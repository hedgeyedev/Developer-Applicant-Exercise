describe "Helpers" do
  
  describe ".instance_of_class(name)" do
    it "should exist and be equal to {}" do
      instance_of_class("Hash").should == Hash.new
    end
    it "should not equal to {} if Class exists and doesn't match" do
      instance_of_class("Array").should_not == Hash.new
    end
    it "should not raise error is instance_of_class is NotARealClass" do
      lambda { 
        instance_of_class("NotARealClass").should_not == Hash.new
      }.should raise_error(NameError)
    end
  end  
end