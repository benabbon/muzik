keys = ['A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E',  'F', 'F#', 'G', 'G#']

KeySelector = Backbone.View.extend({
  tagName: 'div'
  className: 'selector'

  events:
    'click': 'onClick'

  initialize: ->
    @idx = 0
    @key = keys[0]

  render: ->
    this.$el.text(@key)
    return this

  onClick: ->
    @idx++
    @key = keys[@idx % keys.length]
    @render()

})

module.exports = KeySelector
