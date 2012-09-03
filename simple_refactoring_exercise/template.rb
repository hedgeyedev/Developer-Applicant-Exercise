module Template
    def template(source_template, req_id)
        altcode = "#{req_id[0..4]}-#{req_id[5..7]}"
        source_template.gsub(/\%CODE%/,req_id).gsub(/\%ALTCODE%/,altcode)
    end
end
