React       = require('react')
ComponentA  = require('views/generic/component-a')
componentB  = require('views/generic/component-b')

ComponentD = React.createClass

    displayName: 'ComponentD'

    propTypes:
        propA:  React.PropTypes.string.isRequired
        propB:  React.PropTypes.object.isRequired

    getInitialState: -> {
        some: 'state'
    }

    render: ->
        return (
            <div className="index-component">
                <h1>This is component D</h1>

                <ComponentA/>
                <ComponentB/>

            </div>
        )

module.exports = ComponentD
