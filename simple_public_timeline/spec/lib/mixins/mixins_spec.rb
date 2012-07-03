describe "Mixins" do
  describe "on Hash.black_list(*args)" do
    it "should exist" do
      instance_of_class("Hash").should respond_to_method("black_list")
    end
  end
end