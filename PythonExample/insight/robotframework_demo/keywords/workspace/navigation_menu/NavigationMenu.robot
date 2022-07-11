*** Settings ***
Resource   ../../../resources/SystemLibraries.robot
Resource   ../../../resources/SystemVariables.robot
Resource   ../interaction_area/WorkCard.robot
Variables  NavigationMenuLocator.py



*** Keywords ***

Agent Click On Welcome Page Button
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_MENU_WELCOME_PAGE_BUTTON}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_MENU_WELCOME_PAGE_BUTTON}

Agent Click On SMS Button
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_MENU_SMS_BUTTON}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_MENU_SMS_BUTTON}

Agent Click On Customer Search Button
    [Documentation]  Click customer search on navigation menu to navigate to customer history search and smart search page
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_MENU_BTN_CUSTOMER_SEARCH}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_MENU_BTN_CUSTOMER_SEARCH}

#================================== HELP BUTTON ==========================================
Agent Click On Help Button
    [Documentation]  Click Help on navigation menu to open the Help page
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_MENU_BTN_HELP}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_MENU_BTN_HELP}

Agent Click Search Button on Help Page
    [Documentation]  Agent Click Search Button on Help Page
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_HELP_BTN_SEARCH}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_HELP_BTN_SEARCH}
    # Verify can open Help page successfully
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_HELP_TITLE}    timeout=30
    ${title_help_page} =  Get Text    ${LOC_WORKSPACE_NAVIGATION_HELP_TITLE}
    Should Be Equal     ${title_help_page}        Using Avaya Workspaces for AACC and ACCS
#
#Agent Search Something on Help Page
#    [Documentation]  Agent Search Some Thing on Help Page
#    [Arguments]    ${help_search}
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_HELP_INPUT_SEARCH}    timeout=30
#    Click Element    ${LOC_WORKSPACE_NAVIGATION_HELP_INPUT_SEARCH}
#    Input Text      ${LOC_WORKSPACE_NAVIGATION_HELP_INPUT_SEARCH}   Keyboard shortcuts
#    Click Element    ${LOC_WORKSPACE_NAVIGATION_HELP_BTN_SEARCH}
#
#    # Verify can search something successfully
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_HELP_SEARCH_HEADING}    timeout=30
#    ${search_heading_text} =    Get Text    ${LOC_WORKSPACE_NAVIGATION_HELP_SEARCH_HEADING}
#    Should Be Equal     ${search_heading_text}      'Search results for:' + ${help_search}

#================================== SETTINGS BUTTON ==========================================
Open Settings
    [Documentation]  Agent Click Settings Button
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_MENU_BTN_SETTINGS}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_MENU_BTN_SETTINGS}
    Sleep   1

Create Email Signature
    [Arguments]    ${email_signature}
    # open Email signature
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_SETTINGS_EMAIL_SIGNATURE}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_SETTINGS_EMAIL_SIGNATURE}
    # Clear old email signature
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}    timeout=30
    Input Text  ${LOC_WORKSPACE_NAVIGATION_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}    ${email_signature}
    Sleep   2
    # Save email signature
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_SETTINGS_EMAIL_SIGNATURE_BTN_SAVE}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_SETTINGS_EMAIL_SIGNATURE_BTN_SAVE}
    Sleep   1

#================================================ SCREENPOP BUTTON =====================================================
# 16/03/2020
Open Screenpop
    [Documentation]  Click screenpop on navigation menu to navigate to screenpop page
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_MENU_BTN_SCREENPOP}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_MENU_BTN_SCREENPOP}
    Sleep   1

#=================================================== CHAT BUTTON =======================================================
# 16/03/2020
Open Chat
    [Documentation]  Click screenpop on navigation menu to navigate to screenpop page
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_MENU_CHAT_BUTTON}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_MENU_CHAT_BUTTON}
    Sleep   1

#=================================================== EMAIL BUTTON ======================================================
# 16/03/2020
Open Email
    [Documentation]  Click screenpop on navigation menu to navigate to screenpop page
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_MENU_EMAIL_BUTTON}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_MENU_EMAIL_BUTTON}
    Sleep   1

#============================================ CUSTOMER DETAILS BUTTON ==================================================
# 17/03/2020
Open Customer Details
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_MENU_CUSTOMER_DETAILS}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_MENU_CUSTOMER_DETAILS}
    Sleep   1

Get Time Of Current Contact
    [Arguments]    ${contact_info}
    WorkCard.Agent Clicks On A Work Card   ${contact_info}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    Open Customer Details
    ${loc_date_curr_contact}=    String.Replace String    ${LOC_WORKSPACE_NAVIGATION_DATE_CURRENT_CONTACT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_date_curr_contact}     timeout=5
    ${date_curr_contact} =    Get Text    ${loc_date_curr_contact}
