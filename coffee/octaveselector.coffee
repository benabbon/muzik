{MAX_OCTAVE} = require './constants.coffee'

OctaveSelector = Backbone.View.extend({
  tagName: 'div'
  className: 'octaveselector'

  events:
    'click': 'onClick'

  initialize: ->
    @octave = 3

  render: ->
    this.$el.text("Octave #{@octave}")
    return this

  onClick: ->
    @octave++
    if @octave is MAX_OCTAVE
      @octave = 0
    @render()

})

module.exports = OctaveSelector
