module Template
  def template(source_template, req_id)
    # The test was the only way I knew what this code was doing, I thought maybe I was missing something.
    # I don't know of any specific smells it had other than it was drastically over complicated (at least based on what the test expected).
    # I used gsub instead of sub since it seems implied that you would want to replace all instances of these template vars.
    # There are caveats that didn't appear to be addressed in the old code so i didn't address them in this either. The length of the req_id matters otherwise you can be out of range.
    # Normally when refactoring I would break out functionality into separate methods (SRP) but I had a difficult time understanding what the intent was with most of the previous code.

    String.new(source_template).gsub('%CODE%', req_id).gsub('%ALTCODE%', "#{req_id[0..4]}-#{req_id[5..7]}")
  end
end
