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
    And Load data List Map
      | DataFile    | TestDataID  |
      | file1.excel | Test case 3 |
      | file2.excel | Test case 4 |
      | file3.excel | Test case 5 |
      | file4.excel | Test case 6 |
    And Load data Map
      | DataFile   | file1.excel |
      | TestDataID | Test case 4 |
      | Name       | Test name   |
    And Load data fifth
      | DataFile   | file1.excel | file2.excel | file3.excel |
      | TestDataID | Test case 5 | Test case 6 | Test case 7 |
    And Load data sixth
      |      | lat       | lon         |
      | KMSY | 29.993333 | -90.258056  |
      | KSFO | 37.618889 | -122.375000 |
      | KSEA | 47.448889 | -122.309444 |
      | KJFK | 40.639722 | -73.778889  |
    And Load data for list String
      | file1.excel |
      | file2.excel |
      | file3.excel |
