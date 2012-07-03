require 'spec_helper'


describe Example do 

	describe "generic validtion" do
    before(:each) { FactoryGirl.create(:example) }
    after(:each) { Example.delete_all }

		it { should respond_to :name }
		it { should respond_to :description }
		it { should respond_to :user }
		it { should respond_to :project }
		it { should respond_to :email }
		it { should respond_to :revision }

		it { should_not allow_mass_assignment_of(:email) }
		it { should allow_mass_assignment_of :name }
		it { should allow_mass_assignment_of :description }
		it { should allow_mass_assignment_of :user }
		it { should allow_mass_assignment_of :project }
		it { should allow_mass_assignment_of :revision }
		
    # it { should validate_uniqueness_of(:user).with_message 'user is already taken ("user13")' }
 		it "should thrown a Mongoid::Errors::Validations - User already taken exception" do
 		  FactoryGirl.create(:example, :user => "duplicate")
 		  expect { FactoryGirl.create(:example, :user => "duplicate") }.to raise_error(Mongoid::Errors::Validations)
	  end

		it { should validate_presence_of :name}
		it { should validate_numericality_of :revision }

    it { should ensure_length_of(:user).is_at_least(4).with_short_message(/minimum is 4 characters/) }
    it { should ensure_length_of(:user).is_at_most(20).with_short_message(/maximum is 20 characters/) }

		it { should ensure_length_of(:name).is_at_least(6).with_short_message(/minimum is 6 characters/) }
		it { should ensure_length_of(:name).is_at_most(249).with_short_message(/maximum is 249 characters/) }

		it { should_not allow_value("aaaaa").for(:name).with_message(/too short/) }
		it { should_not allow_value("a"*250).for(:name).with_message(/too long/)}
	end	
  describe ".assign_email" do
    it "should create example resource with generated email" do
      @example = FactoryGirl.create(:example)
  	  @example.email.should eq (@example.user + "@gmail.com")
	   end
	   it "should create example resource not have assigned email" do
	     @example = FactoryGirl.create(:example)
  	   @example.email.should_not eq "notuser1@gmail.com"
  	   
     end
  end
  
  describe "error handeling" do
    it "should raise error Mongoid::Errors::Validations empty resource :examples" do
      expect { Example.create! }.to raise_error(Mongoid::Errors::Validations)
    end
    it "should raise error Mongoid::Errors::Validations if :user is not unique" do
      @example = FactoryGirl.create(:example)
      duplicate =  @example.user
      expect { FactoryGirl.create(:example, :user => duplicate) }.to raise_error(Mongoid::Errors::Validations)
    end
    it "should raise error Mongoid::Errors::Validations if :user is empty" do
      @example = FactoryGirl.build(:example, :user => "" )
      expect { @example.save! }.to raise_error(Mongoid::Errors::Validations )
    end
    it "should raise error Mongoid::Errors::Validations if :user too long" do
      @example = FactoryGirl.build(:example, :user => "a"*21 )
      expect { @example.save! }.to raise_error(Mongoid::Errors::Validations )
    end
    it "should raise error Mongoid::Errors::Validations if :name is too short" do
      @example = FactoryGirl.build(:example, :name => "a"*3)      
      expect { @example.save! }.to raise_error(Mongoid::Errors::Validations )
    end
    
    it "should raise error Mongoid::Errors::Validations if :name is too long" do
      @example = FactoryGirl.build(:example, :revision => "a"*250)
      expect { @example.save! }.to raise_error(Mongoid::Errors::Validations )
    end
    
    it "should raise error Mongoid::Errors::Validations if :revision is not a number" do
      @example = FactoryGirl.build(:example, :revision => "aasd")
      expect { @example.save! }.to raise_error(Mongoid::Errors::Validations )
    end
    
  end
end