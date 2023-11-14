require_relative 'template'

describe Template do
  include Template

  let(:valid_code) { "1234567890" }
  let(:alt_code) { "12345-678" }
  let(:source_template) { "Code: %CODE%, Alt Code: %ALTCODE%" }

  describe "#template" do
    context "with a valid code" do
      it "replaces %CODE% with the normal code" do
        expect(template(source_template, valid_code)).to include(valid_code)
      end

      it "replaces %ALTCODE% with the formatted alternative code" do
        expect(template(source_template, valid_code)).to include(alt_code)
      end

      it "should substitute %CODE% and %ALTCODE% in the template" do
        expect(template(source_template, valid_code)).to eq "Code: 1234567890, Alt Code: 12345-678"
      end
    end

    context "with an invalid code" do
      let(:invalid_code) { "12345" }

      it "raises an error for codes that are not 10 characters long" do
        expect { template(source_template, invalid_code) }
          .to raise_error(RuntimeError, "Code must be 10 characters long")
      end
    end
  end
end
