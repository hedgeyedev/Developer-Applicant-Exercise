require 'sinatra'
require './data'

get '/' do
  erb :index
end

get '/via_js' do
  erb :via_js
end

get '/via_js_vanilla' do
  erb :via_js_vanilla
end

get '/feed' do
  get_feed_json
end
