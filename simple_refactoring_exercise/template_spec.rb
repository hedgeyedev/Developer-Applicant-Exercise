require_relative 'template'

describe Template do
  include Template
  let(:test_code) { '5678901234' }
  let(:multiple_of_same_word) {
    'The %CODE% is here, but it\'s also here %CODE%. The %ALTCODE% is here but also here %ALTCODE%'
  }
  let(:multiple_of_same_word_result) {
    'The 5678901234 is here, but it\'s also here 5678901234. The 56789-012 is here but also here 56789-012'
  }

  it "should substitute %CODE% and %ALTCODE% in the template" do
    expect(template('Code is %CODE%; alt code is %ALTCODE%', test_code)).to eq 'Code is 5678901234; alt code is 56789-012'
  end

  it "should substitute more than one of the same template word in the template" do
    expect(template(multiple_of_same_word, test_code)).to eq multiple_of_same_word_result
  end

end
