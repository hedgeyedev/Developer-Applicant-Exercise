require "sinatra"
class PublicTimeline < Sinatra::Base
  helpers do
    def extract_source source
      unless (source.to_s =~ /\&gt\;(.+?)\&lt/).nil?
        string = $1
      end
      string
    end
  end

  get "/" do
    @results = Twitter.search("popular tweets", :rpp => 20, :result_type => "recent")
    erb :index
  end
  
  get "via_js" do
  end
end
