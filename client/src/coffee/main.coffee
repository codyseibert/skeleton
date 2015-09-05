window.$ = window.jQuery = require 'jquery'
Backbone = require 'backbone'
Backbone.$ = $;
require 'bootstrap'
_ = require 'underscore'

$(document).ready ->
  users = [];

  $.ajax
    url: 'https://randomuser.me/api/?results=100'
    dataType: 'json'
    success: (data) ->
      _.each data.results, (user) ->
        users.push user.user
      showUsers()
      startRotatingUsers()

  showUsers = ->
    _.each users, (user) ->
      $('body').append "<img src='#{user.picture.medium}' />"

  startRotatingUsers = ->

    setInterval ->
      $first = $('img').first()
      $first.addClass 'fade'

      setTimeout ->
        $first.detach()
        $first.removeClass 'fade'
        $('body').append $first
      , 200

    , 500
