module Template
  def template(source_template, req_id)
    template = source_template

    # I first refactored the String.new out, since you do not need to
    # use String.new in for to create a new string in Ruby.
    #
    # Next I used the gsub function to clearly substitute the desired
    # string for the code. No need to manually do this.

    # Substitute for %CODE%
    template = template.gsub("%CODE%", req_id)

    # Substitute for %ALTCODE%
    altcode = req_id[0..4] + "-" + req_id[5..7]
    template.gsub("%ALTCODE%", altcode)
  end
end
