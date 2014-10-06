Given(/^there are two different people in the action zone$/) do
  Capybara.session_name = "Andrew"
  register("Andrew")
  Capybara.session_name = "Steve"
  register("Steve")
end

Given(/^I am on "(.*?)"'s browser$/) do |name|
  	Capybara.session_name = name
end

When(/^I select Super Computer$/) do
	choose('opponent_super_computer')
end

When(/^press the button "(.*?)"$/) do |button|
	click_on button	
end

When(/^I select Dumb Human$/) do
  	choose('opponent_dumb_human')
  	click_on "Let's play!"
end

def register(name)
	visit '/'
	fill_in 'name', with: name
	click_button 'Bring it on!'
end