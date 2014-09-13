Button = require '../button'
spectrum = require '../../spectrum'
{NOTES_PER_OCTAVE, ROOT_NOTE, HOST} = require '../../constants'

template = '''
<div class="button"></div>
'''

fb = new Firebase(HOST + 'instrument')

Key = Button.extend({
  className: 'column'

  initialize: (opts) ->
    @index = opts.index
    @colour = spectrum[opts.index]
    @parent = opts.parent

  render: (index, colour) ->
    @$el.html(template)
    @button = @$('.button')
    @target = @button
    @button.css(background: @colour)
    return this

  play: ->
    Button::play.call(this)

    key = @parent.selectors.key.idx
    scale = @parent.selectors.scale.scale.notes
    octave = @parent.selectors.octave.octave

    note = ROOT_NOTE + (octave * NOTES_PER_OCTAVE) + key + scale[@index]

    request = {
      instrument: @parent.name
      note: note
      velocity: 100
      start: 0
    }

    fb.push(request)
})

module.exports = Key
