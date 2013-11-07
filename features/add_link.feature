Feature: Adding Links

  In order to save a link
  As a person who wants to save links
  I want to be able to add links

  Background:
    Given I am on the homepage
    When I follow "Add Link"
    And I fill in "title" with "Bananas"
    And I fill in "uri" with "http://www.youtube.com/watch?v=BYBw_o_2nG0"
    And I fill in "description" with "The most awesome wideoh"

  Scenario: Adding a link
    And I press "Add link" 
    Then I should see "Bananas"

  Scenario: Adding a link with a tag 
    And I fill in "tags" with "minions, bananas"
    And I press "Add link"
    Then I should see "minions"

