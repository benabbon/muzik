{HOST} = require '../../constants.coffee'
Instrument = require '../instrument.coffee'
Key = require './key.coffee'
KeySelector = require '../../selectors/keyselector.coffee'
ScaleSelector = require '../../selectors/scaleselector.coffee'
OctaveSelector = require '../../selectors/octaveselector.coffee'

Octave = new Firebase(HOST + 'octave')
Scale = new Firebase(HOST + 'scale')
KeySync = new Firebase(HOST + 'keysync')

# Maps keycodes to the index of the note that key should play.
# Eg. A = 65 = root note in the scale = index 0
keymap =
  65: 0
  83: 1
  68: 2
  70: 3
  71: 4
  72: 5
  74: 6
  75: 7

template = '''
  <div class="selectors"></div>
'''

Keyboard = Backbone.View.extend({
  className: 'keyboard'

  initialize: (opts) ->
    that = this
    @name = opts.name
    @id = opts.name

    @selectors =
      key: new KeySelector()
      octave: new OctaveSelector()
      scale: new ScaleSelector()

    @num_notes = 8
    @keys = (new Key({index: i, parent: that}) for i in [0...@num_notes])

    Octave.on 'child_added', (data) =>
      val = data.val()
      if val
        @selectors.octave.set(val)

    Scale.on 'child_added', (data) =>
      val = data.val()
      if val
        @selectors.scale.set(val)

    KeySync.on 'child_added', (data) =>
      val = data.val()
      if val
        @selectors.key.set(val)

  render: ->
    Instrument::render.call(this)

    @$el.attr('id', @id)
    @$el.html(template)

    for key in @keys
      key.render()
      @$el.append(key.render().$el)

    wrap = @$('.selectors')

    for k, selector of @selectors
      selector.render()
      wrap.append(selector.$el)

    return this

  play: (code) ->
    index = keymap[code]
    if index? and @keys[index]?
      @keys[index].play()

})

module.exports = Keyboard
