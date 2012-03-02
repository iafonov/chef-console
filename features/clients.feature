@javascript
Feature: Clients management

	Scenario: Viewing clients list
	 Given chef server has clients
		When I am on the home page
		 And I follow "Clients"
		Then I should see "test-client1" within the active content element
