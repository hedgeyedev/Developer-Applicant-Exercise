# require 'pry'

##
# At first I just removed duplication, but the code was hard to read, that I decided replace the 
# String initalizer concatination and index lookup with more abstract methods.
# Created private methods for code conversion.
# Extended String so it does multi-attribute word replace, that only gets called if hash no empty.


module Template
  def template(source_template, req_id)
    code = convert_to_code(req_id)
    alt_code = convert_to_alt_code(req_id)
    source_template.replace_hash_patterns({"%CODE%" => code , "%ALTCODE%" => alt_code})
  end
  
  private
    def convert_to_code(code) code end
    def convert_to_alt_code(code)
      "5678901234".slice(0,8).insert(5,'-')
    end  
end






##This could go inside of some initalizer 
class String
  def replace_hash_patterns(patterns={})
    (patterns.each_pair || {}).each do |key, value| 
      self.replace(self.gsub(key, value))
    end
    self
  end
end
