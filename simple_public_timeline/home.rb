require 'sinatra'
require 'uri'
require 'net/https'
require 'json'

get '/' do
	url = URI.parse('https://api.twitter.com/1/statuses/public_timeline.json?count=20&include_entities=true')
	http = Net::HTTP.new(url.host, url.port)
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	http.use_ssl = true
	response = http.get(url.path).body
	
	
	parsed_json = JSON(response)
	
	content = "<html><head><title>Twitter Ruby Demo</title></head><body><div id=\"page\">"
	parsed_json.each do |tweet|
		imageURL = tweet["user"]["profile_image_url"]
		text = tweet["text"]
		name = tweet["user"]["name"]
		userName = tweet["user"]["screen_name"]
		source = tweet["source"]
		created = DateTime.parse(tweet["created_at"]).strftime("%m/%d/%y %I:%M:%S")
		content += "<img src=\"#{imageURL}\"/><a href=\"http://twitter.com/#{userName}\" class=\"name\">#{name}</a><div class=\"created\">#{created}</div><div class=\"text\">#{text}</div><div class=\"source\">via #{source}</div>"
	end
	content += "</div></body></html>"
	content
end

get '/via_js' do
	content = "<html><head><title>Twitter Ruby Demo</title></head><body><div id=\"page\">"
end