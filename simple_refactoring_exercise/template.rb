module Template
  def template(source_template, req_id)
    # change %CODE% to req_id and %ALTCODE% to req_id formula based on the test spec
    source_template.gsub("%CODE%", req_id).gsub("%ALTCODE%","#{req_id[0..4]}-#{req_id[5..7]}")
  end
end
