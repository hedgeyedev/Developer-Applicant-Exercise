# I have refactored the code by putting the duplicated code in one method 
# and call that method wherever required.
#Also I just modified the code and removed String.new as it was not needed
module Template
  def template(source_template, req_id)
    sub = sub(source_template,"%CODE%")
    template = sub[0] + req_id + sub[1]
    new_sub = sub(template,"%ALTCODE%")
    altcode = req_id[0..4] + "-" + req_id[5..7]
    new_sub[0] + altcode + new_sub[1]
  end

  def sub(template,code)
    template_split_begin = template.index(code)
    template_split_end = template_split_begin + code.length
    template_part_one = template[0..(template_split_begin-1)]
    template_part_two = template[template_split_end..template.length]
    return template_part_one,template_part_two
  end
  
end

