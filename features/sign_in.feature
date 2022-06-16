Feature: Sign in feature

    Scenario: User can login using helper module
      Given Gitlab sign in page is opened
      When I sign in as a preregistered user
      Then I see that new user is logged in