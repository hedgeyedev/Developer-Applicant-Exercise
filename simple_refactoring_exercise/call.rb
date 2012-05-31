require_relative 'template'
include Template

temp = Template.template('Code is %CODE%; alt code is %ALTCODE%', '5678901234')

print temp
print "\n"
