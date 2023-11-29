require 'rails_helper'

RSpec.describe TweetFetcher do
  describe '.fetch' do
    context 'when the request is successful' do
      before do
        fake_response = [{ text: 'Sample tweet', user: { screen_name: 'user1' } }].to_json
        stub_request(:get, TweetFetcher::API_URL).to_return(status: 200, body: fake_response)
      end

      it 'returns an array of tweets' do
        expect(TweetFetcher.fetch).to be_an(Array)
      end
    end

    context 'when the request returns an empty array' do
      before { stub_request(:get, TweetFetcher::API_URL).to_return(status: 200, body: '[]') }

      it 'raises a FetchError' do
        expect { TweetFetcher.fetch }.to raise_error(TweetFetcher::FetchError)
      end
    end

    context 'when there is an HTTP error' do
      before { stub_request(:get, TweetFetcher::API_URL).to_raise(StandardError) }

      it 'raises a FetchError' do
        expect { TweetFetcher.fetch }.to raise_error(TweetFetcher::FetchError)
      end
    end
  end
end
