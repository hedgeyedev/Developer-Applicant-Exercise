require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'
require './news_api'

class ApplicationController < Sinatra::Base
 
  get '/' do
    @headlines = Rack::Response.new(NewsApi.top_headlines('us', 'business', 20))
    slim :index
  end

  get '/via_js' do
    slim :via_js
  end
end 