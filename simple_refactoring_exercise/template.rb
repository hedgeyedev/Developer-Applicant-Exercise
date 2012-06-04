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
# 5. Again without context, I'd say the module's template method would
#    be best suited in the model it is being included on.  It seems
#    to be very dependant on the data in that class and likely class
#    specific.
#
# 6. #template's string spliting and reconstruction seemed error prone
#    and unwieldy, String#gsub cleans it up nicely.
#
# 7. If #template were going to be called often with the same source_template 
# argument, I'd consider setting a default value, eg.:
#     def template(req_id, template = "...")
# in order to increase consistency and ease maintainability.


module Template
  def altcode_from_req_id(req_id)
    req_id[0..4] + "-" + req_id[5..7]
  end

  def template(source_template, req_id)
    source_template.gsub('%CODE%', req_id).gsub('%ALTCODE%', altcode_from_req_id(req_id))
  end
end
