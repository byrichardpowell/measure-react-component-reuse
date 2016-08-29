React       = require('react')
ComponentB  = require('views/generic/component-b')
componentC  = require('views/generic/component-c')

ComponentA = React.createClass

    displayName: 'ComponentA'

    propTypes:
        propA:  React.PropTypes.string.isRequired
        propB:  React.PropTypes.object.isRequired

    getInitialState: -> {
        some: 'state'
    }

    render: ->
        return (
            <div className="index-component">
                <h1>This is component A</h1>

                <ComponentB/>
                <ComponentC/>

            </div>
        )

module.exports = ComponentA
