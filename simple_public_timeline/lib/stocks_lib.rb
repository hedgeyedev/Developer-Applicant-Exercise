require 'net/http'
require 'json'
module StocksLib
  def self.load_facebook_data(page_id)
    response = Net::HTTP.get_response("graph.facebook.com","/#{page_id}")
    (JSON.parse(response.body)['talking_about_count'])
  end
end