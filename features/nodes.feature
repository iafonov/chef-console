@javascript
Feature: Nodes management

  Scenario: Viewing nodes list
   Given chef server has nodes
    When I am on the home page
     And I follow "Nodes"
    Then I should see "test-shard1" within the active content element

  Scenario: Adding a new node
   Given chef server has nodes
    When I am on the home page
     And I follow "Nodes"
     And I follow "New Node"
     And I fill in "Name" with "new-node"
     And I press "Create"
     And I wait for 1 second
