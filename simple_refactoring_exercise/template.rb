module Template
  def template(source_template, req_id)
    template = source_template

    # Substitute for %CODE%
    def substitute_for_code(template, req_id)
      substitute_markup(template, "%CODE%", req_id)
    end


    # Substitute for %ALTCODE%
    def substitute_for_altcode(template, req_id)
      substitute_markup(template, "%ALTCODE%", alt_code(req_id))
    end

    def substitute_markup(template, markup, value)
      template.gsub(markup, value)
    end

    def alt_code(code)
      "#{code[0..4]}-#{code[5..7]}"
    end

    substitute_for_altcode(substitute_for_code(template, req_id), req_id)
  end
end
