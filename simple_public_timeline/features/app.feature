Feature: Viewing Twitter Timeline
  In order to test the twitter integration
  As a user
  I want to see the title with the greeting and 20 tweets

  Scenario: View server rendered tweets
    Given I am on the home page
    Then I should see headline "Recent Public Tweets"
    And  I should see sub-headline "What everyone on Twitter is talking about"
    And  I should see 20 tweets

  Scenario: View JS rendered tweets
    Given I am on the via_js page 
    Then I should see headline "Recent Public Tweets"
    And  I should see sub-headline "What everyone on Twitter is talking about"
    And  I should see 20 tweets