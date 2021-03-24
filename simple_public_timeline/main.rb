require 'sinatra'
require './data'
require './wrangle_text'

get '/' do
  erb :index
end

get '/via_js' do
  erb :via_js
end
