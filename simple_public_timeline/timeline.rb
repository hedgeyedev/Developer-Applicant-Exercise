require 'sinatra'
require 'httparty'
require 'date'
require 'hashie'

helpers do
  def format_string_date(d)
     DateTime.parse(d).strftime("%Y-%m-%d %H:%M")
  end

  def user_link(screen_name)
    "http://twitter.com/#{screen_name}"
  end

end

get "/" do
   @tweets = HTTParty.get('http://twitter.com/statuses/public_timeline.json').map{|t| Hashie::Mash.new(t) }
   erb :index
end

get "/via_js" do
   erb :via_js
end
