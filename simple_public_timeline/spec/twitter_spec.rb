require_relative '../twitter'
require 'rspec'

describe 'Twitter' do
  describe ".public_timeline" do
    before do
      @public_timeline_response = Twitter.public_timeline
    end

    it "should return 20 results by default" do
      @public_timeline_response.count.should == 20
    end
  end
end
