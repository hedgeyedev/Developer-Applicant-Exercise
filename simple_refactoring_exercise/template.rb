module Template
  def template(source_template, req_id)
    template = String.new(source_template)

    # The template Knew Too Much about how codes are formatted.
    code_formatter = CodeFormatter.new(req_id)

    # Smells: duplication, inappropriate intimacy. 
    # This might be an instance of the refactoring "Replace Inline Code with Function Call".
    # It cleared up some duplication as well as replacing some magic numbers.
    template.gsub!("%CODE%", code_formatter.plain_code)
    template.gsub!("%ALTCODE%", code_formatter.altcode)
  end

  # This class should maybe come from somewhere else. However I'm not sure what the "context"
  # of this code is so it's hard to pick a place. I chose to keep it nearby.
  #
  # Named refactorings: 
  # - combine functions into class
  # - encapsulate record
  class CodeFormatter
    def initialize(code)
      # Is valid input? I need better specs to help me understand the goals.
      @raw_code = String.new(code)
    end

    def plain_code
      # Mmm...memoization.
      @code ||= @raw_code
    end

    def altcode
      # I have chosen to allow the spec to dictate whether the
      # truncation possible here is valid or not. If another
      # result is desired it should be defined in the spec first.
      @altcode ||= @raw_code[0..4] + "-" + @raw_code[5..7]
    end
  end
end
