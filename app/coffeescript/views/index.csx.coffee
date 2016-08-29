React   = require('react')
Banner  = require('views/banner')
About   = require('views/about')
Contact = require('views/contact')

IndexComponent = React.createClass

    displayName: 'indexComponent'

    propTypes:
        propA:  React.PropTypes.string.isRequired
        propB:  React.PropTypes.object.isRequired

    getInitialState: -> {
        some: 'state'
    }

    render: ->
        return (
            <div className="index-component">
                <Banner />
                <About />
                <Contact />
            </div>
        )

module.exports = IndexComponent
