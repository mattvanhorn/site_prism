Feature: Page navigation
  As a tester
  I want to be able to use abstractions for messages on the page
  In order to verify the page

  Scenario: Verify a message
    When I navigate to the message page
    Then I should see the greeting message
     But I should not see the thank you message

