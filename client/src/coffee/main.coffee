window.$ = window.jQuery = require 'jquery'
Backbone = require 'backbone'
Backbone.$ = $;
require 'bootstrap'

other = require './other'
console.log other 1337

$(document).ready ->
  $('#someDiv').html('yo')
