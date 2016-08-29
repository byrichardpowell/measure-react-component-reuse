React       = require('react')
ComponentA  = require('views/generic/component-a')

AboutComponent = React.createClass

    displayName: 'aboutComponent'

    propTypes:
        propA:  React.PropTypes.string.isRequired
        propB:  React.PropTypes.object.isRequired

    getInitialState: -> {
        some: 'state'
    }

    render: ->
        return (
            <div className="index-component">
                <h1>The about component</h1>
                <p>The about content would go here</p>

                <ComponentA/>

            </div>
        )

module.exports = AboutComponent
