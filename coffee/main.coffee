Keyboard = require './keyboard.coffee'
Drums = require './drums.coffee'

$(document).ready ->
  keyboard = new Keyboard()
  keyboard.render().$el.appendTo('body')

  drums = new Drums()
  drums.render().$el.appendTo('body')

  $('body').on 'keydown', (event) ->
    keyboard.play(event.keyCode)

  w = $ window

  w.resize ->
    h = $('.drums').height() / 8
    $('.drum').css({
      marginTop: h
      marginBottom: h
    })

  w.resize()
