module Template
  def template(source_template, req_id)
    source_template.gsub!("%CODE%", req_id)
    source_template.gsub!("%ALTCODE%", altcode(req_id))

    source_template
  end

  def altcode(code)
    if code.length > 4
      code[0..4] + "-" + code[5..7]
    else
      code
    end
  end
end
