require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'
require './news_api'

get '/' do
  @headlines = Rack::Response.new(NewsApi.top_headlines('us', 'business', 20))
  slim :index
end

get '/via_js' do
  @api_key = NewsApi.get_api_key
  slim :via_js
end