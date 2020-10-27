module Template
  # first make a function that generates the altCode
  def generateAltCode(codeString)
    altCode = codeString[0..4] + "-" + codeString[5..7]
  end 
  
  # now simply iterate through the string OR use a regex 
  # to replace %CODE% or %altCode% occurances
  def template(source_template, req_id)
    # generate altCode
    altCode = generateAltCode(String.new(req_id))
    
    template = String.new(source_template)

    # in general i prefer to use built in methods when possible 
    # so i utilize a built in method .gsub which is a global 
    # string replacement method perfect for the test case that
    # has multiple occurances of %code%/%altcode%

    # Substitute for %CODE%
    template = template.gsub('%CODE%', String.new(req_id))
    # Substitute for %ALTCODE%
    template = template.gsub('%ALTCODE%', String.new(altCode))

    template
  end

  # in the end we have code that is more readable and is dynamic,
  # meaning it can replace multiple orrurances of the %CODE% and
  # %Altcode% key words

end
