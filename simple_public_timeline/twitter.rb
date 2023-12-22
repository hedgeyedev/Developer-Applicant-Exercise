require 'sinatra'
require 'net/http'
require 'uri'
require 'debug'


get '/' do
  uri = URI('http://localhost:1234/1.1/statuses/status.json')
  params = {count: 20}
  uri.query = URI.encode_www_form(params)
  response = Net::HTTP.get(uri)
  @posts = JSON.parse(response)

  erb :ruby_view
end

get '/via_js' do
  erb :js_view
end

