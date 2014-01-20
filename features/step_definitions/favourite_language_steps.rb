Given(/^I am on homepage$/) do
  visit '/'
end

When(/^I enter "(.*?)" as the username$/) do |user|
  fill_in "Username", with: user
end

When(/^I click "(.*?)"$/) do |button_name|
  click_button button_name
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end