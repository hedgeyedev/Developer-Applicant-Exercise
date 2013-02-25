module Template
  def template(source_template, req_id)
    template = String.new(source_template)

    # Substitute for %CODE%
    template_split_begin = template.index("%CODE%")
    template_split_end = template_split_begin + 6
    code = String.new(req_id)
    template = gen_template(code)

    # Substitute for %ALTCODE%
    template_split_begin = template.index("%ALTCODE%")
    template_split_end = template_split_begin + 9  
    
    # altcode unnecessary, changing value of code instead - altcode = code[0..4] + "-" + code[5..7]
    code = String.new(code[0..4] + "-" + code[5..7])
    
    template = gen_template(code)
    
    # Was invalid code
    #template_part_one + altcode + template_part_two
    
  end
  
  #Move duplicate string operations into separate method
 
  def gen_template(code)
      template_part_one =
      String.new(template[0..(template_split_begin-1)])
      template_part_two =
      String.new(template[template_split_end..template.length])
      template =
      String.new(template_part_one + code + template_part_two)
   end

end
