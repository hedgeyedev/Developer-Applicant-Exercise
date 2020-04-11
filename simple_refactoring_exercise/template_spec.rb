require_relative 'template'

describe Template do
  include Template
  let(:code) { '5678901234' }

  describe '#template' do
    it 'should substitute %CODE% and %ALTCODE% in the template' do
      expect(template('Code is %CODE%; alt code is %ALTCODE%', code)).to eq 'Code is 5678901234; alt code is 56789-01234'
    end
  end

  describe '#generate_alt_code' do
    it 'should insert a \'-\' after the 5th character of a string' do
      expect(generate_alt_code(code)).to eq '56789-01234'
    end
  end

  describe '#generate_dictionary' do
    it 'should create a hash containing definitions for %CODE and %ALTCODE%' do
      expect(generate_dictionary(code)).to eq({ '%CODE%' => '5678901234', '%ALTCODE%' => '56789-01234' })
    end
  end
end
