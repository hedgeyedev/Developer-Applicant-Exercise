# 1. Long method, looks like #template is building the altcode
#    as well as swapping it in to the template.
#
# 2. Better naming all around (uncommunicative names):
#    - Template seems like a very generic and non-descript name.
#      The generic-ness of it could lead to conflicts later, while
#      the module's intended purpose isn't apparent by its name.
#    - The module is named Template, has a template method, and a
#      argument named template, too many templates?
#    - req_id is more descriptive name than code, using it avoids a
#      second variable
#
# 3. Without more background, I'd lean towards having the
#    altcode being the responsibility of the model to provide.
#
# 4. Altcode creation should be handled in it's own method to provide
#    for reuse and ease of testing.
#
# 5. Again, without context, I'd say the module's template method would
#    be best suited in the model it is being included on.  It seems
#    to be very dependant on the data in that class.

module Template
  def altcode_from_req_id(req_id)
    req_id[0..4] + "-" + req_id[5..7]
  end

  def template(source_template, req_id)
    template = source_template

    # Substitute for %CODE%
    template_split_begin = template.index("%CODE%")
    template_split_end = template_split_begin + 6
    template_part_one = template[0..(template_split_begin-1)]
    template_part_two = template[template_split_end..template.length]
    code = String.new(req_id)
    template = template_part_one + code + template_part_two

    # Substitute for %ALTCODE%
    template_split_begin = template.index("%ALTCODE%")
    template_split_end = template_split_begin + 9
    template_part_one = template[0..(template_split_begin-1)]
    template_part_two = template[template_split_end..template.length]
    #altcode = code[0..4] + "-" + code[5..7]
    template_part_one + altcode_from_req_id(req_id) + template_part_two # looks like, appending part two is not covered in testing
  end
end
