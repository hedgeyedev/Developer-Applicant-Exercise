require_relative 'template'

describe Template do
  include Template

  it "should silently process strings without tokens %CODE% and %ALTCODE%." do
    template('Code is ; This is introduced characters; alt code is ', '5678901234').should == 'Code is ; This is introduced characters; alt code is '
  end

  it "should substitute %CODE% and %ALTCODE% in the template" do
    template('Code is %CODE%; alt code is %ALTCODE%', '5678901234').should == 'Code is 5678901234; alt code is 56789-012'
  end

  it "should substitute %CODE% and %ALTCODE% in the template.  Even with different length strings." do
    template('Code is %CODE%; This is introduced characters; alt code is %ALTCODE%', '5678901234').should == 'Code is 5678901234; This is introduced characters; alt code is 56789-012'
  end
end
