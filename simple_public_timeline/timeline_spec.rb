require 'rspec'
require 'rack/test'
require_relative 'timeline'

set :environment, :test

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'Hedgeye Twitter Timeline App' do
  describe "GET '/'" do
    it "loads timeline" do
      get '/'
      expect(last_response).to be_ok
    end
  end

  describe "GET '/via_js'" do
    it "loads timeline via Javascript" do
      get '/via_js'
      expect(last_response).to be_ok
    end
  end

  describe "#extract_name_from_x_url" do
    it "returns formatted name from URL" do
      expect(extract_name_from_x_url("https://example.com/john_doe")).to eq("John Doe")
    end

    it "returns 'X User' for invalid URL" do
      expect(extract_name_from_x_url("not a url")).to eq("X User")
    end
  end

  describe "#extract_source_from" do
    it "extracts source from HTML string" do
      html_string = "<div>Some text</div>"
      expect(extract_source_from(html_string)).to eq("Some text")
    end

    it "returns nil for invalid input" do
      expect(extract_source_from(nil)).to be_nil
    end
  end

  describe "#time_distance_in_words" do
    it "returns time distance in words" do
      time = Time.now - 3600 # 1 hour ago
      expect(time_distance_in_words(time)).to include("1 hour")
    end
  end
end
