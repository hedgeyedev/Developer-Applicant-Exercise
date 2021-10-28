require_relative 'template'

describe Template do
  include Template

  it 'substitutes %CODE% and %ALTCODE% in the template' do
    expect(substitute_code_and_altcode('Code is %CODE%; alt code is %ALTCODE%', '5678901234')).to eq('Code is 5678901234; alt code is 56789-012')
  end

  it 'does not modify the template string' do
    source = '%CODE%:::%ALTCODE%'
    substitute_code_and_altcode(source, '77777777')
    expect(source).to eq('%CODE%:::%ALTCODE%')
  end

  it 'does not fail if %ALTCODE% is missing, but the original implementation does which I would ask/look at usage to determine if that is desired or not' do
    expect(substitute_code_and_altcode('Code is %CODE%', '5678901234')).to eq('Code is 5678901234')
  end
end
