require_relative "tweet_time"

describe "TweetTime" do
  it "should do retrieve 20 rows of twitter data" do
    grabtimeline().size.should == 20
  end
end