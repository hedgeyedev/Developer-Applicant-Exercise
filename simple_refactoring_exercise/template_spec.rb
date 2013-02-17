require_relative 'template'

describe Template do
  include Template

  context "#template" do
    it "should substitute %CODE% and %ALTCODE% in the template" do
    	template('Code is %CODE%; alt code is %ALTCODE%', '5678901234').should == 'Code is 5678901234; alt code is 56789-012'
  	end
  
    it "shouldn't barf if %CODE% or %ALTCODE% aren't present in the template" do
      template('Code is %CODE%; alt code is %BLAH%', '5678901234').should == 'Code is 5678901234; alt code is %BLAH%'
      template('Code is %BLOO%; alt code is %ALTCODE%', '5678901234').should == 'Code is %BLOO%; alt code is 56789-012'
      template('Code is %BLOO%; alt code is %BLAH%', '5678901234').should == 'Code is %BLOO%; alt code is %BLAH%'
    end

    it "shouldn't replace CODE or ALTCODE in the template" do
      template('Code is CODE; alt code is ALTCODE', '5678901234').should == 'Code is CODE; alt code is ALTCODE'
    end
  end

  
  context "#alter_req_id" do
  	it "should convert a req_id of format 5678901234 into format 56789-012" do
  		alter_req_id("1234567890").should == "12345-678"
  	end
  end

end
