#1. Long method. String#gsub works too.
#2. Duplication of similar code
#3. Too many identifiers that begin with "template"

module Template
  def template(source_template, req_id)
    altcode = req_id[0..4] + "-" + req_id[5..7]
    source_template.gsub('%CODE%', req_id).gsub('%ALTCODE%', altcode)
  end
end

