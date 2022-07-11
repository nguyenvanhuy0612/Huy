*** Settings ***
#Resource   ../../../resources/SystemResources.robot
Variables        AgentToolbarLocator.py
Variables        ../login/LoginLocator.py
#Variables        AgentToolbarConstant.py
#Variables        ../login/LoginConstant.py
#Library          ../../base_module/BaseKeyword.py
#Library     BuiltIn
#Library     Calculator
#Library     Selenium2Library
#Library     subprocess  # library for open the application
#Library     os          # library for open the application
#Library     BuiltIn
#Library     Calculator
#Library     String
#Library     Collections
#Library     DateTime
#Library     OperatingSystem

Resource    ../../../resources/SystemVariables.robot
Resource    ../../../resources/SystemLibraries.robot


*** Keywords ***
# todo ============================ Right side of Agent toolbar ========================================================

Agent Start Work
#    Wait Until Element Is Visible    ${LOC_AGENT_STATE}    timeout=20s
    [Arguments]    ${check_agent_status}=True       ${check_icon_status}=True
    Wait Until Agent Status Changes To    Connected     timeout=60
    Wait Until Channel Icon Status Changes To    Logged Out
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    Sleep   3s
#    ${start_work_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_START_WORK}    timeout=30s
#    Sleep    1
#    Run Keyword If    '${start_work_status}'=='True'    Click Element    ${LOC_AGENT_TOOLBAR_BTN_START_WORK}    action_chain=True
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_START_WORK}    timeout=30s
    Sleep    1
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_START_WORK}    action_chain=True
    # Verify Workspaces starts work successfully
    Sleep    2
    Run Keyword If    ${check_agent_status}     Wait Until Agent Status Changes To    Not Ready     timeout=10
    Run Keyword If    ${check_icon_status}     Wait Until Channel Icon Status Changes To    Not Ready      timeout=60
#    Verify NRD


Agent Go Ready

#    ${home_dropdow_menu}=    Run Keyword And Return Status     Wait Until Element Is Visible    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}    timeout=30s
#    Run Keyword If    '${home_dropdow_menu}'=='True'    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
#    Sleep   1
#    ${go_ready_status}=    Run Keyword And Return Status     Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_READY}    timeout=30s
#    Run Keyword If    '${go_ready_status}'=='True'    Click Element    ${LOC_AGENT_TOOLBAR_BTN_READY}
#    # Close dropdown menu
#    Run Keyword If    '${go_ready_status}'=='False'    Double Click Element     ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
#    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    [Arguments]    ${timeout}=30s     ${check_agent_status}=True       ${check_icon_status}=True
    Open Dropdown Menu
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_READY}    timeout=${timeout}
    Sleep    1
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_READY}     action_chain=True
#    Wait Until Element Does Not Contain     ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}   NOT     ${TIMEOUT_MEDIUM}
#    ${get_status} =     Get Element Attribute    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}    title
#    Should Be Equal     ${get_status}   Ready
    Sleep   2
#    Verify Ready
    Run Keyword If    ${check_agent_status}     Wait Until Agent Status Changes To    Ready     timeout=${timeout}
    Run Keyword If    ${check_icon_status}     Wait Until Channel Icon Status Changes To    Ready      timeout=${timeout}
#    Sleep   2

