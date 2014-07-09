_.templateSettings.interpolate = /{{([\s\S]+?)}}/g

template = _.template "<p>hello, {{name}}</p>"
data = name: 'world'

$ ->
  dom = $ '.app'
  dom.html template data
