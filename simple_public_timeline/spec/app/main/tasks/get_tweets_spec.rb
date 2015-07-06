require 'spec_helper'

describe 'get tweets', type: :task do
  it 'should return 20 tweets' do
    tweets = []

    TwitterTasks.get_tweets.then do |result|
      tweets = result
    end.fail do |error|
      tweets = [1,2,3,4] # will know failure trigger if length is 4
    end

    expect(tweets.count).to eq(20)
  end
end