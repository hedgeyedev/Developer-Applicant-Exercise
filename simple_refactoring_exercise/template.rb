module Template
  def template(source_template, req_id)
    source_template.gsub('%CODE%', req_id).gsub('%ALTCODE%', "#{req_id[0..4]}-#{req_id[5..7]}")
  end
end

# ------------
# CODE SMELLS:
# ------------
#   There were a few. Here's a list of ones that jumped out at me...
#     1. Possible Feature Envy - abuse of String methods
#     2. Long Method - I like methods quite short, as in my Smalltalk days
#     3. Duplicate Code - the easiset one to spot
#
# ----------
# QUESTIONS:
# ----------
# 1. Is the initial implementation (copied here) of taking the first 5 characters of the req_id
#    and concatenating that with a '-' and the next 3 characters really correct?
# 2. Or is the intent that the last part of the alternate code is the last 3 characters of the req_id?
# 3. If #2 is so, what would be the behavior for a req_id that is less than 8 characters long?
#
# ------
# NOTES:
# ------
# I was at first tempted to apply an ExtractMethod refactoring, but then I realized that the String#gsub
# method would be cleaner and more correct, since it would replace all occurrences of the given tags.
#
# If the available tags were to expand at all, this current naïve implementation would need to be
# refactored again. It might end up being something like this:
#
# def template(source_template, req_id)
#   token_tranformers.each_pair do |token, transformer|
#     source_template = source_template.gsub("%#{token}%", transformer.call(req_id))
#   end
#   source_template
# end
#
# def token_tranformers
#   {:CODE => proc{|e| e}, :ALTCODE => proc{|e| "#{e[0..4]}-#{e[5..7]}"}, ...}
# end
#
# Template#token_tranformers could also be a constant, but its implementation as a method allows the
# containing Type to implement token_transformers differently.
# 
# If the design needed to grow, I could also see the transformers becoming first-class objects. You'd
# probably have something like this:
#
#    class Transformer
#      attr_reader :token
#
#      def transform(template, input)
#        template.gsub(self.token, transform(input))
#      end
#
#      def transform(input); input; end
#    end
# 
#    class CodeTransformer < Transformer
#      def initialize; @token = '%CODE%'; end
#    end
# 
#    class AlternateCodeTransformer < Transformer
#      def initialize; @token = '%ALTCODE%'; end
#      def transform(input); "#{input[0..4]}-#{input[5..7]}"; end
#    end