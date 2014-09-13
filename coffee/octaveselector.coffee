{MAX_OCTAVE} = require './constants.coffee'

OctaveSelector = Backbone.View.extend({
  tagName: 'div'
  className: 'selector'

  events:
    'click': 'onClick'

  initialize: ->
    @octave = 3

  render: ->
    this.$el.text(@octave)
    return this

  onClick: ->
    @octave++
    if @octave is MAX_OCTAVE
      @octave = 0
    @render()

})

module.exports = OctaveSelector
