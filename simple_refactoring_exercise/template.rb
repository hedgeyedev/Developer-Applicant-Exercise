module Template
  def template(source_template, req_id)
    begin
      altcode = req_id[0..4] + "-" + req_id[5..7]
    rescue
      altcode = req_id
    end
    source_template.gsub(/\%CODE\%/,req_id).gsub(/\%ALTCODE\%/,altcode)
  end
end
