React       = require('react')
ComponentB  = require('views/generic/component-b')

ContactComponent = React.createClass

    displayName: 'contactComponent'

    propTypes:
        propA:  React.PropTypes.string.isRequired
        propB:  React.PropTypes.object.isRequired

    getInitialState: -> {
        some: 'state'
    }

    render: ->
        return (
            <div className="index-component">
                <h1>The contact component</h1>
                <p>The contact content would go here</p>

                <ComponentB/>
            </div>
        )

module.exports = ContactComponent
