Instrument = Backbone.View.extend({
  tagName: 'div'

  initialize: ->

  render: ->
    @$el.addClass('instrument')
    @$el.attr('id', @id)

})

module.exports = Instrument
