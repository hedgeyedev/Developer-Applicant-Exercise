require_relative 'app'

describe Tweets do
  
  it "should get an array" do
    res = Tweets.get 20
    res.class.should == Array
  end
  
  it "should be as long as specified" do
    5.times do |i|
      res = Tweets.get i
      res.length.should == i
    end
  end
  
  it "should be different each time called" do
    a = Tweets.get 1
    b = Tweets.get 1
    a.should_not == b
  end
  
end

describe Display do
  it "should show the basic twitter fields" do
    user = double 'twitter user', name: "Bob", profile_image_url: "http://nowhere.com/image.jpg", screen_name:"nobody"
    tweet = double 'tweet', user:user, text:"My Status Update", source: "RSpec Mock", created_at: Time.new(1981,4,17,11,15)
    result = Display.tweet tweet:tweet
    result.should include("Bob")
    result.should include("http://nowhere.com/image.jpg")
    result.should include("My Status Update")
    result.should include("RSpec Mock")
    result.should include("81")
    result.should include("Apr")
    result.should include("17")
    result.should include("11")
    result.should include("15")
  end
  
  it "should include many tweets" do
    tweet = double 'tweet'
    tweet_list = Array.new 20,tweet
    allow(Display).to receive(:tweet).and_return ""
    expect(Display).to receive(:tweet).with(tweet:tweet).exactly(20).times

    Display.tweet_list tweet_list:tweet_list    
  end
  
  it "should render arbitrary display" do
    result = Display.page content:"Random Content" 
    result.should include("Random Content")
  end
  
  it "should include specified javascript files" do
    result = Display.page javascript:["jquery.js","app.js"]
    result.should include("jquery.js")
    result.should include("app.js")
  end
  
  it "should include some filler text" do
    result = Display.page
    
    result.should include("Recent Public Tweets")
    result.should include("What everyone on Twitter is talking about")
  end
end

describe "Integration" do
  it "should work together" do
    tweets = Tweets.get 20
    Display.tweet_list tweet_list:tweets
  end
end