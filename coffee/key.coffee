host = 'http://158.130.167.110:8084/pennApps/receive'

template = '''
<div class="button"></div>
'''

C0 = 12
octave = 3
notes_per_octave = 12

scales =
  major: [0, 2, 4, 5, 7, 9, 11, 12]

root = C0 + octave * notes_per_octave

spectrum = [
  '#c0392b'
  '#f39c12'
  '#f1c40f'
  '#2ecc71'
  '#3498db'
  '#8e44ad'
  '#9b59b6'
]

Key = Backbone.View.extend({
  tagName: 'div'
  className: 'column'

  events:
    'click': 'onClick'

  initialize: (opts) ->
    @index = opts.index
    @colour = spectrum[opts.index]

  render: (index, colour) ->
    @$el.html(template)
    @$('.button').css(background: @colour)
    return this

  play: ->
    request = {
      note: root + scales.major[@index]
      velocity: 100
      start: 0
    }

    $.ajax({
      method: 'POST'
      url: host
      data: JSON.stringify(request)
      dataType: 'json'
    })

  onClick: ->
    @play()
})

module.exports = Key
