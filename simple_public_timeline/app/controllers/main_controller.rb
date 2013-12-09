#
# This file is part of simple_public_timeline. Copyright (C) 2013 and above Shogun <shogun@cowtech.it>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

class MainController < ApplicationController
  SIZE = 20

  helper MainHelper

  def index
    @tweets = fetch_tweets
  end

  def via_js
    if request.xhr? then
      @tweets = fetch_tweets
      render(:index, layout: false)
    end
  end

  private
    def client
      if !@client then
        credentials = YAML.load_file(Rails.root + "config/twitter.yml")

        @client = Twitter::Streaming::Client.new do |config|
          config.consumer_key = credentials[:consumer_key]
          config.consumer_secret = credentials[:consumer_secret]
          config.access_token = credentials[:access_token]
          config.access_token_secret = credentials[:access_token_secret]
        end
      end

      @client
    end

    def fetch_tweets
      count = params[:count].to_integer    
      count = SIZE if count < 1

      rv = []
      client.sample do |tweet|
        rv << tweet if tweet.deleted != true
        break if rv.count == count
      end

      rv
    end
end