# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $(".search-hidden-btn").on "click" , ->
    $(".hidden-form").toggle()

$(document).on 'turbolinks:load', ->
  $(".search-hidden-home-btn").on "click" , ->
    $(".hidden-form-home").toggle()