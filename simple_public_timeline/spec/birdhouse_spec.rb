require_relative 'spec_helper'

describe BirdHouse do
  
  before :each do
    @birdhouse = BirdHouse.new
  end

  describe "#new" do
    it "should return a BirdHouse object" do
      @birdhouse.should be_an_instance_of BirdHouse
    end
  end

end
