require 'httparty'

class Twitter
  include HTTParty

  def self.public_timeline(count = 20)
    self.get("http://twitter.com/statuses/public_timeline.json?count=#{count}")
  end
end
