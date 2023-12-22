require_relative 'template'

describe Template do
  include Template

  it "should substitute %CODE% and %ALTCODE% in the template" do
    expect(template('Code is %CODE%; alt code is %ALTCODE%', '5678901234')).to eq 'Code is 5678901234; alt code is 56789-012'
  end

  it "should substitute %CODE% and %ALTCODE% no matter where they are located in the string" do
    expect(template('%CODE% is Code; %ALTCODE% is alt code', '5678901234')).to eq '5678901234 is Code; 56789-012 is alt code'
  end

  it "should substitue all instances of %CODE% and %ALTCODE% in the template" do
    expect(template('Code is %CODE%; alt code is %ALTCODE%; Code is %CODE%; alt code is %ALTCODE%', '5678901234')).to eq 'Code is 5678901234; alt code is 56789-012; Code is 5678901234; alt code is 56789-012'
  end

end
