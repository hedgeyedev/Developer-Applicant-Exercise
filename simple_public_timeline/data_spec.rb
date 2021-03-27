require 'rspec/autorun'
require './data'

describe Tweet do

  it "is a struct with fields :text, :time, :lang, :source, :user_name, :user_img, and the method :time_phrase" do
    expect(
      (Tweet.new().methods &
       [:text, :time, :lang, :source, :user_name, :user_img, :time_phrase]).size
    ).to eq 7
  end

  it "gives a correct approximation of the time since posted" do
    expect(Tweet.new("",Time.now.to_i - 3,"","","","").time_phrase).to eq "just now"
    expect(Tweet.new("",Time.now.to_i - 24,"","","","").time_phrase).to eq "about 25sec ago"
    expect(Tweet.new("",Time.now.to_i - 65,"","","","").time_phrase).to eq "about 1min ago"
    expect(Tweet.new("",Time.now.to_i - 111,"","","","").time_phrase).to eq "about 2min ago"
    expect(Tweet.new("",Time.now.to_i - 410,"","","","").time_phrase).to eq "about 5min ago"
    expect(Tweet.new("",Time.now.to_i - 490,"","","","").time_phrase).to eq "about 10min ago"
  end

end

describe tweets do
  it "returns an array populated by Tweet structs" do
    expect(tweets.class).to eq Array
    expect(tweets.size > 0).to eq true
    expect(tweets[0].class).to eq Tweet
  end
end

describe get_feed do
  it "returns an array of 20 tweets, ordered by random creation times from 0-600s in the past" do
    expect(get_feed.class).to eq Array
    expect(get_feed.size).to eq 20
  end
end

describe get_feed_json do
  it "returns a json string shaped like get_feed" do
    expect(get_feed_json.class).to eq String
    expect(JSON.parse(get_feed_json).size).to eq 20
  end
end
