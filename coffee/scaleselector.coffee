scales = ['Major', 'Minor']

ScaleSelector = Backbone.View.extend({
  tagName: 'div'
  className: 'scaleselector'

  events:
    'click': 'onClick'

  initialize: ->
    @idx = 0
    @scale = scales[0]

  render: ->
    this.$el.text(@scale)
    return this

  onClick: ->
    @idx++
    @scale = scales[@idx % scales.length]
    @render()

})

module.exports = ScaleSelector
