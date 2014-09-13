spectrum = [
  '#c0392b'
  '#f39c12'
  '#f1c40f'
  '#2ecc71'
  '#3498db'
  '#8e44ad'
  '#9b59b6'
]

$(document).ready ->
  for colour, i in spectrum
    column = $('<div>').addClass('column')

    div = $('<div>')
      .addClass('button')
      .css({background: colour})
      .attr('data-index', i)
      .on('click', ->
        console.log $(this).attr('data-index')
      )
      .on('mouseenter', ->
        console.log 'enter'
        $(this).find('.overlay').show()
      )
      .on('mouseout', ->
        console.log 'out'
        $(this).find('.overlay').hide()
      )

    column.append(div)
    div.append($('<div>').addClass('overlay'))
    column.appendTo('.buttons')
