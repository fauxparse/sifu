Feature: Automated setup
  In order to get started with my website
  As an administrator
  I want to set up a new site quickly and easily
  
  Background:
    Given an empty sites table
    And an empty users table
  
  Scenario: Require setup on first visit
    When I go to the home page
    Then I should see "Set up your site"

  Scenario: Don't show setup page after setup
    Given I have completed setup
    When I go to the home page
    Then I should not see "Set up your site"
  
  Scenario: Disallow access to setup page after setup
    Given I have completed setup
    When I go to the new setup page
    Then I should not see "Set up your site"

  Scenario Outline: Fill in the setup form
    When I go to the home page
    And I fill in "First name" with "<first_name>"
    And I fill in "Last name" with "<last_name>"
    And I fill in "Email" with "<email>"
    And I fill in "Username" with "<username>"
    And I fill in "Password" with "<password>"
    And I fill in "Password confirmation" with "<password_confirmation>"
    And I press "Continue"
    Then I should be on the <page> page
    And I <action> see "Set up your site"
    
    Examples:
      | first_name | last_name | email             | username | password | password_confirmation | page  | action     |
      | Admin      | User      | admin@example.com | admin    | password | password              | home  | should not |
      | Admin      | User      |                   | admin    | password | password              | setup | should     |
      | Admin      | User      | admin@example.com | admin    | password | different password    | setup | should     |
