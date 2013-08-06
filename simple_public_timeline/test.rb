require 'tweetstream'
require 'sinatra'

TweetStream.configure do |config|
  config.consumer_key       = 'c2J2sxvlpWR2It2rPsBtrQ'
  config.consumer_secret    = 'ErknEVZhXfQl0PsiFmyOB2bWWXauHARgGaVLu6HYRc'
  config.oauth_token        = '1641773640-uIf6B6AYhPnhhxebnceEZzLG3Didfn2679ITpJc'
  config.oauth_token_secret = 'nj8rXHw3S9OTm47QMtEdZsCf2H0M4j8yLqxdeazdA'
  config.auth_method        = :oauth
end

client = TweetStream::Client.new


#this works
result = nil
client.sample do |tweet,client|
  puts "got a first tweet"
  result = tweet
  client.stop
end
puts result

#this does not
get '/' do
  result = []
  client.sample do |tweet,client|
    result << tweet;
    puts "got a second tweet!"
  end
  
  while result.length < 1
  end
  
  puts result

end
