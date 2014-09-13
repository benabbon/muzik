Instrument = Backbone.View.extend({
  tagName: 'div'

  initialize: ->

  render: ->
    @$el.addClass('instrument')
})

module.exports = Instrument
