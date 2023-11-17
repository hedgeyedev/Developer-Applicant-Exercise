require 'sinatra'
require 'net/http'
require 'uri'

get '/' do
  uri = URI("http://localhost:5555/1.1/statuses/status.json") # https://github.com/hedgeyedev/fake_twitter_api
  response = Net::HTTP.get(uri)
  @results = JSON.parse(response).take(20)

  erb :index, layout: :main
end

get '/via_js' do
  erb :via_js
end

def extract_name_from_x_url(url)
  username = url.split('/').last
  username.split('_').map(&:capitalize).join(' ') # Convert 'matthew_henry' to 'Matthew Henry'
end
