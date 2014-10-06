Feature: Starting a game
	In order to play RPSLS
	As a competitive player
	I want to start a new game

Scenario: Visiting the RPSLS Page
	Given I visit the RPSLS page
	Then I should see "Welcome to RPSLS HQ"

Scenario: Creating a new game
	Given I am still on the RPSLS Page
	When I enter my "name" as "Steve"
	And I click on the button "Bring it on!"
	Then I should see "Welcome to the Action Zone, Steve"

