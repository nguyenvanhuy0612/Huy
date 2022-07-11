*** Settings ***
Library     BaseKeyword.py
Resource    ../../resources/SystemLibraries.robot
Library     String
Library     Collections
Library     DateTime


*** Variables ***
# Variable to verify time format hh:mm:ss am/pm
${REGREX_TIME_WITH_NO_SECOND_12H}    ^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9] (AM|PM)$
${REGREX_TIME_WITH_NO_SECOND_24H}    ^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$
${REGREX_TIME_WITH_SECOND}    ^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$
${REGREX_TIME_WITH_SECOND_12H}    ^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9] (AM|PM)$

*** Keywords ***
Select Item In List
    [Documentation]    Select item in list
    [Arguments]    ${locator_of_list}    ${item_name}
    @{items}=     Get WebElements    ${locator_of_list}
    :FOR    ${item}    IN    @{items}
    \    ${name}=    Get Text     ${item}
    \    Run Keyword If    '${name}'=='${item_name}'     Run Keywords     Click Element    ${item}    AND    Exit For Loop


# Author: Phuc Hoang
# Created date: 4-Oct-2018
# Argument:
#    ${number_of_messages}: number of random strings. Ex: 100
#....${length_of_string}: length of string. Refer document of kw Generate Random String
#    ${type_of_string}: Refer document of kw Generate Random String
Create List Of Random Strings
    [Documentation]    Crete list of random string
    [Arguments]    ${number_of_messages}    ${length_of_string}=8    ${type_of_string}=[LETTERS][NUMBERS]
    ${random_message}=    Generate Random String    ${length_of_string}    ${type_of_string}
    @{list}=   Create List    ${random_message}

    FOR   ${index}    IN RANGE    0    ${number_of_messages}-1
            ${random_message}=    Generate Random String
            Append To List    ${list}    ${random_message}
        [Return]    @{List}
    END


# Author: hnguyenphuc
# Created date: 10-Oct-2018
# Argument:
#    ${time}: time with format hh:mm:ss a. 10:20:30 AM
# Return:
#    ${time}: time without second. Ex  10:20 AM
Remove Second In Time
    [Documentation]    Remove second in time
    [Arguments]    ${time}
    @{texts}=    Get Regexp Matches    ${time}    ${REGREX_TIME_WITH_NO_SECOND_24H}
    ${length_2}=    Get Length    ${texts}
    ${input_format}=   Run Keyword If    ${length_2}>0    Set Variable    %H:%M

    @{texts}=    Get Regexp Matches    ${time}    ${REGREX_TIME_WITH_NO_SECOND_12H}
    ${length_1}=    Get Length    ${texts}
    # In case there is no second in time
    ${input_format}=   Run Keyword If    ${length_1}>0    Set Variable    %I:%M %p
    ...                            ELSE    Set Variable    ${input_format}

    ${continue}=    Run Keyword If    ${length_1}>0    Set Variable    True
    ...                        ELSE    Set Variable    False
    ${continue}=    Run Keyword If    ${length_2}>0    Set Variable    True
    ...                         ELSE    Set Variable    ${continue}
        
    ${output_format}=    Set Variable    %I:%M %p
    ${time_without_second}=    Run Keyword If    '${continue}'=='True'    BaseKeyword.Format Time    ${time}    ${input_format}     ${output_format}
    
    Return From Keyword If    '${continue}'=='True'    ${time_without_second}

    # In case there is second in time
    @{texts}=    Get Regexp Matches    ${time}    ${REGREX_TIME_WITH_SECOND_12H}
    ${length}=    Get Length    ${texts}    
    ${input_format}=    Run Keyword If    '${length}'=='0'    Set Variable    %H:%M:%S
    ...                            ELSE    Set Variable    %I:%M:%S %p
    ${output_format}=    Run Keyword If    '${length}'=='0'    Set Variable    %H:%M
    ...                            ELSE    Set Variable    %I:%M %p
    ${time_without_second}=    BaseKeyword.Format Time    ${time}    ${input_format}     ${output_format}
    [Return]     ${time_without_second}


# Author: hnguyenphuc
# Created date: 03-Dec-2018
# [Arguments]
#       ${time}: time with format  01:00 PM, 13:00, 1:00:20 PM, 13:00:20
Convert Time To Seconds
    [Documentation]    Convert time to second
    [Arguments]    ${time}
    @{texts}=    Get Regexp Matches    ${time}    ${REGREX_TIME_WITH_NO_SECOND_12H}
    ${length}=    Get Length    ${texts}
    # In case there is no second in time
    ${input_format}=   Run Keyword If    ${length}>0    Set Variable    %I:%M %p
    ${new_time}=    Run Keyword If    ${length}>0    BaseKeyword.Format Time    ${time}    ${input_format}    %H:%M:%S
    Run Keyword And Return If    ${length}>0    Convert Time    ${new_time}
    
    @{texts}=    Get Regexp Matches    ${time}    ${REGREX_TIME_WITH_SECOND_12H}
    ${length}=    Get Length    ${texts}    
    ${input_format}=    Run Keyword If    ${length}>0    Set Variable    %I:%M:%S %p
    ${new_time}=    Run Keyword If    ${length}>0    BaseKeyword.Format Time    ${time}    ${input_format}    %H:%M:%S
    Run Keyword And Return If    ${length}>0    Convert Time    ${new_time}
    
    @{texts}=    Get Regexp Matches    ${time}    ${REGREX_TIME_WITH_NO_SECOND_24H}
    ${length}=    Get Length    ${texts}
    ${input_format}=   Run Keyword If    ${length}>0    Set Variable    %H:%M
    ${new_time}=    Run Keyword If    ${length}>0    BaseKeyword.Format Time    ${time}    ${input_format}    %H:%M:%S
    Run Keyword And Return If    ${length}>0    Convert Time    ${new_time}

    ${seconds}=    Convert Time    ${time}
    [Return]    ${seconds}

# Author: hnguyenphuc
# [Arguments]
#       ${time1}:  time with format  01:00 PM, 13:00, 1:00:20 PM, 13:00:20
#       ${time2}:  time with format  01:00 PM, 13:00, 1:00:20 PM, 13:00:20
#       ${extend_time}: ${time1} - ${time2} <=  ${extend_time}
Verify 2 Times
    [Arguments]     ${time1}    ${time2}    ${extend_time}=0
    ${second1}=    Convert Time To Seconds    ${time1}
    ${second2}=    Convert Time To Seconds    ${time2}
    ${extend_time}=    Evaluate    ${extend_time}
    ${t}=    Evaluate    abs(${second1}-${second2})
    ${result}=    Run Keyword And Return If    ${t}==${extend_time}    Set Variable    True
    ...    ELSE    Set Variable    False
    ${result}=    Run Keyword And Return If    ${t}<${extend_time}    Set Variable    True
    ...    ELSE    Set Variable    ${result}
    should be equal     ${result}    True


# Created by: lcntuan
# Created date: 27-Nov-2018
# Argument:
#    ${test_step}: For example: 'STEP 01'
#    ${test_step_content}: For example: 'STEP 01 Content'
TEST CASE HAS RUN INTO STEP
    [Documentation]    Test Case has run into step
    [Arguments]    ${test_step}    ${test_step_content}
    ${log_content}=    Set Variable    ${test_step} : ${test_step_content}
    Log to Console    \n${log_content}\n

# todo================================================================================================================
# Huy
# 15/6/2021