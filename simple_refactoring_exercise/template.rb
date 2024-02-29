module Template
  def template(source_template, req_id)
    template = String.new(source_template)

    # Substitute for %CODE%
    code_sub = source_template.gsub('%CODE%', req_id)

    # Substitute for %ALTCODE%
    alt_sub = req_id.insert(5,'-')[0...-2]
    code_sub.gsub('%ALTCODE%', alt_sub)

  
    # # Substitute for %CODE%
    # template_split_begin = template.index("%CODE%")
    # template_split_end = template_split_begin + 6
    # template_part_one =
    #   String.new(template[0..(template_split_begin-1)])
    # template_part_two =
    #   String.new(template[template_split_end..template.length])
    # code = String.new(req_id)
    # template =
    #   String.new(template_part_one + code + template_part_two)

    # # Substitute for %ALTCODE%
    # template_split_begin = template.index("%ALTCODE%")
    # template_split_end = template_split_begin + 9
    # template_part_one =
    #   String.new(template[0..(template_split_begin-1)])
    # template_part_two =
    #   String.new(template[template_split_end..template.length])
    # altcode = code[0..4] + "-" + code[5..7]
    # template_part_one + altcode + template_part_two
  end
end
