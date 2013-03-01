require 'net/http'
require 'json'

module TwitterTimeline 
  def self.pull_data
    response = HTTParty.get("https://api.twitter.com/1/statuses/public_timeline.json?count=3&include_entities=true")
    (JSON.parse(response.body))
  end
  
  def self.pull_data_from_url(url)
    response = HTTParty.get(url)
    (JSON.parse(response.body))
  end
  
end