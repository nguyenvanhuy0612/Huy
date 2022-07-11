*** Settings ***
Resource    DataManagement.robot

*** Keywords ***
email by email
    [Documentation]    Open Data Management and verify customer email by search email
    [Arguments]    ${customer email}    ${expected email}
    Open Data Management
    Sleep    2
    @{search results}=    Search Customer    ${customer email}    email
    Set Window Minimum
    Should Be Equal    ${search results}[1]  ${expected email}


*** Test Cases ***
Test 1
    email by email      email1    Not found email/phone with email1