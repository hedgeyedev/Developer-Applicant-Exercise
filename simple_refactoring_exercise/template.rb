
module Template
  def template(source_template, req_id)
    #honestly i had to look this one up, i knew that the string.news was not DRY
    #the thing that stumped me was the +6 and +9 which after research i figured out
    #it was just the amount of char in %code% & %altcode% and had nothing to do with anything!!
    #once i figured that out it was simple. to turn CODE to altcode 
    #just need to set altcode to the first 5 char of CODE - (char[5]->char[7])of CODE
    #then created new template and subed %CODE% for req_id unchanged 
    #then sub %altcode% for altcode which we just concated   
   altcode = req_id[0..4]+"-"+req_id[5..7]
   template_new = source_template.gsub(/%CODE%/,req_id)
   template_new = source_template.gsub(/%altcode%/,altcode)
   return template_new
  end
end
 
