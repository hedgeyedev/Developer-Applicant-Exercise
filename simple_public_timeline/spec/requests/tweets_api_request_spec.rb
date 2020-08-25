require 'rails_helper'

RSpec.describe 'TweetsApis', type: :request do
  describe 'tweets' do
    it 'should get tweets' do
      get '/api/v1/tweets/2'
      expect(response).to have_http_status(200)
      expect(response.body['message']).to be_truthy
      expect(response.body['tweets']).to be_truthy
    end
  end
end
