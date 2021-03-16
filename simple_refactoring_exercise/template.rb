module Template
  def template(source_template, req_id)
    template = String(source_template)
    code = String(req_id)

    # Substitute for %CODE%
    template.gsub!("%CODE%", code)

    # Substitute for %ALTCODE%
    altcode = code[0..4] + "-" + code[5..7]
    template.gsub!("%ALTCODE%", altcode)

    # I replaced the index-finding code and string splicing with Ruby String's `gsub!` method, which finds a substring and replaces it within a string. The ! means that the method is descructive, and thus prevents the need from extra declarative statements. Further, there was variable reuse which causes confusion and can introduce bugs easily.

    # The reason this is better than the provided code is that the previously provided code created a bunch of new string objects that take up additional memory every iteration. The above is much less memory intensive, less redundant, and much more human readable. 
  end
end
