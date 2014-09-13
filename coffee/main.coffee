Keyboard = require './keyboard.coffee'
Drums = require './drums.coffee'

$(document).ready ->
  main = $('.main')

  keyboard = new Keyboard()
  drums = new Drums()

  instruments = [keyboard, drums]

  for instrument in instruments
    instrument.render().$el.appendTo(main)

  $('body').on 'keydown', (event) ->
    keyboard.play(event.keyCode)

  $('.menu .item').each ->
    t = $ this
    target = t.attr('data-target')
    t.on 'click', ->
      $.scrollTo(target, 300, {offset: {top: -80}})

  w = $ window

  w.resize ->
    h = $('.drums').height() / 8
    $('.drum').css({
      marginTop: h
      marginBottom: h
    })

    s = $('.selectors')

    s.css({left: (w.width() - s.width()) / 2})

  w.resize()
