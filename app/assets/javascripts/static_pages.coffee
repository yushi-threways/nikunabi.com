# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $(".search-hidden-btn").on "click" , ->
    $(".hidden-form").toggle()

  $(".search-hidden-home-btn").on "click" , ->
    $(".hidden-form-home").toggle()
  
  $(".nikunai-accordion-main").on "click" , ->
    $(".nikunai-accordion-menu--main").toggle()

  $(".nikunai-accordion-area").on "click" , ->
    $(".nikunai-accordion-menu--area").toggle()

  $(".nikunai-accordion-service").on "click" , ->
    $(".nikunai-accordion-menu--service").toggle()

  $(".nikunai-accordion-recommend").on "click" , ->
    $(".nikunai-accordion-menu--recommend").toggle()