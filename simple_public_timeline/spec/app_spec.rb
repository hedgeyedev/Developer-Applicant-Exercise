# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'spec_helper'
require 'rspec'

describe App do
  let(:app) { App.new }

  context 'get /' do
    let(:response) { get '/' }

    it 'returns status 200 OK' do
      expect(response.status).to eq(200)
    end
  end

  context 'get /timeline' do
    let(:response) { get '/timeline' }

    it 'returns status 200 OK' do
      expect(response.status).to eq(200)
      expect(response.content_type).to eq('application/json')
    end
  end

  context 'get /via_js' do
    let(:response) { get '/via_js' }

    it 'returns status 200 OK' do
      expect(response.status).to eq(200)
    end
  end

  context 'post /tweetList' do
    let(:response) { post '/tweetList' }

    it 'returns status 200 OK' do
      expect(response.status).to eq(200)
    end
  end
end
