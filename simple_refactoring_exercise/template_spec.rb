require_relative 'template'

describe Template do
  include Template
  
  before(:each) do
    @template = 'Code is %CODE%; alt code is %ALTCODE%'
    @code = '5678901234'
  end

  it "should substitute %CODE% and %ALTCODE% in the template" do
    template(@template, @code).should == 'Code is 5678901234; alt code is 56789-012'
  end
  
  it "should not alter either original string" do
    template(@template,@code)
    @template.should == 'Code is %CODE%; alt code is %ALTCODE%'
    @code.should == '5678901234'
  end
  
end
