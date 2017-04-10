module Template
  # The original implementation used indexs arithmetics to replace portions of strings. Given the default Ruby library, this not needed.
  # I took advantage of block syntax of String#gsub. If you want to follow the original approach, StringScanner might be used instead.
  def template(source_template, req_id)
    # There was no need to use String.new. If you want to make sure the original string is not changed, you can just use dup
    template = source_template.dup

    # Build an hash which will hold all the key we want to replace
    replacements = {
      "CODE" => req_id,
      "ALTCODE" => req_id.dup.insert(5, "-")[0, 9]
    }

    # Now perform the replacement
    template.gsub(/%([A-Z]+)%/) { |k| replacements[k.gsub("%", "")] }
  end
end
