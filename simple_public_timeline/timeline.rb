require 'sinatra'
require 'net/http'
require 'uri'

get '/' do
  uri = URI("https://jsonplaceholder.typicode.com/photos")
  response = Net::HTTP.get(uri)
  @results = JSON.parse(response).take(20)

  erb :index, layout: :main
end

get '/via_js' do
  erb :via_js
end
