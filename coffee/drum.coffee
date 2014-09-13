spectrum = require './spectrum.coffee'

codes = [24, 26, 27, 30]

fb = new Firebase('https://muzik.firebaseio.com/drums')

Drum = Backbone.View.extend({
  tagName: 'div'
  className: 'drum'

  events:
    'click': 'onClick'

  initialize: (opts) ->
    @index = opts.index
    @colour = spectrum[opts.index]

  render: ->
    this.$el.css(background: @colour)
    return this

  play: ->
    @$el.addClass('active')
    setTimeout((=> @$el.removeClass('active')), 250)

    note = codes[@index] + 12

    request = {
      note: note
      velocity: 100
      start: 0
    }

    fb.push(request)

  onClick: ->
    @play()
})

module.exports = Drum
