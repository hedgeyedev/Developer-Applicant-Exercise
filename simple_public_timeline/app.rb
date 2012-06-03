# myapp.rb

require 'bundler/setup'

require 'sinatra'
require 'httparty'

get '/' do
  "This is /"
end

get '/via_js' do
  "This is /via_js"
end

