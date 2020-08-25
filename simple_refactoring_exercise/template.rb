# Replaces determined strings with given strings.
module Template
  # Module for replacing determined strings in a template with a give code.
  def replace_in_template(source_template, code_to_insert)
    raise ArgumentError, 'code_to_insert must be greater than 6 characters' unless code_to_insert.length >= 6
    new_template = replace(source_template, '%CODE%', code_to_insert)
    replace(new_template, '%ALTCODE%', code_to_insert[0..7].insert(5, '-'))
  end

  def replace(template, pattern, replacement)
    split_begin = template.index(pattern)
    template.slice! pattern
    template.insert(split_begin, replacement)
  end
end
