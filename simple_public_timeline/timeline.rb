require 'sinatra'
require 'net/http'
require 'uri'
require 'nokogiri'
require 'dotiw'

include DOTIW::Methods

API_URL = "http://localhost:5555/1.1/statuses/status.json" # I would normally put these in a config file
MAX_RESULTS = 20

helpers do # I would normally put these in a separate module or class, but for the sake of simplicity, I'm putting them here
  def fetch_twitter_data
    uri = URI(API_URL + "?count=#{MAX_RESULTS}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  rescue StandardError => e
    puts "Error fetching data: #{e.message}"
    []
  end
end

get '/' do
  @results = fetch_twitter_data

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
