module Template
  STARTINDEX = 0
  STARTALTINDEX = 4
  SPLITINDEX = 5
  ENDINDEX = 7
  def template(source_template, req_id)
    # Reduce to two lines of code
    # Code Smells
    #   Duplicated Code - CODE/ALTCODE sections
    #   Long Method (for functionality)) - This can be done with two lines of code
    #   Uncommunicative Method Name -  The method name really should be changed but not sure if this is within scope of refactoring
    #   Comments -  Don't really add much value.  Don't specify intent.
    template = source_template.gsub("%CODE%",req_id)
    template = template.gsub("%ALTCODE%",req_id.to_s[STARTINDEX..4]+"-"+req_id.to_s[SPLITINDEX..ENDINDEX])
  end

  def template_old(source_template, req_id)
    template = String.new(source_template)

    # Substitute for %CODE%
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
