This refactoring example is a ruby port of a refactoring exercise from
_Extreme Programming Explored_.  template.rb taken from the the Ruby
refactoring code https://github.com/kevinrutherford/rrwb-code

Refactoring Notes:

At first I saw some duplication when I saw the same exact steps for both strings that we were searching for, so I refactored it into a method so that it could be reused.  

Then I realized that for a template, we probably want to replace ALL instances of the template word, not just the first one.  The original implementation would only replace the first match.  I changed the implementation of the template word substitution to use RegExp in order to replace everywhere in the template.

As far as the tests, I added an additional test to account for more than one of each template word to replace and verified that it was replaced correctly using that test.