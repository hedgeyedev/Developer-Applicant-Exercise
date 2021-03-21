require_relative 'template'

describe Template do
  include Template

  it "should substitute %CODE% and %ALTCODE% in the template" do
    expect(template('Code is %CODE%; alt code is %ALTCODE%', '5678901234')).to eq 'Code is 5678901234; alt code is 56789-012'
  end

  it "should substitute %ALTCODE% and %CODE% in the template" do
    expect(template('Alt code is %ALTCODE% and code is %CODE%', '5678901234')).to eq 'Alt code is 56789-012 and code is 5678901234'
  end

  it "should substitute more than once instance of %ALTCODE% and %CODE%" do
    expect(template('Alt codes are %ALTCODE%, %ALTCODE% and two codes are %CODE%, %CODE%', '5678901234')).to eq 'Alt codes are 56789-012, 56789-012 and two codes are 5678901234, 5678901234'
  end

  it "should escape requid if it contains %" do
    expect(template('Code is %CODE%', '5678901234%')).to eq 'Code is 5678901234%'
  end

  it "should raise an exception if req_id doesn't have at least 8 characters" do
    expect {template('Code is %CODE%', '5678')}.to raise_error StandardError
  end

  it "should still run if template doesn't have any placeholders" do
    expect(template('Code is and altcode is', '5678901234')).to eq 'Code is and altcode is'
  end
end