Agent Go Not Ready
    [Arguments]     ${nrd_code}
    # Open menu contains state of agent
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    Sleep   1s
    ${go_not_ready_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_NOT_READY}    timeout=30s

    ${choose_nrd_code} =    String.Replace String   ${LOC_AGENT_TOOLBAR_BTN_NOT_READY_CODE}      ${NOT_READY_CODE}       ${nrd_code}
    # Click on Go Not Ready button
    Run Keyword If    '${go_not_ready_status}'=='True'    Run Keywords    Click Element    ${LOC_AGENT_TOOLBAR_BTN_NOT_READY}    AND
    # choose NRD code
    ...    Wait Until Element Is Visible    ${choose_nrd_code}    timeout=10s    AND
    ...    Click Element    ${choose_nrd_code}
    # Close dropdown menu
    Run Keyword If    '${go_not_ready_status}'=='False'    Double Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}      #${LOC_AGENT_TOOLBAR_BTN_DROP_DOWN_MENU}
    
    # Verify Workspaces goes not ready successfully
    Sleep    5s
    ${toolbar_state}=    Get Element Attribute  ${LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE}    title
    Should Be True    '${toolbar_state}'    Not Ready          #== '${AGENT_TOOLBAR_TXT_NOT_READY_STATE}'
    # Verify NRD Code Should Display Correctly
    Sleep   2


Agent Go ACW
    [Arguments]     ${acw}
    # Open menu contains state of agent
    Open Dropdown Menu
    sleep   1s
    ${go_acw_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_ACW}    timeout=20s

    ${choose_acw_code} =    String.Replace String   ${LOC_AGENT_TOOLBAR_BTN_ACW_CODE}      ${ACW_CODE}       ${acw}
    # Click on ACW code
    Run Keyword If    '${go_acw_status}'=='True'    Run Keywords    Click Element    ${LOC_AGENT_TOOLBAR_BTN_ACW}    AND
    # choose NRD code
    ...    Wait Until Element Is Visible    ${choose_acw_code}    timeout=10s    AND
    ...    Click Element    ${choose_acw_code}
    # Close dropdown menu
    Run Keyword If    '${go_acw_status}'=='False'    Double Click Element    ${LOC_AGENT_TOOLBAR_BTN_DROP_DOWN_MENU}

    # Verify Workspaces goes not ready successfully
    Sleep    3s
    ${toolbar_state}=    Get Element Attribute  ${LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE}    title
    Should Be True    '${toolbar_state}'       After Contact Work Pending       #== '${AGENT_TOOLBAR_TXT_NOT_READY_STATE}'
    Sleep   2

# Set Finish Work
Agent Finish Work
    # Open menu contains state of agent
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}    timeout=20s
#    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
#    sleep    2s
    [Arguments]    ${check_agent_status}=True       ${check_icon_status}=True
    Open Dropdown Menu
    # Click Finish Work button
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_FINISH_WORK}    timeout=20s
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_FINISH_WORK}   action_chain=True
    # Verify Workspaces finishes work successfully
    Sleep    4s
#    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE}    timeout=20s
#    ${toolbar_state}=    Get Element Attribute    ${LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE}    title
#    Should Be True    '${toolbar_state}'    Connected       #== '${AGENT_TOOLBAR_TXT_LOG_OUT_STATE}'
    Run Keyword If    ${check_agent_status}     Wait Until Agent Status Changes To    Connected     timeout=20
    Run Keyword If    ${check_icon_status}     Wait Until Channel Icon Status Changes To    Logged Out      timeout=60
#    Sleep   2

# Exit from Workspaces
Agent Exit
    # Open menu contains state of agent
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}    timeout=30s
#    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
#    sleep    1s
    Open Dropdown Menu
    # Click Exit button to exit Workspaces
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_EXIT}    timeout=30s
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_EXIT}  action_chain=True
    # Verify exit successfully
    Wait Until Page Contains Element    ${LOC_WORKSPACE_LABEL_SIGNIN}    180s
        # Verify login page
    ${str_sign_in} =    Get Text    ${LOC_WORKSPACE_LABEL_SIGNIN}
    Should Be Equal    ${str_sign_in}    Login Agent
    Sleep   1

