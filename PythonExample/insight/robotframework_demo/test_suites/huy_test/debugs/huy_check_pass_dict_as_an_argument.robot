*** Settings ***
Documentation    https://stackoverflow.com/questions/54303252/how-to-pass-dictionary-as-an-argument-in-some-method-that-will-take-all-the-user
Library    Collections
Variables
Resource

*** Variables ***



*** Keywords ***
My Keyword That Works With Dictionaries
    Import Variables
    [Arguments]     &{dct}
    ${item1}=   Set Variable    ${dct}[key1]    #[key1]
    Log To Console    ${\n}This is item1 for key1 ${item1}

Add Participant
    [Arguments]  ${Number_of_users}  ${Participants}
    FOR  ${ELEMENT}  IN  @{Participants}
        log  element: ${Participants}[${ELEMENT}]
    END

Login test
    [Arguments]    &{dic}
    Log To Console    ${\n}${dic.key1}
    ${a}=   Set Variable    ${dic.key1}     #.key
    Log To Console    ${\n}${a}

*** Test Cases ***
Huy Test Case 2
    Import Variables
    Import Library
    Import Resource

    &{dict}=    Create Dictionary   key1=value1    key2=another value   key3=${EMPTY}
    Log To Console    ${\n}Key1 is ${dict.key1}
    Log To Console    Key3 is ${dict.key3}
    Login Test    &{dict}

# Dict
Test Case 1
    &{a dict}=  Create Dictionary     key1=value1    key2=another value
    My Keyword That Works With Dictionaries    &{a dict}

Example
    ${Participants}  Create Dictionary  user1="John"  user2="Jane"
    Add Participant  2  ${Participants}


# List
Nested container
    ${nested} =    Evaluate    [['a', 'b', 'c'], {'key': ['x', 'y']}]
    Log To Console    ${\n}
    Log Many    ${nested}[0]         # Logs 'a', 'b' and 'c'.
    Log Many    ${nested}[1][key]    # Logs 'x' and 'y'.

Slice
    ${items} =    Create List    first    second    third
    Log Many    ${items}[1:]         # Logs 'second' and  'third'.