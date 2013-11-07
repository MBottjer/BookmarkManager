Feature: Signing In 

  Scenario: Signing in as a User

    Given I am on the homepage
    And a User exists with the following details:
    |email                     |password_digest   |
    |michaelbottjer@hotmail.com|devesh            |
    When I follow "Sign In"
    And I fill in "email" with "michaelbottjer@hotmail.com"
    And I fill in "password" with "devesh"
    And I press "Sign In"
    Then I should see "Welcome, michaelbottjer@hotmail.com"