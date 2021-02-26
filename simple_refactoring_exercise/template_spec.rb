require_relative 'template'

describe Template do
  include Template

  it "should substitute %CODE% and %ALTCODE% in the template" do
    expect(template('Code is %CODE%; alt code is %ALTCODE%', '5678901234', 5, 2)).to eq 'Code is 5678901234; alt code is 56789-012'
  end

  it "should substitute %CODE% and %ALTCODE% in the template when index is 3 and drop is 4" do
    expect(template('Code is %CODE%; alt code is %ALTCODE%', '5678901234', 3, 4)).to eq 'Code is 5678901234; alt code is 567-890'
  end

  it "should substitute %CODE% and %ALTCODE% in the template even when code is frozen" do
    expect(template('Code is %CODE%; alt code is %ALTCODE%'.freeze, '5678901234', 3, 4)).to eq 'Code is 5678901234; alt code is 567-890'
  end
end
