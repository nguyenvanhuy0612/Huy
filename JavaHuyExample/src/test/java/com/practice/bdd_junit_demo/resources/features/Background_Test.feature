@Feature_Background_Test
Feature: Test background

  Background: Try load test data
    Given Load lab info
    Then Load Test Object

  Scenario: Test background scenario 1
    Given Login agent