# myapp.rb
require 'sinatra'
require 'httparty'
require 'sinatra'
require 'rack/test'

class TwitterTimeline
  include HTTParty

  # I had problems definining "get" a method in this class
end

# setup test environment
set :environment, :test
set :run, true
set :raise_errors, true
set :logging, false


get '/' do
	@title = 'Twitter Public Timeline (ruby/httparty retrieval)'
	@timeline = TwitterTimeline.get('http://api.twitter.com/1/statuses/public_timeline.json')
	# @timeline won't get passed to the template without the puts
	puts @timeline
	erb :tweet
end

get '/via_js' do
	@title = 'Twitter Public Timeline (js/jquery retrieval)'
	erb :tweet_js
end

get '/' do
end