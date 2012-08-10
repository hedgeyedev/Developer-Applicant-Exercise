Given /^I am on the home page$/ do
  visit '/'
end

Given /^I am on the via_js page$/ do
  visit '/via_js'
end

Then /^I should see headline "(.*?)"$/ do |headline|
  find(:xpath, '//h1').should have_content(headline)
end

Then /^I should see sub\-headline "(.*?)"$/ do |sub_headline|
  find(:xpath, '//h2').should have_content(sub_headline)
end

Then /^I should see (\d+) twits$/ do |twits_count|
  begin
    wait_until(10){all(".twit").count==20}
  rescue
    p page.body
  end 
  all(".twit").count.should eq twits_count.to_i
end

