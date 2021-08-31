# frozen_string_literal: true

require "#{RSPEC_ROOT}/simple_refactoring_exercise/template_generators/code_template_service.rb"

describe TemplateGenerators::CodeTemplateService do
  let(:valid_input_template) { 'Code is %CODE%; alt code is %ALTCODE%' }
  let(:valid_code) { '5678901234' }
  let(:invalid_code) { '567' }
  let(:expected_output_template) { 'Code is 5678901234; alt code is 56789-012' }
  let(:expected_error_type) { TemplateGenerators::CodeTemplateService::InvalidCodeError }
  let(:expected_error_message) { 'code length is not greater than or equal to 8' }

  it 'should substitute %CODE% and %ALTCODE% in the template with the expected code and altcode' do
    expect(described_class.new(template: valid_input_template, code: valid_code).perform)
      .to eq(expected_output_template)
  end

  it 'should raise an InvalidCodeError if the code does not have a length of at least 8' do
    expect { described_class.new(template: valid_input_template, code: invalid_code).perform }
      .to raise_error(expected_error_type, expected_error_message)
  end
end
