module Template
  def substitute_template_placeholder(source_template, req_id, replace_term)
    source_template.gsub(replace_term, req_id)
  end

  def format_for_altcode(source_template, req_id)
    "#{req_id[0..4]}-#{req_id[5..7]}"
  end

  def template(source_template, req_id)
    template = substitute_template_placeholder(String.new(source_template), req_id, '%CODE%')
    substitute_template_placeholder(template, format_for_altcode(template, req_id), '%ALTCODE%')
  end
end

# Refactored into smaller reusable methods. Previous method had more than a single responsibility.