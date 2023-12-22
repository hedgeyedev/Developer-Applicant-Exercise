module Template
  
  # Define inline string literals as constants
  CODE = "%CODE%"
  ALTCODE = "%ALTCODE%"

  def template(source_template, req_id)
    # Calling String.new is unnecessary here, as it should already be a string literal
    template = source_template
    code = req_id
    altcode = code[0..4] + "-" + code[5..7]

    # Can replace all the string manipulation with concise gsub method leveraging regex
    # Previous code is brittle, only works if CODE and ALTCODE are in specific locations
    # Not sure if we want to replace all instances of CODE and ALTCODE?
    # If not use sub here instead
    template.gsub!(/#{CODE}/, code)
    template.gsub!(/#{ALTCODE}/, altcode)
  end
end