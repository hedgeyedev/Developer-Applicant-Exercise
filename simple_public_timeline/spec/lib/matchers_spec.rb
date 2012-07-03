describe "Matchres" do
  describe "respond_to_method" do
    it "should return true for method 'inspect' on {}" do
      Hash.new.should respond_to_method("inspect")
    end
    it "should not return true for method 'not_a_real_method' on {}" do
      Hash.new.should_not respond_to_method("not_a_real_method")
    end
    it "should use .instance_of_class helper with valid class {}" do
      instance_of_class("Hash").should respond_to_method("inspect")
    end
    it "should use .instance_of_class helper with invalid class NotARealClass" do
      lambda {
        instance_of_class("NotARealClass").should_not respond_to_method("inspect")
      }.should raise_exception(NameError)
    end
  end
end
# 
# describe 'the one_plus method' do
#   it 'should add one to a number' do
#     (1 + 1).should add_up_to(2)
#     (1 + 0).should_not add_up_to(2)
#   end
# end
