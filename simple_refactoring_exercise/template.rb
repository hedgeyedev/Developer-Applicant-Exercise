module Template
  def template(source_template, req_id)
    source_template.gsub!("%CODE%", req_id)
    source_template.gsub!("%ALTCODE%", altcode(req_id))
  end

  def altcode(code)
    code[0..4] + "-" + code[5..7]
  end
end
