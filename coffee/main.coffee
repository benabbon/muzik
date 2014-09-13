Keyboard = require './instruments/keyboard/keyboard'
Drums = require './instruments/drums/drums'

$(document).ready ->
  main = $('.main')

  piano = new Keyboard(name: 'piano')
  synth = new Keyboard(name: 'synth')
  drums = new Drums(name: 'drum')

  active = piano

  instruments = [piano, synth, drums]

  for instrument in instruments
    instrument.render().$el.appendTo(main)

  $('body').on 'keydown', (event) ->
    active.play(event.keyCode)

  $('body').on 'keyup', (event) ->
    active.stop(event.keyCode)

  $('.menu .item').each (i) ->
    t = $ this
    target = t.attr('data-target')
    ((i) ->
      t.on 'click', ->
        active = instruments[i]
        $.scrollTo(target, 300, {offset: {top: -80}})
    )(i)

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
