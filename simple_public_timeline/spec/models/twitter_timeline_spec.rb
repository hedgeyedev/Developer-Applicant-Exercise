require 'rails_helper'

RSpec.describe TwitterTimeline, type: :model do
  let(:sample_feed) { JSON.parse(File.read('spec/data/sample_feed.json')) }

  describe 'public_timeline' do
    it 'calls the helper methods' do
      expect(described_class).to receive(:fetch).once.and_return(sample_feed)
      expect(described_class).to receive(:transform).once.and_call_original
      described_class.public_timeline
    end
  end

  describe 'fetch' do
    it 'returns the body of the twitter response' do
      allow(HTTParty).to receive(:get).and_return(OpenStruct.new(body: sample_feed.to_json))
      expect(described_class.fetch).to eq(sample_feed)
    end
  end

  describe 'transform' do
    it 'transforms the twitter response into a simple array' do
      result = described_class.transform(sample_feed)
      expect(result.count).to eq(20)
    end

    it 'transforms the twitter response items into simple hashes' do
      result = described_class.transform(sample_feed)
      expect(result[0]).to eq({text: "RT @AnalogyBoss: #HinduVirodhiKhattar\n\nPeople can perform namaz on road, covid won't harm. But it is a problem for Diwali!", username: 'hrishipanigrah1', profile_image_url: 'https://pbs.twimg.com/profile_images/1454176020475441154/dqJlKfUs_normal.jpg', created_at: "2021-11-01T18:07:03.000Z", source: 'Twitter for Android'})
    end
  end
end
