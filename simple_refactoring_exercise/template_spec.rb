require_relative 'template'

describe Template do
  include Template

  before(:each) do
  	@alt = '56789-012'
  end

  it "should substitute %CODE% and %ALTCODE% in the template" do
  	# We only want this test to fail if the problem is with it, 
  	# and not with a method that it's calling. 
  	# So, we stub get_altcode
  	stub!(:get_altcode).with('5678901234').and_return(@alt)
    template('Code is %CODE%; alt code is %ALTCODE%', '5678901234').should == 'Code is 5678901234; alt code is ' + @alt
  end

  it "should return the ALTCODE given the CODE" do
  	get_altcode('5678901234').should == @alt
  end
end
