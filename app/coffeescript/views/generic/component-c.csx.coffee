React       = require('react')
ComponentC  = require('views/generic/component-a')
componentB  = require('views/generic/component-b')

ComponentC = React.createClass

    displayName: 'ComponentC'

    propTypes:
        propA:  React.PropTypes.string.isRequired
        propB:  React.PropTypes.object.isRequired

    getInitialState: -> {
        some: 'state'
    }

    render: ->
        return (
            <div className="index-component">
                <h1>This is component C</h1>

                <ComponentA/>
                <ComponentB/>

            </div>
        )

module.exports = ComponentC
