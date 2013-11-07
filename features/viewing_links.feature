Feature: Viewing Links
  In order to avoid having a large memory
  As a person who loves surfin the web
  I want to view the links I saed before

  Scenario: Viewing a link
    Given I have saved the following links:
      |title        |uri                    |description    |
      |Superpage    |http://example.com     |This is hard   |
    And I am on the homepagerequire
    Then I should see Superpage
  