# Click to open dropdown menu button
Open Dropdown Menu
    # Wait to see dropdown button appears
    Wait Until Element Is Visible    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}    timeout=30s
    # check find menu appears
    # ${menu} = 1: Found dropdown menu
    # ${menu} = 0: Not found dropdown menu
    ${menu}=	Get Element Count	${LOC_WORKSPACE_HOME_DROPDOWN_MENU_CONTAINER_VERIFY}
    # if not found dropdown menu, click to dropdown menu button
    Run Keyword If    '${menu}'== '0'    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}   action_chain=True
    # Verify dropdown menu appears
    Wait Until Element Is Visible    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU_CONTAINER_VERIFY}   15s
    Sleep    1

# Click to close dropdown menu button
Close Dropdown Menu
    # Wait to see dropdown button appears
    Wait Until Element Is Visible    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}    timeout=10s
    # check find menu appears
    # ${menu} = 1: Found dropdown menu
    # ${menu} = 0: Not found dropdown menu
    ${menu}=	Get Element Count	${LOC_WORKSPACE_HOME_DROPDOWN_MENU_CONTAINER_VERIFY}
    # if found dropdown menu, click to dropdown menu button
    Run Keyword If    '${menu}'== '1'    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}   action_chain=True
    # Verify dropdown menu disappears
    Wait Until Element Is Not Visible    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU_CONTAINER_VERIFY}   15s
    Sleep    1

# Check current agent state
Get Current Agent State
    [Arguments]    ${timeout}=5
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}   ${timeout}
    ${get_status} =     Get Element Attribute    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}    title
    [Return]    ${get_status}

# Wait for agent status
Wait Until Agent Status Changes To
    # Accept only ${expected agent status}: Connected , Not Ready , Ready   except [unknown, reconnection ...]
    # EX: Wait Until Agent Status Changes To    Connected
    # EX: Wait Until Agent Status Changes To    Not Ready   60
    [Arguments]    ${expected agent status}     ${timeout}=30
    ${loc state}=     String.Format String    ${LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE_VERIFY}     ${expected agent status}
    Wait Until Page Contains Element    ${loc state}    ${timeout}
    Sleep    1

Wait Until Channel Icon Status Changes To
    [Documentation]    wait util all channel change to expect status
    # expected_channel_status is one of : Logged Out, Not Ready, Ready, After Contact Work Pending, After Contact Work
    # Use: Wait Until Channel Icon Status Changes To    Logged Out
    # Use: Wait Until Channel Icon Status Changes To    Not Ready
    # Use: Wait Until Channel Icon Status Changes To    Ready   time=60
    [Arguments]    ${expected_channel_status}    ${timeout}=30s
    # location of icon state
    ${loc expected status}=     String.Format String    ${F_LOC_FOOTER_LIST_ICON_STATUS}     ${expected_channel_status}
    Wait Until Page Contains Element    ${LOC_FOOTER_LIST_ICON_COUNT}   ${timeout}
    # get number of icons
    Sleep    1
    ${time int}=    Convert Time    ${timeout}
    ${time int}=    Evaluate    int(${time int})
    ${is_equal}=    Set Variable    ${False}
    FOR    ${i}    IN RANGE    0    ${time int}
        ${numbers of icon}=  Get Element Count   ${LOC_FOOTER_LIST_ICON_COUNT}
        ${numbers of icon as expected status}=  Get Element Count    ${loc expected status}
        IF    '${numbers of icon as expected status}'=='${numbers of icon}'
            ${is_equal}=    Set Variable    ${True}
            Exit For Loop
        END
        Sleep    1
    END
    Run Keyword If    ${is_equal}==${False}     Fail    Icon did not change to as expected


# todo ============================ Left side of Agent toolbar =========================================================

Agent Create Email
    Import Variables    AgentToolbarLocator.py
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_CREATE_EMAIL}    timeout=30s
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_CREATE_EMAIL}
    Sleep   2

Agent Calls Out
    [Arguments]     ${call out number}
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_IPT_PHONE}    ${TIMEOUT_MEDIUM}
    Input Text    ${LOC_AGENT_TOOLBAR_IPT_PHONE}      ${call out number}
    Sleep   2
    Click Element    ${LOC_AGENT_TOOLBAR_IPT_PHONE}
    Sleep   1
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_BTN_CALL_OUT}    ${TIMEOUT_MEDIUM}
    Click Element   ${LOC_AGENT_TOOLBAR_BTN_CALL_OUT}
    Sleep   1

