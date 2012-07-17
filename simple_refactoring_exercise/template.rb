module Template
  def template(source_template, req_id)
    template = source_template

    # Substitute for %CODE%
    def substitute_for_code(template, req_id)
      substitute_markup(template, "%CODE%", req_id)
    end


    # Substitute for %ALTCODE%
    def substitute_for_altcode(template, req_id)
      substitute_markup(template, "%ALTCODE%", "#{req_id[0..4]}-#{req_id[5..7]}")
    end

    def substitute_markup(template, markup, value)
      template_split_begin = template.index(markup)
      template_split_end = template_split_begin + markup.length
      template_part_one = template[0..(template_split_begin-1)]
      template_part_two = template[template_split_end..template.length]
      code = value
      template_part_one + code + template_part_two
    end

    substitute_for_altcode(substitute_for_code(template, req_id), req_id)
  end
end
