Selector = require './selector.coffee'
{MAX_OCTAVE} = require '../constants.coffee'

OctaveSelector = Selector.extend({
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