#    Click Element   ${LOC_AGENT_TOOLBAR_BTN_CALL_OUT}
#    Sleep   1

Agent Redial
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_BTN_REDIAL}    ${TIMEOUT_MEDIUM}
    Click Element   ${LOC_AGENT_TOOLBAR_BTN_REDIAL}
    Sleep   1

Agent Calls Supervisor
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_BTN_SUPERVISOR_CALL}    ${TIMEOUT_MEDIUM}
    Click Element   ${LOC_AGENT_TOOLBAR_BTN_SUPERVISOR_CALL}
    Sleep   1

# 13/03/2020
#Address Book Call Out
#    [Arguments]     ${agent}
#    # click button phonebook
#    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_BTN_PHONEBOOK}    ${TIMEOUT_MEDIUM}
#    Click Element   ${LOC_AGENT_TOOLBAR_BTN_PHONEBOOK}
#    Sleep   1
#    # search agent
##    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_IPT_PHONEBOOK_SEARCH}    ${TIMEOUT_MEDIUM}
##    Input Text   ${LOC_AGENT_TOOLBAR_IPT_PHONEBOOK_SEARCH}      ${agent}
##    Sleep   1
#    # choose agent then make call out
#    ${loc_choose_agent}=    String.Replace String    ${LOC_AGENT_TOOLBAR_PHONEBOOK_LIST}    ${AGENT_VAR}    ${agent}
#    Wait Until Page Contains Element    ${loc_choose_agent}    ${TIMEOUT_MEDIUM}
#    Click Element   ${loc_choose_agent}
#    Sleep   1
#    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_BTN_PHONEBOOK_CALL}    ${TIMEOUT_MEDIUM}
#    Click Element   ${LOC_AGENT_TOOLBAR_BTN_PHONEBOOK_CALL}
#    Sleep   1

Address Book Call Out
    [Arguments]     ${id}
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_BTN_PHONEBOOK}    ${TIMEOUT_MEDIUM}
    Click Element   ${LOC_AGENT_TOOLBAR_BTN_PHONEBOOK}
    Sleep   1
    ${loc_btn_call_agent} =    String.Replace String    ${LOC_AGENT_TOOLBAR_BTN_PHONEBOOK_CALL}   ${ID_AGENT}    ${id}
    Selenium2Library.Scroll Element Into View   ${loc_btn_call_agent}
    Wait Until Page Contains Element    ${loc_btn_call_agent}    ${TIMEOUT_MEDIUM}
    Set Focus To Element    ${loc_btn_call_agent}
    Click Element    ${loc_btn_call_agent}
    Sleep   1

Verify Start Work Page Should Display Full Name Of Agent
    [Documentation]    Verify Start Work page should display full name of Agent
    [Arguments]     ${agent_username}
    Wait Until Page Contains Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}    ${TIMEOUT_MEDIUM}
    ${str_lable_agent}=   Get Text    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    Should Be Equal    ${str_lable_agent}    ${agent_username}

Verify Menu Header Should Display Full Name Of Agent
    [Documentation]    Verify Menu Header should display full name of Agent
    [Arguments]     ${agent_username}
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    sleep    2s
    Wait Until Page Contains Element    ${LOC_WORKSPACE_HOME_MENU_HEADER}    ${TIMEOUT_MEDIUM}
    ${str_lable_agent}=   Get Text    ${LOC_WORKSPACE_HOME_MENU_HEADER}
    Should Be Equal    ${str_lable_agent}    ${agent_username}
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    sleep    2s

