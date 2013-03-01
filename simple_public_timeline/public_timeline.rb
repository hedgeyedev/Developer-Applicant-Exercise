require "sinatra"
require "twitter"
class PublicTimeline < Sinatra::Base
  helpers do
    def extract_source source
      unless (source.to_s =~ /\&gt\;(.+?)\&lt/).nil?
        string = $1
      end
      string
    end
  end
  
  def self.get_recent_tweets
    Twitter.search("popular tweets", :rpp => 20, :result_type => "recent")
  end

  get "/" do
    @results = PublicTimeline::get_recent_tweets
    erb :index
  end
  
  get "/via_js" do
    erb :via_js
  end
end
