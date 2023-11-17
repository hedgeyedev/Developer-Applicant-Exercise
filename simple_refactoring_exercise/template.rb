module Template
  # My notes on what was refactored and why:
  # Code duplication when parsing the template string is pretty much the same for both
  # CODE and ALTCODE. The use of magic numbers is also not ideal. A great opportunity to
  # leverage regular expressions to make it more readable and maintainable.
  def template(source_template, req_id)
    altcode = req_id[0..4] + "-" + req_id[5..7]
    source_template.sub(/%CODE%/, req_id).sub(/%ALTCODE%/, altcode)
  end
end
