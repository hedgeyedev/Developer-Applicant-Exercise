require_relative 'template'

describe Template do
  include Template

  describe "#altcode_from_req_id" do
    pending "better logic requirements (length, etc.)"

    it "should convert a req_id to an altcode" do
      altcode_from_req_id("5678901234").should == '56789-012'
    end
  end

  describe "#template" do
    it "should substitute %CODE% and %ALTCODE% in the template" do
      template('Code is %CODE%; alt code is %ALTCODE%', '5678901234').should == 'Code is 5678901234; alt code is 56789-012'
    end
  end
end
