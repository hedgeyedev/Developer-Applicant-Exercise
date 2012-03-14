$: << File.dirname(__FILE__)
require 'template'

describe Template do
  include Template

  it "should apply the template substition" do
    template('Code is %CODE%; alt code is %ALTCODE%', '5678901234').should == 'Code is 5678901234; alt code is 56789-012'
  end
  
end
