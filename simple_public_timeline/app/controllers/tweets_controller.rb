require 'twitter'

class TweetsController < ApplicationController
  before_action :require_xhr_request, only: [:action, :action_2]

  def index
    @tweets = home_timeline 
  end 

  def initialize
    super
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "GDnMMmqIN4kIxxWk4ng0fYg8G"
      config.consumer_secret     = "HwUp1i60vum3KmkGgLjSlJcdtfAAKDEk6QJo68Jnq6DF9tu6IX"
      config.access_token        = "1036347348262109184-ZGfpiuhEsEfgy82WALkn0J3AdcouSJ"
      config.access_token_secret = "S5PlKfJUNzVdUUnnPOa3WNihw09E8avZJllalUPmGaA3J"
    end
  end 
  
  def home_timeline
    @tweets = @client.home_timeline
    #@users = {}
    @tweets.each do |tweet|
      puts tweet
     # @users[tweet.id] = tweet.user
    end
    @tweets
  end 
  

  

  private
  def require_xhr_request
    redirect_to(root_url) unless request.xhr?
  end
end
