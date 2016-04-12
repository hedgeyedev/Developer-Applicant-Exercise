# I have refactored the by putting the duplicated code in one method 
# and call that method wherever required
module Template
  def template(source_template, req_id)
    template = String.new(source_template)
    sub = sub(template,"%CODE%")
    code = String.new(req_id)
    template = String.new(sub[0] + code + sub[1])
    new_sub = sub(template,"%ALTCODE%")
    altcode = code[0..4] + "-" + code[5..7]
    new_sub[0] + altcode + new_sub[1]
  end

  def sub(template,code)
    template_split_begin = template.index(code)
    template_split_end = template_split_begin + code.length
    template_part_one = String.new(template[0..(template_split_begin-1)])
    template_part_two = String.new(template[template_split_end..template.length])
    return template_part_one,template_part_two
  end
  
end

