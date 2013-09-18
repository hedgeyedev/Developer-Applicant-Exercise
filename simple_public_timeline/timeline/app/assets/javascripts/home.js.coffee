# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#language1').change ->
    lang =  $('#language1').val()
    $('#language').val(lang)
    $('#spinner').removeClass("hide")
    $('#postsDiv').empty()
    fetch lang

  $(window).on "scroll", ->
    if $(window).scrollTop() is ($(document).height() - $(window).height())
      lang = $("#language1").value
      $("#spinner").removeClass "hide"
      fetch lang  

  fetch = (lang) ->
    $.ajax
      type: "get"
      url: '/home/more_tweets'
      data:
        language: lang
      success: (oldposts) ->
        $("#spinner").addClass "hide"
        $("#postsDiv").append(oldposts).fadeIn "slow"

