module Template
  def template(source_template, req_id)
    template = String.new(source_template)
    code     = String.new(req_id)
    altcode  = code[0..4] + '-' + code[5..7]

    # Substitute for %CODE% and %ALTCODE
    template.sub!('%CODE%', code)
    template.sub!('%ALTCODE%', altcode)

    return template
  end
end