Verify Agent ID
    [Documentation]    Verify Agent ID Of Agent Should Display Correctly
    [Arguments]     ${agent_ID}
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_CARD_AGENT_ID}    ${TIMEOUT_MEDIUM}
    ${agent_ID_on_page}=   Get Text    ${LOC_AGENT_TOOLBAR_CARD_AGENT_ID}
    Should Be Equal    ${agent_ID_on_page}    ${agent_ID}

Verify Station ID
    [Documentation]    Verify Station ID Of Agent Should Display Correctly
    [Arguments]     ${station_ID}
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_CARD_STATION_ID}    ${TIMEOUT_MEDIUM}
    ${station_ID_on_page}=   Get Text    ${LOC_AGENT_TOOLBAR_CARD_STATION_ID}
    Should Be Equal    ${station_ID_on_page}    ${station_ID}

#   04/03/2020
Verify Ready
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}    ${TIMEOUT_MEDIUM}
    Sleep    5
    ${title_footer} =   Get Element Attribute    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}   title
    Should Be Equal     ${title_footer}     Ready

#   07/04/2020
Verify NRD Without RC
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}    ${TIMEOUT_MEDIUM}
    ${title_footer} =   Get Element Attribute    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}   title
    Should Be Equal     ${title_footer}     Not Ready

#   04/03/2020
Verify NRD With RC
    [Documentation]    Verify NRD Code Should Display Correctly
    [Arguments]     ${nrd_code}

    # get text of title_nrd_code
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_TITLE_NRD_CODE}    ${TIMEOUT_MEDIUM}
    ${title_nrd_code} =     Get Text    ${LOC_AGENT_TOOLBAR_TITLE_NRD_CODE}
    # get length of code
    ${len_nfr_code} =   Get Length     ${nrd_code}
    ${len_title_nfr_code} =   Get Length     ${title_nrd_code}
    # position of code
    ${locate} =      Evaluate   ${len_title_nfr_code}-${len_nfr_code}
    ${cut_title_nrd_code} =     Get Substring   ${title_nrd_code}   ${locate}
    ${upper_cut_title_nrd_code} =     String.Convert To Upper Case    ${cut_title_nrd_code}
    ${upper_nrd_code} =     String.convert to upper case    ${nrd_code}
    Should Be Equal          ${upper_cut_title_nrd_code}   ${upper_nrd_code}

Verify Not Ready
    [Arguments]     ${nrd_code}=${EMPTY}
    ${workcard_id} =    Run keyword if   '${nrd_code}'=='${EMPTY}'    Verify NRD Without RC
    ...     ELSE    Verify NRD With RC    ${nrd_code}

#   05/03/2020
Verify ACW
    [Documentation]    Verify ACW Code Should Display Correctly
    [Arguments]     ${acw}
    # get text of title_nrd_code
    ${title_acw_code} =     Get Text    ${LOC_AGENT_TOOLBAR_TITLE_NRD_CODE}
    # get length of code
    ${len_acw_code} =   Get Length     ${acw}
    ${len_title_acw_code} =   Get Length     ${title_acw_code}
    # position of code
    ${locate} =      Evaluate   ${len_title_acw_code}-${len_acw_code}
    ${cut_title_acw_code} =     Get Substring   ${title_acw_code}   ${locate}
    ${upper_cut_title_acw_code} =     String.Convert To Upper case    ${cut_title_acw_code}
    ${upper_acw_code} =     String.Convert To Upper case    ${acw}
    Should Be Equal          ${upper_cut_title_acw_code}   ${upper_acw_code}

#   04/03/2020
Verify Pending NRD
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}    ${TIMEOUT_MEDIUM}
    ${title_footer} =   Get Element Attribute    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}   title
    Should Be Equal     ${title_footer}     Not Ready Pending

#   05/03/2020
Verify Pending ACW
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}    ${TIMEOUT_MEDIUM}
    ${title_footer} =   Get Element Attribute    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}   title
    Should Be Equal     ${title_footer}     After Contact Work Pending

