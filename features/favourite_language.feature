Feature: Getting a user's favourite language
  In order to be able to find out a user's favourite language
  I want to be able to type in a username and have the language displayed

  @vcr
  Scenario: Finding hamchapman's favourite language
    Given I am on homepage
    When I enter "hamchapman" as the username 
    And I click "Submit"
    Then I should see "Favourite language(s) of hamchapman: Ruby"

  @vcr
  Scenario: Returning a suitable error if a user's repos don't have a language associated
    Given I am on homepage
    When I enter "barry" as the username 
    And I click "Submit"
    Then I should see "Favourite language(s) of barry: not able to be calculated"

  @vcr
  Scenario: Returning a suitable error if a user doesn't exist
    Given I am on homepage
    When I enter "hamchapman777" as the username 
    And I click "Submit"
    Then I should see "Favourite language(s) of hamchapman777: not available because the user does not exist"