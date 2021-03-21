=begin
Things I noticed right away:
1. %CODE% and %ALTCODE% look redundant.
It looks like altcode should replace code, but substring the 
first eight digits and insert a dash before the last two.

2. What happens if a template string includes a % character?
Do we restrict to numbers? I chose to raise an exception here
bec
  
3. The template_split_begin + index doesn't look very flexible.
What if we need to change our template placeholders

4. What if we changed the order of %CODE% and %ALTCODE%?

5. What if we have more than one instance of %CODE% and %ALTCODE%?

6. What if altcode doesn't have enough characaters to format properly?

7. What if the template doesn't include a %CODE% or %ALTCODE%?

=end
module Template
  CODE = "%CODE%"
  ALTCODE = "%ALTCODE%"

  # The altcode format depends largely on what an altcode is.
  # I've put into it's own formatting method to make it easier to update.   
  def format_alt_code(code)
    String.new(code)[0...8].insert(5, '-')
  end

  def template(source_template, req_id)
    # Allow the req id to accept % but escape it
    req_id.gsub(/%/, '\%')

    # Make sure the req_id has at least 8 characters so that format_alt_code works
    if req_id.size < 8
      raise StandardError.new "Improper req_id supplied, req_id must be at least 8 characters"
    end

    # Replace instances of CODE, and ALTCODE constants
    replacements = { CODE => req_id, ALTCODE=> format_alt_code(req_id) }
    template = String.new(source_template)
    template.gsub(/#{CODE}|#{ALTCODE}/) { |match| replacements[match] }
  end
end
