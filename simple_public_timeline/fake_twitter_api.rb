# frozen_string_literal: true

require 'uri'
require 'net/http'

# Service for api data
class FakeTwitterApi
  def fetch_fake_tweets(count = 20)
    url = "http://localhost:4568/1.1/statuses/status.json?count=#{count}"
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      res.body
    else
      []
    end
  end
end
