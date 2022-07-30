@Feature_Data
Feature: Test data

  Background: Background for test data
    Given Init data

  @TestData
  Scenario: Test Data load
  Given Get test DataFile: WorkspaceFile1 with Data: TestCase1


  @Data
  Scenario: Scenario test data type
    Given Load data for test first
      | DataFile    | TestDataID  |
      | file1.excel | Test case 1 |
    When Load data second
      | DataFile    | TestDataID  |
      | file1.excel | Test case 1 |
      | file2.excel | Test case 2 |
    And Load data third
      | DataFile    | TestDataID  |
      | file1.excel | Test case 3 |
    And Load data fourth
      | DataFile    | TestDataID  |
      | file1.excel | Test case 4 |
    And Load data fifth
      | DataFile    | TestDataID  |
      | file1.excel | Test case 5 |
    And Load data sixth
      | DataFile    | TestDataID  |
      | file1.excel | Test case 6 |
