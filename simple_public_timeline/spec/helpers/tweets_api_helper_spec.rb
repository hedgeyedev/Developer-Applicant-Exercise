require 'rails_helper'

RSpec.describe TweetsApiHelper do
  describe 'tweets_api_helper' do
    it "correctly set ups Tweeter's API credentials" do
      expect(TweetStream.options[:consumer_key]).to be_nil
      configure
      expect(TweetStream.options[:consumer_key]).to be_truthy
    end

    it 'gets information from Tweeter' do
      status, status_message, tweets = get_tweets(2)
      expect(tweets).to be_truthy
      expect(status).to be_truthy
      expect(status_message).to be_truthy

      expect(tweets.length).to eql(2)
    end

    it 'raises error when wrong arguments are passed' do
      expect { get_tweets('2') }.to raise_error
    end
  end
end
