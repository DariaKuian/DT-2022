Feature: Sign up & sign in feature

  Scenario: User can sign up
    Given Gitlab sign up page is opened
    When I register user via UI
    Then I see that user is registered

  Scenario: Registered user can sign in
    Given Gitlab sign in page is opened
    When I sign in as a preregistered user
    Then I see that new user is logged in