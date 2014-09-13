spectrum = require '../../spectrum.coffee'
{NOTES_PER_OCTAVE, ROOT_NOTE, HOST} = require '../../constants.coffee'

template = '''
<div class="button"></div>
'''

fb = new Firebase(HOST + 'instrument')

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

    key = @parent.selectors.key.idx
    scale = @parent.selectors.scale.scale.notes
    octave = @parent.selectors.octave.octave

    note = ROOT_NOTE + (octave * NOTES_PER_OCTAVE) + key + scale[@index]

    request = {
      instrument: 'keyboard'
      note: note
      velocity: 100
      start: 0
    }

    fb.push(request)

  onClick: ->
    @play()
})

module.exports = Key
