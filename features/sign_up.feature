Feature: Sign up feature

    Scenario: User can sign up
      Given Gitlab sign up page is opened
      When I register user via UI
      Then I see that user is registered