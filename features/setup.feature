Feature: Automated setup
  In order to get started with my website
  As an administrator
  I want to set up a new site quickly and easily
  
  Scenario: Require setup on first visit
    Given an empty sites table
    When I go to the home page
    Then I should see "Set up your site"

  Scenario: Don't show setup page after setup
    Given I have completed setup
    When I go to the home page
    Then I should not see "Set up your site"
  
  Scenario: Disallow access to setup page after setup
    Given I have completed setup
    When I go to the setup page
    Then I should not see "Set up your site"
  
  