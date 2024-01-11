require 'sinatra'
require 'net/http'

set :app_file, __FILE__
set :root, File.dirname(__FILE__)

def getTwits
  headers = { 'Content-Type': 'application/json' }
  uri = URI('http://127.0.0.1:5678/1.1/statuses/status.json')
  params = { :count => 20 }
  uri.query = URI.encode_www_form(params)
  res = Net::HTTP.get(uri, headers)
end

get '/' do
  twits = getTwits
  erb(:stream, :locals => {:twits => JSON.parse(twits)})
end

get '/is_js' do
  twits = getTwits
  erb(:jsstream, :locals => {:twits => twits})
end