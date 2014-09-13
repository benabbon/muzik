spectrum = require './spectrum.coffee'

Drum = Backbone.View.extend({
  tagName: 'div'
  className: 'drum'

  initialize: (opts) ->
    @index = opts.index
    @colour = spectrum[opts.index]

  render: () ->
    this.$el.css(background: @colour)
    return this
})

module.exports = Drum
