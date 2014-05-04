require 'rubygems'
require 'sinatra'
require 'haml'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require_relative 'models/tweet'

get '/' do
  @tweets = Tweet.new.get
  haml :index
end

get '/.json' do
  content_type :json
  Tweet.new.get.to_json
end

get '/via_js' do
  haml :index_js
end
