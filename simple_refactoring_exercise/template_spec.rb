require_relative 'template'

describe Template do
  include Template

  context "when substituting codes in the template" do
    let(:template_string) { 'Code is %CODE%; alt code is %ALTCODE%' }
    let(:req_id) { '5678901234' }
    let(:expected_output) { 'Code is 5678901234; alt code is 56789-012' }

    it "replaces %CODE% and %ALTCODE% with correct values" do
      expect(template(template_string, req_id)).to eq(expected_output)
    end
  end
end
