module Template
  def template(source_template, req_id)
	#handle some basic checks
	raise ArgumentError, "req_id must be a String" unless req_id.kind_of? String
	raise ArgumentError, "req_id must at least 8 characters long" unless req_id.length >= 8
	raise ArgumentError, "source_template must be a String" unless source_template.kind_of? String
	
    #setup altcode
	altcode = req_id[0..4] + "-" + req_id[5..7]
	
	#use regex to find the variables, replace with enum
	source_template.gsub(/%(ALT)?CODE%/, '%CODE%' => req_id, '%ALTCODE%' => altcode)
  end
end