#   18/03/2020
Verify Reset Timer
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_TIMER}    ${TIMEOUT_MEDIUM}
    ${get_timer} =   Get Text    ${LOC_AGENT_TOOLBAR_TIMER}
    # get minute
    ${get_minute} =    Get Substring    ${get_timer}      1     3
    Should Be Equal     ${get_minute}   00
    Log To Console      The Minute is reset 00
    # get second
    ${get_second} =    Get Substring    ${get_timer}      4     6
    ${convert_second} =      Convert To Integer     ${get_second}
    ${compare_second} =     Evaluate    ${convert_second} < 10
    ${convert_string_second} =  Convert To String   ${compare_second}
    Should Be Equal     ${convert_string_second}   True
    Log To Console      The Second is reset 00

Verify Start Work Page
    Wait Until Element Is Visible    ${LOC_BTN_START_WORK}    timeout=60s
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    sleep   3s
    ${start_work_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_START_WORK}    timeout=20s
    Run Keyword If    '${start_work_status}'=='True'    Log To console   Agent finished work
    ...   ELSE   Fail   Agent did not finish work
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    Sleep    1

#Verify Agent Finished Work
#    Sleep    4s
#    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE}    timeout=30s
#    ${toolbar_state}=    Get Element Attribute    ${LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE}    title
#    Should Be True    '${toolbar_state}'    Connected       #== '${AGENT_TOOLBAR_TXT_LOG_OUT_STATE}'
#    Sleep   2


Verify Missed Contact Is Not Showed On Interaction Log
    [Documentation]    Verify Missed Contact Is Not Showed On Interaction Log
    [Arguments]    ${contact_info}
    [Teardown]    Run Keywords     Click Element At Coordinates    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}    0    0    AND    Sleep    0.5s
    Click Element     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}
    Sleep    0.5s
    @{contacts}=    Get WebElements    ${LOC_AGENT_TOOLBAR_TABLE_INTERACTION_LOG_TAB_ALL_LIST_MISSED_CONTACTS}
    FOR     ${contact}   IN    @{contacts}
        ${wc_title}=    Get Element Attribute    ${contact}    title
        Run Keyword If    '${wc_title}'=='${contact_info}'    Fail    Missed contact ${contact_info} is showed on interaction log
    END

# 4/5/2020
Verify Missed Contact
    [Documentation]    Verify Missed Contact Is Showed On Interaction Log
    [Arguments]    ${contact_info}       ${skillset}    ${contact_type}
    [Teardown]    Run Keywords     Click Element At Coordinates    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}    0    0    AND    Sleep    1s
    Click Element     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}
    Sleep    1
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_MISSED}
    ${last_contact_type_missed} =   Get Element Attribute   ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_CONTACT_TYPE_MISSED}   aria-label
    Run Keyword If   '${contact_type}'== 'Webchat'    Should Be Equal    ${last_contact_type_missed}    Missed Chat
    Log To Console   Missed contact type is ${contact_type}
    ${info_last_contact_missed} =    Get Element Attribute   ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_CONTACT_MISSED}   title
    ${skillset_last_contact_missed} =   Get Text     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_SKILL_CONTACT_MISSED}
    Should Be Equal     ${info_last_contact_missed}    ${contact_info}
#    Should Be Equal     ${skillset_last_contact_missed}    ${skillset}
    Log To Console   Missed contact ${contact_info} is showed on interaction log with Skillset ${skillset}

