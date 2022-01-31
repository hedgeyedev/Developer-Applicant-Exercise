module Template
  def template(source_template, req_id)
    template = String.new(source_template)
    code_formatter = CodeFormatter.new(req_id)

    template = template.gsub("%CODE%", code_formatter.plain_code)
    template = template.gsub("%ALTCODE%", code_formatter.altcode)
  end

  class CodeFormatter
    def initialize(code)
      @raw_code = String.new(code)
    end

    def plain_code
      @code ||= @raw_code
    end

    def altcode
      @altcode ||= @raw_code[0..4] + "-" + @raw_code[5..7]
    end
  end
end
