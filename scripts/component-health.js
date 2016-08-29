var walk = require('walk');
var fs = require('fs');
var sloc = require('sloc');
var loc = 0;
var components = 0;
var allComponentCode = ""
var genericComponentInstances = 0;
var genericComponentRequirePaths = [];
var viewPath = './app/coffeescript/views'

// Walker options
var walker  = walk.walk(viewPath, { followLinks: false });

// Every time we get a file
walker.on('file', function(root, stat, next) {

    // It's a component
    if (stat.name.indexOf('.csx.coffee') > -1) {

        filePath = root + '/' + stat.name;

        // open the file
        fs.readFile(filePath, "utf8", function (error, code) {

            // We'll check this later for instances of each generic component
            allComponentCode += code

            // Count the total loc
            loc += sloc(code, "js").total;

            // count the number of components
            components++

            // It's a generic component
            if (filePath.indexOf('/views/generic/') > -1) {

                splitPath   = filePath.split('/')

                // Paths with 8 or more folders in them tend to be child components of generic components
                // We only was the generic components themselves, not the children of generic components
                if (splitPath.length < 8) {

                    // The path we would use to require the module, e.g: require('views/generic/forms/toggle')
                    requirePath = splitPath.slice(3, splitPath.length).join('/').split('.')[0]

                    // We'll use this to count the number of generic components.
                    // But also to count the number of instances of these components.
                    genericComponentRequirePaths.push(requirePath);
                }
            }

            // Move onto the next file
            next();

        });

    } else {
        next();
    }

});




walker.on('end', function() {

    // Don't use components thar are not used in the instances per generic component
    componentsNotUsedCount = 0;

    genericComponentRequirePaths.forEach(function(requirePath) {

        escapedRequirePath          = requirePath.split('/').join('\\/')
        requirePathRegExpression    = new RegExp(escapedRequirePath, 'g')

        // Note: This is a simplistic calculation.
        // It counts the number of times we require generic components.
        // It doesn't count the number of times we *use* that required component
        // So if you require a component, but don't use it, or if you require a component
        // but use it twice in that component, this number will be innacurate.
        // I can't imagine these edge cases apply that often
        componentRequiredCount      = ( allComponentCode.match( requirePathRegExpression ) || [] ).length

        if (componentRequiredCount === 0)
            componentsNotUsedCount ++;

        else
            genericComponentInstances   += componentRequiredCount;

    });

    console.log(Math.round((loc / components)*100)/100 + " loc per component");
    console.log(genericComponentRequirePaths.length + " generic components");
    console.log(Math.round((genericComponentInstances / (genericComponentRequirePaths.length - componentsNotUsedCount) )*100)/100 + " instances per generic component")
});
