spectrum = require './spectrum.coffee'

Drum = Backbone.View.extend({
  tagName: 'div'
  className: 'drum'

  events:
    'click': 'onClick'

  initialize: (opts) ->
    @index = opts.index
    @colour = spectrum[opts.index]

  render: ->
    this.$el.css(background: @colour)
    return this

  play: ->
    @$el.addClass('active')
    setTimeout((=> @$el.removeClass('active')), 250)

  onClick: ->
    @play()
})

module.exports = Drum
