require 'twitter'

class TweetsController < ApplicationController

  def index
    @tweets = home_timeline  
  end 

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "GDnMMmqIN4kIxxWk4ng0fYg8G"
      config.consumer_secret     = "HwUp1i60vum3KmkGgLjSlJcdtfAAKDEk6QJo68Jnq6DF9tu6IX"
      config.access_token        = "1036347348262109184-ZGfpiuhEsEfgy82WALkn0J3AdcouSJ"
      config.access_token_secret = "S5PlKfJUNzVdUUnnPOa3WNihw09E8avZJllalUPmGaA3J"
    end
  end 
  
  def home_timeline
    @tweets = @client.home_timeline
    @tweets.each do |tweet|
      puts tweet
    end
    @tweets
  end 

end
