{HOST} = require '../constants'
Selector = require './selector'
fb = new Firebase(HOST + 'keysync')

keys = ['A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E',  'F', 'F#', 'G', 'G#']

KeySelector = Selector.extend({
  initialize: ->
    @idx = 0
    @key = keys[0]

  render: ->
    this.$el.text(@key)
    return this

  onClick: ->
    @idx++
    @key = keys[@idx % keys.length]
    fb.push(@key)
    @render()

  set: (@key) ->
    @render()

})

module.exports = KeySelector
