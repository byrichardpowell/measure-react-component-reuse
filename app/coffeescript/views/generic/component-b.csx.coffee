React       = require('react')
ComponentC  = require('views/generic/component-c')
componentD  = require('views/generic/component-a')

ComponentB = React.createClass

    displayName: 'ComponentB'

    propTypes:
        propA:  React.PropTypes.string.isRequired
        propB:  React.PropTypes.object.isRequired

    getInitialState: -> {
        some: 'state'
    }

    render: ->
        return (
            <div className="index-component">
                <h1>This is component B</h1>

                <ComponentC/>
                <ComponentD/>

            </div>
        )

module.exports = ComponentB
