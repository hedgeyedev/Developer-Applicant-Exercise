get_tweet_data = ->
  $.ajax
    dataType: "json"
    url: "tweets.json"
    success: (data) ->
      render_tweet_data data

render_tweet_data = (tweets) ->
  tweet_markup = []
  for tweet in tweets
    tweet_markup.push render_tweet
      tweet: tweet
  $('#tweets').html tweet_markup.join('')


$().ready ->
  if $('#tweets > .tweet').size() is 0
    get_tweet_data()
