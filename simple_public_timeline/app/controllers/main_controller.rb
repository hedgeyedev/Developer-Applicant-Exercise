#
# This file is part of simple_public_timeline. Copyright (C) 2013 and above Shogun <shogun@cowtech.it>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

# TODO@PI: rvmrc
class MainController < ApplicationController
  SIZE = 20

  helper MainHelper

  def index
    count = params[:count].to_integer    
    @tweets = client.search("yankees", count: count > 0 ? count : SIZE)
  end

  def via_js
  end

  private
    def client
      if !@client then
        credentials = YAML.load_file(Rails.root + "config/twitter.yml")

        @client = Twitter::REST::Client.new do |config|
          config.consumer_key = credentials[:consumer_key]
          config.consumer_secret = credentials[:consumer_secret]
          config.access_token = credentials[:access_token]
          config.access_token_secret = credentials[:access_token_secret]
        end
      end

      @client
    end
end