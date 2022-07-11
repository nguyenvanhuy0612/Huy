*** Settings ***
Library     data_managementLib.py
Resource    ../../resources/SystemLibraries.robot

*** Variables ***


*** Keywords ***

#=======================================================================================================================
#Huy, date: May 6, 2021
#todo Verify
Verify Customer Email By Email
    [Documentation]    Open Data Management and verify customer email by search email
    [Arguments]    ${customer email}    ${expected email}
    Run Keyword And Ignore Error    Open Data Management
    Sleep    2
    @{search results}=    data_managementLib.Search Customer    ${customer email}    email
    Set Minimum
    Should Be Equal    ${search results}[1]  ${expected email}


#=======================================================================================================================
#Huy, date: May 6, 2021
Verify Customer Email By Contact ID
    [Documentation]    Open Data Management and verify customer email by search contact id
    [Arguments]    ${contacts id}    ${expected email}
    Run Keyword And Ignore Error    Open Data Management
    Sleep    2
    @{search results}=    data_managementLib.Search Customer    ${contacts id}    id
    Set Minimum
    Should Be Equal    ${search results}[1]  ${expected email}


#=======================================================================================================================
#Huy, date: May 6, 2021
Verify Customer Email By Phone
    [Documentation]    Open Data Management and verify customer email by search phone
    [Arguments]    ${phone}    ${expected email}
    Run Keyword And Ignore Error    Open Data Management
    Sleep    2
    @{search results}=    data_managementLib.Search Customer    ${phone}    phone
    Set Minimum
    Should Be Equal    ${search results}[1]  ${expected email}


#=======================================================================================================================
#Huy, date: May 6, 2021
Verify Customer Phone Number By Email
    [Documentation]    Open Data Management and verify customer phone by search email
    [Arguments]    ${customer email}    ${expected Phone}
    Run Keyword And Ignore Error    Open Data Management
    Sleep    2
    @{search results}=    data_managementLib.Search Customer    ${customer email}    email
    Set Minimum
    Should Be Equal    ${search results}[1]  ${expected Phone}


#=======================================================================================================================
#Huy, date: May 6, 2021
Verify Customer Phone Number By Contact ID
    [Documentation]    Open Data Management and verify customer phone by search contact id
    [Arguments]    ${contact id}    ${expected Phone}
    Run Keyword And Ignore Error    Open Data Management
    Sleep    2
    @{search results}=    data_managementLib.Search Customer    ${contact id}    id
    Set Minimum
    Should Be Equal    ${search results}[1]  ${expected Phone}


#=======================================================================================================================
#Huy, date: May 6, 2021
Verify Customer Phone Number By Phone
    [Documentation]    Open Data Management and verify customer phone by search phone
    [Arguments]    ${customer phone}    ${expected Phone}
    Run Keyword And Ignore Error    Open Data Management
    Sleep    2
    @{search results}=    data_managementLib.Search Customer    ${customer phone}    phone
    Set Minimum
    Should Be Equal    ${search results}[1]  ${expected Phone}


#=======================================================================================================================
#Huy, date: May 10, 2021
Verify Customer Contact ID By Email
    [Documentation]    Open Data Management and verify customer contact id by search email
    [Arguments]    ${customer email}    ${expected contact id}
    Run Keyword And Ignore Error    Open Data Management
    Sleep    2
    @{search results}=    data_managementLib.Search Customer    ${customer email}    email
    Set Minimum
    Should Be Equal    ${search results}[2]  ${expected contact id}


#=======================================================================================================================
#Huy, date: May 10, 2021
Verify Customer Contact ID By Contact ID
    [Documentation]    Open Data Management and verify customer contact id by search Contact ID
    [Arguments]    ${customer Contact ID}    ${expected contact id}
    Run Keyword And Ignore Error    Open Data Management
    Sleep    2
    @{search results}=    data_managementLib.Search Customer    ${customer Contact ID}    id
    Set Minimum
    Should Be Equal    ${search results}[2]  ${expected contact id}


#=======================================================================================================================
#Huy, date: May 10, 2021
Verify Customer Contact ID By Phone
    [Documentation]    Open Data Management and verify customer contact id by search Phone
    [Arguments]    ${customer phone}    ${expected contact id}
    Run Keyword And Ignore Error    Open Data Management
    Sleep    2
    @{search results}=    data_managementLib.Search Customer    ${customer phone}    phone
    Set Minimum
    Should Be Equal    ${search results}[2]  ${expected contact id}

#=======================================================================================================================
#Huy, date: May 10, 2021
Verify Customer Name By Email
    [Documentation]    Open Data Management and verify customer contact id by search email
    [Arguments]    ${customer email}    ${expected contact Name}
    Run Keyword And Ignore Error    Open Data Management
    Sleep    2
    @{search results}=    data_managementLib.Search Customer    ${customer email}    email
    Set Minimum
    Should Be Equal    ${search results}[0]  ${expected contact Name}


#=======================================================================================================================
#Huy, date: May 10, 2021
Verify Customer Name By Contact ID
    [Documentation]    Open Data Management and verify customer contact id by search Contact ID
    [Arguments]    ${customer Contact ID}    ${expected contact Name}
    Run Keyword And Ignore Error    Open Data Management
    Sleep    2
    @{search results}=    data_managementLib.Search Customer    ${customer Contact ID}    id
    Set Minimum
    Should Be Equal    ${search results}[0]  ${expected contact Name}


#=======================================================================================================================
#Huy, date: May 10, 2021
Verify Customer Name By Phone
    [Documentation]    Open Data Management and verify customer contact id by search Phone
    [Arguments]    ${customer phone}    ${expected contact Name}
    Run Keyword And Ignore Error    Open Data Management
    Sleep    2
    @{search results}=    data_managementLib.Search Customer    ${customer phone}    phone
    Set Minimum
    Should Be Equal    ${search results}[0]  ${expected contact Name}


#=======================================================================================================================
#Huy, date: May 6, 2021
#Todo delete
Delete Customer By Email
    [Documentation]    Open Data Management and delete customer with email
    [Arguments]    ${customer email}
    Run Keyword And Ignore Error    Open Data Management
    Sleep    2
    Delete Customer    ${customer email}    email



#=======================================================================================================================
#Huy, date: May 6, 2021
Delete Customer By Phone
    [Documentation]    Open Data Management and delete customer with phone
    [Arguments]    ${customer phone}
    Run Keyword And Ignore Error    Open Data Management
    Sleep    2
    Delete Customer    ${customer phone}    phone



#=======================================================================================================================
#Huy, date: May 6, 2021
Delete Customer By Contact ID
    [Documentation]    Open Data Management and delete customer with phone
    [Arguments]    ${customer contact id}
    Run Keyword And Ignore Error    Open Data Management
    Sleep    2
    Delete Customer    ${customer contact id}    id
    Sleep    2


#=======================================================================================================================
#Huy, date: May 6, 2021
Customer Should Be Not Found
    [Arguments]    ${customer verify info}     ${customer search}
    @{search results}=    data_managementLib.Search Customer    ${customer verify info}    phone
    Set Minimum
    Should Be Equal    ${search results}[1]      Not found email/phone with ${customer verify info}