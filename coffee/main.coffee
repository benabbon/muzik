Keyboard = require './keyboard.coffee'

$(document).ready ->
  keyboard = new Keyboard()
  keyboard.render()
  keyboard.$el.appendTo('body')

  $('body').on 'keydown', (event) ->
    keyboard.play(event.keyCode)
