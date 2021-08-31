# frozen_string_literal: true

module TemplateGenerators
  class CodeTemplateService
    class InvalidCodeError < StandardError
      def message
        'code length is not greater than or equal to 8'
      end
    end

    attr_reader :template, :code, :altcode

    def initialize(template:, code:)
      @template = String(template)
      @code = String(code)
      @altcode = generate_altcode
    end

    def perform
      generate_template
    end

    private

    def generate_altcode
      raise InvalidCodeError unless code.length >= 8

      "#{code[0..4]}-#{code[5..7]}"
    end

    def generate_template
      template.gsub('%CODE%', code).gsub('%ALTCODE%', altcode)
    end
  end
end
