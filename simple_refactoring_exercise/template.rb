module Template
  def template(source_template, req_id)
    dictionary = generate_dictionary(req_id)

    source_template.gsub(/%\w+%/, dictionary)
  end

  def generate_alt_code(code)
    code.clone.insert(5, '-')
  end

  def generate_dictionary(code)
    { '%CODE%' => code, '%ALTCODE%' => generate_alt_code(code) }
  end
end


# Refactoring notes
#
# Basically everything in the method was replaced as gsub with a
# regex pattern and dictionary hash not only accomplishes the goal,
# but also allows templates to contain multiple instances of
# %CODE% and %ALTCODE%.
#
# Comments on the original approach
#
# template.rb
#
# 1. Declaring the `template` variable is unnecessary. The arg
#    can be directly referenced. Also, declaring a variable
#    with the same name as a method is smelly.
#
# 2. Creating a new string and passing in an arg that should
#    be a string is unnecessary. It is already a string.
#
# 3. The rest of the method was completely abandoned once I
#    figured out what it was doing. It is a convoluted, brittle,
#    and difficult to read. It is also unable to handle instances
#    where `%CODE%` and `%ALTCODE%` are used multiple times.
#
# 4. There appeared to be a bug in the code AND in the spec.
#    When the altcode is generated...
#
#    `altcode = code[0..4] + "-" + code[5..7]`
#
#    I believe that the _intent_ of this code is to insert a `-`
#    after the 5th character but the implementation actually loses
#    the last two characters. Since the arg is named `req_id`, those
#    final two characters seem like they would be significant. If
#    the previous implementation was left as-is, there would likely be
#    id collisions.
#
# template_spec.rb
#
# 1. As stated in #4 for template.rb, I believe that is an implementation
#    error. I'd guess that in this situation, the imaginary engineer just
#    changed the spec to get it to pass.
#
# 2. The spec's description used double quotes when there was
#    no string interpolation. Not the end of the world but I
#    switched single quotes anyway.
#
# Some misc. comments on my approach
#
# 1. On line 2, I declared a variable called `dictionary`. This is
#    not necessary of course but I think it makes the method nicer to read.
#
