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