#    ${get_date} =    Get Substring     ${date_curr_contact}    0   7
#    ${get_time} =    Get Substring     ${date_curr_contact}    8   15
#    ${get_date_time} =    Convert To String    ${get_date} ${get_time}
    Log To Console   Date and Time of current Contact: ${date_curr_contact}     #${get_date_time}
    [Return]    ${date_curr_contact}    #${get_date_time}

#============================================ CUSTOMER SEARCH BUTTON ===================================================
# 17/07/2020
Open Customer Search
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_BTN_CUSTOMER_SEARCH}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_BTN_CUSTOMER_SEARCH}    action_chain=True
    Sleep   2

#===================================== MULTIMEDIA CONTACT SEARCH BUTTON ================================================
# 17/03/2021
Open Multimedia Contact Search
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_BTN_MULTIMEDIA_CONTACT_SEARCH}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_BTN_MULTIMEDIA_CONTACT_SEARCH}      action_chain=True
    Sleep   1

#=================================================== MY AGENT BUTTON ===================================================
# 13/08/2020
Open My Agent
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_MENU_MY_AGENT_BUTTON}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_MENU_MY_AGENT_BUTTON}
    Sleep   1

#============================================== CUSTOMER JOURNEY BUTTON ================================================
# 03/11/2020
Open Customer Journey
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_MENU_CUSTOMER_JOURNEY}    timeout=30
    Click Element    ${LOC_WORKSPACE_NAVIGATION_MENU_CUSTOMER_JOURNEY}
    Sleep   1

#==================================================== PHONEBOOK ========================================================
# 08/12/2020
Open Phonebook
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_MENU_PHONEBOOK}    timeout=20
    Click Element    ${LOC_WORKSPACE_NAVIGATION_MENU_PHONEBOOK}
    Sleep   1

#================================================== WEB STATICTIS ======================================================
# /12/2020
Open Web Statistic
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_MENU_WEB_STATISTIC}    timeout=20
    Click Element    ${LOC_WORKSPACE_NAVIGATION_MENU_WEB_STATISTIC}
    Sleep   0.5
    Wait Until Element Is Visible    ${LOC_WORKSPACE_NAVIGATION_LABEL_WEB_STATISTIC}    timeout=10
    Sleep   0.5

#=======================================================================================================================

Verify Current Contact Status
    [Arguments]    ${contact_info}   ${status_contact}
    WorkCard.Agent Clicks On A Work Card   ${contact_info}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    Open Customer Details
    ${loc_status_curr_contact}=    String.Replace String    ${LOC_WORKSPACE_NAVIGATION_STATUS_CURRENT_CONTACT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_status_curr_contact}     timeout=5
    ${status_curr_contact} =    Get Text    ${loc_status_curr_contact}
    Should Be Equal      ${status_curr_contact}     ${status_contact}
    Log To Console    Status of Current contact is Open
    Sleep   1

Verify Date and Time Previous Contact
    [Arguments]    ${contact_info}    ${date_time}
    WorkCard.Agent Clicks On A Work Card   ${contact_info}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    Open Customer Details
    ${loc_date_previous_contact}=    String.Replace String    ${LOC_WORKSPACE_NAVIGATION_DATE_PREVIOUS_CONTACT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_date_previous_contact}     timeout=5
    ${date_previous_contact} =    Get Text    ${loc_date_previous_contact}
#    ${get_date} =    Get Substring     ${date_previous_contact}    0   7
#    ${get_time} =    Get Substring     ${date_previous_contact}    8   15
#    ${get_date_time} =   Convert To String   ${get_date} ${get_time}
#    Should Be Equal      ${get_date_time}     ${date_time}
    Should Be Equal     ${date_previous_contact}    ${date_time}
    Log To Console   Date and Time of Previous Contact: ${date_previous_contact}    #${get_date_time}

Verify Previous Contact Status
    [Arguments]    ${contact_info}   ${status_contact}    ${date}=${EMPTY}
    WorkCard.Agent Clicks On A Work Card   ${contact_info}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    Open Customer Details
    ${loc_status_previous_contact}=    String.Replace String    ${LOC_WORKSPACE_NAVIGATION_STATUS_PREVIOUS_CONTACT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_status_previous_contact}     timeout=5
    ${status_previous_contact} =    Get Text    ${loc_status_previous_contact}
    Should Be Equal      ${status_previous_contact}     ${status_contact}
    Verify Date and Time Previous Contact    ${contact_info}    ${date}
    Log To Console    Status of Previous contact is Closed
    Sleep   1

#16/04/2020
Verify Contact Status
    [Arguments]    ${contact_info}   ${status_contact}   ${date}=${EMPTY}
    Run Keyword If   '${status_contact}'=='Open'    Verify Current Contact Status   ${contact_info}   ${status_contact}
    Run Keyword If   '${status_contact}'=='Closed'    Verify Previous Contact Status    ${contact_info}   ${status_contact}   ${date}

