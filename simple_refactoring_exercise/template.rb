module Template
  def template(source_template, req_id)
    template = source_template

    # Substitute for %CODE%
    template_split_begin = template.index("%CODE%")
    template_split_end = template_split_begin + 6
    template_part_one =
      template[0..(template_split_begin-1)]
    template_part_two =
      template[template_split_end..template.length]
    code = req_id
    template =
      template_part_one + code + template_part_two

    # Substitute for %ALTCODE%
    template_split_begin = template.index("%ALTCODE%")
    template_split_end = template_split_begin + 9
    template_part_one =
      template[0..(template_split_begin-1)]
    template_part_two =
      template[template_split_end..template.length]
    altcode = code[0..4] + "-" + code[5..7]
    template_part_one + altcode + template_part_two
  end
end
