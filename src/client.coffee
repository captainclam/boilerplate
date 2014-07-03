window._ = require 'underscore'
window.$ = require 'jquery'

$ ->
  dom = $ '.app'
  dom.text 'Content'
