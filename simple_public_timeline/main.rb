# frozen_string_literal: true

require 'sinatra'
require 'httparty'

get '/' do
  @tweets = HTTParty.get('http://localhost:4567/1.1/statuses/status.json?count=20')

  erb :index
end

get '/via_js' do
  erb :via_js
end
