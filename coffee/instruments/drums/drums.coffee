Instrument = require '../instrument.coffee'

Drum = require './drum.coffee'

Drums = Instrument.extend({
  className: 'drums'

  initialize: ->
    @drums = (new Drum(index: i) for i in [0...4])

  render: ->
    Instrument::render.call(this)

    for drum in @drums
      drum.render().$el.appendTo(@$el)

    return this
})

module.exports = Drums
