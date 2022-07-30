@Feature_Test
Feature: Test
  This is test feature

  Background: This is background
    Given Go to url

  @Scenario1 @Scenario2
  Scenario: Scenario test 1, login agent to workspace
    Given Go to url
    When Login agent
    Then Verify login successfully

  Scenario: Scenario test 2, accept call
    Given Go to url
    When Login agent
    Then Verify login successfully