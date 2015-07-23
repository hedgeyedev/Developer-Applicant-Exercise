require_relative 'template'

describe Template do
  include Template

  describe '.template' do
    it 'substitutes code' do
      expect(template('Code is %CODE%', '5678901234')).to eq('Code is 5678901234')
    end

    it 'substitutes alt code' do
      expect(template('alt code is %ALTCODE%', '5678901234')).to eq('alt code is 56789-012')
    end

    it "substitutes both codes" do
      expect(template('Code is %CODE%; alt code is %ALTCODE%', '5678901234')).to eq('Code is 5678901234; alt code is 56789-012')
    end
  end
end
