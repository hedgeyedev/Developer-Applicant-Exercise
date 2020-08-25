This refactoring example is a ruby port of a refactoring exercise from
_Extreme Programming Explored_.  template.rb taken from the the Ruby
refactoring code https://github.com/kevinrutherford/rrwb-code

## Refactored Smells
- Long Method
  - Fixed by extracting to a function.
- Abuse of bloaters (String constructor used unnecessarily)
  - Fixed by removing code.
- Undescriptive variable names
  - Fixed by renaming variables and functions to more descriptive and intuitive ones.
- Magic Numbers when string searching
  - Fixed by replacing magic literals.
- Duplicated Code
  - Fixed by extracting to a function.
- Not leveraging Ruby/Non-ideal string operations
  - Ruby has many built-in functions for strings operations. Makes it more readable.
- No exception handling
  - When the replacement string is less than 6 characters, the code raises an undescriptive error. Fixed by adding an exception.
- Too many temporary variables
  - Fixed by extracting to a function.
  
## Code Decisions
- I decided to keep the string operations instead of regex substitution since they are faster.
- Kept the ALTCODE truncation to 8 characters. Without any function specification, it seemed more of a 
specification rather than a bug.