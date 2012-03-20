require_relative 'template'

describe Template do
  include Template

  it "should substitute %CODE% and %ALTCODE% in the template" do
    template('Code is %CODE%; alt code is %ALTCODE%', '5678901234').should == 'Code is 5678901234; alt code is 56789-012'
  end

  it "should substitute all occurrences of keywords in the template" do
    template('Code is %CODE%; alt code is %ALTCODE%, and again Code => %CODE%', '5678901234').should == 
      'Code is 5678901234; alt code is 56789-012, and again Code => 5678901234'
    template('Code => %CODE%; alt code => %ALTCODE%. Code => %CODE%; alt code => %ALTCODE%.', '5678901234').should == 
      'Code => 5678901234; alt code => 56789-012. Code => 5678901234; alt code => 56789-012.'
  end
  
  it "should work with alphas, too" do
    template('Code is %CODE%; alt code is %ALTCODE%', 'abc5678def').should == 'Code is abc5678def; alt code is abc56-78d'
  end
  
  it "should behave sensibly when the request id is too short" do
    template('Code is %CODE%; alt code is %ALTCODE%', '5678').should == 'Code is 5678; alt code is 5678-'
    template('Code is %CODE%; alt code is %ALTCODE%', '56789').should == 'Code is 56789; alt code is 56789-'
    template('Code is %CODE%; alt code is %ALTCODE%', '567891').should == 'Code is 567891; alt code is 56789-1'
  end
  
  it "should keep the string intact that has no keywords" do
    template('foo', '10981309').should == 'foo'
  end
end
