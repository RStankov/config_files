Then 'I should see "$text"' do |text|
  page.should have_content text
end

Then 'I should not see "$text"' do |text|
  page.should_not have_content text
end

Then /^show me the page$/ do
  save_and_open_page
end

