# 1. Extracts template replacement logic into separate Formatter and Replacer classes.
#   - By creating dedicated classes, the code becomes more modular, adhering to the Single Responsibility Principle.
#   - Each class has a clear purpose: Formatter for formatting the code strings, and Replacer for handling the template replacement.
# 2. Utilizes gsub, a more concise and idiomatic way of replacing strings in Ruby.
#   - This tackles the code smell of Duplication and Complexity in the original code.
# 3. Encapsulates the state and behavior related to formatting and replacing in its respective classes.
#   - This Enhances maintainability and clarity. Each class is responsible for its own data and behavior.
module Template
  def template(source_template, req_id)
    formatter = Formatter.new(req_id)
    Replacer.new(source_template, formatter).replace
  end
end

class Replacer
  def initialize(template, formatter)
    @template = String.new(template)
    @formatter = formatter
  end

  def replace
    template = @template.gsub("%CODE%", @formatter.normal_code)
    template.gsub("%ALTCODE%", @formatter.alt_code)
  end
end

class Formatter
  def initialize(code)
    raise "Code must be 10 characters long" if code.length != 10
    @code = code
  end

  def normal_code
    @code
  end

  def alt_code
    @code[0..4] + "-" + @code[5..7]
  end
end
