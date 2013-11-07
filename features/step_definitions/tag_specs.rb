Given(/^I have the tag "(.*?)"$/) do |tag|
  visit '/'
  click_link 'Add Link'
  fill_in 'title', with: 'Something'
  fill_in 'uri', with: 'http://www.something.com'
  fill_in 'description', with: 'Something'
  fill_in 'tags', with: tag
  click_button 'Add link'
end

Given(/^I have a link with tag "(.*?)"$/) do |tag|
  visit '/'
  click_link 'Add Link'
  fill_in 'title', with: 'Something'
  fill_in 'uri', with: 'http://www.something.com'
  fill_in 'description', with: 'Something'
  fill_in 'tags', with: tag
  click_button 'Add link'
end