# 4/5/2020
Verify Transcript
    [Arguments]    ${contact_info}   @{chat_script}
    WorkCard.Agent Clicks On A Work Card   ${contact_info}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    Open Customer Details
    ${btn_open_case_detail_previous} =    String.Replace String    ${LOC_WORKSPACE_NAVIGATION_BTN_OPEN_CASE_DETAIL_PREVIOUS}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Click Element   ${btn_open_case_detail_previous}
    Sleep   1
    ${get_transcript_previous} =    Get Text    ${LOC_WORKSPACE_NAVIGATION_TRANSCRIPT_PREVIOUS}
#    Log To Console   ${get_transcript_previous}
    ${script_length}=    Get Length    ${chat_script}
    FOR     ${i}    IN RANGE    -1   ${script_length}
    \   Should Contain     ${get_transcript_previous}   @{chat_script}[${i}]
    \   Sleep   0.5
    Sleep   1

#   11/08/2020
Verify Previous Transcript
    [Arguments]    ${contact_info}   ${chat_from}    ${chat_content}
    WorkCard.Agent Clicks On A Work Card   ${contact_info}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    Open Customer Details
    ${btn_open_case_detail_previous} =    String.Replace String    ${LOC_WORKSPACE_NAVIGATION_BTN_OPEN_CASE_DETAIL_PREVIOUS}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait until Element Is Visible    ${btn_open_case_detail_previous}     timeout=5
    Click Element   ${btn_open_case_detail_previous}
    Sleep   1
#    Run Keyword If    '${chat_from}'=='Agent'     Verify Previous Transcript Of Agent     ${chat_content}
#    Run Keyword If    '${chat_from}'=='Customer'     Verify Previous Transcript Of Customer     ${chat_content}
    @{message_elements}=   Run keyword if     '${chat_from}'=='Agent'     Get WebElements     ${LOC_WORKSPACE_NAVIGATION_CHAT_FROM_AGENT}
    ...     ELSE    Get WebElements     ${LOC_WORKSPACE_NAVIGATION_CHAT_FROM_CUSTOMER}
    ${count_chat} =   Get Length  ${message_elements}
    FOR     ${i}    IN RANGE    0   ${count_chat}
    \   ${get_text_chat}=   Get Text    @{message_elements}[${i}]
    \   log to console      ******${i}********${get_text_chat}
    \   Run Keyword If    '${get_text_chat}'=='${chat_content}'    Exit For Loop
    \   Run Keyword Unless    '${get_text_chat}'=='${chat_content}' AND '${i}'=='${count_chat}'   Click Element   ${btn_open_case_detail_previous}
    \   Run Keyword Unless    '${get_text_chat}'=='${chat_content}' AND '${i}'=='${count_chat}'   Fail    Previous Transcript does not contant: ${chat_content}
    Click Element   ${btn_open_case_detail_previous}
    Sleep   1

Verify Previous Transcript Of Agent
    [Arguments]    ${chat_content}
    @{message_agent_elements}=    Get WebElements     ${LOC_WORKSPACE_NAVIGATION_CHAT_FROM_AGENT}
    ${count_agent_chat} =   Get Length  ${message_agent_elements}
    FOR     ${i}    IN RANGE    -1   ${count_agent_chat}
    \   ${get_text_chat}=   Get Text    @{message_agent_elements}[${i}]
    \   Run Keyword If    '${get_text_chat}'=='${chat_content}'    Exit For Loop
    \   Run Keyword Unless    '${get_text_chat}'=='${chat_content}' AND '${i}'=='${count_agent_chat}'   Fail    Previous Transcript does not contant: ${chat_content}
    Sleep   1

Verify Previous Transcript Of Customer
    [Arguments]    ${chat_content}
    @{message_cust_elements}=    Get WebElements     ${LOC_WORKSPACE_NAVIGATION_CHAT_FROM_CUSTOMER}
    ${count_cust_chat} =   Get Length  ${message_cust_elements}
    FOR     ${i}    IN RANGE    -1   ${count_cust_chat}
    \   ${get_text_chat}=   Get Text    @{message_cust_elements}[${i}]
    \   Run Keyword If    '${get_text_chat}'=='${chat_content}'    Exit For Loop
    \   Run Keyword Unless    '${get_text_chat}'=='${chat_content}' AND '${i}'=='${count_cust_chat}'   Fail    Previous Transcript does not contant: ${chat_content}
    Sleep   1



#
#    ${get_transcript_previous} =    Get Text    ${LOC_WORKSPACE_NAVIGATION_TRANSCRIPT_PREVIOUS}
##    Log To Console   ${get_transcript_previous}
#    ${script_length}=    Get Length    ${chat_script}
#    FOR     ${i}    IN RANGE    -1   ${script_length}
#    \   Should Contain     ${get_transcript_previous}   @{chat_script}[${i}]
#    \   Sleep   0.5
#    Sleep   1