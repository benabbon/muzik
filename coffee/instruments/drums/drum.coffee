Button = require '../button.coffee'
spectrum = require '../../spectrum.coffee'
{HOST} = require '../../constants.coffee'

codes = [24, 26, 27, 30]

fb = new Firebase(HOST + 'instrument')

Drum = Button.extend({
  className: 'drum'

  initialize: (opts) ->
    @index = opts.index
    @colour = spectrum[opts.index]

  render: ->
    this.$el.css(background: @colour)
    @target = @$el
    return this

  play: ->
    Button::play.call(this)

    note = codes[@index] + 12

    request = {
      instrument: 'drums'
      note: note
      velocity: 100
      start: 0
    }

    fb.push(request)

})

module.exports = Drum
