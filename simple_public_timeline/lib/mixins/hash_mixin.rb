module HashMixin
  def black_list(*args)
	  self.delete_if { |k,v| args.include?(k) } 
  end
end