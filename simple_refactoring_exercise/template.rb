module Template
  def template(source_template, req_id)
    template = source_template.dup

    template = insert_code(template, req_id)
    template = insert_altcode(template, req_id)

    template
  end

  private

  def insert_code(template, req_id)
    update_placeholder(template, '%CODE%', req_id)
  end

  def insert_altcode(template, req_id)
    altcode = req_id[0..4] + '-' + req_id[5..7]
    update_placeholder(template, '%ALTCODE%', altcode)
  end

  def update_placeholder(template, placeholder, value)
    template.gsub(placeholder, value)
  end
end
