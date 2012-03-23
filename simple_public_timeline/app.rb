require 'json'
require 'sinatra'
require_relative 'app/models'
require_relative 'app/tweet_loader'
require 'haml'

get '/' do
  haml :index, :locals => {:tweets => TweetLoader.tweets}
end

get '/via_js/?' do
  haml :'index-js'
end

get '/load_tweets/?' do
  content_type 'application/json'
  JSON(TweetLoader.tweets)
end