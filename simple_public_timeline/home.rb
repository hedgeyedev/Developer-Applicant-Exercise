require 'sinatra'
require 'uri'
require 'net/https'
require 'json'

get '/' do
	tweets = getPublicTimeline
	ERB.new(File.new("home.erb").read()).result(binding)
end

get '/via_js' do
	(ERB.new(File.new("via_js.erb").read())).result()
end

get '/public_timeline' do
	content_type(:json)
	getPublicTimeline().to_json()
end

def getPublicTimeline()
	url = URI.parse('https://api.twitter.com/1/statuses/public_timeline.json?count=20&include_entities=true')
	http = Net::HTTP.new(url.host, url.port)
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	http.use_ssl = true
	parsedJson = JSON(http.get(url.path).body())
	tweets = []
	parsedJson.each do |tweet|		
		tweets << {
			"imageURL" => tweet["user"]["profile_image_url"],
			"text" => tweet["text"],
			"name" => tweet["user"]["name"],
			"userName" => tweet["user"]["screen_name"],
			"source" => tweet["source"],
			"created" => DateTime.parse(tweet["created_at"]).strftime("%m/%d/%y %I:%M:%S")
		}
	end
	tweets
end