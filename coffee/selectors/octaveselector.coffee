{HOST} = require '../constants'
Selector = require './selector'
{MAX_OCTAVE} = require '../constants'
fb = new Firebase(HOST + 'octave')

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
    fb.push(@octave)
    @render()

  set: (@octave) ->
    @render()
})

module.exports = OctaveSelector
