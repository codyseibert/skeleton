window.$ = window.jQuery = require('jquery')
var Backbone = require('backbone');
Backbone.$ = $;
require('bootstrap')
// require('../../../../bower_components/bootstrap-sass-official/assets/javascripts/bootstrap');

var other = require('./other');

console.log($);
$(document).ready(function() {
  $('#someDiv').html('yo');
});
