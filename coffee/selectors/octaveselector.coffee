{HOST} = require '../constants.coffee'
Selector = require './selector.coffee'
{MAX_OCTAVE} = require '../constants.coffee'
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
