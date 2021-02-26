module Template
  def template(source_template, req_id, hyphen_index, drop_from_end_number)
    template = String.new(source_template)
    # Substitute for %CODE%
    template.sub! "%CODE%", req_id
    # Substitute for %ALTCODE%
    template.sub! "%ALTCODE%", req_id.insert(hyphen_index, "-")[0...-drop_from_end_number]
  end
end
