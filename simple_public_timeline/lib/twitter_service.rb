require 'uri'
require 'net/http'

class TwitterService
  def initialize(url)
    @url = URI(url)
  end

  def get_public_posts(result_count)
    params = {count: result_count}
    @url.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(@url)

    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      []
    end
  end
end