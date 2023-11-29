require 'net/http'
require 'json'

class TweetFetcher
  class FetchError < StandardError; end

  API_URL = 'http://localhost:4567/1.1/statuses/status.json'

  def self.fetch
    response = make_request
    parse_response(response)
  end

  private

  def self.make_request
    uri = URI(API_URL)
    Net::HTTP.get(uri)
  rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
    Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
    raise FetchError, "HTTP Error: #{e.message}"
  rescue StandardError => e
    raise FetchError, "HTTP Error: #{e.message}"
  end

  def self.parse_response(response)
    tweets = JSON.parse(response, symbolize_names: true)
    raise FetchError, 'Error fetching tweets.' if tweets.empty?

    tweets
  rescue JSON::ParserError
    raise FetchError, 'Invalid response format.'
  end
end
