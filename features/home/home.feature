Feature: Hello Cucumber
  As a user
  I want our users to be greeted when they visit our site
  So that they have a better experience

  @selenium
  Scenario: User sees the home message
    When I go to the homepage
    And I pause
    Then I should see the welcome message