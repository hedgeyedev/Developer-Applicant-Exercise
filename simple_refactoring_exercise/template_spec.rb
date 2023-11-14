require_relative 'template'

describe Template do
  include Template

  it "should not alter the template when it is empty" do
    expect(template('', '0123456789')).to eq ''
  end

  it "should not alter the template when the placeholders are not present" do
    expect(template('Code and altcode are not present', '0123456789')).to eq 'Code and altcode are not present'
  end

  it "should not throw an error if one placeholder is missing" do
    expect(template('alt code is %ALTCODE%;', '0123456789')).to eq 'alt code is 01234-567;'
    expect(template('Code is %CODE%;', '0123456789')).to eq 'Code is 0123456789;'
  end

  it "should substitute %CODE% and %ALTCODE% in the template" do
    expect(template('Code is %CODE%; alt code is %ALTCODE%', '5678901234')).to eq 'Code is 5678901234; alt code is 56789-012'
  end

  it "should handle multiple instances of placeholders" do
    expect(template('Code is %CODE%; alt code is %ALTCODE%; Code is still %CODE%', '0123456789')).to eq 'Code is 0123456789; alt code is 01234-567; Code is still 0123456789'
    expect(template('Code is %CODE%; alt code is %ALTCODE%; alt code is still %ALTCODE%', '0123456789')).to eq 'Code is 0123456789; alt code is 01234-567; alt code is still 01234-567'
  end

  it "should handle req_id with different lengths" do
    expect(template('Code is %CODE%; alt code is %ALTCODE%', '012')).to eq 'Code is 012; alt code is 012'
    expect(template('Code is %CODE%; alt code is %ALTCODE%', '012345678901234567890')).to eq 'Code is 012345678901234567890; alt code is 01234-567'
  end

  it "should handle req_id with special characters" do
    expect(template('Code is %CODE%; alt code is %ALTCODE%', 'abc~!@#$%^&*()_+')).to eq 'Code is abc~!@#$%^&*()_+; alt code is abc~!-@#$'
  end


end
