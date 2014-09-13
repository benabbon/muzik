spectrum = require './spectrum.coffee'

host = 'http://localhost:3000'

template = '''
<div class="button"></div>
'''

A0 = 21
octave = 3
notes_per_octave = 12

socket = io.connect(host)

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

    key = @parent.keyselector.idx

    scale = @parent.scaleselector.scale.notes

    note = A0 + (octave * notes_per_octave) + key + scale[@index]

    request = JSON.stringify({
      note: note
      velocity: 100
      start: 0
    })

    console.log request

    socket.emit('sound', request)

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
