require_relative 'template'

describe Template do
  include Template

  it "should substitute %CODE% and %ALTCODE% in the template" do
    template('Code is %CODE%; alt code is %ALTCODE%', '5678901234').should == 'Code is 5678901234; alt code is 56789-012'
  end
  
  it "should substitute %CODE% in the template without %ALTCODE%" do
    template('Code is %CODE%', '5678901234').should == 'Code is 5678901234'
  end

  it "should substitute %ALTCODE% in the template without %CODE%" do
    template('Code is %ALTCODE%', '5678901234').should == 'Code is 56789-012'
  end

  it "should substitute %CODE% and %ALTCODE% in the template twice" do
    template('Code is %CODE%; alt code is %ALTCODE%; Code is %CODE%; alt code is %ALTCODE%', '5678901234').should == 'Code is 5678901234; alt code is 56789-012; Code is 5678901234; alt code is 56789-012'
  end

end
