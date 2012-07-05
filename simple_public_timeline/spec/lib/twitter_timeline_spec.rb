require "spec_helper"

describe TwitterTimeline do
  it "should return an array of 20 attributes" do
    TwitterTimeline.pull_data.size.should eq 20
  end
end