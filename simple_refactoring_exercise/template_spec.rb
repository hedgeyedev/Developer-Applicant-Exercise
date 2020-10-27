require_relative 'template'

describe Template do
  include Template

  it "should substitute %CODE% and %ALTCODE% in the template" do
    expect(template('Code is %CODE%; alt code is %ALTCODE%', '5678901234')).to eq 'Code is 5678901234; alt code is 56789-012'
  end

  it "should substitute %CODE% and %ALTCODE% with a non hardcoded return value" do
    expect(template('The code is %CODE% while the alt code is %ALTCODE%', '5678901234')).to eq 'The code is 5678901234 while the alt code is 56789-012'
  end
  
  it "should substitute %CODE% and %ALTCODE% in template when given multiple occurance" do
    expect(template('%ALTCODE% The code is called 3 times %CODE% %CODE% %CODE% while the alt code is called 2 times %ALTCODE%', '5678901234')).to eq '56789-012 The code is called 3 times 5678901234 5678901234 5678901234 while the alt code is called 2 times 56789-012'
  end

  it "should substitute %CODE% and %ALTCODE% in a weird string" do
    expect(template('%ALTCODE%%%CODE% ', '5678901234')).to eq '56789-012%5678901234 '
  end
end
