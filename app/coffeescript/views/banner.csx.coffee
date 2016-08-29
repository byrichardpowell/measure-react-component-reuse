React       = require('react')
ComponentA  = require('views/generic/component-a')

BannerComponent = React.createClass

    displayName: 'bannerComponent'

    propTypes:
        propA:  React.PropTypes.string.isRequired
        propB:  React.PropTypes.object.isRequired

    getInitialState: -> {
        some: 'state'
    }

    render: ->
        return (
            <div className="index-component">
                <h1>The banner component</h1>
                <p>The banner component would go here</p>

                <ComponentA/>
            </div>
        )

module.exports = BannerComponent
