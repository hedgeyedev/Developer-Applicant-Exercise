require 'sinatra'
require 'sinatra/reloader' if development?
require 'news-api'
require 'slim'
require 'dotenv/load'


class ApplicationController < Sinatra::Base

  newsapi = News.new(ENV['NEWS_API_KEY']) 
  
  get '/' do
    response = newsapi.get_top_headlines(country: 'us', category: 'business', pageSize: 20)
    @headlines = Rack::Response.new(response)
    slim :index
  end

  get '/via_js' do
    slim :via_js
  end
end 