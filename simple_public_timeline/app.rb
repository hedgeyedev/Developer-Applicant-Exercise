require 'sinatra/base'
require 'net/https'
require 'uri'
require 'json'

class App < Sinatra::Base
  get '/' do
    uri = URI.parse("https://api.twitter.com/1/statuses/public_timeline.json")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    @twits = JSON.parse response.body
    
    erb :index
  end

  get '/via_js' do
    erb :via_js
  end
end