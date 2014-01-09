module Template
  def template(source_template, req_id)
    # Duplicate source to avoid possible pass by reference issues
    template = source_template.dup
    # Took advantage of Ruby gsub function to do a basic string replace on template
    template.gsub! '%CODE%', req_id
    template.gsub! '%ALTCODE%', req_id.dup.insert(5, "-")[0,9]
    template
  end
end
