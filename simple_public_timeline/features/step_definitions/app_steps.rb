Given /^I am on the home page$/ do
  visit '/'
end

Given /^I am on the via_js page$/ do
  visit '/via_js'
end

Then /^I should see headline "(.*?)"$/ do |headline|
  pending find('h1').should have_content(headline)
end

Then /^I should see sub\-headline "(.*?)"$/ do |sub_headline|
  pending find('h2').should have_content(sub_headline)
end

Then /^I should see (\d+) tweets$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

