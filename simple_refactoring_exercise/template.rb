module Template
  def template(source_template, req_id)
    template = String.new(source_template)

    # Substitute for %CODE%
    code = req_id.to_s
    template = substitute(template, '%CODE%', code)

    # Substitute for %ALTCODE%
    substitute(template, '%ALTCODE%', "#{code[0..4]}-#{code[5..7]}" )
  end

  def substitute(template, str_to_replace, sub_val)
    template.gsub(/#{Regexp.escape(str_to_replace)}/, sub_val)
  end
end
