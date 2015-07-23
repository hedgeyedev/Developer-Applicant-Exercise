# I fixed the following code smells to simplify the implementation
# - long method
# - duplicate code (refactored using ruby string methods)
# - complexity (split up responsibility with private method to format alt code)
# - excessive casting (used to_s and known return types)

module Template
  def template(source_template, req_id)
    source_template.to_s.gsub('%CODE%', req_id).gsub('%ALTCODE%', altcode(req_id))
  end

  private

  def altcode(code)
    code[0..4] + "-" + code[5..7]
  end
end
