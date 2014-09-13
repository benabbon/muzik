Key = require './key.coffee'

keys = []

# Maps keycodes to the index of the note that key should play.
# Eg. A = 65 = root note in the scale = index 0
keymap =
  65: 0
  83: 1
  68: 2
  70: 3
  71: 4
  72: 5
  73: 6
  74: 7

$(document).ready ->
  for i in [0...7]
    key = new Key(index: i)
    keys.push(key)
    key.render().$el.appendTo('.buttons')

  $('body').on 'keydown', (event) ->
    index = keymap[event.keyCode]
    if index and keys[index]
      keys[index].play()
