module Template
  def template(source_template, req_id)
    substitute(source_template, req_id)
  end
  
  def substitute(source_template, req_id)
    alt_req_id = req_id.sub(/(\d{5})(\d{3})(\d{2})/, "\\1-\\2")
    subs = { '%CODE%' => req_id, '%ALTCODE%' => alt_req_id }
    source_template.gsub(/%CODE%|%ALTCODE%/) { |match| subs[match] }
  end
  
end