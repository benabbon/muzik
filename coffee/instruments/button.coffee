Button = Backbone.View.extend({
  tagName: 'div'

  events:
    'mousedown': 'mouseDown'
    'mouseup': 'mouseUp'

  play: ->
    @target.addClass('active')

  stop: ->
    @target.removeClass('active')

  mouseDown: ->
    @play()

  mouseUp: ->
    @stop()
})

module.exports = Button

