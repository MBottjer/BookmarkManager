Feature: Signing Up 

  Scenario: Adding a User 

    Given I am on the homepage
    When I follow "Sign Up"
    And I fill in "name" with "Michael"
    And I fill in "email" with "michaelbottjer@hotmail.com"
    And I fill in "password" with "devesh"
    And I fill in "password_confirmation" with "devesh"
    And I press "Sign Up"
    Then I am on the homepage
    And I should see "Welcome, michaelbottjer@hotmail.com"

  Scenario: Adding a User with unmatched passwords

    Given I am on the sign up page 
    When I fill in "name" with "Michael"
    And I fill in "email" with "michaelbottjer@hotmail.com"
    And I fill in "password" with "devesh"
    And I fill in "password_confirmation" with "devash"
    And I press "Sign Up"
    Then I should be on the sign up page
    And I should see "Password does not match the confirmation"

  Scenario: Adding a duplicate user 

    Given I am on the sign up page
    And a User exists with the following details:
    |email                      |password_digest   |name        |
    |michaelbottjer@hotmail.com |devesh            |michael     |
    When I fill in "name" with "Michael"
    And I fill in "email" with "michaelbottjer@hotmail.com"
    And I fill in "password" with "devesh"
    And I fill in "password_confirmation" with "devesh" 
    And I press "Sign Up"
    Then I should be on the sign up page
    And I should see "This email is already taken"