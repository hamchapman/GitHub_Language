Feature: Getting a user's favourite language
  In order to be able to find out a user's favourite language
  I want to be able to type in a username and have the language displayed

  Scenario: Finding hamchapman's favourite language
    Given I am on homepage
    When I enter "hamchapman" as the username 
    And I click "Submit"
    Then I should see "hamchapman's favourite language(s): Ruby"
