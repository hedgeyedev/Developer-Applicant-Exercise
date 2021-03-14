module Template

  @@tag_definitions = Hash[
    "CODE"    => lambda { |code| code },
    "ALTCODE" => lambda { |code| code.to_s[0..4] + "-" + code.to_s[5..7] }
  ]

  def template_old(source_template, req_id)
    # non-descriptive parameter name "req_id"?
    template = String.new(source_template)

    # 1. DRY this out ("Duplicated Code")
    # 2. is there a better way to manipulate strings? This seems verbose/clunky ("Shotgun Surgery")
    # 3. is the template method the best place to get req_id? maybe it is. That would depend on who
    #    or what is using this module and how? Can/should the interface be changed? (if yes, this
    #    could be a case of "Long Parameter List")

    # Substitute for %CODE%
    template_split_begin = template.index("%CODE%")
    template_split_end = template_split_begin + 6 # magic number
    template_part_one =
      String.new(template[0..(template_split_begin-1)])
    template_part_two =
      String.new(template[template_split_end..template.length])
    code = String.new(req_id)
    template =
      String.new(template_part_one + code + template_part_two)

    # Substitute for %ALTCODE%
    template_split_begin = template.index("%ALTCODE%")
    template_split_end = template_split_begin + 9 # magic number
    template_part_one =
      String.new(template[0..(template_split_begin-1)])
    template_part_two =
      String.new(template[template_split_end..template.length])
    altcode = code[0..4] + "-" + code[5..7] # magic numbers
    template_part_one + altcode + template_part_two # ambiguous? what should this return?
  end

  def template(source_template, req_id)

    template = String.new(source_template)
    # should req_id also be enforced to a string? or should that be handled in the tag definition?

    @@tag_definitions.each do |tag, replace|
      template.gsub!("%#{tag}%", replace.call(req_id))
    end

    return template

  end

  module_function :template
  module_function :template_old
end
