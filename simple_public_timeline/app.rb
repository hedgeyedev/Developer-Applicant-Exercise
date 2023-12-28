# app.rb
require 'sinatra'
require 'json'
require 'httparty'

# Replace with your actual Twitter API endpoint
TWITTER_API_URL = 'http://localhost:3000/1.1/statuses/status.json'

get '/' do
  @tweets = fetch_tweets
  erb :index
end

get '/via_js' do
  erb :via_js
end

get '/tweets' do
  tweets = fetch_tweets
  content_type :json
  tweets.to_json
end

def fetch_tweets
  response = HTTParty.get(TWITTER_API_URL)
  JSON.parse(response.body)
end

