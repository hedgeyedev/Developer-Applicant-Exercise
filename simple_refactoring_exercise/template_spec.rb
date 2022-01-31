require_relative 'template'

describe Template do
  include Template

  it "should substitute %CODE% and %ALTCODE% in the template" do
    template = 'Code is %CODE%; alt code is %ALTCODE%'
    code = '5678901234'
    result = 'Code is 5678901234; alt code is 56789-012'
    expect(template(template, code)).to eq result
  end

end
