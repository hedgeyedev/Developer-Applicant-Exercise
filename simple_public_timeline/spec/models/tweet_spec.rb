require 'spec_helper'
require_relative '../../models/tweet'

describe Tweet do
  before do
    TweetStream::Client.any_instance.stub(:sample) do
      [1..2].map {|i| Twitter::Tweet.new(id: i) }
    end
    stub_const('Tweet::MAX_TWEETS', 2)
  end

  it 'caches tweets on first call' do
    expect_any_instance_of(Redis).to receive(:set)
    Tweet.new.get
  end

  it 'gets from twitter on first call' do
    expect_any_instance_of(TweetStream::Client).to receive(:sample)
    Tweet.new.get
  end

  context 'second call' do
    before do
      Tweet.new.get
    end

    it 'gets from cache' do
      expect_any_instance_of(Redis).to receive(:get)
      Tweet.new.get
    end

    it 'does not get from twitter' do
      expect_any_instance_of(TweetStream::Client).not_to receive(:sample)
      Tweet.new.get
    end

  end
end
