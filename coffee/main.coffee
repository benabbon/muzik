Keyboard = require './instruments/keyboard/keyboard.coffee'
Drums = require './instruments/drums/drums.coffee'

$(document).ready ->
  main = $('.main')

  piano = new Keyboard(name: 'piano')
  synth = new Keyboard(name: 'synth')
  drums = new Drums()

  active = piano

  instruments = [piano, synth, drums]

  for instrument in instruments
    instrument.render().$el.appendTo(main)

  $('body').on 'keydown', (event) ->
    active.play(event.keyCode)

  $('.menu .item').each ->
    t = $ this
    target = t.attr('data-target')
    t.on 'click', ->
      $.scrollTo(target, 300, {offset: {top: -80}})

  $('.add').on 'click', ->
    kb = new Keyboard()
    instruments.push(kb)

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
