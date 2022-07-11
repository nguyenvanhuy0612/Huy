*** Settings ***
Resource   ../../../resources/SystemLibraries.robot
Resource   ../../../resources/SystemVariables.robot
Variables    MultimediaContactSearchLocator.py


*** Keywords ***
# todo Multimedia Contact Search Page ==================================================================================
# ====================================    Search by field    ===========================================================
Search By
    [Documentation]    Click to seach by box and select
    [Arguments]    ${search by}     ${parameter1}       ${parameter2}=None
    ${check}=   Evaluate    '${search by}' in ['Skillset', 'Status', 'Subject', 'Closed Reason', 'Channel', 'Disposition Code', 'Mail To', 'Mail From', 'Arrival Date', 'Last Action', 'Agent', 'ID', 'Closed Date']
    Run Keyword Unless    ${check}    Fail    ${search by} not found
    # select search by
    Wait Until Element Is Visible    ${LOC_BTN_SEARCH_BY}    10s
    Click Element    ${LOC_BTN_SEARCH_BY}
    ${loc search by}=    String.Format String    ${F_LOC_ITEM_SEARCH_BY}    ${search by}
    Click Element    ${loc search by}

    # input text search
    ${check}=   Evaluate    '${search by}' in ['ID', 'Subject', 'Mail To', 'Mail From']
    Run Keyword If    ${check}      Input Search With Parameter     ${search by}     ${parameter1}

    # select data time with 2 pamameters: [issue]
    ${check}=   Evaluate    '${search by}' in ['Closed Date', 'Arrival Date']
    Run Keyword If    ${check}      Select Search With Two Parameter     ${parameter1}       ${parameter2}

    # select 1 parameter
    ${check}=   Evaluate    '${search by}' in ['Skillset', 'Status', 'Closed Reason', 'Channel', 'Disposition Code', 'Last Action', 'Agent']
    Run Keyword If    ${check}     Select Search With One Parameter     ${parameter1}


# ====================================    Search Parameter field    ====================================================
Select Search With Two Parameter
    [Documentation]    Select Search Parameter in next step
    [Arguments]    ${parameter1}        ${parameter2}
    Set Selenium Speed    0.3
    Set Selenium Timeout    10
    ${loc form date}=   String.Format String    ${F_LOC_INPUT_SEARCH_DATE}      From
    ${loc to date}=   String.Format String    ${F_LOC_INPUT_SEARCH_DATE}      To
    Wait Until Element Is Visible    ${loc form date}
    Input Text    ${loc form date}      ${parameter1}
    Wait Until Element Is Visible    ${loc to date}
    Input Text    ${loc to date}      ${parameter1}
    Sleep    1


Input Search With Parameter
    [Documentation]    Select Search Parameter in next step
    [Arguments]    ${search by}     ${parameter}
    ${loc input}=   String.Format String    ${F_LOC_INPUT_SEARCH_PARAMETER}        ${search by}
    Wait Until Element Is Visible     ${loc input}      10s
    Sleep    1
    Input Text    ${loc input}      ${parameter}


Select Search With One Parameter
    [Documentation]    Select Search Parameter in next step
    [Arguments]    ${parameter}
    Click Element      ${LOC_BTN_SEARCH_PARAMETER}
    Sleep    0.5
    ${loc parameter}=    String.Format String   ${F_LOC_ITEM_SEARCH_PARAMETER}      ${parameter}
    @{list}=  Get Webelements    ${loc parameter}
    FOR    ${item}    IN    @{list}
        ${text}=    Get Text    ${item}
        ${text}=  Evaluate    '${text}'.strip()
        IF    '${text}' == '${parameter}'
            ${loc parameter}=   Set Variable    ${item}
            Exit For Loop
        END
    END
    Click Element      ${loc parameter}


# ====================================    Search Results field    ======================================================
Get Table Result In Line
    [Arguments]    ${line number}
    ${loc line number}=     String.Format String    ${F_LOC_LINE_NUMBER}    ${line number}
    Wait Until Element Is Visible       ${loc line number}      10s
    @{loc datas}=    Get Webelements    ${loc line number}/td
    @{list}=    Create List
    FOR    ${loc data}      IN      @{loc datas}
        ${text}=    Get Element Attribute    ${loc data}    title
        Append To List    ${list}   ${text}
    END
    [Return]    @{list}


Select Contact In Line
    [Arguments]    ${line}
    Set Selenium Speed    0.3
    ${loc line number}=     String.Format String    ${F_LOC_LINE_NUMBER}    ${line}
    Wait Until Element Is Visible       ${loc line number}      10s
    ${loc checkbox}=    Set Variable    ${loc line number}/td[1]//div
    Click Element    ${loc checkbox}
    Sleep    0.5

Click Close Selected Contacts
    Set Selenium Speed    0.3
    Wait Until Element Is Enabled    ${LOC_BTN_CLOSE_CONTACTS}      10s
    Scroll Element Into View    ${LOC_BTN_CLOSE_CONTACTS}
    Click Element    ${LOC_BTN_CLOSE_CONTACTS}

Select Close Reason Code With Agent Note In Prompt
    [Arguments]    ${reason_code}=${EMPTY}    ${agent_note}=${EMPTY}
    Set Selenium Speed    0.3
    IF    '${reason_code}'
        Wait Until Element Is Visible    ${LOC_BTN_CLOSE_REASON_CODE}   10s
        Click Element    ${LOC_BTN_CLOSE_REASON_CODE}
        Sleep    0.5
        ${loc reason code}=     String.Format String    ${F_REASON_CODE}    ${reason_code}
        Wait Until Element Is Visible    ${loc reason code}
        Click Element    ${loc reason code}     action_chain=True
        Sleep    1
    END
    IF    '${agent_note}'
        Wait Until Element Is Visible    ${LOC_AGENT_NOTE}   5s
        Input Text    ${LOC_AGENT_NOTE}      ${agent_note}
    END
    Wait Until Element Is Enabled    ${LOC_BTN_CLOSE}    10s
    Scroll Element Into View    ${LOC_BTN_CLOSE}
    Click Element    ${LOC_BTN_CLOSE}   action_chain=True





# ====================================    Add / remove parameter field    ==============================================
Click Add More Search Parameter
    Wait Until Element Is Enabled    ${LOC_BTN_ADD_MORE_PARAMETER}      10s
    Click Element    ${LOC_BTN_ADD_MORE_PARAMETER}


Click Remove Search Parameter
    Wait Until Element Is Enabled    ${LOC_BTN_REMOTE_PARAMETER}      10s
    Click Element    ${LOC_BTN_REMOTE_PARAMETER}


# ====================================    Search button field    =======================================================
Click Search Button
    Wait Until Element Is Enabled    ${LOC_BTN_SEARCH}      10s
    Click Element    ${LOC_BTN_SEARCH}


# todo Verify ==========================================================================================================
Verify Multimedia Contact Search Not Display for Voice Only Agent
    Page Should Not Contain Element    ${LOC_MULTIMEDIA_CONTACT_SEARCH}     Page not contain    ${LOC_MULTIMEDIA_CONTACT_SEARCH}
    Sleep    1

