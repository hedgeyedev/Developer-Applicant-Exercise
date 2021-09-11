This refactoring example is a ruby port of a refactoring exercise from
_Extreme Programming Explored_.  template.rb taken from the the Ruby
refactoring code https://github.com/kevinrutherford/rrwb-code

## Refactoring Thought Process and Proposal

At first glance reviewing the source code and lack of comments/documentation in `template.rb`, the purpose and functionality of the template module and function were not instantly evident. The accompanying test case provided a clear summary of the expected behavior and result of the template function with its appropriately word spec. The following code smells and bad practices stood out to me when working through this refactoring exercise:

* **Not DRY (Do Not Repeat Yourself)** - The implementor did a poor job of being concise by defining variables and data unnecessarily multiple times over which makes the source functionality hard to reason about, update, and maintain. Additionally, over time as more capabilities need to be introduced to into this function/module it can result in the source producing unintended consequences or break existing functionality due to the complex logic being used to implement a simple task.

* **Failure to use language features** - The implementation involved creating and using their own version of string substitution instead of using the Ruby language's built in functions which exist in every modern programming language today. This resulted in the source being convoluted and verbose.

The goal was to avoid adding extensive comments explaining the functionality of this module/function. The only way to accomplish this by writing clean code that follows Ruby's industry standard conventions and utilizes well-documented features to perform the work. This led me to employ the `sub!` function to mutate and build the resulting template with the `%CODE%` and `%ALTCODE%` injected. The result is a concise, easy to read, and enhance string template functionality.
