describe "HashMixin" do
  describe "#black_list(*args)" do
    before(:each) do
      @params = { :name => "Marcin", :age => 23, :stupid => true }
    end
    it "should not filter any data, because nothing was passed in" do
      filtered = @params
      @params.black_list.should eq filtered
    end
    it "should filter out name" do
      filtered = @params = { :age => 23, :stupid => true }
      @params.black_list(['name']).should eq filtered
    end
    it "should filter out name and stupid" do
      filtered = @params = { :age => 23 }
      @params.black_list(['name', 'stupid']).should eq filtered
    end  
  end
end