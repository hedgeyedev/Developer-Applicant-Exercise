class TimelineController < ApplicationController
  def index
    service = TwitterService.new('http://localhost:4567/1.1/statuses/status.json')
    @tweets = service.get_public_posts(20)
  end

  def via_js
  end
end
