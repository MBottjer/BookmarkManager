Feature: Filter Tags 
  
  In order to find the bookmark
  As a person with poor memory
  I want to be able to filter bookmarks

Scenario: Filtering Tags 

  Given I have the tag "Devesh"
  When I follow "Tags"
  Then I should see "Devesh"

Scenario: Finding links with the same tags 
  
  Given I have a link with tag "Devesh"
  When I follow "Devesh"
  Then I should see "Something"


