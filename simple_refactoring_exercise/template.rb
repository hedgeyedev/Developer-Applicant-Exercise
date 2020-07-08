require 'pry'

module Template
  # 'Code is 5678901234; alt code is 56789-012'

  def template(source_template, req_id)
    template = String.new(source_template)

    # Substitute for %CODE%
    code = String.new(req_id)
    template = String.new(String.new(template[0..(template.index("%CODE%")-1)]) + code + String.new(template[template.index("%CODE%")+6..template.length]))

    # Substitute for %ALTCODE% 
    altcode = code[0..4] + "-" + code[5..7]
    String.new(template[0..(template.index("%ALTCODE%")1)]) + altcode + String.new(template_split_begin + 9..template.length])
  end

end