# 4/5/2020
Verify Inbound Contact
    [Documentation]    Verify Missed Contact Is Showed On Interaction Log
    [Arguments]    ${contact_info}       ${skillset}    ${contact_type}
    [Teardown]    Run Keywords     Click Element At Coordinates    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}    0    0    AND    Sleep    1s
    Click Element     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}
    Sleep    1
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_INBOUND}
    ${last_contact_type_inbound} =   Get Element Attribute   ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_CONTACT_TYPE_INBOUND}   aria-label
    Run Keyword If   '${contact_type}'== 'Webchat'    Should Be Equal    ${last_contact_type_inbound}    Incoming Chat
    Log To Console   Inbound contact type is ${contact_type}
    ${info_last_contact_inbound} =    Get Element Attribute   ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_CONTACT_INBOUND}   title
    ${skillset_last_contact_inbound} =   Get Text     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_SKILL_CONTACT_INBOUND}
    Should Be Equal     ${info_last_contact_inbound}    ${contact_info}
#    Should Be Equal     ${skillset_last_contact_missed}    ${skillset}
    Log To Console   Inbound contact ${contact_info} is showed on interaction log with Skillset ${skillset}



#Verify Missed Contact
#    [Documentation]    Verify Missed Contact Is Showed On Interaction Log
#    [Arguments]    ${contact_info}
#    [Teardown]    Run Keywords     Click Element At Coordinates    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}    0    0    AND    Sleep    1s
#    Click Element     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}
#    Sleep    1
#
#    @{contacts}=    Get WebElements    ${LOC_AGENT_TOOLBAR_TABLE_INTERACTION_LOG_TAB_ALL_LIST_MISSED_CONTACTS}
#    :FOR     ${contact}   IN    @{contacts}
#    \    ${wc_title}=    Get Element Attribute    ${contact}    title
#    \    Return From Keyword If    '${wc_title}'=='${contact_info}'
#    Fail    Missed contact ${contact_info} is not showed on interaction log


# Author: Phuc Hoang
# Created Date: 09-Nov-18
Verify Incoming Contact Is Not Showed On Interaction Log
    [Documentation]    Verify Incoming Contact Is Not Showed On Interaction Log
    [Arguments]    ${contact_info}
    [Teardown]    Run Keywords     Click Element At Coordinates    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}    0    0    AND    Sleep    0.5s 
    Click Element     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}
    Sleep    0.5s
    @{contacts}=    Get WebElements    ${LOC_AGENT_TOOLBAR_TABLE_INTERACTION_LOG_TAB_ALL_LIST_INCOMING_CONTACTS}
    FOR     ${contact}   IN    @{contacts}
        ${wc_title}=    Get Element Attribute    ${contact}    title
        Run Keyword If    '${wc_title}'=='${contact_info}'    Fail    Incoming contact ${contact_info} is showed on interaction log
    END

Verify Incoming Contact Is Showed On Interaction Log
    [Documentation]    Verify Incoming Contact Is Showed On Interaction Log
    [Arguments]    ${contact_info}
    [Teardown]    Run Keywords     Click Element At Coordinates    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}    0    0    AND    Sleep    0.5s
    Click Element     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}
    Sleep    0.5s
    @{contacts}=    Get WebElements    ${LOC_AGENT_TOOLBAR_TABLE_INTERACTION_LOG_TAB_ALL_LIST_INCOMING_CONTACTS}
    FOR     ${contact}   IN    @{contacts}
        ${wc_title}=    Get Element Attribute    ${contact}    title
        Return From Keyword If    '${wc_title}'=='${contact_info}'
    END
    Fail    Incoming contact ${contact_info} is not showed on interaction log


# Author: Huy
# Created Date: 29-Mar-2021
Verify Toast Message contains
    [Arguments]    ${expected message}
    Wait Until Element Is Visible    ${LOC_TOAST_MESSAGE}   timeout=5s
    ${Text Message}=    Get Text    ${LOC_TOAST_MESSAGE}
    Should Contain    ${Text Message}   ${expected message}      ignore_case=True

Verify Toast Message Display
    [Arguments]    ${expected message}
    Wait Until Element Is Visible    ${LOC_TOAST_MESSAGE}   timeout=5s
    ${Text Message}=    Get Text    ${LOC_TOAST_MESSAGE}
    Should Be Equal    ${Text Message}   ${expected message}
