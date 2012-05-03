Handlebars.registerHelper "timeAgo", (timeStamp) ->
  prettyDate timeStamp

render = (tweets) ->
  template = Handlebars.compile($("#tweet-template").html())
  $("#tweets").html template(tweets)

jQuery ($) ->
  if tweets
    render tweets
  else
    $.getJSON "http://api.twitter.com/1/statuses/public_timeline.json?callback=?", (data) ->
      render data
