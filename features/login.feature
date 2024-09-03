@login
Feature: Login

Background: User on login page
  Given User on the login page

  @positive
  Scenario Outline: User can log into home page

    When User login with "<username>" and "<password>"
    Then User should redirected to home page

    Examples:
      | username      | password       |
      | standard_user | secret_sauce   |
      | visual_user   | secret_sauce   |
  
  @negative
  Scenario Outline: Log in with invalid credentials

    When User login with "<username>" and "<password>"
    Then User should see an error message "<errorMessage>"
    
    Examples:
      | username      | password     | errorMessage                                                               |
      | stasdsda_user | lalalalalaal | Epic sadface: Username and password do not match any user in this service  |
      | standard_user |              | Epic sadface: Password is required                                         |
      |               | secret_sauce | Epic sadface: Username is required                                         |