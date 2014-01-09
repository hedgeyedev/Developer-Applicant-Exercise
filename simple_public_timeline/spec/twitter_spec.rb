require 'spec_helper'

describe TwitterFetcher do
  before :each do
    @TwitterFetcher = TwitterFetcher.new
  end

  describe "#new" do
    it "returns a new TwitterFetcher object" do
      @TwitterFetcher.should be_an_instance_of TwitterFetcher
    end

    it "takes zero parameters and returns a TwitterFetcher object" do
       lambda { TwitterFetcher.new "testParam1" }.should raise_exception ArgumentError
    end
  end
end
