#!/usr/bin/ruby

require 'tweetstream'
require 'json'
require_relative 'birdhouse'

BIRDHOUSE = BirdHouse.new

  # Configuration of TweetStream
  TweetStream.configure do |config|
    config.consumer_key          = 'bkyBRnTyupAUduFzULa5TA'
    config.consumer_secret       = 'vE4GGtymbICKtbfQ0e5al5rSl254r7fm8kCb93Wnk'
    config.oauth_token           = '111410184-DW0082LnbEgnl9if1ZAKvPcjLQMU292Jliyt14gj'
    config.oauth_token_secret    = 'mtCaSyZun4BSwulQlDXNIcz1zhZ0OlNWNi1ue6havJddU'
    config.auth_method           =  :oauth
  end
  
  client = TweetStream::Client.new
  
  client.sample do |status|
  # For each entry, show the profile image, a link to the users profile,
  # the tweet text, the time of the tweet, and source("via Twitter for Android")
    BIRDHOUSE.push_tweet(
      id:                 status[:id],
      profile_image_url:  status.user.profile_image_url,
      username:           status.user.screen_name,
      text:               status.text,
      recieved_at:        Time.new.strftime("Recieved on %m/%d/%Y at %T:%M%p"),
      source:             status.source
    )

  end

