class PublicTimelineController < ApplicationController

  def root
    @tweets = []
    client = TweetStream::Client.new

    client.sample do |object|
      @tweets << object if object.is_a?(Twitter::Tweet)
      break if @tweets.length == 20
    end

    render :root
  end

  def via_js
    render :via_js
  end
end
