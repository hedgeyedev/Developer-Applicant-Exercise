module Template
  def template(source_template, req_id)
    req_id = String.new(req_id)
    template = String.new(source_template)
    template = ReplaceCodeVariable.new(template: template, req_id: req_id).()
    ReplaceAltCodeVariable.new(template: template, req_id: req_id).()
  end

  private

  # Command pattern for variable replacement leaves freedom for each command to
  # define their own initialize depending on their own needs. At the end of the
  # day, they all just need to distill 'template', 'variable', and 'value'
  class ReplaceVariableCommand
    def call()
      @template.gsub(variable(), @value)
    end
  end

  class ReplaceCodeVariable < ReplaceVariableCommand
    def variable()
      "%CODE%".freeze
    end

    def initialize(template:, req_id:)
      @template = template
      @value = req_id
    end
  end

  class ReplaceAltCodeVariable < ReplaceVariableCommand
    def variable()
      "%ALTCODE%".freeze
    end

    def initialize(template:, req_id:)
      @template = template
      @value = req_id[0..4] + "-" + req_id[5..7]
    end
  end
end
