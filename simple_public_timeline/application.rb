require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  'Hello world!'
end

get '/via_js' do
  
end