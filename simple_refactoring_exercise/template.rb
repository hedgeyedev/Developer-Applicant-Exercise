# -*- coding: utf-8 -*-

module Template
  def template(source_template, req_id)
    source_template.
      gsub('%CODE%', req_id).
      gsub('%ALTCODE%', "#{req_id[0,5]}-#{req_id[5,3]}")
  end
end
