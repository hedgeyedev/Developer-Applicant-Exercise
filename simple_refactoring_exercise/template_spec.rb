require_relative 'template'

describe Template do
  include Template

  it 'should substitute %CODE% and %ALTCODE% in the template' do
    expect(template('Code is %CODE%; alt code is %ALTCODE%',
                    '5678901234')).to eq 'Code is 5678901234; alt code is 56789-012'
  end

  it 'should substitute %CODE% and %ALTCODE% in the template with multiple instances of the template vars' do
    expect(
      template(
        'Code is %CODE%; alt code is %ALTCODE%, code is definitely not %ALTCODE%; alt code most certainly is not %CODE%', '5678901234'
      )
    ).to eq 'Code is 5678901234; alt code is 56789-012, code is definitely not 56789-012; alt code most certainly is not 5678901234'
  end

  [rand(10**10).to_s, rand(10**10).to_s].each do |req_id|
    it 'should have some fun with random numbers for req_id' do
      expect(template('Code is %CODE%; alt code is %ALTCODE%',
                      req_id)).to eq "Code is #{req_id}; alt code is #{req_id[0..4]}-#{req_id[5..7]}"
    end
  end
end
