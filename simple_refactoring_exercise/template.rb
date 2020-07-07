require 'pry'

module Template
  # source_template = 5678901234
  # req_id = 20
  # 'Code is 5678901234; alt code is 56789-012'

  def template(source_template, req_id)
    template = String.new(source_template)

    # Substitute for %CODE%
    code_template = []
    template_split_begin = template.index("%CODE%")
    template_split_end = template_split_begin + 6
    template_part_one =
      String.new(template[0..(template_split_begin-1)])
    template_part_two =
      String.new(template[template_split_end..template.length])
    code = String.new(req_id)
    template =
      String.new(template_part_one + code + template_part_two)

    # Substitute for %ALTCODE%
    template_split_begin = template.index("%ALTCODE%")
    template_split_end = template_split_begin + 9
    template_part_one =
      String.new(template[0..(template_split_begin-1)])
    template_part_two =
      String.new(template[template_split_end..template.length])
    altcode = code[0..4] + "-" + code[5..7]
    template_part_one + altcode + template_part_two
  end

end
