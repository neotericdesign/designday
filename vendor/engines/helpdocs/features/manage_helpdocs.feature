@helpdocs
Feature: Helpdocs
  In order to have helpdocs on my website
  As an administrator
  I want to manage helpdocs

  Background:
    Given I am a logged in refinery user
    And I have no helpdocs

  @helpdocs-list @list
  Scenario: Helpdocs List
   Given I have helpdocs titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of helpdocs
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @helpdocs-valid @valid
  Scenario: Create Valid Helpdoc
    When I go to the list of helpdocs
    And I follow "Add New Helpdoc"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 helpdoc

  @helpdocs-invalid @invalid
  Scenario: Create Invalid Helpdoc (without title)
    When I go to the list of helpdocs
    And I follow "Add New Helpdoc"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 helpdocs

  @helpdocs-edit @edit
  Scenario: Edit Existing Helpdoc
    Given I have helpdocs titled "A title"
    When I go to the list of helpdocs
    And I follow "Edit this helpdoc" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of helpdocs
    And I should not see "A title"

  @helpdocs-duplicate @duplicate
  Scenario: Create Duplicate Helpdoc
    Given I only have helpdocs titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of helpdocs
    And I follow "Add New Helpdoc"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 helpdocs

  @helpdocs-delete @delete
  Scenario: Delete Helpdoc
    Given I only have helpdocs titled UniqueTitleOne
    When I go to the list of helpdocs
    And I follow "Remove this helpdoc forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 helpdocs
 