require 'bundler/setup'
require 'sinatra'
require_relative 'engine'

# Sinatra by default runs on Thin, which uses EventMachine to handle incoming requests.
# Sinatra's routing functions, however, block; EventMachine won't handle any more events until we return the previous result.
# This is a problem for us, because TweetStream uses EventMachine to receive streaming events from Twitter.
# And we need to receive streaming events in order to load from sample.json.
# If we send a request for twitter data, we won't be able to receive the data, until we return our HTTP response.
# And by then it will be too late to use the twitter data.
#
# There are several methods to work around this problem
#
#  • Preload the TweetStream data before running Sinatra
#     The tweets we would be displaying would always be the same though until we restarted our app.
#  • Preload TweetStream data before running Sinatra, and then update the Sinatra data *AFTER*  each request for the next request
#     It still would seem unsatisfying to potentially be seeing tweets from an hour ago if there was an hour gap in between requests
#  • Have TweetStream constantly running, queueing 20 tweets at a time, and showing the most recent for each request
#     We would have to be wary of running into Twitter's rate limiting if we did this option
#  • Change our technology stack - don't use Thin
#     We would still have to figure out how to handle the event-based nature of HTTP requests.
#     Most other servers typically require the use of Apache, nginx, or unix sockets to function;
#     This is doable, but seems overkill to work on for a simple app like this.
#     The other option would of course be to use Rails:
#     the "rails server" command uses WEBrick, which doesn't use EventMachine.
#  • Run TweetStream in a separate app that uses a separate EventMachine.  Pass the data using STDOUT
#     In the end, I chose this method just because it was the simplest to implement.
#     It isn't a bad solution, but it might be better in the long run, if you planned on using this for something bigger,
#     to use one of the other solutions for speed and maintainability reasons.
#     For something simple like this, though, it is simple enough and does the job with the least fuss.
#     And it is much better to code for the problems you do have than the problems you might have

get '/' do
  Display.page content:(`ruby load_tweets.rb`)
end

get '/via_js' do
  Display.page javascript:['jquery.js','app.js']
end

get '/get_tweets' do
  `ruby load_tweets.rb`
end