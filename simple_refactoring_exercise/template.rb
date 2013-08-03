module Template
  def template(template, code)
    altcode = "#{code[0..4]}-#{code[5..7]}"
    
    return template.sub("%CODE%",code).sub!("%ALTCODE%",altcode)
  end
end
