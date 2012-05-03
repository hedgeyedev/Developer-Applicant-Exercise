module Template
  def template(source_template, req_id)
    # Both substitutions are simeple and a regexp will probably be faster and less error prone.
    #
    # Code smells:
    #  * String.new, not very rubyish
    #  * Multiple intermediate strings
    source_template.gsub(/%CODE%/, req_id).gsub(/%ALTCODE%/, "#{req_id[0..4]}-#{req_id[5..7]}")
  end
end
