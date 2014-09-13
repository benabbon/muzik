Selector = Backbone.View.extend({
  tagName: 'div'
  className: 'selector'

  events:
    'click': 'onClick'
})

module.exports = Selector
