require 'sinatra'
require './data'

get '/' do
  erb :index
end

get '/via_js' do
  erb :via_js
end

get '/feed' do
  get_feed_json
end
