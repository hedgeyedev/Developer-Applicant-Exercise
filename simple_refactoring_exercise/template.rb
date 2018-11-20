module Template
  def template(source_template, req_id)
# ---------------------------------------------------------------------------------------------------------------------------------------------------#
    # the code smells here are :
      # duplicated code: finding the beginning and the end of a word to extract it and replace it 
      # by something else is done twice
      # Too many temporary strings (that are overwritten): template_split_begin, template_split_end, 
      # template_part_one, template_part_two
      # Uses of new.String() which create a brand new data instead of having simple data type 
      # conversion with to_s or prepending String
      # maybe the way to insert "-" in the middle of a string could be better as right now it involve
      # the concatenation of three strings. 

    # For the record: the way this code was written involve that both of the key words are present 
# ---------------------------------------------------------------------------------------------------------------------------------------------------#
    # If we are ok with regex:
    code = req_id.to_s
    altcode = code[0..7].insert(5, "-")
    # Replace %CODE% with code, and %ALTCODE% with a dashed version of req_id
    String source_template.gsub(/[%]\bCODE\b[%]|[%]\bALTCODE\b[%]/, 
      '%CODE%' => code, 
      '%ALTCODE%' => altcode
    )
# ---------------------------------------------------------------------------------------------------------------------------------------------------#
    # If we want a substitution process more generic because we will have to replace more complex 
    # patterns in the future, we could:  
    # - from this function, define code and altcode (in a string data type)
    # - from this function, call an outside function passing it the source_template as a string, 
    #   the pattern %CODE% and the code variable
    # - always from this function, call the outside function passing it the new source_template 
    #   as a string, the pattern %ALTCODE% and the altcode variable
    # - build this function taking the source_template, the pattern and the new value as arguments
    # - this function would find the beginning and the end of the pattern in the source_template, 
    #   and replace the pattern by the value passed in and return the new source_template
    # - from this function return the last source_tempalte alterated  
# ---------------------------------------------------------------------------------------------------------------------------------------------------#
    # also if we are only looking at passing the spec we do not need to convert req_id or template 
    # into a string data type as it is tested in a string context. 
    # another reason for doing this would be to if we have a validation when calling this method, 
    # ensuring we are only passing strings to it. 

    # altcode = code[0..7].insert(5, "-")
    # source_template.gsub(/[%]\bCODE\b[%]|[%]\bALTCODE\b[%]/, 
    #   '%CODE%' => req_id, 
    #   '%ALTCODE%' => altcode
    # )

  end
end
