spectrum = [
  '#c0392b'
  '#f39c12'
  '#f1c40f'
  '#2ecc71'
  '#3498db'
  '#8e44ad'
  '#9b59b6'
]

C = 24

# major
notes = [0, 2, 4, 5, 7, 9, 11, 12]

root = C

$(document).ready ->
  for colour, i in spectrum
    column = $('<div>').addClass('column')

    div = $('<div>')
      .addClass('button')
      .css({background: colour})
      .attr('data-index', i)
      .on('click', ->
        idx = +$(this).attr('data-index')

        request = {
          note: root + notes[idx]
          velocity: 100
          start: 0
        }

        console.log request
      )
      .on('mouseenter', ->
        $(this).find('.overlay').show()
      )
      .on('mouseout', ->
        $(this).find('.overlay').hide()
      )

    column.append(div)
    div.append($('<div>').addClass('overlay'))
    column.appendTo('.buttons')
