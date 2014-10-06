Feature: The Player must choose their opponent
	In order to progress further
	As a participant of an actual game
	I want choose whether my oppponent is real or not

Scenario: The Player chooses their opponent as the computer
	Given I am in the Action Zone
	When I select Super Computer
	And press the button "Let's play!"
	Then I should see "Good Luck, this piece of metal has one smart cookie!"

Scenario: The Player chooses their opponent as another player
	Given I am in the Action Zone
	When I select Dumb Human
	And press the button "Let's play!"
	Then I should see "Please wait whilst we try to find you a fellow humanoid to play against."