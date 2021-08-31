# frozen_string_literal: true

require "#{ROOT}/simple_public_timeline/lib/services/twitter/tweet_service.rb"
require 'twitter'

class MockTwitterClient
  def initialize; end

  def home_timeline; end
end

class MockTweet
  attr_reader :user, :text, :created_at

  def initialize(user, text, created_at)
    @user = user
    @text = text
    @created_at = created_at
  end
end

class MockUser
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

describe Twitter::TweetService do
  let!(:mock_twitter_client) { MockTwitterClient.new }
  let(:mock_tweets) do
    [
      MockTweet.new(MockUser.new('test user 1'), 'tweet text 1', 'tweet time 1' ),
      MockTweet.new(MockUser.new('test user 2'), 'tweet text 2', 'tweet time 2' )
    ]
  end
  let(:expected_output) do
    [
      { username: 'test user 1', text: 'tweet text 1', created_at: 'tweet time 1' },
      { username: 'test user 2', text: 'tweet text 2', created_at: 'tweet time 2' }
    ]
  end

  before do
    allow(Twitter::REST::Client).to receive(:new).and_return(mock_twitter_client)
    allow(mock_twitter_client).to receive(:home_timeline).and_return(mock_tweets)
  end

  it 'should query twitter for our home timeline tweets' do
    described_class.new.perform
    expect(Twitter::REST::Client).to have_received(:new)
    expect(mock_twitter_client).to have_received(:home_timeline)
  end

  it 'should return tweets in the expected format' do
    expect(described_class.new.perform).to eq(expected_output)
  end
end
