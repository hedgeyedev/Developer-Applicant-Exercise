module Template
  def template(source_template, req_id)
    # template = String.new(source_template)

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



# ---------------------------------------------------------------------------------------------------------------------------------------------------#
    # the code smells here are :
      # duplicated code: 
      #                  - finding the beginning and the end of a word to extract it and replace it by something else is done twice
      #                  - Both arguments are transformed into a string data type
      # Too many temporary strings (that are overwritten): template_split_begin, template_split_end, template_part_one, template_part_two
      # Uses of new.String() which create a brand new data instead of having simple data type conversion with to_s or prepending String 

    # the way this code was written involve that both of the key words are present 
    #(otherwise some indexes would come to null and throw an error when adding a number to it or using the spread operator)    
# ---------------------------------------------------------------------------------------------------------------------------------------------------#
    # If we are ok with regex, we could simplify at the extreme:
    code = req_id.to_s
    altcode = code[0..4] + "-" + code[5..7]
    # Replace %CODE% with code, and %ALTCODE% with a dashed version of req_id
    String source_template.gsub(/[%]\bCODE\b[%]|[%]\bALTCODE\b[%]/, 
      '%CODE%' => code, 
      '%ALTCODE%' => altcode
    )
# ---------------------------------------------------------------------------------------------------------------------------------------------------#
    # If we want a substitution process more generic because we will have to replace more complex patterns in the future, we could:  
    # - from this function, define code and altcode (in a string data type)
    # - from this function, call an outside function passing it the source_template as a string, the pattern %CODE% and the code variable
    # - always from this function, call the outside function passing it the new source_template as a string, the pattern %ALTCODE% and the altcode variable
    # - build this function taking the source_template, the pattern and the new value as arguments
    # - this function would find the beginning and the end of the pattern in the source_template, and replace the pattern by the value passed in and return the new source_template
    # - from this function return the last source_tempalte alterated  
# ---------------------------------------------------------------------------------------------------------------------------------------------------#
  # also if we are only looking at passing the spec we do not need to convert req_id or template into a string data type as it is tested in a string context. 
  # another reason for doing this would be to if we have a validation when calling this method, ensuring we are only passing strings to it. 
    # altcode = req_id[0..4] + "-" + req_id[5..7]
    # source_template.gsub(/[%]\bCODE\b[%]|[%]\bALTCODE\b[%]/, 
    #   '%CODE%' => req_id, 
    #   '%ALTCODE%' => altcode
    # )

  end
end
