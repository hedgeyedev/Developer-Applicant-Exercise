module Template
  def template(source_template, req_id)
     TemplateConverter.new(source_template, req_id).convert
  end

  class TemplateConverter
    def initialize(source_template, req_id)
       @template, @req_id = source_template, req_id
    end

    # Substitute for %CODE%
    def substitute_for_code(template = @template)
      substitute_markup(template, "%CODE%", @req_id)
    end


    # Substitute for %ALTCODE%
    def substitute_for_altcode(template = @template)
      substitute_markup(template, "%ALTCODE%", alt_code(@req_id))
    end

    def substitute_markup(template, markup, value)
      template.gsub(markup, value)
    end

    def alt_code(code)
      "#{code[0..4]}-#{code[5..7]}"
    end

    def convert
      substitute_for_altcode(substitute_for_code(@template))
    end

  end
end
