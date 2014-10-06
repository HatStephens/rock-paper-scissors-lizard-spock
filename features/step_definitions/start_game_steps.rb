Given(/^I visit the RPSLS page$/) do
	visit '/'
end

Then(/^I should see "(.*?)"$/) do |text|
	expect(page).to have_content text
end

Given(/^I am still on the RPSLS Page$/) do
	visit '/'
end

When(/^I enter my "(.*?)" as "(.*?)"$/) do |field, name|
	fill_in field, with: name
end

When(/^I click on the button "(.*?)"$/) do |button|
	click_button button
end

Then(/^see "(.*?)"$/) do |text|
	expect(page).to have_content text
end

# When(/^I fail to enter my "(.*?)"$/) do |field|
#   fill_in field, with: ""
# end

# Then(/^I should see and an error message$/) do
# 	expect(page).to have_content "You must enter your name to continue."
# end