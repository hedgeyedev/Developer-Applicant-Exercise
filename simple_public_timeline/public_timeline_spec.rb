require_relative 'public_timeline'

describe PublicTimeline do

  it "#get_recent_tweets should return 20 most recent Tweets" do
    PublicTimeline::get_recent_tweets.length.should == 20
  end
  
end
