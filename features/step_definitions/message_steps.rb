When /^I navigate to the message page$/ do
  @test_site = TestSite.new
  @test_site.page_with_message.load
end

Then /^I should see the greeting message$/ do
  @test_site.page_with_message.should have_greeting
end

Then /^I should not see the thank you message$/ do
  @test_site.page_with_message.should have_no_thank_you
end
