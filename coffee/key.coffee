spectrum = require './spectrum.coffee'
{NOTES_PER_OCTAVE, ROOT_NOTE} = require './constants.coffee'

host = 'http://localhost:3000'

template = '''
<div class="button"></div>
'''

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
    octave = @parent.octaveselector.octave

    note = ROOT_NOTE + (octave * NOTES_PER_OCTAVE) + key + scale[@index]

    request = JSON.stringify({
      note: note
      velocity: 100
      start: 0
    })

    socket.emit('sound', request)

  onClick: ->
    @play()
})

module.exports = Key
