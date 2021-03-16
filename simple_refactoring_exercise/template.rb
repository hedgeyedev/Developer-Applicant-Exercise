module Template
  def template(source_template, req_id)
    template = String(source_template)
    code = String(req_id)

    # Substitute for %CODE%
    template.gsub!("%CODE%", code)

    # Substitute for %ALTCODE%
    altcode = code[0..4] + "-" + code[5..7]
    template.gsub!("%ALTCODE%", altcode)
  end
end
