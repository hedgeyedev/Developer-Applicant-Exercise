module Template
  def template(source_template, req_id)

    source_substitution = source_template.sub(/%CODE/, req_id)
    return source_substitution.sub(/%ALTCODE/) { req_id[0..4] + "-" + req_id[5..7] }

  end
end
