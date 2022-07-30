@Feature_BG_Test
Feature: Test background

  Background: Background test1
    Given Test Background

  @BG
  Scenario: Test scenario 1
    Given Go to url
    When Login agent
    Then Verify login successfully
