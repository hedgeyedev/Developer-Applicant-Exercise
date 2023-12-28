# spec/app_spec.rb
require_relative 'spec_helper'

describe Sinatra::Application do
  include RSpecMixin

  describe 'GET /' do
    it 'renders tweets on the server side' do
      allow(HTTParty).to receive(:get).and_return(
        double('HTTParty Response', body: '[{"user": {"profile_image_url": "image_url", "profile_url": "profile_url", "screen_name": "user123"}, "text": "Hello world!", "created_at": "2023-01-01 12:00:00", "source": "via Twitter"}]')
      )

      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to include('Recent Public Tweets')
      expect(last_response.body).to include('via Twitter')
    end
  end

  describe 'GET /via_js' do
    it 'renders tweets via JavaScript' do
      get '/via_js'
      expect(last_response).to be_ok
      expect(last_response.body).to include('Recent Public Tweets (Via JavaScript)')
    end
  end

  describe 'GET /tweets' do
    it 'returns a JSON response with tweets' do
      allow(HTTParty).to receive(:get).and_return(
        double('HTTParty Response', body: '[{"user": {"profile_image_url": "image_url", "profile_url": "profile_url", "screen_name": "user123"}, "text": "Hello world!", "created_at": "2023-01-01 12:00:00", "source": "via Twitter"}]')
      )
      get '/tweets'
      expect(last_response).to be_ok
      expect(last_response.headers['Content-Type']).to include('application/json')

      tweets = JSON.parse(last_response.body)
      expect(tweets).to be_an(Array)
      tweets.each do |tweet|
        expect(tweet).to have_key('user')
        expect(tweet['user']).to have_key('profile_image_url')
        expect(tweet['user']).to have_key('profile_url')
        expect(tweet['user']).to have_key('screen_name')
        expect(tweet).to have_key('text')
        expect(tweet).to have_key('created_at')
        expect(tweet).to have_key('source')
      end
    end
  end
end
