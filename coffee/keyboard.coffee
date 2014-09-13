Key = require './key.coffee'
KeySelector = require './keyselector.coffee'
ScaleSelector = require './scaleselector.coffee'

# Maps keycodes to the index of the note that key should play.
# Eg. A = 65 = root note in the scale = index 0
keymap =
  65: 0
  83: 1
  68: 2
  70: 3
  71: 4
  72: 5
  74: 6

Keyboard = Backbone.View.extend({
  tagName: 'div'
  className: 'keyboard'

  initialize: ->
    that = this
    @keyselector = new KeySelector()
    @scaleselector = new ScaleSelector()
    @num_notes = 8
    @keys = (new Key({index: i, parent: that}) for i in [0...@num_notes])

  render: ->
    for key in @keys
      key.render()
      console.log key
      @$el.append(key.render().$el)

    @keyselector.render()
    @$el.append(@keyselector.$el)

    @scaleselector.render()
    @$el.append(@scaleselector.$el)

    return this

  play: (code) ->
    index = keymap[code]
    if index and @keys[index]?
      @keys[index].play()

})

module.exports = Keyboard
