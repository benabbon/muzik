host = 'ws://158.130.167.110:8084/pennApps/s_receive'

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

socket = new WebSocket(host)

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
    this.button = @$('.button')
    @button.css(background: @colour)
    return this

  play: ->
    @button.addClass('active')
    setTimeout((=> @button.removeClass('active')), 250)
    # @button.animate(height: '+=50').delay(100).animate(height: '-=50')

    request = JSON.stringify({
      note: root + scales.major[@index]
      velocity: 100
      start: 0
    })

    console.log request

    socket.send(request)

    # $.ajax({
    #   method: 'POST'
    #   url: host
    #   data: request
    #   dataType: 'json'
    # })

  onClick: ->
    @play()
})

module.exports = Key
