spectrum = require './spectrum.coffee'

host = 'ws://158.130.167.110:8084/pennApps/sreceive'

template = '''
<div class="button"></div>
'''

A0 = 21
octave = 3
notes_per_octave = 12

scales =
  major: [0, 2, 4, 5, 7, 9, 11, 12]

socket = new WebSocket(host)

Key = Backbone.View.extend({
  tagName: 'div'
  className: 'column'

  events:
    'click': 'onClick'

  initialize: (opts) ->
    @index = opts.index
    @colour = spectrum[opts.index]
    @parent = opts.parent

  render: (index, colour) ->
    @$el.html(template)
    this.button = @$('.button')
    @button.css(background: @colour)
    return this

  play: ->
    @button.addClass('active')
    setTimeout((=> @button.removeClass('active')), 250)

    key = parent.keyselector.idx
    note = A0 + (octave * notes_per_octave) + key + scales.major[@index]

    request = JSON.stringify({
      note: note
      velocity: 100
      start: 0
    })

    console.log request

    socket.send(request)

    # $.ajax({
    #   method: 'POST'
    #   url: host
    #   data: request
    #   dataType: 'json'
    # })

  onClick: ->
    @play()
})

module.exports = Key
