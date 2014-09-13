{HOST} = require '../constants'
Selector = require './selector'
fb = new Firebase(HOST + 'scale')

ScaleSelector = Selector.extend({
  initialize: ->
    @scales = [
      {
        name: 'Major',
        notes: [0, 2, 4, 5, 7, 9, 11, 12]
      }
      {
        name: 'Minor'
        notes: [0, 2, 3, 5, 7, 8, 11, 12]
      }
    ]
    @idx = 0
    @scale = @scales[0]

  render: ->
    this.$el.text(@scale.name)
    return this

  onClick: ->
    @idx++
    @scale = @scales[@idx % @scales.length]
    fb.push(@scale)
    @render()

  set: (@scale) ->
    @render()
})

module.exports = ScaleSelector
