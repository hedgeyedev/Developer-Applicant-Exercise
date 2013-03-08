# After looking at the specs, this is supposed to do something 
# simple, but goes into doing it a confusing and complicated way
# 
# Problem 1:
# The process is almost the same for replacing %CODE% and %ALTCODE
# so there's no need for the duplication. We could simply create another method
# and pass in the key (%CODE% or %ALTCODE%) and the value in the right format.
# This cuts down duplication...
#
# Problem 2:
# Why all the spliting and concatenating?
# No reason to reinvent the wheel, use a predefined 
# function: gsub
# This makes the code less confusing.
#
# Problem 3: 
# From the specs, source_template and req_id
# are already strings... Not quite sure why it's 
# being 're-stringified'
#
# Solution: (well it's down there)
# 1. removed duplication and unecessary complexity... no more string splitting etc...
# 2. use of predefine methods makes the code more easier to understand

module Template
  def template(template, code)
    # Substitute for %CODE%
    template = template.gsub('%CODE%', code)
    # Substitute for %ALTCODE%
    template.gsub('%ALTCODE%', get_altcode(code))
  end

  def get_altcode(code)
    code[0..4] + "-" + code[5..7]
  end
end