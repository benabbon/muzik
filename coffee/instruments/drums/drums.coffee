Instrument = require '../instrument.coffee'

Drum = require './drum.coffee'

keymap =
  65: 0
  83: 1
  68: 2
  70: 3

Drums = Instrument.extend({
  className: 'drums'

  initialize: (opts) ->
    @name = opts.name
    @id = opts.name
    @drums = (new Drum(index: i) for i in [0...4])

  render: ->
    Instrument::render.call(this)

    for drum in @drums
      drum.render().$el.appendTo(@$el)

    return this

  play: (code) ->
    index = keymap[code]
    if index? and @drums[index]?
      @drums[index].play()

  stop: (code) ->
    index = keymap[code]
    if index? and @drums[index]?
      @drums[index].stop()
})

module.exports = Drums
