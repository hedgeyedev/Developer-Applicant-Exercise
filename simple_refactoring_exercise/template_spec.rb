require_relative 'template'

describe Template do
  include Template

  it "should substitute %CODE% and %ALTCODE% in the template" do
    template('Code is %CODE%; alt code is %ALTCODE%', '5678901234').should == 'Code is 5678901234; alt code is 56789-012'
  end
  
  it "should substitute multiple occurances of %CODE% and %ALTCODE% in the template" do
    template('Code is %CODE%; alt code is %ALTCODE%, and dup %CODE% with one more %ALTCODE%', '5678901234').should == 'Code is 5678901234; alt code is 56789-012, and dup 5678901234 with one more 56789-012'
  end

  it "should substitute %ALTCODE%, without %CODE% in the tempalte" do
    template('alt code is %ALTCODE%', '5678901234').should == 'alt code is 56789-012'
  end

  it "should substitute %CODE%, without %ALTCODE% in the tempalte" do
    template('Code is %CODE%', '5678901234').should == 'Code is 5678901234'
  end

  it "should handle value less than 7 characters" do
    template('Code is %CODE%; alt code is %ALTCODE%', 'abc').should == 'Code is abc; alt code is abc'
  end

end
