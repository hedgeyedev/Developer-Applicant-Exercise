# app.rb

require 'bundler/setup'

require 'sinatra'
require 'httparty'
require_relative 'twitter'

get '/' do
  @tweets = Twitter.public_timeline(20)
  erb :index
end

get '/via_js' do
  erb :via_js
end

