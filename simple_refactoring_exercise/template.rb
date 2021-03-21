=begin
Things I noticed right away:
1. %CODE% and %ALTCODE% look redundant.
  It looks like altcode should replace code,
  but substring the first eight digits and insert a dash before the last two.

2. What happens if a template string includes a % character?
  Do we restrict to numbers?
  
3. The template_split_begin + index doesn't look very flexible.
  What if we need to change our template placeholders

4. What if we changed the order of %CODE% and %ALTCODE%?

5. What if we have more than one instance of %CODE% and %ALTCODE%?

=end
module Template
  CODE = "%CODE%"
  ALTCODE = "%ALTCODE%"

  def alt_req_id(req_id)
    String.new(req_id)[0...8].insert(5, '-')
  end

  def template(source_template, req_id)
    if req_id.include? "%"
      raise StandardError.new "Template Error. Oops. Cannot contain '%' character"
    end
    replacements = { CODE => req_id, ALTCODE=> alt_req_id(req_id) }
    template = String.new(source_template)
    template.gsub(/#{CODE}|#{ALTCODE}/) { |match| replacements[match] }
  end
end
