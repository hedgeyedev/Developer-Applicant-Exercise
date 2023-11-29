module Template
  def template(source_template, req_id)
    # Substitute for %CODE% and %ALTCODE%
    source_template.gsub('%CODE%', req_id).gsub('%ALTCODE%', req_id[0..4] + "-" + req_id[5..7])
  end
end
