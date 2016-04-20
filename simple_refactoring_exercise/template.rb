module Template
  def template(source_template, req_id)
    source_template.sub("%CODE%", req_id).sub("%ALTCODE%", req_id[0..7].insert(5, "-"))

    # Most of the code that was here was unnecessary. Here are some notes about some of the various
    #  problems with the code that was here:
    # - One of the (many) great things about Ruby is the great wealth of built-in methods to
    #    simplify the code needed to manipulate objects, especially strings.
    # - The first line in the method is intended to separate the string being modified in this
    #    method from the reference passed in. This could be more simply achieved using the
    #    String#clone method, which would have exactly the same effect.
    #
    # - There was a lot of unnecessary use of String constructors. Its use in the assignments on
    #    lines 9, 11, 14, 20, and 22 was completely unnecessary.
    # - The definition of the local var `code` on line 12 is problematic. For one, its use of a
    #    String constructor could be simplified to use String#clone, just as on line 3. Secondly,
    #    this statement is embedded in the section devoted to the %CODE% substitution, but it is
    #    also referenced in the %ALTCODE% substitution. That line should be moved up, above the
    #    comment on line 5, so it's clear that it is referenced throughout the method.
    #
    # About my implementation:
    # - I used String#sub, and not the more commonly used String#gsub because I was trying to mirror
    #    as much as possible the behavior of the old code. The old code used String#index to find
    #    where to substitute, and that method returns the *first* instance of the string provided.
    #    String#sub matches this behavior, whereas String#gsub will replace *all* occurrences.
    # - Because I only used non-destructive methods on the `source_template`, it wasn't necessary to
    #    clone it, or create a new instance of a String from it.
    # - The way that the old method generated the `altcode` (on line 23) wasn't actually that bad.
    #    But I decided that using String#insert made the statement read better. Where the old one
    #    read as "concatenate together the first four characters, a hyphen, and the fifth through
    #    seventh characters", the new one reads "take the first seven characters, and insert a
    #    hyphen after the first five."
  end
end
