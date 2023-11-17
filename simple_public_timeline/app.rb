require 'sinatra'
require 'httparty'
require 'json'
require 'nokogiri'

require 'date'
require 'dotiw'

include DOTIW::Methods

FAKE_TWITTER_API_PORT='4444'
FAKE_TWITTER_API_URL="http://localhost:#{FAKE_TWITTER_API_PORT}/1.1/statuses/status.json?count=20"

set :public_folder, __dir__ + '/static'

get '/' do
  @tweets = fetch_tweets
  erb :index
end

get '/via_js' do
  @fake_twitter_api_url = FAKE_TWITTER_API_URL
  erb :index_via_js
end

def fetch_tweets
  response = HTTParty.get(FAKE_TWITTER_API_URL)
  tweets = response.parsed_response

  tweets.map do |tweet|
    {
      user: {
        profile_image_url: tweet['user']['profile_image_url'],
        screen_name: tweet['user']['screen_name']
      },
      text: tweet['text'],
      created_at: time_in_words(tweet['created_at']),
      source: strip_tags(tweet['source'])
    }
  end
end

def time_in_words(timestamp)
  distance_of_time_in_words(Time.now, DateTime.parse(timestamp))
end

def strip_tags(html)
  Nokogiri::HTML(html).text
end

helpers do
  def user_link(screen_name)
    "https://twitter.com/#{screen_name}"
  end
end

__END__

@@layout
<!doctype html>
<html>
<head>
  <title>Recent Public Tweets</title></head>
  <link rel="stylesheet" type="text/css" href="/css/styles.css">
<body>
  <%= yield %>
</body>
</html>

@@index
<h1>Recent Public Tweets</h1>
<h2>What everyone on Twitter is talking about</h2>
<ul>
  <% @tweets.each do |tweet| %>
    <li>
      <img src="<%= tweet[:user][:profile_image_url] %>">
      <a href="<%= user_link(tweet[:user][:screen_name]) %>"><%= tweet[:user][:screen_name] %></a>
      <div><%= tweet[:text] %></div>
      <div class="source"><%= tweet[:created_at] %> ago from <%= tweet[:source] %></div>
      <hr>
    </li>
  <% end %>
</ul>

@@index_via_js
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script type="text/javascript">
  var FAKE_TWITTER_API_URL = "<%= @fake_twitter_api_url %>";
</script>
<h1>Recent Public Tweets</h1>
<h2>What everyone on Twitter is talking about</h2>
<ul id="tweets"></ul>
<script src="/js/fetch_tweets.js"></script>






