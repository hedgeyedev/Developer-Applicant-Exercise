require_relative 'template'

describe Template do
  include Template

  it "should substitute %CODE% and %ALTCODE% in the template" do
    template('Code is %CODE%; alt code is %ALTCODE%', '5678901234').should eq 'Code is 5678901234; alt code is 56789-012'
  end

  it "should return validate erro" do
    expect( template(1234, '123213')).to eq 'source template is not string'
  end

  it "should return validate erro" do
    expect( template("fsdfsdfsd", "123123dsdfs")).to eq 'request_id should be numeric'
  end

  it "should have and ALTCODE" do
    expect( template('Code id %ALTCODE%', '12345999') ).to eq 'source template should have %CODE%'
  end

  it "should have ALTCODE" do
    expect( template('Code id %CODE%', '12345999') ).to eq 'source template should have %ALTCODE%'
  end
  
end
