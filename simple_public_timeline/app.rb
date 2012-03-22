require 'json'
require 'sinatra'
require_relative 'app/models'
require 'haml'

get '/' do
  haml :index, :locals => {:tweets => JSON(File.read("spec/tweets.json")).map{|e| Tweet.new(e) }}
end

get '/via_js/?' do
  haml :'index-js'
end

get '/load_tweets/?' do
  content_type 'application/json'
  # https://api.twitter.com/1/statuses/public_timeline.json
  tweets = JSON(File.read("spec/tweets.json")).map{|e| Tweet.new(e) }
  JSON(tweets)
end