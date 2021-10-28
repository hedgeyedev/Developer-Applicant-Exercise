# Template is not a good name because it is too generic, maybe MessageTemplate would be better? I need more context to come up with a better one
module Template
  # renamed method and params to reflect intention
  def substitute_code_and_altcode(source_template, replacement)
    source_template.gsub(/%CODE%/, replacement).gsub(/%ALTCODE%/, replacement[0..4] + '-' + replacement[5..7])
  end
end
