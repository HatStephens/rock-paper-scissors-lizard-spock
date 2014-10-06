
Given(/^I am in the Action Zone$/) do
	visit '/'
	fill_in 'name', with: "Steve"
	click_button 'Bring it on!'
end

When(/^I select Super Computer$/) do
	choose('opponent_super_computer')
end

When(/^press the button "(.*?)"$/) do |button|
	click_on button	
end

When(/^I select Dumb Human$/) do
  choose('opponent_dumb_human')
end