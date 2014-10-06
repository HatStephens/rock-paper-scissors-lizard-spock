Given(/^I am playing against the computer$/) do
  	visit '/'
	fill_in 'name', with: "Steve"
	click_button 'Bring it on!'
	choose('opponent_super_computer')
	click_on "Let's play!"
end

When(/^I choose a weapon$/) do
  	choose('weapon_rock')
  	click_on "Let's play!"
end

Then(/^we should be taken to the result page to find out who won$/) do
	expect(page).to have_content "So the winner is"
end
