# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.main').onepage_scroll()
  $('.home-menu-link').click (e)->
    e.preventDefault
    id = $(this).data("index")
    $('.main').moveTo(id)
