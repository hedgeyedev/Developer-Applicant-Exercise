module Helpers
  def instance_of_class(name)
    (eval name).new 
  end
end