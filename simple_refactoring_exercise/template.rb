# Left module as-is assuming that was the intent, but otherwise would fold into the class
# ie, (Combine Functions into Class)
module Template
  def template(source_template, req_id)
    # (Extract Variables) for template strings for visibility, ease of updating
    code_string = "%CODE%"
    altcode_string = "%ALTCODE%"
    # declaring `code` and `altcode` up top for clarity
    code = String.new(req_id)
    altcode = code[0..4] + "-" + code[5..7]
    template = String.new(source_template)

    # Substitute for %CODE% and %ALTCODE%
    # replace string split+concat with gsub method, using method chaining for simplicity
    # (Replace Inline Code With Function Call) / (Inline Temp)
    template
      .gsub(code_string, code)
      .gsub(altcode_string, altcode)
  end
end

# added a class to pull our module into (Extract Class?)
class TemplateInvoker
  include Template 
end

# instantiate the invoker class
invoker = TemplateInvoker.new
# output example for debugging
puts invoker.template('Code is %CODE%; alt code is %ALTCODE%', '5678901234')