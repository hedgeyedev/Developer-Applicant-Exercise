module Template
  def template(source_template, req_id)
    # The test was the only way I knew what this code was doing, I thought maybe I was missing something.
    # I don't know of any specific smells it had other than it was drastically over complicated (at least based on what the test expected).
    # I managed to get the test running locally and this seems to be the simplest solution.
    # I used gsub instead of sub since it seems implied that you would want to replace all instances of these template vars.
    # Potential remaining smells but am unsure due to only 1 existing test: source template var is mutated, regardless of pass by reference or by value i usually prefer to copy
    # This may have been the significance of String.new but for the sake of refactoring to the simplest solution that passes the test, this was the route I went. 
    # Additionally req_id has a hard requirement on string length that isn't enforced. 
    # My thought process is, if these were required there would have been tests for them, so in the absence of tests I went with the simplest solution I could think of.

    source_template.gsub('%CODE%', req_id).gsub('%ALTCODE%', "#{req_id[0..4]}-#{req_id[5..7]}")
  end
end
