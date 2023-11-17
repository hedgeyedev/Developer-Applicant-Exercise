require 'sinatra'
require 'net/http'
require 'uri'
require 'nokogiri'
require 'dotiw'

include DOTIW::Methods

get '/' do
  uri = URI("http://localhost:5555/1.1/statuses/status.json") # https://github.com/hedgeyedev/fake_twitter_api
  response = Net::HTTP.get(uri)
  @results = JSON.parse(response).take(20)

  erb :index, layout: :main
end

get '/via_js' do
  erb :via_js, layout: :main
end

def extract_name_from_x_url(url)
  return "X User" unless url.is_a?(String) && url.include?('/')

  username = url.split('/').last
  return "X User" if username.nil? || username.strip.empty?

  username.split('_').map(&:capitalize).join(' ') # "john_doe" => "John Doe"
end

def extract_source_from(html_string)
  return nil if html_string.nil? || !html_string.is_a?(String)
  doc = Nokogiri::HTML(html_string)
  doc.text.strip
end

def time_distance_in_words(time)
  distance_of_time_in_words(Time.now, time, except: :seconds)
end
