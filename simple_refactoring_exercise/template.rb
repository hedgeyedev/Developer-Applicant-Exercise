module Template
  # Changed the method name to be more clear with what was the method is doing to the template
  def process(source_template, req_id)
    # Created a hash to lookup the intended substitution value
    # If we need to add more potential substitutions for the placeholders this is now all centralized in one place
    substitutions = {
      '%CODE%' => req_id,
      '%ALTCODE%' => "#{req_id[0..4]}-#{req_id[5..7]}"
  }.freeze
    # Instead of using the index method to locate the position of the placeholder value, we iterate over the string
    # This would catch multiple placeholder values as opposed to using index to replace only the first occurence
    source_template.gsub(/%\w+%/) { |placeholder| substitutions[placeholder] }
  end
end
