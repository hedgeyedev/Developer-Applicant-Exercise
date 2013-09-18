module Template
  def template(source_template, request_id)
    #healthy check
    return 'source template is not string' unless source_template.kind_of? String
    return 'request_id should be numeric' unless request_id.kind_of?(String) && request_id.match(/^\d+$/)
    ['%CODE%', '%ALTCODE%'].each do |code| 
       return "source template should have #{code}" unless source_template.include? code
    end


    # Substitute for %CODE%
    source_template.gsub!(/\%CODE\%/, request_id.to_s)

    # Substitute for %ALTCODE%
    source_template.gsub(/\%ALTCODE\%/, convert(request_id.to_s))

    #or merge to one
    #source_template.gsub(/\%CODE\%(.*)\%ALTCODE\%/) {request_id.to_s + $1 + convert(request_id.to_s)}
  end

  def convert( origin_string )
    origin_string.gsub(/(\d{5})(\d{3})(.*)/, '\1-\2')
  end
end
