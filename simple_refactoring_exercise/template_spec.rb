require_relative 'template'

describe Template do
  include Template

  it "should substitute %CODE% and %ALTCODE% in the template" do
    # This refactoring is called "Introduce Explaining Variable"
    template = 'Code is %CODE%; alt code is %ALTCODE%'
    code = '5678901234'
    result = 'Code is 5678901234; alt code is 56789-012'
    expect(template(template, code)).to eq result
  end
end

describe Template::CodeFormatter do
  before(:all) do
    @code_formatter = Template::CodeFormatter.new('CATSARENICEANIMALS')
  end

  it "should provide the code in plain format" do
    expect(@code_formatter.plain_code).to eq 'CATSARENICEANIMALS'
  end

  it "should provide the code in an alternative format" do 
    expect(@code_formatter.altcode).to eq 'CATSA-REN'
  end
end