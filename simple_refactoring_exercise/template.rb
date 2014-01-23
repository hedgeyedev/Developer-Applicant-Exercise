module Template
  def template(source_template, req_id)

    # Substitute for %CODE%
    # template_split_begin = template.index("%CODE%")
    # template_split_end = template_split_begin + 6
    # template_part_one =
    #   String.new(template[0..(template_split_begin-1)])
    # template_part_two =
    #   String.new(template[template_split_end..template.length])
    # code = String.new(req_id)
    # template =
    #   String.new(template_part_one + code + template_part_two)

    # Substitute for %ALTCODE%
    # template_split_begin = template.index("%ALTCODE%")
    # template_split_end = template_split_begin + 9
    # template_part_one =
    #   String.new(template[0..(template_split_begin-1)])
    # template_part_two =
    #   String.new(template[template_split_end..template.length])
    # altcode = code[0..4] + "-" + code[5..7]
    # template_part_one + altcode + template_part_two

    # WHAT I CHANGED
    # 1.) Duplicate the source template, and split it into an array separated by whitespace
    # 2.) Collect each element and check if %CODE% or %ALTCODE% exist
    # 3.) replace the current string element with appropriate req_id replacement
    result = source_template.dup.split(" ").collect do |x|
      x.replace(req_id + ";") if x.include? "%CODE%"
      x.replace(req_id.dup.insert(5, "-")[0,9]) if x.include? "%ALTCODE%" 
      x
    end

    # 4.) Return the result after creating it back into a string
    result.join(' ')
  end
end
