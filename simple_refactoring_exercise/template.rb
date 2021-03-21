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

  def template(source_template, req_id)
    template = String.new(source_template)

    # Substitute for %CODE%
    template_split_begin = template.index("%CODE%")
    template_split_end = template_split_begin + 6
    template_part_one =
      String.new(template[0..(template_split_begin-1)])
    template_part_two =
      String.new(template[template_split_end..template.length])
    code = String.new(req_id)
    template =
      String.new(template_part_one + code + template_part_two)

    # Substitute for %ALTCODE%
    template_split_begin = template.index("%ALTCODE%")
    template_split_end = template_split_begin + 9
    template_part_one =
      String.new(template[0..(template_split_begin-1)])
    template_part_two =
      String.new(template[template_split_end..template.length])
    altcode = code[0..4] + "-" + code[5..7]
    template_part_one + altcode + template_part_two
  end
end
