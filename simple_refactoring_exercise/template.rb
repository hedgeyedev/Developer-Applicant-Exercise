module Template
  def insert_codes(template, code)
    altcode = "#{code[0..4]}-#{code[5..7]}"
    
    return template.sub("%CODE%",code).sub!("%ALTCODE%",altcode)
  end
end

# Code smells:
#
# * Code that accomplishes nothing
# * Lots of repeated code
# * Long stretches of function
# * Magic numbers scattered throughout
# * Uncommunicative function name
#
# Refactorings:
#
# * remove String.new's that accomplish nothing
# * replaced "magic numbers" with what they represent
# * moved repeated code into a function
# * replaced function with function in standard library that accomplishes the same thing