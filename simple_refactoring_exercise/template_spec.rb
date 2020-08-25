require_relative 'template'

describe Template do
  include Template

  it 'should substitute %CODE% and %ALTCODE% in the template for any template' do
    expect(replace_in_template('Code is %CODE%; alt code is %ALTCODE%', '5678901234'))
      .to eq 'Code is 5678901234; alt code is 56789-012'
  end

  it 'should substitute %CODE% and %ALTCODE% in the template when template is exactly 8 characters' do
    expect(replace_in_template('Code is %CODE%; alt code is %ALTCODE%', '12345678'))
      .to eq 'Code is 12345678; alt code is 12345-678'
  end

  it 'should substitute %CODE% and %ALTCODE% in the template when template is exactly 6 characters' do
    expect(replace_in_template('Code is %CODE%; alt code is %ALTCODE%', '123456'))
      .to eq 'Code is 123456; alt code is 12345-6'
  end

  it 'must raise error when the template is empty' do
    expect { replace_in_template('Code is %CODE%; alt code is %ALTCODE%', '') }
      .to raise_error ArgumentError
  end

  it 'must raise error when the template is less than 6 characters' do
    expect { replace_in_template('Code is %CODE%; alt code is %ALTCODE%', '12345') }
      .to raise_error ArgumentError
  end
end
