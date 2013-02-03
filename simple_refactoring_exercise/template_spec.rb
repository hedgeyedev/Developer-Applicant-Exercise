require_relative 'template'

describe Template do
  include Template

  context "#template" do
	it "should substitute %CODE% and %ALTCODE% in the template" do
    	template('Code is %CODE%; alt code is %ALTCODE%', '5678901234').should == 'Code is 5678901234; alt code is 56789-012'
  	end
  end

  context "#alter_req_id" do
  	it "should convert a req_id of format 5678901234 into format 56789-012" do
  		alter_req_id("1234567890").should == "12345-678"
  	end
  end

end
