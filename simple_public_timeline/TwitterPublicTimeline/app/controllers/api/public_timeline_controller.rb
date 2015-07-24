class Api::PublicTimelineController < ApplicationController
  def twitter_json
    @tweets = []
    client = TweetStream::Client.new

    client.sample do |object|
      @tweets << object if object.is_a?(Twitter::Tweet)
      break if @tweets.length == 20
    end

    render :tweets
  end
end
