spectrum = require './spectrum.coffee'

Drum = require './drum.coffee'

Drums = Backbone.View.extend({
  tagName: 'div'
  className: 'drums'

  initialize: ->
    @drums = (new Drum(index: i) for i in [0...4])

  render: ->
    for drum in @drums
      drum.render().$el.appendTo(@$el)

    return this
})

module.exports = Drums
