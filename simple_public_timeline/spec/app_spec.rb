require 'spec_helper'

RSpec.describe 'Simple Public Timeline App' do
  describe 'GET /' do
    before { get '/' }

    it 'is successful' do
      expect(last_response.status).to eq 200
    end

    it 'displays the main headline' do
      expect(last_response.body).to include('<h1>Recent Public Tweets</h1>')
    end

    it 'displays the subheadline' do
      expect(last_response.body).to include('<h2>What everyone on Twitter is talking about!</h2>')
    end

    it 'renders the tweets list' do
      expect(last_response.body).to include('<ul>')
    end
  end

  describe 'GET /via_js' do
    before { get '/via_js' }

    it 'is successful' do
      expect(last_response.status).to eq 200
    end

    it 'includes a container for tweets' do
      expect(last_response.body).to include('<div id="tweets"></div>')
    end

    it 'includes a script tag to fetch tweets' do
      expect(last_response.body).to include('<script>')
      expect(last_response.body).to include('fetch(')
    end
  end
end
