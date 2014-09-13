Key = require './key.coffee'

$(document).ready ->
  for i in [0...7]
    key = new Key(index: i)
    key.render().$el.appendTo('.buttons')
