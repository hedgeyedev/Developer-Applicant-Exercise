module Matchers 
#------------------Classes----------------/ 
  class RespondToMethod
    def initialize(expected)
      @expected = expected
    end

    def matches?(actual)
      @actual = actual
      @actual.respond_to? @expected
    end

    def failure_message
      "expected '#{@expected}' but got '#{@actual}'"
    end

    def negative_failure_message
      "expected something else then '#{@expected}' but got '#{@actual}'"
    end
  end



#------------------Matchers----------------/ 
  def respond_to_method(expected)
    RespondToMethod.new(expected)
  end
end