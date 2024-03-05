module Template
  def template(source_template, req_id)
    # Substitute for %CODE%
    code_sub = source_template.gsub('%CODE%', req_id)

    # Substitute for %ALTCODE%
    alt_sub = req_id.insert(5,'-')[0...-2]
    code_sub.gsub('%ALTCODE%', alt_sub)

    # Thought Process: 
    # Line 4: We use .gsub to replace all displays of %CODE% in source_template with the provided req_id.
    # Line 7: Inserts a hyphen into req_id string at the 5th index. The [0..-2] array range doesn't include
    # the last two characters.
    # Line 8: Similar to line 4, we want to remove all occurances of %ALTCODE% and substitute it with our
    # altered alt_sub. Ruby returns the last line of a block so the altered code_sub variable with the 
    # substitute for %CODE% & %ALTCODE& will be returned. 

    # The provided code below is verbose and involved several instances of new variable creations and 
    # multiple unnecessary concatenations. A simpler way is to replace all instances of %CODE% and the
    # altered code of %ALTCODE%



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
