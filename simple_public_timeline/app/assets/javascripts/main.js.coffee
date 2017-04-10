#
# This file is part of simple_public_timeline. Copyright (C) 2013 and above Shogun <shogun@cowtech.it>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

# Setup tooltips
setupTooltips = -> $("[rel=tooltip]").tooltip()

loadTweets = ->
  loader = $("#loader")
  container = loader.parent()
  $("#root").addClass("loading")
  content = null

  $.ajax(location.href, {
    success: (data, status, xhr) ->
      content = $(data)
    error: (xhr, status, error) -> 
      error = JSON.parse(xhr.responseText)
      content = $("""<div id="error" class="alert alert-danger"><strong>Unable to load tweets:</strong> #{error.error} (Status: #{error.status})</div>""")
    complete: ->       
      content.prependTo(container).hide()
      loader.fadeOut("fast", -> 
        $("#root").removeClass("loading")
        content.fadeIn("fast")
      )
  })

$ ->
  setupTooltips()
  loadTweets() if $("#loader").size() > 0