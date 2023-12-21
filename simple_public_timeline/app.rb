require 'sinatra'
require 'httparty'

get '/' do
  response = HTTParty.get('http://localhost:3000/1.1/statuses/status.json?count=20')
  @tweets = response.parsed_response
  erb :index
end

get '/via_js' do
  erb :via_js
end

get '/tweets.json' do
  content_type :json
  response = HTTParty.get('http://localhost:3000/1.1/statuses/status.json?count=20')
  response.body
end
