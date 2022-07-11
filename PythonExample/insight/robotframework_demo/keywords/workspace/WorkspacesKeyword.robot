*** Settings ***
Variables        WorkspacesLocator.py
Library    String

*** Variables ***
@{filter2_list}     0   1    2    Display Name    Last Name    First Name    Phone   Call Out   Mobile   9   IP Phone   10    Other Phone   11    Email    Department    Street   City    State    PostalCode

*** Keywords ***

########################################################################################################################
#   ==========================================  AGENT TOOLBAR KEYWORDS =================================================
########################################################################################################################

Agent Start Work
    Wait Until Element Is Visible    ${LOC_AGENT_STATE}    timeout=20s
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    Sleep   3s
    ${start_work_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_START_WORK}    timeout=30s
    Run Keyword If    '${start_work_status}'=='True'    Click Element    ${LOC_AGENT_TOOLBAR_BTN_START_WORK}
    # Verify Workspaces starts work successfully
    Sleep    10s

Agent Go Ready

#    ${home_dropdow_menu}=    Run Keyword And Return Status     Wait Until Element Is Visible    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}    timeout=30s
#    Run Keyword If    '${home_dropdow_menu}'=='True'    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
#    Sleep   1
#    ${go_ready_status}=    Run Keyword And Return Status     Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_READY}    timeout=30s
#    Run Keyword If    '${go_ready_status}'=='True'    Click Element    ${LOC_AGENT_TOOLBAR_BTN_READY}
#    # Close dropdown menu
#    Run Keyword If    '${go_ready_status}'=='False'    Double Click Element     ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    Sleep   2
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_READY}    timeout=30s
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_READY}
    Sleep    3
    ${get_status} =     Get Element Attribute    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}    title
    Should Be Equal     ${get_status}   Ready
    Sleep   1

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
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
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

Agent Finish Work
    # Open menu contains state of agent
    Wait Until Element Is Visible    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}    timeout=20s
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    sleep    2s
    # Click Finish Work button
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_FINISH_WORK}    timeout=20s
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_FINISH_WORK}
    # Verify Workspaces finishes work successfully
    Sleep    4s
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE}    timeout=20s
    ${toolbar_state}=    Get Element Attribute    ${LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE}    title
    Should Be True    '${toolbar_state}'    Connected       #== '${AGENT_TOOLBAR_TXT_LOG_OUT_STATE}'
    Sleep   2

Agent Exit
    # Open menu contains state of agent
    Wait Until Element Is Visible    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}    timeout=30s
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    sleep    1s
    # Click Exit button to exit Workspaces
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_EXIT}    timeout=30s
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_EXIT}
    # Verify exit successfully
    Wait Until Page Contains Element    ${LOC_WORKSPACE_LABEL_SIGNIN}    180s
        # Verify login page
    ${str_sign_in} =    Get Text    ${LOC_WORKSPACE_LABEL_SIGNIN}
    Should Be Equal    ${str_sign_in}    Login Agent
    Sleep   1

Agent Create Email
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_CREATE_EMAIL}    timeout=30s
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_CREATE_EMAIL}
    Sleep   2

Agent Calls Out
    [Arguments]     ${call_out}
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_IPT_PHONE}    ${TIMEOUT_MEDIUM}
    Input Text    ${LOC_AGENT_TOOLBAR_IPT_PHONE}      ${call_out}
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
    [Arguments]     ${agent_username}
    Wait Until Page Contains Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}    ${TIMEOUT_MEDIUM}
    ${str_lable_agent}=   Get Text    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    Should Be Equal    ${str_lable_agent}    ${agent_username}

Verify Menu Header Should Display Full Name Of Agent
    [Arguments]     ${agent_username}
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    sleep    2s
    Wait Until Page Contains Element    ${LOC_WORKSPACE_HOME_MENU_HEADER}    ${TIMEOUT_MEDIUM}
    ${str_lable_agent}=   Get Text    ${LOC_WORKSPACE_HOME_MENU_HEADER}
    Should Be Equal    ${str_lable_agent}    ${agent_username}
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    sleep    2s

Verify Agent ID
    [Arguments]     ${agent_ID}
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_CARD_AGENT_ID}    ${TIMEOUT_MEDIUM}
    ${agent_ID_on_page}=   Get Text    ${LOC_AGENT_TOOLBAR_CARD_AGENT_ID}
    Should Be Equal    ${agent_ID_on_page}    ${agent_ID}

Verify Station ID
    [Arguments]     ${station_ID}
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_CARD_STATION_ID}    ${TIMEOUT_MEDIUM}
    ${station_ID_on_page}=   Get Text    ${LOC_AGENT_TOOLBAR_CARD_STATION_ID}
    Should Be Equal    ${station_ID_on_page}    ${station_ID}

#   04/03/2020
Verify Ready
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}    ${TIMEOUT_MEDIUM}
    ${title_footer} =   Get Element Attribute    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}   title
    Should Be Equal     ${title_footer}     Ready

#   07/04/2020
Verify NRD Without RC
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}    ${TIMEOUT_MEDIUM}
    ${title_footer} =   Get Element Attribute    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}   title
    Should Be Equal     ${title_footer}     Not Ready

#   04/03/2020
Verify NRD With RC
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
    ${upper_cut_title_nrd_code} =     Convert To Uppercase    ${cut_title_nrd_code}
    ${upper_nrd_code} =     Convert To Uppercase    ${nrd_code}
    Should Be Equal          ${upper_cut_title_nrd_code}   ${upper_nrd_code}

Verify Not Ready
    [Arguments]     ${nrd_code}=${EMPTY}
    ${workcard_id} =    Run keyword if   '${nrd_code}'=='${EMPTY}'    Verify NRD Without RC
    ...     ELSE    Verify NRD With RC    ${nrd_code}

#   05/03/2020
Verify ACW
    [Arguments]     ${acw}
    # get text of title_nrd_code
    ${title_acw_code} =     Get Text    ${LOC_AGENT_TOOLBAR_TITLE_NRD_CODE}
    # get length of code
    ${len_acw_code} =   Get Length     ${acw}
    ${len_title_acw_code} =   Get Length     ${title_acw_code}
    # position of code
    ${locate} =      Evaluate   ${len_title_acw_code}-${len_acw_code}
    ${cut_title_acw_code} =     Get Substring   ${title_acw_code}   ${locate}
    ${upper_cut_title_acw_code} =     Convert To Uppercase    ${cut_title_acw_code}
    ${upper_acw_code} =     Convert To Uppercase    ${acw}
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
    ${compare_second} =     Evaluate    ${convert_second} < 8
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

Verify Missed Contact Is Not Showed On Interaction Log
    [Arguments]    ${contact_info}
    [Teardown]    Run Keywords     Click Element At Coordinates    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}    0    0    AND    Sleep    0.5s
    Click Element     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}
    Sleep    0.5s
    @{contacts}=    Get WebElements    ${LOC_AGENT_TOOLBAR_TABLE_INTERACTION_LOG_TAB_ALL_LIST_MISSED_CONTACTS}
    :FOR     ${contact}   IN    @{contacts}
    \    ${wc_title}=    Get Element Attribute    ${contact}    title
    \    Run Keyword If    '${wc_title}'=='${contact_info}'    Fail    Missed contact ${contact_info} is showed on interaction log

# 4/5/2020
Verify Missed Contact
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

########################################################################################################################
#   =========================================  CUSTOMER DETAILS KEYWORDS ===============================================
########################################################################################################################

# 17/03/2020
Verify Customer Details
    [Arguments]    ${cust_email}
    # get workcard ID
    ${workcard_id} =    WorkCard.Get WorkCard ID    ${cust_email}
    Sleep   1
    # get Email
    ${loc_line_email}=    String.Replace String    ${LOC_CUSTOMER_DETAIL_LINE_EMAIL}     ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_line_email}    timeout=30
    ${loc_email} =    Get Text    ${loc_line_email}
    Should Be Equal    ${loc_email}    ${cust_email}
    Sleep   1
    # click More Information
    ${loc_btn_more}=    String.Replace String    ${LOC_CUSTOMER_DETAIL_BTN_MORE_INFO}     ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_btn_more}    timeout=30
    Click Element   ${loc_btn_more}
    Sleep   1
    Wait Until Element Is Visible    ${loc_line_email}    timeout=30
    ${loc_email} =    Get Text    ${loc_line_email}
    Should Be Equal    ${loc_email}    ${cust_email}
    Sleep   1

# 17/03/2020
Verify Have No Customer Details
    [Arguments]    ${cust_email}
    # get workcard ID
    ${workcard_id} =    WorkCard.Get WorkCard ID    ${cust_email}
    Log To Console      Workcard ID = ${workcard_id}
    Sleep   1
    # get Email
    ${loc_line_email}=    String.Replace String    ${LOC_CUSTOMER_DETAIL_LINE_EMAIL}     ${WORKCARD_ID_VAR}    ${workcard_id}
    Log To Console  ${loc_line_email}
    Wait Until Page Does Not Contain    ${loc_line_email}   timeout=10
    Log To Console      Have No Customer Details For This Contact
    Sleep   1

# ================================================ INTERACTION DETAILS =================================================
#Verify Interaction Details
#    [Arguments]    ${contact_type}  ${agent_id}  ${station_id}    ${contact_info}  ${skillset}     ${uri}  ${phone}
#    # verify contact type
#    Wait Until Element Is Visible    ${LOC_CUSTOMER_DETAIL_WIDGET_CONTENT}    timeout=30
#    Click Element   ${LOC_CUSTOMER_DETAIL_WIDGET_CONTENT}
#    Sleep   1
#    Wait Until Element Is Visible    ${LOC_CUSTOMER_DETAIL_CHANEL_TYPE}    timeout=30
#    ${channel_type} =   Get Text    ${LOC_CUSTOMER_DETAIL_CHANEL_TYPE}
#    Should Be Equal      ${channel_type}    ${contact_type}
#    # verify service
#    Wait Until Element Is Visible    ${LOC_CUSTOMER_DETAIL_SERVICE}    timeout=30
#    ${service} =   Get Text    ${LOC_CUSTOMER_DETAIL_SERVICE}
#    Should Be Equal      ${service}    ${skillset}
#    # verify oriiginal address
#    Wait Until Element Is Visible    ${LOC_CUSTOMER_DETAIL_ORIGINAL_ADDRESS}    timeout=30
#    ${original_address} =   Get Text    ${LOC_CUSTOMER_DETAIL_ORIGINAL_ADDRESS}
#    Should Be Equal      ${original_address}    ${uri}
#    # verify Destination address (voice)
#    Wait Until Element Is Visible    ${LOC_CUSTOMER_DETAIL_DESTINATION}    timeout=30
#    ${destination_address} =   Get Text    ${LOC_CUSTOMER_DETAIL_DESTINATION}
#    Should Be Equal      ${destination_address}    ${phone}
#    # verify contact ID
#    ${workcard_id} =    WorkCard.Get WorkCard ID    ${contact_info}
#    ${contact_id} =     Get Text    ${LOC_CUSTOMER_DETAIL_CONTACT_ID}
#    Run Keywork If  '${channel_type}' == 'Voice'      Should Be True    '${workcard_id}' == '${station_id}V${contact_id}'
#        ...     ELSE    Should Be True    '${workcard_id}' == '${agent_id}M${contact_id}'

# =================================================== INTRINSICS =======================================================
# 18/03/2020
Verify Intrinsics
    [Arguments]    ${contact_info}      ${cdn_uri}      ${cdn}      ${station_id}    ${cust_dn}   ${skillset}
    Open Customer Details
    Sleep   1
    Selenium2Library.Scroll Element Into View    ${LOC_CUSTOMER_DETAIL_CONTACT_ID}
    Wait Until Element Is Visible    ${LOC_CUSTOMER_DETAIL_CONTACT_ID}    timeout=30
    Set Focus To Element    ${LOC_CUSTOMER_DETAIL_CONTACT_ID}
    ${workcard_id} =    WorkCard.Get WorkCard ID    ${contact_info}
    ${len_workcard} =   Get Length     ${workcard_id}
    ${convert_count} =      Convert To Integer     ${len_workcard}
    ${x} =     Evaluate    ${convert_count}-8
    ${get_contact_id} =    Get Substring    ${workcard_id}      ${x}     ${len_workcard}
    ${loc_intrinsic_name} =    String.Replace String    ${LOC_CUSTOMER_DETAIL_INTRINSIC_NAME}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${loc_intrinsic_value} =    String.Replace String    ${LOC_CUSTOMER_DETAIL_INTRINSIC_VALUE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    @{list_intrinsic_name}=    Get WebElements     ${loc_intrinsic_name}
    @{list_intrinsic_value}=    Get WebElements     ${loc_intrinsic_value}
    ${length_list_intrinsic_name}=    Get Length    ${list_intrinsic_name}
    FOR      ${i}    IN RANGE    -1   ${length_list_intrinsic_name}
    \   Selenium2Library.Scroll Element Into View    @{list_intrinsic_name}[${i}]
    \   ${name_of_intrinsic} =     Get Text    @{list_intrinsic_name}[${i}]
    \   ${value_of_intrinsic} =     Get Text    @{list_intrinsic_value}[${i}]
    \   Run Keyword If    '${name_of_intrinsic}' == 'Channel Type:'    Run Keywords    Should Be Equal   ${value_of_intrinsic}    Voice     AND    Log to console    Channel Type: Voice
    \   Run Keyword If    '${name_of_intrinsic}' == 'ProviderContactID:'    Run Keywords    Should Be Equal   ${value_of_intrinsic}    ${get_contact_id}    AND    Log to console    ProviderContactID: ${value_of_intrinsic}
    \   Run Keyword If    '${name_of_intrinsic}' == 'ContactType:'    Run Keywords   Should Be Equal   ${value_of_intrinsic}    10000   AND    Log to console    ContactType: 10000
    \   Run Keyword If    '${name_of_intrinsic}' == 'SIP_REQUEST_URI:'    Run Keywords    Should Be Equal   ${value_of_intrinsic}    ${cdn_uri}   AND   Log to console    SIP_REQUEST_URI: ${cdn_uri}
    \   Run Keyword If    '${name_of_intrinsic}' == 'SIP_TO_ADDRESS:'    Run Keywords    Should Be Equal   ${value_of_intrinsic}    ${cdn_uri}   AND    Log to console    SIP_TO_ADDRESS: ${cdn_uri}
    \   Run Keyword If    '${name_of_intrinsic}' == 'SIP_DIALED_DN:'    Run Keywords    Should Be Equal   ${value_of_intrinsic}    ${cdn}   AND    Log to console    SIP_DIALED_DN: ${cdn}
    \   Run Keyword If    '${name_of_intrinsic}' == 'AD_CDN:'    Run Keywords   Should Be Equal   ${value_of_intrinsic}    ${cdn}   AND    Log to console    AD_CDN: ${cdn}
    \   Run Keyword If    '${name_of_intrinsic}' == 'SIP_FROM_ADDRESS:'    Run Keywords   Should Be Equal   sip:${value_of_intrinsic}    ${contact_info}   AND    Log to console    SIP_FROM_ADDRESS: ${contact_info}
    \   Run Keyword If    '${name_of_intrinsic}' == 'AD_CLID:'    Run Keywords    Should Be Equal   ${value_of_intrinsic}    ${cust_dn}   AND   Log to console    AD_CLID: ${cust_dn}
    \   Run Keyword If    '${name_of_intrinsic}' == 'CALLED_NUMBER:'    Run Keywords    Should Be Equal   ${value_of_intrinsic}    ${cust_dn}   AND    Log to console    CALLED_NUMBER: ${station_id}

########################################################################################################################
#   ========================================  CUSTOMER JOURNEY KEYWORDS ================================================
########################################################################################################################

# 10/11/2020
Show Previous Touchpoint
    [Arguments]    ${contact_info}     ${contact_type}   ${content_status}

    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_journey_touchpoint}=    String.Replace String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5

    ${get_contact_type} =    set variable if    '${contact_type}'=='WC'    'CH'    '${contact_type}'=='EM'    'EM'   '${contact_type}'=='Voice'    'VO'
    ${loc_touchpoint}=    String.Format String    ${loc_journey_touchpoint}    ${get_contact_type}
    Sleep   0.5
    @{touchpoint_elements}=    Get WebElements     ${loc_touchpoint}
    ${touchpoint_total}=    Get Length    ${touchpoint_elements}
    ${previous_touchpoint} =    evaluate    ${touchpoint_total}-2
    ${current_touchpoint} =    evaluate    ${touchpoint_total}-1
    Mouse Up    @{touchpoint_elements}[${current_touchpoint}]
    Selenium2Library.Scroll Element Into View    @{touchpoint_elements}[${previous_touchpoint}]
    Click element   @{touchpoint_elements}[${previous_touchpoint}]
    Sleep   0.5
    # verify interaction
    #   tooltip timeline
    ${loc_timeline} =      String.Replace String    ${LOC_CUSTOMER_JOURNEY_TOOLTIP_TIMELINE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${get_text_timeline} =     Get text    ${loc_timeline}
    Should contain     ${get_text_timeline}    ${content_status}
    Sleep   0.5

# 11/11/2020
Show Current Touchpoint
    [Arguments]    ${contact_info}   ${contact_type}   ${content_status}

    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    log to console   id=${workcard_id}
    ${loc_journey_touchpoint}=    String.Replace String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5

    ${get_contact_type} =    set variable if    '${contact_type}'=='WC'    'CH'    '${contact_type}'=='EM'    'EM'   '${contact_type}'=='Voice'    'VO'
    ${loc_touchpoint}=    String.Format String    ${loc_journey_touchpoint}    ${get_contact_type}
    Sleep   0.5
    @{touchpoint_elements}=    Get WebElements     ${loc_touchpoint}
    ${touchpoint_total} =    Get Length    ${touchpoint_elements}
    ${current_touchpoint} =    evaluate    ${touchpoint_total}-1
    Wait Until Element Is Visible    @{touchpoint_elements}[${current_touchpoint}]    timeout=5
    Click element   @{touchpoint_elements}[${current_touchpoint}]
    Sleep   1
    # verify interaction
    #   tooltip timeline
    ${loc_transcript_btn} =      String.Replace String    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5
    Run keyword unless    ${get_contact_type}=='VO'     Selenium2Library.Scroll Element Into View   ${loc_transcript_btn}
    ${loc_timeline} =      String.Replace String    ${LOC_CUSTOMER_JOURNEY_TOOLTIP_TIMELINE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${get_text_timeline} =     Get text    ${loc_timeline}
    Should contain     ${get_text_timeline}    ${content_status}
    Sleep   0.5

# 10/11/2020
Verify Touchpoint Transcript
    [Arguments]     ${content}
    Selenium2Library.Scroll Element Into View    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_BTN}
    Click Element   ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_BTN}
    Sleep   1
    ${get_content} =    Get text    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_CONTENT}
    Log to console    ${get_content}
    Should contain     ${get_content}   ${content}
    Sleep   0.5
    Wait Until Element Is Visible    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_CLOSE_BTN}    timeout=5
    Click element   ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_CLOSE_BTN}
    Sleep   0.5

# 18/11/2020
Verify Attachment In Transcript
    [Arguments]     ${attach_name}
    Selenium2Library.Scroll Element Into View    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_BTN}
    Click Element   ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_BTN}
    Sleep   1
    Selenium2Library.Scroll Element Into View    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_ATTACHMENT}
    ${get_attachment} =     Get text    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_ATTACHMENT}
    Log to console  Attachment: ${get_attachment}
    Should contain     ${get_attachment}   ${attach_name}
    Sleep   0.5
    Wait Until Element Is Visible    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_CLOSE_BTN}    timeout=5
    Click element   ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_CLOSE_BTN}
    Sleep   0.5

# 11/11/2020
Verify Touchpoint Tooltip
    [Arguments]    ${contact_info}   ${contact_type}    ${content}=${EMPTY}

    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_journey_touchpoint}=    String.Replace String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5

    NavigationMenu.Open Customer Details
    ${loc_customerID}=    String.Replace String    ${LOC_CUSTOMER_JOURNEY_GET_CUSTOMER_ID}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5
    Selenium2Library.Scroll Element Into View    ${loc_customerID}
    ${get_customer_id} =     Get text    ${loc_customerID}
    Sleep   0.5
    NavigationMenu.Open Customer Journey
    ${get_contact_type} =    set variable if    '${contact_type}'=='WC'    'CH'    '${contact_type}'=='EM'    'EM'   '${contact_type}'=='Voice'    'VO'
    ${loc_touchpoint}=    String.Format String    ${loc_journey_touchpoint}    ${get_contact_type}
    Sleep   0.5
    @{touchpoint_elements}=    Get WebElements     ${loc_touchpoint}
    ${touchpoint_total} =    Get Length    ${touchpoint_elements}
    ${current_touchpoint} =    evaluate    ${touchpoint_total}-1
    # move Mouse to this Tooltip
    Wait Until Element Is Visible    @{touchpoint_elements}[${current_touchpoint}]    timeout=5
    Mouse Up   @{touchpoint_elements}[${current_touchpoint}]
    Sleep   0.5
    # verify Customer ID
    ${get_tooltip_touchpoint} =     Get text     ${LOC_CUSTOMER_JOURNEY_TOOLTIP_TOUCHPOINT}
    Run keyword unless    ${get_contact_type}=='VO'    Should contain     ${get_tooltip_touchpoint}   ${get_customer_id}
    Run keyword unless    ${get_contact_type}=='${EMPTY}'    Should contain     ${get_tooltip_touchpoint}   ${content}
    Sleep   0.5

# 3/12/2020
Select Time Range Touchpoint
    [Arguments]    ${time_range}
    Wait Until Element Is Visible    ${LOC_CUSTOMER_JOURNEY_TIME_RANGE_SELECTION}   timeout=5
    Click Element   ${LOC_CUSTOMER_JOURNEY_TIME_RANGE_SELECTION}
    ${loc_time_range} =    String.Format String    ${LOC_CUSTOMER_JOURNEY_TIME_RANGE_OPTION}    ${time_range}
    Wait Until Element Is Visible    ${loc_time_range}   timeout=5
    Click Element   ${loc_time_range}

########################################################################################################################
#   =====================================  CUSTOMER HISTORY SEARCH KEYWORDS ============================================
########################################################################################################################

Search Customer
    [Arguments]    ${search_by}   ${content_search}
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_SELECT_SEARCH}     20
    Click Element   ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_SELECT_SEARCH}
    Sleep   0.5
    # choose search by
    ${loc_search_by} =   String.Replace String    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_SELECT_SEARCH_BY}    ${VALUE_SEARCH_BY}    ${search_by}
    Wait Until Element Is Visible    ${loc_search_by}     20
    Click Element    ${loc_search_by}
    Sleep   0.5
    Run Keyword If    '${search_by}'=='Date'    Search By Date
    ...     ELSE    Search By Email Subject Address     ${content_search}
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_SEARCH}     20
    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_SEARCH}
    Sleep   1

Search By Email Subject Address
    [Arguments]    ${content_search}
    # input content search
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_SEARCH_FIELD}     20
    Input text   ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_SEARCH_FIELD}   ${content_search}
    Sleep   1

Search By Date
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_FROM_DATE}     20
    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_FROM_DATE}
    Sleep   1
    Press Keys   ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_FROM_DATE}   RETURN
    Sleep   1
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_TO_DATE}     20
    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_TO_DATE}
    Sleep   1
    Press Keys   ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_TO_DATE}   RETURN
    Sleep   1

Verify Customer Search
    [Arguments]    ${contact_type}   ${a}=${EMPTY}   ${b}=${EMPTY}   ${c}=${EMPTY}    ${d}=${EMPTY}
#    [Arguments]    EM   ${from}   ${to}   ${subject}    ${content}
#    [Arguments]    WC   ${from}   ${customer_name}   ${chat_from}   ${content}
    Run keyword if   '${contact_type}'=='EM'    Verify Email Search     ${a}   ${b}   ${c}  ${d}
    ...    ELSE IF   '${contact_type}'=='WC'    Verify Webchat Search     ${a}   ${b}   ${c}  ${d}


Verify Email Search
    [Arguments]    ${from}   ${to}   ${subject}    ${content}
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_BTN_SHOW_FIRST_DETAIL}     20
    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_BTN_SHOW_FIRST_DETAIL}
    Sleep   0.5
    # verify Email from
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_FROM}     20
    ${loc_from} =    Get Element Attribute   ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_FROM}     aria-label
    Should be equal     ${loc_from}   ${from}
    Sleep   0.5
    # verify Email to
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_TO}     20
    ${loc_to} =    Get Element Attribute   ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_TO}     aria-label
    Should be equal     ${loc_to}   ${to}
    Sleep   0.5
    # verify Email Subject
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_SUBJECT}     20
    ${loc_subject} =    Get Text   ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_SUBJECT}
    Should contain     ${loc_subject}   ${subject}
    Sleep   1
    # verify content Email search
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_CONTENT_LINE}    timeout=20s
    @{content_element}=    Get WebElements     ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_CONTENT_LINE}
    ${content_total}=    Get Length    ${content_element}
    FOR     ${i}    IN RANGE    -1   ${content_total}
    \   ${content_line} =  Get Text    ${content_element}[${i}]
    \   ${check} =   Run Keyword And Return Status    Should contain    ${content_line}   ${content}
    \   Run Keyword If  '${check}'=='True'   Run keywords   Log to console   Content Email display correctly   AND   Exit For Loop
    Sleep   1


Verify Webchat Search
    [Arguments]    ${from}   ${customer_name}   ${chat_from}   ${chat_content}
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_BTN_SHOW_FIRST_DETAIL}     20
    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_BTN_SHOW_FIRST_DETAIL}
    Sleep   0.5
    # verify Email from
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_FROM}     20
    ${loc_from} =    Get Element Attribute   ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_FROM}     aria-label
    Should be equal     ${loc_from}   ${from}
    Sleep   0.5
    # verify Customer name
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_NAME}     20
    ${loc_name} =    Get Element Attribute   ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_NAME}     aria-label
    Should be equal     ${loc_name}   ${customer_name}
    Sleep   0.5

    # verify content chat search
    @{message_elements}=   Run keyword if     '${chat_from}'=='Agent'     Get WebElements     ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_CHAT_FROM_AGENT}
    ...     ELSE    Get WebElements     ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_CHAT_FROM_CUSTOMER}
    ${count_chat} =   Get Length  ${message_elements}
    log to console      ******count_chat********${count_chat}
    ${end} =    evaluate    ${count_chat}-1
    FOR     ${i}    IN RANGE    0   ${count_chat}
    \   Selenium2Library.Scroll Element Into View    @{message_elements}[${i}]
    \   ${get_text_chat}=   Get Text    @{message_elements}[${i}]
    \   log to console      ******${i}********${get_text_chat}+++++++++++++++++++++++++++++${chat_content}
    \   Run keyword if     "${chat_content}" in "${get_text_chat}"   Exit for loop
    \   Run keyword if    "${i}"=="${end}"   Fail     Transcript does not contain: ${chat_content}

    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_SEARCH}
    Sleep   1

########################################################################################################################
#   ===========================================  WIDGET EMAIL KEYWORDS =================================================
########################################################################################################################

Agent Replies Email
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_REPLY_EMAIL}    timeout=60s
    Click Element    ${LOC_WIDGETEMAIL_BTN_REPLY_EMAIL}
    Sleep   1

Agent Replies All Email
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_REPLY_ALL_EMAIL}    timeout=30s
    Click Element    ${LOC_WIDGETEMAIL_BTN_REPLY_ALL_EMAIL}
    Sleep   1

Agent Sends Email
   [Arguments]    ${cust_email}    ${subject_email}     ${content_email}    ${skillset}=${EMPTY}
    Run Keyword If   '${skillset}'=='${EMPTY}'   Reply Email    ${cust_email}     ${content_email}
    Run Keyword Unless    '${skillset}'=='${EMPTY}'     Send Out Email    ${cust_email}    ${subject_email}     ${content_email}    ${skillset}
    Sleep   1

#   19/5/2020
Complete Send Email
    [Arguments]    ${button}    ${contact_info}=${EMPTY}
    ${btn_complete} =   Convert To Upper Case   ${button}
    Run Keyword If   '${contact_info}'=='${EMPTY}'   Click Element   ${LOC_WIDGETEMAIL_WORKCARD}
    ${workcard_id} =    Run Keyword If    '${contact_info}'=='${EMPTY}'     Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${send_btn} =   String.Replace String    ${LOC_WIDGETEMAIL_BTN_SEND_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${cancel_btn} =     String.Replace String    ${LOC_WIDGETEMAIL_BTN_CANCEL_SEND_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Run Keyword if   '${btn_complete}'=='SEND'    Click Element    ${send_btn}
    Run Keyword if   '${btn_complete}'=='CANCEL'    Click Element    ${cancel_btn}
    Sleep   1

Send Out Email
    [Arguments]    ${cust_email}    ${subject_email}     ${content_email}    ${skillset}
    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}
    Sleep   1
    ${workcard_id} =    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ${loc_field_to} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_TO}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Choose Email Skillset   ${skillset}
    # input Field To
    Wait Until Element Is Visible    ${loc_field_to}    timeout=30s
    Click Element   ${loc_field_to}
    Input Text    ${loc_field_to}    ${cust_email}
    Sleep   1
    # input subject Email
    ${loc_subject_email} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_SUBJECT_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_subject_email}    timeout=30s
    Input Text    ${loc_subject_email}    ${subject_email}
    Sleep   1
    # input content Email
    ${loc_content_email} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL1}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_content_email}    timeout=30s
    Input Text    ${loc_content_email}    ${content_email}
    Sleep   1

Choose Email Skillset
    [Arguments]    ${skillset}
    Wait Until Element Is Visible   ${LOC_WIDGETEMAIL_BTN_CHOOSE_SKILLSET}   timeout=60s
    Click Element   ${LOC_WIDGETEMAIL_BTN_CHOOSE_SKILLSET}
    Sleep   1
    @{list_skillset} =    Get WebElements   ${LOC_WIDGETEMAIL_BTN_CHOOSE_SKILLSET_LIST}
    @{loc_list_skillset} =  Get WebElements   ${LOC_WIDGETEMAIL_BTN_CHOOSE_SKILLSET_LIST_ELEMENT}
    ${length_list_skillset} =    Get Length   ${list_skillset}
    :FOR    ${i}    IN RANGE    0   ${length_list_skillset}
    \   ${get_text_skillset} =   Get Text    ${list_skillset}[${i}]
    \   Run Keyword If   '${get_text_skillset}'=='${skillset}'    Click Element     ${loc_list_skillset}[${i}]
    \   Run Keyword If   '${get_text_skillset}'=='${skillset}'     Exit For Loop
    Sleep   1

Reply Email
    [Arguments]    ${cust_email}     ${content_email}
    ${contact_info} =   Fetch From Left    ${cust_email}   ;
    ${check_email} =    Run Keyword And Return Status   Should Contain    ${cust_email}  ;
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    # input To field if having more emails
    ${loc_input_to}=    String.Replace String    ${LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_TO}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_input_to}    timeout=30s
    Run Keyword If    '${check_email}'=="True"   Click Element   ${loc_input_to}
    Run Keyword If    '${check_email}'=="True"   Input Text    ${loc_input_to}    ${cust_email}
    Sleep   2
    #   INPUT CONTENT EMAIL
    ${loc_input_content} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${loc_input_content_plain} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_PLAIN}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${check_plain_text} =    Run Keyword And Return Status    Element Should Be Visible    ${loc_input_content}
    Run Keyword if   '${check_plain_text}'=='True'   Press Keys    ${loc_input_content}    ${content_email}
    ...     ELSE    Press Keys    ${loc_input_content_plain}    ${content_email}
    Sleep   1

# 22/5/2020
Reply By Suggestion
    [Arguments]    ${contact_info}    ${suggest_name}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_search_suggest} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_SEARCH_SUGGEST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_search_suggest}    timeout=20s
    Input Text   ${loc_search_suggest}   ${suggest_name}
    ${loc_choose_suggest} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CHOOSE_SUGGEST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible      ${loc_choose_suggest}    timeout=20s
    Click Element   ${loc_choose_suggest}
    Sleep   1

# 21/5/2020
Input CC Email
    [Arguments]    ${cust_email}    ${contact_info}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_field_cc} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_CC}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_field_cc}    timeout=20s
    Click Element   ${loc_field_cc}
    Input Text    ${loc_field_cc}    ${cust_email}
    Sleep   1

Insert Attachment
    [Arguments]    ${contact_info}=${EMPTY}    ${file_attach}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_insert_btn} =   String.Replace String    ${LOC_WIDGETEMAIL_BTN_ATTACH_FILE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    # Click Attach file button
    Wait Until Element Is Visible    ${loc_insert_btn}    timeout=20s
    Click Element    ${loc_insert_btn}
    Sleep   2
    # Click Select file attach button
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_SELECT_FILE_ATTACH}    timeout=20s
    Click Element    ${LOC_WIDGETEMAIL_BTN_SELECT_FILE_ATTACH}
    Sleep   1
    WidgetEmailLocator.attach_file      ${file_attach}
    Sleep   3
    # upload all attach file
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_UPLOAD_ALL_ATTACH}    timeout=20s
    Click Element    ${LOC_WIDGETEMAIL_BTN_UPLOAD_ALL_ATTACH}
    Sleep   1

#   10/6/2020
Edit Format Email
    [Arguments]    ${contact_info}=${EMPTY}    ${edit_type}=${EMPTY}    ${content}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${choose_type_edit} =   Run Keyword if   '${edit_type}'=='Bold'    String.Replace String    ${LOC_WIDGETEMAIL_BOLD}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${edit_type}'=='Italic'    String.Replace String    ${LOC_WIDGETEMAIL_ITALIC}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${edit_type}'=='Underline'    String.Replace String    ${LOC_WIDGETEMAIL_UNDERLINE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${edit_type}'=='Insert Numbered List'    String.Replace String    ${LOC_WIDGETEMAIL_NUMBER_LIST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${edit_type}'=='Insert List'    String.Replace String    ${LOC_WIDGETEMAIL_INSERT_LIST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${edit_type}'=='Align Left'    String.Replace String    ${LOC_WIDGETEMAIL_ALIGN_LEFT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${edit_type}'=='Align Center'    String.Replace String    ${LOC_WIDGETEMAIL_ALIGN_CENTER}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${edit_type}'=='Align Right'    String.Replace String    ${LOC_WIDGETEMAIL_ALIGN_RIGHT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5
    Wait Until Element Is Visible   ${choose_type_edit}  timeout=30
    Click Element   ${choose_type_edit}
    ${loc_content} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible   ${loc_content}  timeout=30
    Run keyword if   '${content}'=='${EMPTY}'    Input Text   ${loc_content}    ${EMPTY}
    ...     ELSE    Press Keys   ${loc_content}    ${content}
    Sleep   1


# 22/5/2020
Insert Link
    [Arguments]    ${link}    ${contact_info}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_btn_link} =    String.Replace String    ${LOC_WIDGETEMAIL_INSERT_LINK}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_btn_link}    timeout=20s
    Click element   ${loc_btn_link}
    Sleep   0.5
    ${loc_text_link} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_EDIT_TEXT_LINK}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_text_link}    timeout=20s
    Input text   ${loc_text_link}   ${link}
    Sleep   0.5
    ${loc_insert_link} =    String.Replace String    ${LOC_WIDGETEMAIL_BTN_INSERT_LINK}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_insert_link}    timeout=20s
    Click element   ${loc_insert_link}
    Sleep   1

Insert Email Signature
    Sleep   1
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_INSERT_EMAIL_SIGNATURE}    timeout=20s
    Click Element    ${LOC_WIDGETEMAIL_BTN_INSERT_EMAIL_SIGNATURE}
    Sleep   1
    #Verify Email Signature Displays In Email Contents
    Sleep   1

Click Any Editor Button
    [Arguments]    ${button}    ${contact_info}=${EMPTY}
    Run Keyword If   '${contact_info}'=='${EMPTY}'   Run keywords   Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_WORKCARD}    timeout=30s    AND   Click Element   ${LOC_WIDGETEMAIL_WORKCARD}
    ...     ELSE    Agent Clicks On A Work Card     ${contact_info}
    ${workcard_id} =    Run Keyword If    '${contact_info}'=='${EMPTY}'     Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_btn} =   String.Replace String    ${button}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Click Element   ${loc_btn}
    Sleep   1

Check Image Extention
    [Arguments]    ${file_name}
    ${extention} =   Fetch From Right    ${file_name}   .
    ${extent} =     Convert To Upper Case   ${extention}
    ${check} =   convert to string   False
    ${check} =  Run Keyword if   '${extent}'=='PNG'   convert to string     True
    ...     ELSE IF   '${extent}'=='JPG'   convert to string   True
    ...     ELSE IF   '${extent}'=='GIF'   convert to string   True
    ...     ELSE IF   '${extent}'=='JPEG'   convert to string   True
    ...     ELSE    convert to string   False
    [Return]    ${check}

Delete Old Selected Inline Image
    ${old_image} =    Run Keyword And Return Status    Element Should Be Visible    ${LOC_WIDGETEMAIL_CHOOSE_SELECTED_IMAGE}
    Run Keyword if   '${old_image}'=='True'   Click Element   ${LOC_WIDGETEMAIL_CHOOSE_SELECTED_IMAGE}
    Run Keyword if   '${old_image}'=='True'   Run Keywords    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_DELETE_INLINE_IMAGE}    timeout=20s    AND     Click Element   ${LOC_WIDGETEMAIL_BTN_DELETE_INLINE_IMAGE}
    Sleep   0.5

#   19/5/2020
Insert Inline Image
    [Arguments]    ${file_name}    ${contact_info}=${EMPTY}
    # click insert image button
    Click Any Editor Button     ${LOC_WIDGETEMAIL_INSERT_IMAGE}     ${contact_info}
    # delete old inserted image
    Delete Old Selected Inline Image
    # click upload new image button
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_UPLOAD_IMAGE}    timeout=20s
    Click Element   ${LOC_WIDGETEMAIL_BTN_UPLOAD_IMAGE}
    Sleep   1
    # choose file and insert
    WidgetEmailLocator.attach_file      ${file_name}
    Sleep   1
    # CHECK image have or have not extention
    ${check_image_extention} =    Run Keyword And Return Status   Should Contain    ${file_name}  .
    ${get_warning_mess} =   Run Keyword if   '${check_image_extention}'=='False'    Get Text    ${LOC_WIDGETEMAIL_WARNING_MESS_UPLOAD_IMAGE}
    Run Keyword if   '${check_image_extention}'=='False'    Should be equal     ${get_warning_mess}    This file type is not supported.
    Run Keyword if   '${check_image_extention}'=='False'    Log to console    You inserted the image having no extention. This file type is not supported.
    Run Keyword if   '${check_image_extention}'=='False'    Click Element   ${LOC_WIDGETEMAIL_BTN_EXIT_UPLOAD_IMAGE_WINDOW}
    # check correct image extention
    ${correct_extention} =   Check Image Extention    ${file_name}
    Run Keyword if   '${correct_extention}'=='True'    Click Element   ${LOC_WIDGETEMAIL_BTN_INSERT_INLINE_IMAGE}
    ...     ELSE IF  '${correct_extention}'=='False'    Run Keywords    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_EXIT_UPLOAD_IMAGE_WINDOW}    timeout=30s   AND   Click Element   ${LOC_WIDGETEMAIL_BTN_EXIT_UPLOAD_IMAGE_WINDOW}  AND   Log to console    This file type is not supported.
    Sleep   1

#   25/5/2020
Undo Email
    [Arguments]    ${content_email}   ${contact_info}=${EMPTY}
    Click Any Editor Button     ${LOC_WIDGETEMAIL_ALIGN_UNDO}     ${contact_info}
    Run Keyword If   '${contact_info}'=='${EMPTY}'   Run keywords   Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_WORKCARD}    timeout=30s    AND   Click Element   ${LOC_WIDGETEMAIL_WORKCARD}
    ...     ELSE    Agent Clicks On A Work Card     ${contact_info}
    ${workcard_id} =    Run Keyword If    '${contact_info}'=='${EMPTY}'     Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_content_email} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${content_new} =   Get Text   ${loc_content_email}
    Should not contain   ${content_new}    ${content_email}
    Sleep   1

#   25/5/2020
Redo Email
    [Arguments]    ${content_email}    ${contact_info}=${EMPTY}
    Click Any Editor Button     ${LOC_WIDGETEMAIL_ALIGN_REDO}     ${contact_info}
    Run Keyword If   '${contact_info}'=='${EMPTY}'   Run keywords   Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_WORKCARD}    timeout=30s    AND   Click Element   ${LOC_WIDGETEMAIL_WORKCARD}
    ...     ELSE    Agent Clicks On A Work Card     ${contact_info}
    ${workcard_id} =    Run Keyword If    '${contact_info}'=='${EMPTY}'     Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_content_email} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${content_new} =   Get Text   ${loc_content_email}
    Should contain   ${content_new}    ${content_email}
    Sleep   1

#   22/06/2020
Choose Email Template
    [Arguments]    ${contact_info}=${EMPTY}     ${template_name}=${EMPTY}   ${character_search}=${EMPTY}
     ${workcard_id} =    Run Keyword If    '${contact_info}'=='${EMPTY}'     Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    # input character to search
    ${loc_ipt_template} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_SEARCH_TEMPLATE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_ipt_template}    timeout=20s
    Input Text    ${loc_ipt_template}    ${character_search}
    # select Email template GROUP
    ${loc_template_name_group} =   String.Replace String    ${LOC_WIDGETEMAIL_SELECT_EMAIL_TEMPLATE_GROUP}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5
    ${loc_template_name_group1} =   String.Replace String    ${loc_template_name_group}    ${EMAIL_TEMPLATE_NAME}    ${template_name}
    Sleep   1
    ${check_line_template_group} =    Run Keyword And Return Status   Page Should Contain Element    ${loc_template_name_group1}
    Run keyword if   '${check_line_template_group}'=='True'   Click Element   ${loc_template_name_group1}
    Sleep   0.5
    # select Email template MIME
    ${loc_template_name_mime} =   String.Replace String    ${LOC_WIDGETEMAIL_SELECT_EMAIL_TEMPLATE_MIME}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5
    ${loc_template_name_mime1} =   String.Replace String    ${loc_template_name_mime}    ${EMAIL_TEMPLATE_NAME}    ${template_name}
    Sleep   1
    ${check_line_template_mime} =    Run Keyword And Return Status   Page Should Contain Element    ${loc_template_name_mime1}
    Sleep   0.5
    # click insert button
    ${loc_btn_insert_temp} =   Run keyword if   '${check_line_template_mime}'=='True'   String.Replace String    ${LOC_WIDGETEMAIL_BTN_INSERTT_TEMPLATE}    ${LINE_EMAIL_TEMPLATE}   ${loc_template_name_mime1}
    Sleep   1
    ${check_btn_insert} =    Run Keyword And Return Status   Page Should Contain Element    ${loc_btn_insert_temp}
    Run keyword if   '${check_btn_insert}'=='True'   Click element    ${loc_btn_insert_temp}
    Sleep   2

#   01/07/2020
Preview Email Template
    [Arguments]    ${contact_info}=${EMPTY}     ${template_name}=${EMPTY}
     ${workcard_id} =    Run Keyword If    '${contact_info}'=='${EMPTY}'     Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    # input character to search
    ${loc_ipt_template} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_SEARCH_TEMPLATE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_ipt_template}    timeout=20s
    Input Text    ${loc_ipt_template}    ${template_name}
    # select Email template GROUP
    ${loc_template_name_group} =   String.Replace String    ${LOC_WIDGETEMAIL_SELECT_EMAIL_TEMPLATE_GROUP}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5
    ${loc_template_name_group1} =   String.Replace String    ${loc_template_name_group}    ${EMAIL_TEMPLATE_NAME}    ${template_name}
    Sleep   1
    ${check_line_template_group} =    Run Keyword And Return Status   Page Should Contain Element    ${loc_template_name_group1}
    Run keyword if   '${check_line_template_group}'=='True'   Click Element   ${loc_template_name_group1}
    Sleep   0.5
    # select Email template MIME
    ${loc_template_name_mime} =   String.Replace String    ${LOC_WIDGETEMAIL_SELECT_EMAIL_TEMPLATE_MIME}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5
    ${loc_template_name_mime1} =   String.Replace String    ${loc_template_name_mime}    ${EMAIL_TEMPLATE_NAME}    ${template_name}
    Sleep   1
    ${check_line_template_mime} =    Run Keyword And Return Status   Page Should Contain Element    ${loc_template_name_mime1}
    Sleep   0.5

    # click preview button
    ${loc_btn_preview_temp} =   Run keyword if   '${check_line_template_mime}'=='True'   String.Replace String    ${LOC_WIDGETEMAIL_BTN_PREVIEW_TEMPLATE}    ${LINE_EMAIL_TEMPLATE}   ${loc_template_name_mime1}
    Sleep   1
    ${check_btn_preview} =    Run Keyword And Return Status   Page Should Contain Element    ${loc_btn_preview_temp}
    Run keyword if   '${check_btn_preview}'=='True'   Click element    ${loc_btn_preview_temp}
    Sleep   2
    # verify preview email template name
    Wait Until Element Is Visible   ${LOC_WIDGETEMAIL_TEMPLATE_NAME}    10
    ${temp_name} =   Get Text   ${LOC_WIDGETEMAIL_TEMPLATE_NAME}
    ${check_temp_name} =    Run Keyword And Return Status   Should Contain    ${temp_name}  ${template_name}
    Run Keyword if   '${check_temp_name}'=='True'   Log to console   Email Template Name: ${temp_name}
    ...     ELSE    Fail    Email Template Name does not correct
    # verify preview email template subject
    Wait Until Element Is Visible   ${LOC_WIDGETEMAIL_TEMPLATE_SUBJECT}    10
    ${temp_subject} =   Get Text   ${LOC_WIDGETEMAIL_TEMPLATE_SUBJECT}
    ${check_temp_subject} =    Run Keyword And Return Status   Should Contain    ${temp_subject}  ${template_name}
    Run Keyword if   '${check_temp_subject}'=='True'   Log to console   Email Template Subject: ${temp_name}
    ...     ELSE    Fail    Email Template Subject does not correct
    # verify content Email Template
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_TEMPLATE_CONTENT}    timeout=10s
    @{content_element}=    Get WebElements     ${LOC_WIDGETEMAIL_TEMPLATE_CONTENT}
    ${content_total}=    Get Length    ${content_element}
    FOR     ${i}    IN RANGE    -1   ${content_total}
    \   ${content_line} =  Get Text    ${content_element}[${i}]
    \   Run Keyword If  '${content_line}'=='${template_name}'   Run keywords   Log to console   Content Email display correctly   AND   Exit For Loop
    Sleep   1
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_CANCEL_PREVIEW_TEMPLATE}    timeout=10s
    Click Element   ${LOC_WIDGETEMAIL_BTN_CANCEL_PREVIEW_TEMPLATE}
    Sleep   1

#   3/6/2020
Verify Format Email
    [Arguments]    ${contact_info}=${EMPTY}     ${button}=${EMPTY}   ${content}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${choose_type_edit} =   Run Keyword if   '${button}'=='Bold'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_BOLD}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${button}'=='Italic'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_ITALIC}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${button}'=='Underline'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_UNDERLINE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${button}'=='Insert Numbered List'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_NUMBER_LIST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${button}'=='Insert List'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_INSERT_LIST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${button}'=='Align Left'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_ALIGN_LEFT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${button}'=='Align Center'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_ALIGN_CENTER}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${button}'=='Align Right'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_ALIGN_RIGHT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    @{get_content_edit} =    Get WebElements    ${choose_type_edit}
    ${content_total}=    Get Length    ${get_content_edit}
    log to console   content_total= ${content_total}
    Run keyword if   ${content_total}<1    Fail    Content Email is not edited
    Sleep   0.5
    FOR     ${i}    IN RANGE    0   ${content_total}
    \   ${text} =    Get Text    ${get_content_edit}[${i}]
    \   log to console   i= ${i}
    \   log to console   text= ${text}
#    \   ${count_content} =   Run Keyword if    '${text}'=='${content}'   Evaluate   ${count_content}+1    ELSE    Evaluate   ${count_content}
    \   ${count_content} =   Run Keyword if    '${text}'=='${content}'   Convert to String   xxx
    \   log to console   count_content= ${count_content}
    \   Run Keyword if    '${text}'=='${content}'   Exit For Loop
    Run Keyword unless  '${count_content}'=='xxx'    Fail    Edit Email incorrect
    Sleep   1

#   3/6/2020
Verify Font Size Email
    [Arguments]    ${contact_info}=${EMPTY}     ${font_size}=${EMPTY}   ${content}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${choose_type_edit} =   Run Keyword if   '${font_size}'=='8' or '${font_size}'=='Small'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_8}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${font_size}'=='12' or '${font_size}'=='Normal'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_12}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${font_size}'=='14' or '${font_size}'=='Large'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_14}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${font_size}'=='16' or '${font_size}'=='Huge'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_16}    ${WORKCARD_ID_VAR}    ${workcard_id}
    @{get_content_edit} =    Get WebElements    ${choose_type_edit}
    ${content_total}=    Get Length    ${get_content_edit}
    Sleep   0.5
    FOR     ${i}    IN RANGE    0   ${content_total}
    \   ${text} =    Get Text    ${get_content_edit}[${i}]
    \   ${check_text} =   Run Keyword And Return Status    Should be equal    ${text}   ${content}
    \   Run Keyword If  '${check_text}'=='False' and '${i}'=='${content_total}'     Fail    Font size Email incorrect
    Sleep   1

# 22/5/2020
Verify Insert Link
    [Arguments]    ${link}   ${contact_info}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_content_link} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_LINK}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_content_link}    timeout=20s
    ${text_link} =    Get Text   ${loc_content_link}
    ${check_link} =   Run Keyword And Return Status    Should contain    ${text_link}   ${link}
    Run Keyword If    '${check_link}' == 'True'    Log to console    Inserted Link displays correctly
    Run Keyword If    '${check_link}' == 'False'    Fail    Inserted Link does not display correctly
    Sleep   1

# 20/5/2020
Verify Inline Image
    [Arguments]    ${contact_info}=${EMPTY}
    ${workcard_id} =    Run Keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_display_inline} =   String.Replace String    ${LOC_WIDGETEMAIL_DISPLAY_INLINE_IMAGE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   1
    ${check_image} =   Run Keyword And Return Status    Page Should Contain Element    ${loc_display_inline}
    Run Keyword If    '${check_image}' == 'True'    Log to console    Inline image displays correctly
    Run Keyword If    '${check_image}' == 'False'    Fail    Missed Inline image
    Sleep   1

# 25/5/2020
Verify Received Email
    [Arguments]    ${contact_info}    ${agent_email}    ${subject}    ${content}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    # verify Subject
    ${loc_subject} =    String.Replace String    ${LOC_WIDGETEMAIL_RECEIVE_SUBJECT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_subject}    timeout=30s
    ${get_subject} =    Get Element Attribute    ${loc_subject}    aria-label
    Run Keyword If     '${contact_info}'=='${ADMIN_EMAIL}'      Should contain     ${get_subject}   Undeliverable
    ${check_subject} =   Run Keyword And Return Status    Should Contain    ${get_subject}   ${subject}
    Run Keyword If    '${check_subject}' == 'True'    Log to console    Subject Email displays correctly
    Run Keyword If    '${check_subject}' == 'False'    Fail    Subject Email does not display correctly
    # verify From Email
    ${loc_from} =    String.Replace String    ${LOC_WIDGETEMAIL_RECEIVE_FROM}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_from}    timeout=20s
    ${get_from} =    Get Text    ${loc_from}
    ${check_from} =   Run Keyword And Return Status    Should Be Equal    ${get_from}   ${contact_info}
    Run Keyword If    '${check_from}' == 'True'    Log to console    From Email displays correctly
    Run Keyword If    '${check_from}' == 'False'    Fail    From Email does not display correctly
    # verify To Email
    ${loc_to} =    String.Replace String    ${LOC_WIDGETEMAIL_RECEIVE_TO}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_to}    timeout=30s
    ${get_to} =    Get Text    ${loc_to}
    ${check_to} =   Run Keyword And Return Status    Should contain    ${get_to}   ${agent_email}
    Run Keyword If    '${check_to}' == 'True'    Log to console    To Email displays correctly
    Run Keyword If    '${check_to}' == 'False'    Fail    To Email does not display correctly
    # verify content Email
    ${loc_content} =    String.Replace String    ${LOC_WIDGETEMAIL_RECEIVE_CONTENT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_content}    timeout=40s
    @{content_element}=    Get WebElements     ${loc_content}
    ${content_total}=    Get Length    ${content_element}
    FOR     ${i}    IN RANGE    -1   ${content_total}
    \   ${content_line} =  Get Text    ${content_element}[${i}]
    \   Run Keyword If  '${content_line}'=='${content}'   Run keywords   Log to console   Content Email display correctly   AND   Exit For Loop
    Sleep   1

#   2/6/2020
Verify Replied Email
    [Arguments]    ${contact_info}    ${agent_email}    ${subject}    ${content}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    # verify To Email
    ${loc_to} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_TO_REPLY}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_to}    timeout=40s
    ${get_to} =    Get Text    ${loc_to}
    ${check_to} =   Run Keyword And Return Status    Should contain    ${get_to}   ${contact_info}
    Run Keyword If    '${check_to}' == 'True'    Log to console    To Email displays correctly
    Run Keyword If    '${check_to}' == 'False'    Fail    To Email does not display correctly
    # verify Subject
    ${loc_subject} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_SUBJECT_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_subject}    timeout=20s
    ${get_subject} =    Get Element Attribute    ${loc_subject}    aria-label
    ${check_subject} =   Run Keyword And Return Status    Should be equal    ${get_subject}   RE: ${subject}
    Run Keyword If    '${check_subject}' == 'True'    Log to console    Subject Email displays correctly
    Run Keyword If    '${check_subject}' == 'False'    Fail    Subject Email does not display correctly
    # verify content Email
    ${loc_content} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_LINE_REPLY}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_content}    timeout=20s
    @{content_element}=    Get WebElements     ${loc_content}
    ${content_total}=    Get Length    ${content_element}

    FOR     ${i}    IN RANGE    -1   ${content_total}
    \   ${content_line} =  Get Text    ${content_element}[${i}]
    \   Log to console     ---------------${content_line}
    \   Run Keyword If  '${content_line}'=='${content}'   Run keywords   Log to console   Content Email display correctly   AND   Exit For Loop
    Sleep   1

# 22/5/2020
Verify Suggesstion
    [Arguments]    ${contact_info}    ${suggest_content}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_content_suggest} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_SUGGEST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_content_suggest}    timeout=20s
    ${text_suggest} =    Get Text   ${loc_content_suggest}
    ${check_suggest} =   Run Keyword And Return Status    Should contain    ${text_suggest}   ${suggest_content}
    Run Keyword If    '${check_suggest}' == 'True'    Log to console    Suggestion displays correctly
    ...     ELSE   Fail    Suggestion does not display correctly
    Sleep   1

Verify Email Signature
    [Documentation]     Verify Email Signature Displays In Email Contents
    [Arguments]    ${signature}
    ${workcard_id} =    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ${loc_content_email} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_content_email}    timeout=20s
    ${text_signature} =  Get Text  ${loc_content_email}
    Should Contain      ${text_signature}   ${signature}
    Sleep   1

#   11/05/2020
Verify Email Attachment
    [Arguments]    ${contact_info}=${EMPTY}   ${attach_name}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_show_attachment} =    String.Replace String    ${LOC_WIDGETEMAIL_SHOW_ATTACHMENT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    @{list_attachment}=    Get WebElements     ${loc_show_attachment}
    ${length_list_attachment}=    Get Length    ${list_attachment}
    Run Keyword If    '${length_list_attachment}' == '0' and '${attach_name}'=='${EMPTY}'   Log to console   Have no this Attachment
    ${state} =     Set Variable   0
    FOR      ${i}    IN RANGE    0   ${length_list_attachment}
    \   ${name_of_attachment} =     Get Text    @{list_attachment}[${i}]
    \   ${state}=    Run Keyword And Return Status    Should Contain    ${name_of_attachment}    ${attach_name}
    Run Keyword If    '${state}' == 'True'    Log to console   Agent recieved Email is attached file ${attach_name}
    Run Keyword If    '${state}' == 'True' and '${attach_name}'=='${EMPTY}'   Fail    Can upload Attachment files which have size larger than 25MB
    Run Keyword If    '${state}' == 'False'    Fail    Missed Attachment
    Sleep   1

Verify Download Attachment
    [Arguments]    ${contact_info}   ${attach_name}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_show_attachment} =    String.Replace String    ${LOC_WIDGETEMAIL_SHOW_ATTACHMENT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    @{list_attachment}=    Get WebElements     ${loc_show_attachment}
    ${length_list_attachment}=    Get Length    ${list_attachment}
    ${status} =     Set Variable   0
    # download attachment
    FOR      ${i}    IN RANGE    -1   ${length_list_attachment}
    \   ${name_of_attachment} =     Get Text    @{list_attachment}[${i}]
    \   Run Keyword If  '${name_of_attachment}'=='${attach_name}'   Click Element   @{list_attachment}[${i}]
    \   Run Keyword If  '${name_of_attachment}'=='${attach_name}'   Exit For Loop
    Sleep   5
    # open folder contain downloaded attachment
    # if finding attachment, delete it
    ${a}=   WidgetEmailLocator.verify_download_attachment   ${attach_name}
    Run Keyword If   '${a}'=='true'   WidgetEmailLocator.delete_download_attachment    ${attach_name}
    Run Keyword If   '${a}' == 'false'    WidgetEmailLocator.close_file_explorer_window
    Run Keyword If   '${a}' == 'false'    Fail    Missed download Attachment
    Sleep   1

########################################################################################################################
#   ============================================  WORKCARD KEYWORDS ====================================================
########################################################################################################################

Get WorkCard ID
    [Documentation]    Get WorkCard ID by contact info (name, email or phone number) of workcard.
    [Arguments]    ${contact_info}
    ${locator}=    String.Replace String    ${LOC_WORKCARD}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Element Is Visible    ${locator}    10s
    ${workcard_id}=     Get Element Attribute    ${locator}    interaction-id
    [Return]    ${workcard_id}

Get WorkCard ID By WorkCard Order
    [Documentation]    Get Workcard id by order of workcard that we want to get id.
    [Arguments]    ${workcard_order}
    ${locator}=    String.Replace String    ${LOC_WORKCARD_ID_BY_ORDER}    ${WORKCARD_ORDER_VAR}    ${workcard_order}
    ${workcard_id}=     Get Element Attribute    ${locator}    card-id
    [Return]    ${workcard_id}

Release All Active Working Contacts
    [Documentation]     Release all active working contacts
    # Click Answer if any, Click End if any, Click Complete If Any
    @{card_containers}=    Get WebElements    ${LOC_WORKCARD_LIST}
    :FOR    ${card_container}    IN    @{card_containers}
    \       ${status}    ${btn_answer}=     Run Keyword And Ignore Error    Find Element    ${LOC_WORKSPACE_BTN_ACCEPT_CONTACT}    ${card_container}
    \       Run Keyword If    '${status}'=='PASS'    Click Element    ${btn_answer}
    \       Sleep    ${TIMEOUT_SHORT}
    \       ${status}    ${btn_end}=    Run Keyword And Ignore Error    Find Element    ${LOC_WORKSPACE_BTN_END_CONTACT}    ${card_container}
    \       Run Keyword If    '${status}'=='PASS'    Click Element    ${btn_end}
    \       Sleep    ${TIMEOUT_SHORT}
    \       ${status}    ${btn_complete}=    Run Keyword And Ignore Error    Find Element    ${LOC_WORKSPACE_BTN_COMPLETE_CONTACT}    ${card_container}
    \       Run Keyword If    '${status}'=='PASS'    Click Element    ${btn_complete}

    # Verify that there is no work cards
    :FOR    ${attempt}    IN RANGE    1    4
    \    Sleep    ${TIMEOUT_SHORT}
    \    ${card_containers}=    Get WebElements    ${LOC_WORKCARD_LIST}
    \    ${num_of_workcards} =    Get Length    ${card_containers}
    \    Run Keyword If    ${num_of_workcards} == 0    Exit For Loop
    ${card_containers}=    Get WebElements    ${LOC_WORKCARD_LIST}
    Should be Empty    ${card_containers}
    Capture Page Screenshot

##################################

Agent Clicks On A Work Card
    [Documentation]    Agent Finds And Clicks On A Work Card
    [Arguments]    ${contact_info}=${EMPTY}
    ${loc_workcard1} =    String.Replace String    ${LOC_WORKCARD}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    10s    Page Should Contain Element    ${loc_workcard1}
    Click Element    ${loc_workcard1}
    Sleep   1

Agent Accepts A Contact
    [Documentation]    Agent Finds And Accepts A Contact Session
    [Arguments]    ${contact_info}
    ${accept_contact_button_locator}=    String.Replace String    ${LOC_WORKCARD_BTN_ACCEPT_CONTACT}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    1s    Page Should Contain Element    ${accept_contact_button_locator}
    Click Element    ${accept_contact_button_locator}
    Sleep    ${TIMEOUT_EXTRA_SHORT}
    ${end_contact_button_locator}=    String.Replace String    ${LOC_WORKCARD_BTN_END_CONTACT}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    30s    1s    Page Should Contain Element    ${end_contact_button_locator}
    Sleep   1

# 07/04/2020
Agent Rejects A Contact
    [Documentation]    Agent Finds And Accepts A Contact Session
    [Arguments]    ${contact_info}
    ${reject_contact_button_locator}=    String.Replace String    ${LOC_WORKCARD_BTN_REJECT_CONTACT}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    10s    Page Should Contain Element    ${reject_contact_button_locator}
    Click Element    ${reject_contact_button_locator}
    Sleep    ${TIMEOUT_EXTRA_SHORT}

#   07/05/2020
Agent End Outbound Contact
    @{get_all_created_email} =   Get WebElements    ${LOC_WORKCARD_BTN_END_ANY_CONTACT}
    ${count_contact} =   Get Length  ${get_all_created_email}
    :FOR   ${i}  IN RANGE   0   ${count_contact}
    \   Click Element   ${get_all_created_email}[${i}]
    \   Wait Until Element Is Visible   ${LOC_WORKCARD_BTN_END_INTERACTION}    10s
    \   Click Element   ${LOC_WORKCARD_BTN_END_INTERACTION}
    \   Sleep   3

# 11/05/2020
Agent End Any Inbound Contact
    @{get_all_hold_btn} =   Get WebElements    ${LOC_WORKCARD_BTN_HOLD_ANY_CONTACT}
    @{get_end_btn} =    Get WebElements     ${LOC_WORKCARD_BTN_END_ANY_CONTACT}
    ${count_hold} =   Get Length  ${get_all_hold_btn}
    ${cound_end} =   Get Length  ${get_end_btn}
    Run Keyword If   ${cound_end}==1     Click Element   ${LOC_WORKCARD_BTN_END_ANY_CONTACT}
    ${check_interaction_btn} =     Run Keyword And Return Status    Wait Until Element Is Visible    ${LOC_WORKCARD_BTN_END_INTERACTION}    timeout=10
    Run Keyword If    '${check_interaction_btn}'=='True'    Click Element   ${LOC_WORKCARD_BTN_END_INTERACTION}
    Sleep   1
    :FOR   ${i}  IN RANGE   0   ${count_hold}
    \   Click Element   ${get_all_hold_btn}[${i}]
    \   Sleep   2
    \   Click Element   ${LOC_WORKCARD_BTN_END_ANY_CONTACT}
    \   Sleep   2
    \   ${check_interaction_btn} =     Run Keyword And Return Status    Wait Until Element Is Visible    ${LOC_WORKCARD_BTN_END_INTERACTION}    timeout=10
    \   Run Keyword If    '${check_interaction_btn}'=='True'    Click Element   ${LOC_WORKCARD_BTN_END_INTERACTION}
    \   Sleep   1
    Sleep   1

Agent Hold A Contact
    [Documentation]    Agent Finds And Hold A Contact
    [Arguments]    ${contact_info}
    ${hold_contact_button_locator}=    String.Replace String    ${LOC_WORKCARD_BTN_HOLD_CONTACT}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    20s    Page Should Contain Element    ${hold_contact_button_locator}
    Click Element    ${hold_contact_button_locator}
    Sleep    ${TIMEOUT_EXTRA_SHORT}
    ${unhold_contact_button_locator}=    String.Replace String    ${LOC_WORKCARD_BTN_UNHOLD_CONTACT}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Element    ${unhold_contact_button_locator}
    Sleep   1

Agent Unhold A Contact
    [Documentation]    Agent Finds And Unhold A Contact
    [Arguments]    ${contact_info}
    ${unhold_contact_button_locator}=    String.Replace String    ${LOC_WORKCARD_BTN_UNHOLD_CONTACT}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    2s    Page Should Contain Element    ${unhold_contact_button_locator}
    Click Element    ${unhold_contact_button_locator}
    Sleep    ${TIMEOUT_EXTRA_SHORT}
    ${hold_contact_button_locator}=    String.Replace String    ${LOC_WORKCARD_BTN_HOLD_CONTACT}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${hold_contact_button_locator}
    Sleep   1

Agent Ends A Contact
    [Documentation]    Agent Finds And Ends A Contact Session
    [Arguments]    ${contact_info}
    ${end_contact_button_locator}=    String.Replace String    ${LOC_WORKCARD_BTN_END_CONTACT}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${end_contact_button_locator}
    Click Element    ${end_contact_button_locator}
    Sleep    ${TIMEOUT_EXTRA_SHORT}
#    ${complete_contact_button_locator}=    String.Replace String    ${LOC_WORKCARD_BTN_COMPLETE_CONTACT}    ${CONTACT_INFO_VAR}    ${contact_info}
#    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${complete_contact_button_locator}

End Interaction Log Call
    [Arguments]    ${contact_info}
    Click Element   xpath://div[@class='md-panel-outer-wrapper md-panel-is-showing']
    Sleep   1
    ${end_interaction_call}=    String.Replace String    ${LOC_WORKCARD_BTN_END_INTERACTION_CALL}    ${CONTACT_INFO_VAR}    ${contact_info}
#    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${end_interaction_call}
    Click Element   ${end_interaction_call}
    Sleep   1

Agent Completes A Contact Session
    [Documentation]    Agent Finds And Completes A Contact Session
    [Arguments]    ${contact_info}
    ${complete_contact_button_locator}=    String.Replace String    ${LOC_WORKCARD_BTN_COMPLETE_CONTACT}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${complete_contact_button_locator}
    Click Element    ${complete_contact_button_locator}
    Sleep    ${TIMEOUT_EXTRA_SHORT}
    Wait Until Keyword Succeeds    10s    1s    Page Should Not Contain Element    ${complete_contact_button_locator}
    Sleep   1

# 11/03/2020
Agent Transfer Contact
    [Documentation]    Agent Clicks Transfer Button On WordCard
    [Arguments]    ${contact_info}
    ${transfer_button_locator} =    String.Replace String    ${LOC_WORKCARD_BTN_TRANSFER}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    ${TIMEOUT_EXTRA_SHORT}    Page Should Contain Element    ${transfer_button_locator}
    Click Element    ${transfer_button_locator}
    Sleep   1

# 11/03/2020
Agent Consult Contact
    [Documentation]    Agent Clicks Consult Button On WordCard
    [Arguments]    ${contact_info}
    ${consult_button_locator} =    String.Replace String    ${LOC_WORKCARD_CONSULT_CALL}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    ${TIMEOUT_EXTRA_SHORT}    Page Should Contain Element    ${consult_button_locator}
    Sleep   2
    Click Element    ${consult_button_locator}
    Sleep   1

Transfer To Service
    [Documentation]    Click Transfer To Service and choose service to transfer contact. (for MM contact)
    [Arguments]    ${contact_info}    ${service_name_to_transfer}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    Agent Transfer Contact    ${contact_info}
    ${loc_service_button}=    String.Replace String    ${LOC_WORKCARD_BTN_SERVICES}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_service_button}    timeout=${TIMEOUT_SHORT}
    Click Element    ${loc_service_button}
    Sleep    ${TIMEOUT_SHORT}
    Wait Until Keyword Succeeds    ${TIMEOUT_SHORT}    30s    Page Should Contain Element    ${LOC_WORKCARD_SERVICE_SEARCH_BOX}
    Input Text    ${LOC_WORKCARD_SERVICE_SEARCH_BOX}    ${service_name_to_transfer}
    ${loc_service_name}=    String.Replace String    ${LOC_WORKCARD_BTN_SERVICE_NAME_TO_TRANSFER}    ${SERVICE_NAME_TO_TRANSFER_VAR}    ${service_name_to_transfer}
    Wait Until Element Is Visible    ${loc_service_name}    timeout=${TIMEOUT_SHORT}
    Click Element    ${loc_service_name}
    Sleep   1

# 10/03/2020
Transfer Team Call
    [Arguments]    ${contact_info}    ${agent_name}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    Agent Transfer Contact    ${contact_info}
    # click Team button
    ${loc_team_button}=    String.Replace String    ${LOC_WORKCARD_BTN_TRANSFER_TEAM}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_team_button}    10s
    Click Element    ${loc_team_button}
    Sleep    ${TIMEOUT_SHORT}
    # input text to Team Search
    ${loc_team_search} =    String.Replace String    ${LOC_WORKCARD_IPT_TRANSFER_TEAM_SEARCH}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Keyword Succeeds    ${TIMEOUT_SHORT}    10s    Page Should Contain Element    ${loc_team_search}
    Input Text    ${loc_team_search}    ${agent_name}
    Sleep   1
    # click to choosed agent
    ${loc_choosed_agent}=    String.Replace String    ${LOC_WORKCARD_BTN_TRANSFER_TEAM_CHOOSED_AGENT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_choosed_agent}    10s
    Click Element    ${loc_choosed_agent}
    Sleep   1

# 11/03/2020
Transfer Extension Call
    [Documentation]    Tranfer call to Extension (for DN or CDN)
    [Arguments]    ${contact_info}    ${extension}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    Agent Transfer Contact    ${contact_info}
    # input Extension
    ${loc_input_extension} =    String.Replace String    ${LOC_WORKCARD_IPT_TRANSFER_EXTENSION}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Keyword Succeeds    ${TIMEOUT_SHORT}    10s    Page Should Contain Element    ${loc_input_extension}
    Input Text    ${loc_input_extension}    ${extension}
    Sleep   1
    # click call to extension
    ${loc_call_extension}=    String.Replace String    ${LOC_WORKCARD_BTN_TRANSFER_CALL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_call_extension}    timeout=${TIMEOUT_SHORT}
    Click Element    ${loc_call_extension}
    Sleep   1


# 11/03/2020
Consult Team Call
    [Arguments]    ${contact_info}    ${agent_name}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    Agent Transfer Contact    ${contact_info}
    # click Team button
    ${loc_team_button}=    String.Replace String    ${LOC_WORKCARD_BTN_TRANSFER_TEAM}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_team_button}    timeout=${TIMEOUT_SHORT}
    Click Element    ${loc_team_button}
    Sleep    ${TIMEOUT_SHORT}
    # input text to Team Search
    ${loc_team_search} =    String.Replace String    ${LOC_WORKCARD_IPT_TRANSFER_TEAM_SEARCH}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Keyword Succeeds    ${TIMEOUT_SHORT}    10s    Page Should Contain Element    ${loc_team_search}
    Input Text    ${loc_team_search}    ${agent_name}
    Sleep   1
    # click to choosed agent
    ${loc_choosed_agent}=    String.Replace String    ${LOC_WORKCARD_BTN_TRANSFER_TEAM_CHOOSED_AGENT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_choosed_agent}    timeout=${TIMEOUT_SHORT}
    Click Element    ${loc_choosed_agent}
    Sleep   1

# 11/03/2020
Consult Extension Call
    [Documentation]    Tranfer call to Extension (for DN or CDN)
    [Arguments]    ${contact_info}    ${extension}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    Agent Consult Contact    ${contact_info}
    # input Extension
    ${loc_input_extension} =    String.Replace String    ${LOC_WORKCARD_IPT_CONSULT_EXTENSION}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Keyword Succeeds    ${TIMEOUT_SHORT}    10s    Page Should Contain Element    ${loc_input_extension}
    Input Text    ${loc_input_extension}    ${extension}
    Sleep   1
    # click call to extension
    ${loc_call_extension}=    String.Replace String    ${LOC_WORKCARD_BTN_CONSULT_CALL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_call_extension}    timeout=${TIMEOUT_SHORT}
    Click Element    ${loc_call_extension}
    Sleep   1

Checks Interaction Details
    [Documentation]    Click Interaction Details in More menu.
    [Arguments]    ${workcard_id}
    ${loc_interaction_details_button}=    String.Replace String    ${LOC_WORKCARD_BTN_INTERACTION_DETAILS_BUTTON}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_interaction_details_button}    timeout=30
    Click Element    ${loc_interaction_details_button}
    Sleep   1

Agent Accepts Any Coming Contact
    [Documentation]    Agent accepts any coming contact and return its title
    # Get Workcard title based accept button
    Wait Until Element Is Visible    ${LOC_WORKCARD_ACCEPT_CONTACT_HEADER_TITLE}    ${WAIT_TIME_SHORT}
    ${contact_header_title} =    Get Element Attribute    ${LOC_WORKCARD_ACCEPT_CONTACT_HEADER_TITLE}    aria-label

    # Accept contact
    ${loc_button_accept} =    String.Replace String    ${LOC_WORKCARD_BTN_ACCEPT_CONTACT}    ${CONTACT_INFO_VAR}    ${contact_header_title}
    Click Element    ${loc_button_accept}
    Sleep    0.5s

    # Verify button End displayed
    ${loc_button_end} =    String.Replace String    ${LOC_WORKCARD_BTN_END_CONTACT}    ${CONTACT_INFO_VAR}    ${contact_header_title}
    Wait Until Element Is Visible    ${loc_button_end}    timeout=30
    [Return]    ${contact_header_title}

Open More Option
    [Documentation]    Click More button on workcard to open more menu.
    [Arguments]    ${contact_info}=${EMPTY}
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${more_button_locator} =    String.Replace String    ${LOC_WORKCARD_BTN_MORE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    10s    Page Should Contain Element    ${more_button_locator}
    Click Element    ${more_button_locator}

Set Activity Code
    [Arguments]    ${contact_info}    ${activity_name}=${EMPTY}
    Agent Clicks On A Work Card     ${contact_info}
    ${work_card_id}=    Get WorkCard ID    ${contact_info}
    Open More Option    ${contact_info}
    Sleep    ${TIMEOUT_EXTRA_SHORT}
    Wait Until Element Is Visible   ${LOC_WORKCARD_BTN_ACTIVITY}    10s
    Click Element    ${LOC_WORKCARD_BTN_ACTIVITY}
    Sleep    ${TIMEOUT_EXTRA_SHORT}
    ${activity_locator}=    String.Format String    ${LOC_WORKCARD_BTN_ACTIVITY_CODE}    ${activity_name}
    Run Keyword Unless    '${activity_name}'=='${EMPTY}'    Click Element    ${activity_locator}
    Run Keyword If    '${activity_name}'=='${EMPTY}'    Click Element     ${LOC_WORKCARD_IPT_ACTIVITY_SEARCH}    AND    Click Element    ${LOC_WORKCARD_BTN_FIRST_ACTIVITY}
    Sleep   1

Set Disposition Code
    [Documentation]    Set Disposition Code based on name
    [Arguments]    ${contact_info}    ${disposition_name}=${EMPTY}
    Agent Clicks On A Work Card     ${contact_info}
    ${work_card_id}=    Get WorkCard ID    ${contact_info}
    Open More Option    ${contact_info}
    Sleep    ${TIMEOUT_EXTRA_SHORT}
    Wait Until Element Is Visible   ${LOC_WORKCARD_BTN_DISPOSITION}
    Click Element    ${LOC_WORKCARD_BTN_DISPOSITION}
    Sleep    ${TIMEOUT_EXTRA_SHORT}
#    ${disposition_locator}=    String.Replace String    ${LOC_WORKCARD_BTN_DISPOSITION_CODE}    ${DISPOSITION_NAME_VAR}    ${disposition_name}
#    Run Keyword Unless    '${disposition_name}'=='${EMPTY}'    Click Element    ${disposition_locator}
    Run Keyword Unless    '${disposition_name}'=='${EMPTY}'    Run Keyword    Search Disposition Code   ${disposition_name}
    Run Keyword If    '${disposition_name}'=='${EMPTY}'    Run Keywords    Click Element     ${LOC_WORKCARD_IPT_DISPOSITION_SEARCH}    AND    Click Element    ${LOC_WORKCARD_BTN_FIRST_DISPOSITION}
    Sleep   1

Search Disposition Code
    [Arguments]    ${disposition_name}
    Input Text    ${LOC_WORKCARD_IPT_DISPOSITION_SEARCH}    ${disposition_name}
    Sleep   1
    Click Element   ${LOC_WORKCARD_BTN_FIRST_DISPOSITION}
    Sleep   1

#   13/08/2020
Supervisor End Observe
    [Arguments]    ${contact_info}
    ${end_observe_btn_locator}=    String.Replace String    ${LOC_WORKCARD_BTN_END_OBSERVE}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    10s    Page Should Contain Element    ${end_observe_btn_locator}
    Click Element    ${end_observe_btn_locator}
    Sleep    ${TIMEOUT_EXTRA_SHORT}
    Wait Until Keyword Succeeds    15s    1s    Page Should Not Contain Element    ${end_observe_btn_locator}
    Sleep   1

#   24/08/2020
Supervisor Coaching
    [Arguments]    ${contact_info}
    ${coach_btn_locator}=    String.Replace String    ${LOC_WORKCARD_BTN_COACH}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    20s    Page Should Contain Element    ${coach_btn_locator}
    Click Element    ${coach_btn_locator}
    Sleep    ${TIMEOUT_EXTRA_SHORT}
    Wait Until Keyword Succeeds    15s    1s    Page Should Not Contain Element    ${coach_btn_locator}
    Sleep   1

Supervisor End Coaching
    [Arguments]    ${contact_info}
    ${end_coach_btn_locator}=    String.Replace String    ${LOC_WORKCARD_BTN_END_COACH}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${end_coach_btn_locator}
    Click Element    ${end_coach_btn_locator}
    Sleep    3

#   24/08/2020
Supervisor Barge-in
    [Arguments]    ${contact_info}
    ${bagre_btn_locator}=    String.Replace String    ${LOC_WORKCARD_BTN_BARGE}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    10s    Page Should Contain Element    ${bagre_btn_locator}
    Click Element    ${bagre_btn_locator}
    Sleep    ${TIMEOUT_EXTRA_SHORT}
    Wait Until Keyword Succeeds    15s    1s    Page Should Not Contain Element    ${bagre_btn_locator}
    Sleep   1

####################

#   20/03/2020
Verify Working Contact
    [Documentation]    Verify working contact routed to agent
    [Arguments]    ${contact_info}
    ${locator}=    String.Replace String    ${LOC_WORKCARD_HEADER_TITLE}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Element Is Visible   ${locator}     timeout=${CONTACT_ROUTING_TIMEOUT}

#   /03/2020
Verify Agent Idle
    Wait Until Element Is Not Visible   ${LOC_WORKCARD_HEADER}     timeout=${CONTACT_ROUTING_TIMEOUT}
    Log To Console    Agent is Idle
    Sleep   1

#   24/4/2020
Verify Interaction Details
    [Arguments]    ${contact_info}=${EMPTY}   ${channel}=${EMPTY}     ${service}=${EMPTY}
    Run keyword if     '${contact_info}'=='${EMPTY}'   Verify Interaction Outgoing     ${channel}
    ...     ELSE    Verify Interaction Incoming    ${contact_info}   ${channel}     ${service}

Verify Interaction Outgoing
    [Arguments]     ${channel}
    ${workcard_id}=    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ${agent_id}=    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-title
    # Open More Option
    ${loc_more_btn} =   String.Replace String    ${LOC_WORKCARD_BTN_MORE_OUTGOING}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Click element   ${loc_more_btn}
    Sleep   1
    Checks Interaction Details    ${workcard_id}
    # Verify Channel
    ${loc_channel} =    String.Replace String    ${LOC_WORKCARD_INTERACTION_CHANNEL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${inter_chanel} =   Get Text    ${loc_channel}
    Should Be Equal     ${inter_chanel}     ${channel}
    Log To Console     Channel: ${inter_chanel}
    # Verify Direction
    ${loc_direction} =    String.Replace String    ${LOC_WORKCARD_INTERACTION_DIRECTION}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${inter_direction} =   Get Text    ${loc_direction}
    Should Be Equal     ${inter_direction}     Outgoing
    Log To Console     Direction: ${inter_direction}
    # Verify Destination Address
    ${loc_dest_add} =    String.Replace String    ${LOC_WORKCARD_INTERACTION_DESTINATION_ADDRESS}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${inter_dest} =   Get Text    ${loc_dest_add}
    Should Be Equal     ${inter_dest}     ${agent_id}
    Log To Console     Destination Address: ${inter_dest}
    # Verify Originaling Address
    ${loc_ori_add} =    String.Replace String    ${LOC_WORKCARD_INTERACTION_ORIGINAL_ADDRESS}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${inter_ori} =   Get Text    ${loc_ori_add}
    Should Be Equal     ${inter_ori}     New Email
    Log To Console     Originaling Address: ${inter_ori}
    # Verify Contact ID
    ${loc_contact_id} =    String.Replace String    ${LOC_WORKCARD_INTERACTION_CONTACT_ID}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${inter_id} =   Get Text    ${loc_contact_id}
    Should Be Equal     ${inter_id}     ${EMPTY}
    Log To Console     Contact ID: EMPTY
    Click Element   ${loc_ori_add}
    Sleep   1

Verify Interaction Incoming
    [Arguments]    ${contact_info}   ${channel}     ${service}
    Agent Clicks On A Work Card     ${contact_info}
    ${work_card_id}=    Get WorkCard ID    ${contact_info}
    Open More Option    ${contact_info}
    Checks Interaction Details    ${work_card_id}
    # Verify Channel
    ${loc_channel} =    String.Replace String    ${LOC_WORKCARD_INTERACTION_CHANNEL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${inter_chanel} =   Get Text    ${loc_channel}
    Should Be Equal     ${inter_chanel}     ${channel}
    Log To Console     Channel: ${inter_chanel}
    # Verify Direction
    ${loc_direction} =    String.Replace String    ${LOC_WORKCARD_INTERACTION_DIRECTION}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${inter_direction} =   Get Text    ${loc_direction}
    Should Be Equal     ${inter_direction}     Incoming
    Log To Console     Direction: ${inter_direction}
    # Verify Service
    ${loc_service} =    String.Replace String    ${LOC_WORKCARD_INTERACTION_SERVICE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${inter_service} =   Get Text    ${loc_service}
    Should Be Equal     ${inter_service}     ${service}
    Log To Console     Service: ${inter_service}
    # Verify Originaling Address
    ${loc_ori_add} =    String.Replace String    ${LOC_WORKCARD_INTERACTION_ORIGINAL_ADDRESS}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${inter_ori} =   Get Text    ${loc_ori_add}
    Should Be Equal     ${inter_ori}     ${contact_info}
    Log To Console     Originaling Address: ${inter_ori}
    # Verify Contact ID
    ${loc_contact_id} =    String.Replace String    ${LOC_WORKCARD_INTERACTION_CONTACT_ID}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${inter_id} =   Get Text    ${loc_contact_id}
    Should Contain     ${workcard_id}    ${inter_id}
    Log To Console     Contact ID: ${inter_id}
    Click Element   ${loc_contact_id}
    Sleep   1
#
Verify Have No Presenting Contact
    Wait Until Element Is Not Visible   ${LOC_WORKCARD_ACCEPT_CONTACT_BUTTON}   20
    Log To Console   Agent Have No Presenting Contact
    Sleep   1

Verify Working Contact Is Not Available On Interaction Area
    [Documentation]    Verify Working Contact Dissapear On Interaction Area
    [Arguments]    ${contact_info}
    ${workcard_header_title_locator}=    String.Replace String    ${LOC_WORKCARD_HEADER_TITLE}    ${CONTACT_INFO_VAR}    ${contact_info}
#    Wait Until Element Is Not Visible    ${locator}     timeout=${TIMEOUT_MEDIUM}
    Wait Until Keyword Succeeds    ${TIMEOUT_MEDIUM}    10s    Page Should Not Contain Element    ${workcard_header_title_locator}

Verify Activity Code
    [Arguments]    ${contact_info}    ${activity_name}
    Agent Clicks On A Work Card     ${contact_info}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_txt_activity} =    String.Replace String    ${LOC_WORKCARD_TXT_ACTIVITY}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${activity_code} =   Get Element Attribute    ${loc_txt_activity}    aria-label
    Should Contain   ${activity_code}   ${activity_name}
    Sleep   1

Verify Disposition Code
    [Arguments]    ${contact_info}    ${disposition_name}
    Agent Clicks On A Work Card     ${contact_info}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_txt_disposition} =    String.Replace String    ${LOC_WORKCARD_TXT_DISPOSITION}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${disposition_code} =   Get Element Attribute    ${loc_txt_disposition}    aria-label
    Should Contain   ${disposition_code}   ${disposition_name}
    Sleep   1

####################################################################################
###   Webchat ###
Agent sends Message to Customer
   [Arguments]    ${contact_info}    ${message}
   WorkCard.Agent Clicks On A Work Card   ${contact_info}
   Sleep    1
   ${workcard_id} =    Get WorkCard ID    ${contact_info}
   ${loc_type_mess}=    String.Replace String    ${LOC_TYPE_A_MESSAGE}    ${WORKCARD_ID_VAR}    ${workcard_id}
   Wait Until Element Is Visible    ${loc_type_mess}    10s
   Click Element    ${loc_type_mess}
   Input Text    ${loc_type_mess}  ${message}
   Sleep    2
   ${check_char_count} =    Characters Count     ${message}
   Run Keyword If    ${check_char_count}<0    Verify Characters Count   ${contact_info}   ${message}
   Sleep    1
   ${loc_send_mess}=    String.Replace String    ${LOC_SEND_MESSAGE}    ${WORKCARD_ID_VAR}    ${workcard_id}
   Wait Until Element Is Visible    ${loc_send_mess}     15s
   Click Element    ${loc_send_mess}
   Sleep    1

#   08/04/2020
Agent Sends Auto Phrases
    [Arguments]    ${contact_info}      ${phrases}
    WorkCard.Agent Clicks On A Work Card   ${contact_info}
    Sleep    1
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_tab_phrases}=    String.Replace String    ${LOC_WORKCARD_TAB_PHRASE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible   ${loc_tab_phrases}   10s
    Click Element    ${loc_tab_phrases}
    Sleep   1
    ${loc_input_phrase} =    String.Replace String    ${LOC_WORKCARD_IPT_PHRASE_SEARCH}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible   ${loc_input_phrase}   10s
    Input Text      ${loc_input_phrase}    ${phrases}
    Sleep   1
    ${loc_send_phrase} =    String.Replace String    ${LOC_WORKCARD_BTN_SEND_PHRASE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible   ${loc_send_phrase}   10s
    Click Element   ${loc_send_phrase}
    Sleep   1
#
Agent Page Push URLs
    [Arguments]    ${contact_info}      ${url}
    WorkCard.Agent Clicks On A Work Card   ${contact_info}
    Sleep    1
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_tab_urls} =    String.Replace String    ${LOC_WORKCARD_TAB_URL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible   ${loc_tab_urls}   10s
    Click Element    ${loc_tab_urls}
    Sleep   1
    ${loc_input_url} =    String.Replace String    ${LOC_WORKCARD_IPT_URL_SEARCH}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible   ${loc_input_url}   10s
    Input Text      ${loc_input_url}    ${url}
    Sleep   1
    ${loc_send_url} =    String.Replace String    ${LOC_WORKCARD_BTN_SEND_URL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible   ${loc_send_url}   10s
    Click Element   ${loc_send_url}
    Sleep   1

#   20/03/2020
Verify Message On Agent Chat
    [Documentation]  Verify the last message on Agent chat display correctly
    [Arguments]    ${contact_info}    ${message}
    WorkCard.Agent Clicks On A Work Card   ${contact_info}
    Sleep    1
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_mess} =    String.Replace String    ${LOC_WORKCARD_CONTENT_CHAT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    # Get all message on agent chat
    @{message_elements}=    Get WebElements     ${loc_mess}
    ${message_total}=    Get Length    ${message_elements}
    ${max_length}=    Evaluate    ${message_total}-1
    Log To Console      message_total = ${message_total}
    ${last_message} =    Set Variable   @{message_elements}[${max_length}]
    ${last_message_text} =  Get Text    ${last_message}
    Log To Console      last_message_text = ${last_message_text}
#    Should Be Equal   ${last_message_text}    ${message}
    Should contain   ${last_message_text}    ${message}
    Sleep   1

# 4/5/2020
Get Transcript
    [Arguments]    ${contact_info}
    WorkCard.Agent Clicks On A Work Card   ${contact_info}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_mess} =    String.Replace String    ${LOC_WORKCARD_CONTENT_CHAT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    # Get all message on agent chat
    @{message_elements} =    Get WebElements     ${loc_mess}
    ${script_length}=    Get Length    ${message_elements}
    @{chatscript} =  Create List
    FOR     ${i}    IN RANGE    -1   ${script_length}
    \   ${message} =    Set Variable   @{message_elements}[${i}]
    \   ${mess} =  Get Text    ${message}
    \   Append To List    ${chatscript}    ${mess}
    [Return]    @{chatscript}

Verify Transferred Message
    [Arguments]    ${contact_info}    ${agent_full_name}    ${from_skill}   ${to_skill}
    ${mess1} =  String.Replace String   ${MESSAGE_NOTIFY_TRANSFER}   NAME_AGENT   ${agent_full_name}
    ${mess2} =  String.Replace String   ${mess1}   SKILLSET_FROM   ${from_skill}
    ${message} =  String.Replace String   ${mess2}   SKILLSET_TO   ${to_skill}
    WorkCard.Agent Clicks On A Work Card   ${contact_info}
    Sleep    1
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_mess} =    String.Replace String    ${LOC_WORKCARD_CONTENT_CHAT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    # Get all message on agent chat
    @{message_elements}=    Get WebElements     ${loc_mess}
    ${message_total}=    Get Length    ${message_elements}
    ${max_length}=    Evaluate    ${message_total}-1
    Log To Console      message_total = ${message_total}
    ${last_message} =    Set Variable   @{message_elements}[${max_length}]
    ${last_message_text} =  Get Text    ${last_message}
    Log To Console      last_message_text = ${last_message_text}
    Should Contain   ${last_message_text}    ${message}
    Sleep   1

#   21/04/2020
Verify Agent Label
    [Documentation]  Verify the last message on Agent chat display correctly
    [Arguments]     ${contact_info}     ${name_label}
    WorkCard.Agent Clicks On A Work Card   ${contact_info}
    Sleep    1
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    # Get all label on Agent chat
    ${loc_tab_label} =    String.Replace String    ${LOC_WORKCARD_LABEL_CHAT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    @{label_elements}=    Get WebElements     ${loc_tab_label}
    ${label_total}=    Get Length    ${label_elements}
    ${max_length_label}=    Evaluate    ${label_total}-1
    Log To Console      label_total = ${label_total}
    ${last_label} =    Set Variable   @{label_elements}[${max_length_label}]
    ${last_label_text} =  Get Text    ${last_label}
    Log To Console      last_label_text = ${last_label_text}
    Should Be Equal   ${last_label_text}    ${name_label}
    Sleep   1

#08/04/2020
Verify Customer Is Typing
    [Arguments]    ${alias_agent}    ${alias_cust}   ${notify_mess}
    Switch Browser    ${alias_cust}
    Wait Until Element Is Visible    ${LOC_WEBCHAT_CHAT_FIELD}     15s
    Click Element   ${LOC_WEBCHAT_CHAT_FIELD}
    Input Text    ${LOC_WEBCHAT_CHAT_FIELD}    Testing...
    Switch Browser    ${alias_agent}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_WORKCARD_MESSENGER_STATUS}     10s
    ${mess_status} =    Get Text   ${LOC_WORKCARD_MESSENGER_STATUS}
    Should contain     ${mess_status}      ${notify_mess}
#    Should be Equal     ${mess_status}      is typing...
    Log To Console      Verify status Customer is typing successfully
    Sleep   1
    Switch Browser    ${alias_cust}
    Click Element    ${LOC_WEBCHAT_BTN_SEND_BUTTON}
    Sleep   1

#   28/07/2020
Verify Notify Chat Message
    [Arguments]    ${notify_mess}
    Wait Until Element Is Visible    ${LOC_WORKCARD_MESSENGER_STATUS}     10s
    ${mess_status} =    Get Text   ${LOC_WORKCARD_MESSENGER_STATUS}
    Should contain     ${mess_status}      ${notify_mess}
    Log To Console      Verify Notify Chat Message successfully
    Sleep   1

#   28/7/2020
Verify Label Of Input Message Text
    [Arguments]    ${label}
    Wait Until Element Is Visible    ${LOC_WORKCARD_TYPE_A_MESSAGE}     10s
    ${get_label} =    Get element attribute  ${LOC_WORKCARD_TYPE_A_MESSAGE}     aria-label
    Should contain     ${get_label}      ${label}
    Log To Console      Verify Label Of Input Message Text successfully
    Sleep   1

Verify Customer Have Left Conversation
    [Arguments]    ${contact_info}
    WorkCard.Agent Clicks On A Work Card   ${contact_info}
    Sleep    1
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_type_mess}=    String.Replace String    ${LOC_TYPE_A_MESSAGE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Not Visible   ${loc_type_mess}    15s
    ${loc_disconnect} =     String.Replace String   ${LOC_WORKCARD_DISCONNECT}  ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_disconnect}     15s
    ${mess_status} =    Get Text   ${loc_disconnect}
    Should be Equal     ${mess_status}      has disconnected
    Log To Console      Customer have left the conversation
    Sleep   1

Replace String In Element Participant Agent 2
    [Arguments]    ${aria_owns}    ${part3}
    ${loc_part3_cust} =     String.Replace String    ${LOC_WORKCARD_BTN_PART3_CUSTOMER}    ${GET_ARIA_OWN}    ${aria_owns}
    ${loc_text_part3_cust} =    Get Text    ${loc_part3_cust}
    Should Be Equal     ${loc_text_part3_cust}      ${part3}
    ${loc_part1_cust_label} =     String.Replace String    ${LOC_WORKCARD_BTN_PART3_CUSTOMER_LABEL}    ${GET_ARIA_OWN}    ${aria_owns}
    ${loc_text_part1_cust_label} =    Get Text    ${loc_part3_cust_label}
    Should Be Equal     ${loc_text_part3_cust_label}      Agent

Verify Participants List
    [Arguments]    ${contact_info}      ${part1}     ${part2}   ${part3}=${EMPTY}
    WorkCard.Agent Clicks On A Work Card   ${contact_info}
    Sleep    1
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_btn_participant} =    String.Replace String    ${LOC_WORKCARD_BTN_PARTICIPANT_LIST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Click Element   ${loc_btn_participant}
    ${aria_owns} =   Get Element Attribute      ${loc_btn_participant}      aria-owns
    Sleep    1
    # Customer
    ${loc_part1_cust} =     String.Replace String    ${LOC_WORKCARD_BTN_PART1_CUSTOMER}    ${GET_ARIA_OWN}    ${aria_owns}
    ${loc_text_part1_cust} =    Get Text    ${loc_part1_cust}
    Should Be Equal     ${loc_text_part1_cust}      ${part1}
    ${loc_part1_cust_label} =     String.Replace String    ${LOC_WORKCARD_BTN_PART1_CUSTOMER_LABEL}    ${GET_ARIA_OWN}    ${aria_owns}
    ${loc_text_part1_cust_label} =    Get Text    ${loc_part1_cust_label}
    Should Be Equal     ${loc_text_part1_cust_label}      Customer
    # Agent 1
    ${loc_part2_agent} =     String.Replace String    ${LOC_WORKCARD_BTN_PART2_AGENT}    ${GET_ARIA_OWN}    ${aria_owns}
    ${loc_text_part2_agent} =    Get Text    ${loc_part2_agent}
    Should Be Equal     ${loc_text_part2_agent}      ${part2}
    ${loc_part2_agent_label} =     String.Replace String    ${LOC_WORKCARD_BTN_PART2_AGENT_LABEL}    ${GET_ARIA_OWN}    ${aria_owns}
    ${loc_text_part2_agent_label} =    Get Text    ${loc_part2_agent_label}
    Should Be Equal     ${loc_text_part2_agent_label}      Agent
    # Agent 2
    Run Keyword Unless    '${part3}'=='${EMPTY}'    Replace String In Element Participant Agent 2    ${aria_owns}     ${part3}
    Click Element   ${loc_part1_cust}
    Sleep   1
    Log To Console      end end end

# 15/04/2020
Verify Characters Count
    [Arguments]    ${contact_info}  ${message}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_type_mess}=    String.Replace String    ${LOC_TYPE_A_MESSAGE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep    1
    ${loc_char_count} =     String.Replace String    ${LOC_WORKCARD_CHARACTER_COUND}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${text_char_count} =    Get Text    ${loc_char_count}
    ${char_mess_count} =    Get Length    ${message}
    ${char_count_display} =    Evaluate    10000-${char_mess_count}
    Should Be Equal     ${text_char_count}   Characters left: ${char_count_display}
    Log To Console    Characters left: ${char_count_display}
    # Verify Send message button is not display
    ${loc_send_mess} =    String.Replace String    ${LOC_SEND_MESSAGE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${state_disable_send_button} =    Get Element Attribute     ${loc_send_mess}    disabled
    Should Be Equal     ${state_disable_send_button}    true
    Log to console  Send button is disabled
    Sleep   0.5

Characters Count
    [Arguments]     ${message}
    ${char_mess_count} =    Get Length    ${message}
    ${char_count_display} =    Evaluate    10000-${char_mess_count}
    [Return]  ${char_count_display}

# 29/4/2020
Verify Scrollbar Chat
    [Arguments]    ${contact_info}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_scroll_chat} =    String.Replace String    ${LOC_WORKCARD_SCROLL_CHAT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${get_style_attribute} =    Get Element Attribute     ${loc_scroll_chat}    style
    Log To Console   Style attribute is: ${get_style_attribute}
    Sleep   1

#   13/05/2020
Verify Skillset Of Contact
    [Arguments]    ${contact_info}   ${skillset}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_label_skillset}=    String.Replace String    ${LOC_WORKCARD_LABEL_SKILLSET}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible   ${loc_label_skillset}    15s
    ${get_skillset} =   Get Text    ${loc_label_skillset}
    Run Keyword If   '${get_skillset}'=='${skillset}'    Log To Console    The Skillset on Workcard is ${get_skillset}
    Run Keyword Unless   '${get_skillset}'=='${skillset}'    Fail    Skillset displays on Workcard is not true. It displays ${get_skillset} instead of ${skillset}
    Sleep   1

########################################################################################################################
#   =========================================  INTERACTION LOG KEYWORDS ================================================
########################################################################################################################

Interaction Log Call
    [Documentation]    Login Agent to Workspaces
    [Arguments]     ${uri_phone}
    # click Interaction Log button
    Wait Until Page Contains Element    ${LOC_INTERACTIONLOG_BTN_INTERACTIONLOG}    ${TIMEOUT_MEDIUM}
    Click Element  ${LOC_INTERACTIONLOG_BTN_INTERACTIONLOG}
    Sleep  1
     Wait Until Page Contains Element    ${LOC_INTERACTIONLOG_LINE_CALL}    ${TIMEOUT_MEDIUM}
    Click Element  ${LOC_INTERACTIONLOG_LINE_CALL}
    Sleep  1
    # Choose customer's call
    ${interaction_call} =    String.Replace String    ${LOC_INTERACTIONLOG_BTN_CALL}    ${PHONE_URI}    ${uri_phone}
    Wait Until Element Is Visible    ${interaction_call}    10s
    Click Element   ${interaction_call}
    Sleep   1

########################################################################################################################
#   ==============================================  LOGIN KEYWORDS =====================================================
########################################################################################################################

Login Agent
    [Documentation]    Login Agent to Workspaces
    [Arguments]     ${browser_type}  ${browser_alias}  ${agent_username}  ${agent_password}
    ###########################
     ${options}=    Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    --ignore-certificate-errors --incognito
    Create WebDriver    Chrome    ${browser_alias}      chrome_options=${options}
    Go To    ${WORKSPACE_URL}
    ###########################
    Maximize Browser Window
    # Waiting login page
    Wait Until Page Contains Element    ${LOC_WORKSPACE_LOGIN_BTN_SIGNIN}    ${TIMEOUT_MEDIUM}
    # Verify login page
    ${str_sign_in} =    Get Text    ${LOC_WORKSPACE_LOGIN_AGENT}
    Should Be Equal    ${str_sign_in}    Login Agent
    # Input username of agent
    Input Text       ${LOC_WORKSPACE_LOGIN_IPT_USERNAME}    ${agent_username}
    # Input password of agent
    Input Password   ${LOC_WORKSPACE_LOGIN_IPT_PASSWORD}    ${agent_password}
    Sleep    ${TIMEOUT_EXTRA_SHORT}
    # Click Sign in button
    Click Element    ${LOC_WORKSPACE_LOGIN_BTN_SIGNIN}
    Sleep   2

Activate Agent
    [Documentation]    Activate Agent
    [Arguments]
    # Waiting activate page
    Wait Until Element Is Visible    ${LOC_WORKSPACE_LOGIN_BTN_ACTIVATE}    ${TIMEOUT_MEDIUM}
    Sleep    ${TIMEOUT_EXTRA_SHORT}
    Click Element    ${LOC_WORKSPACE_LOGIN_BTN_ACTIVATE}
    Sleep   1

Verify Ativate Page Should Display Full Name Of Agent
    [Documentation]    Verify Ativate page should display full name of Agent
    [Arguments]     ${agent_username}
    Wait Until Page Contains Element    ${LOC_WORKSPACE_LOGIN_LABEL_AGENT}    ${TIMEOUT_MEDIUM}
    ${str_lable_agent}=   Get Text    ${LOC_WORKSPACE_LOGIN_LABEL_AGENT}
    Should Be Equal    ${str_lable_agent}    ${agent_username}

#   19/03/2020
Verify Error Login
    Wait Until Page Contains Element    ${LOC_WORKSPACE_ERROR_HEADER}    ${TIMEOUT_MEDIUM}
    ${get_error_header}=   Get Text    ${LOC_WORKSPACE_ERROR_HEADER}
    Should Be Equal    ${get_error_header}     Error happened!

    Wait Until Page Contains Element    ${LOC_WORKSPACE_ERROR_BODY}    ${TIMEOUT_MEDIUM}
    ${get_error_body}=   Get Text    ${LOC_WORKSPACE_ERROR_BODY}
    Should Be Equal    ${get_error_body}     Failed to authenticate user at domain. Please check your username and password.

########################################################################################################################
#   =========================================  WIDGET MY AGENT KEYWORDS ================================================
########################################################################################################################

Observe Contact
    [Arguments]    ${agent_name}    ${contact_info}
    Wait Until Element Is Visible    ${LOC_MYAGENT_SEARCH_AGENT}    timeout=10
    Input text    ${LOC_MYAGENT_SEARCH_AGENT}   ${agent_name}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_MYAGENT_DISPLAY_AGENT}    timeout=10
    ${check_work_item_observe} =     Run Keyword And Return Status    Wait Until Element Is Visible    ${LOC_WORK_ITEM_OBSERVE}    timeout=20
    Run Keyword If    '${check_work_item_observe}'=='False'    Click Element   ${LOC_MYAGENT_DISPLAY_AGENT}
    ${loc_button_observe} =    String.Replace String    ${LOC_MYAGENT_BTN_OBSERVE}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Element Is Visible    ${loc_button_observe}    timeout=20
    Click Element    ${loc_button_observe}
    Sleep   1
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Element    ${LOC_BTN_END_OBSERVE}
    Sleep   1

# 14/09/2020
Change Agent Status
    [Arguments]    ${agent_name}    ${to_status}
    Wait Until Element Is Visible    ${LOC_MYAGENT_SEARCH_AGENT}    timeout=10
    Input text    ${LOC_MYAGENT_SEARCH_AGENT}   ${agent_name}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_MYAGENT_DISPLAY_AGENT}    timeout=10
    Click Element    ${LOC_MYAGENT_DISPLAY_AGENT}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_MYAGENT_BTN_STATUS_AGENT}    timeout=10
    Click Element    ${LOC_MYAGENT_BTN_STATUS_AGENT}
    Sleep   1
    ${loc_change_status} =    String.Replace String    ${LOC_MYAGENT_SELECT_STATUS_AGENT}    ${STATUS_AGENT}    ${to_status}
    Wait Until Element Is Visible    ${loc_change_status}    timeout=20
    Click Element    ${loc_change_status}
    Sleep   1

#  16/09/2020
Verify Agent Status
    [Arguments]    ${agent_name}    ${status}
    Wait Until Element Is Visible    ${LOC_MYAGENT_SEARCH_AGENT}    timeout=10
    Input text    ${LOC_MYAGENT_SEARCH_AGENT}   ${agent_name}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_MYAGENT_DISPLAY_AGENT}    timeout=10
    Click Element    ${LOC_MYAGENT_DISPLAY_AGENT}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_MYAGENT_BTN_STATUS_AGENT}    timeout=10
    Click Element    ${LOC_MYAGENT_BTN_STATUS_AGENT}
    Sleep   1
    ${loc_status} =    String.Replace String    ${LOC_MYAGENT_SELECT_STATUS_AGENT}    ${STATUS_AGENT}    ${status}
    ${start_work_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${loc_status}    timeout=45s
    Run Keyword If    '${start_work_status}'=='True'    Log To console   Status of Agent is ${status}
    ...   ELSE   Fail   Agent does not change status
    Sleep    1

########################################################################################################################
#   =========================================  NAVIGATION MENU KEYWORDS ================================================
########################################################################################################################

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
    Click Element    ${LOC_WORKSPACE_NAVIGATION_BTN_CUSTOMER_SEARCH}
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

########################################################################################################################
#   ============================================  PHONEBOOK KEYWORDS ===================================================
########################################################################################################################

#   9/12/2020
Search Phonebook
    [Arguments]    ${filter1}=${EMPTY}    ${filter2}=${EMPTY}    ${filter3}=${EMPTY}
    Wait Until Element Is Visible    ${PHONEBOOK_BTN_SEARCH}   timeout=5
    Click element   ${PHONEBOOK_BTN_SEARCH}
    # filter1    All, Custom Contacts, Favorite, Speed Dial
    Wait Until Element Is Visible    ${PHONEBOOK_FILTER1}   timeout=5
    Click Element   ${PHONEBOOK_FILTER1}
    Run keyword unless    ${filter3}=='${EMPTY}'    Select From List By Label   ${PHONEBOOK_FILTER1_SELECT}    ${filter1}
    Sleep   0.5
    Click Element   ${PHONEBOOK_FILTER1}
    Sleep   0.5

    # filter2    Display Name, Last Name, First Name, Phone, Mobile, IP Phone, Other Phone, Email, Department, Treet, City, State, PostalCode
    Wait Until Element Is Visible    ${PHONEBOOK_FILTER2}   timeout=5
    Click Element   ${PHONEBOOK_FILTER2}
    Run keyword unless    ${filter3}=='${EMPTY}'    Select From List By Label   ${PHONEBOOK_FILTER2_SELECT}    ${filter2}
    Sleep   0.5
    Click Element   ${PHONEBOOK_FILTER2}
    Sleep   0.5

    # filter3   input text
    Wait Until Element Is Visible    ${PHONEBOOK_FILTER3}   timeout=5
    Run keyword unless    ${filter3}=='${EMPTY}'    Click Element   ${PHONEBOOK_FILTER3}
    ${filter3_remove} =    Remove String    ${filter3}    "
    Input text   ${PHONEBOOK_FILTER3}   ${filter3_remove}
    Sleep   1
    Wait Until Element Is Visible    ${PHONEBOOK_BTN_SEARCH}   timeout=5
    Click element   ${PHONEBOOK_BTN_SEARCH}
    Sleep   1

#   18/12/2020
Create New Contact Phonebook
	Wait Until Element Is Visible    ${PHONEBOOK_BTN_NEW_CONTACT}   timeout=5
	Click element	${PHONEBOOK_BTN_NEW_CONTACT}
	Wait Until Element Is Visible    ${PHONEBOOK_ENTER_FIELD_LABEL}   timeout=5
	Sleep	1

#   18/12/2020
Delete Contact Phonebook
	Wait Until Element Is Visible    ${PHONEBOOK_BTN_DELETE_CONTACT}   timeout=5
	Click element	${PHONEBOOK_BTN_DELETE_CONTACT}
	@{phonebook_row} =    Get WebElements     ${PHONEBOOK_TABLE_ROW}
    ${phonebook_row_total} =    Get Length    ${phonebook_row}
    Should Be Equal    '${phonebook_row_total}'    '0'
	Sleep	1

#   18/12/2020
Call Out By Phonebook
    Wait Until Element Is Visible    ${PHONEBOOK_BTN_CALL_OUT}   timeout=5
	Click element	${PHONEBOOK_BTN_CALL_OUT}
	Wait Until Element Is Visible    ${PHONEBOOK_BTN_END_CALL}   timeout=10
	Sleep	1

Save Contact Phonebook
	Wait Until Element Is Visible    ${PHONEBOOK_BTN_SAVE_NEW_CONTACT}   timeout=5
	Click element	${PHONEBOOK_BTN_SAVE_NEW_CONTACT}
	Wait Until Element Is Visible    ${PHONEBOOK_BTN_NEW_CONTACT}   timeout=5
	Sleep	1

Edit Contact Phonebook
	Wait Until Element Is Visible    ${PHONEBOOK_BTN_EDIT_CONTACT}   timeout=5
	Click element	${PHONEBOOK_BTN_EDIT_CONTACT}
	Wait Until Element Is Visible    ${PHONEBOOK_ENTER_FIELD_LABEL}   timeout=5
	Sleep	1

Edit Field Contact Phonebook
    [Arguments]    ${field_name}    ${content}=${EMPTY}
	${loc_field_edit} =    Format String    ${PHONEBOOK_INPUT_FIELD_CONTACT}    ${field_name}
	Sleep   0.5
	Wait Until Element Is Visible    ${loc_field_edit}   timeout=5
	${edit_content} =    Remove String    ${content}    "
	Input text	 ${loc_field_edit}	 ${edit_content}
	Sleep	0.5

Select Tagging Phonebook
    [Arguments]    ${tag_name}    ${status}
    ${loc_status} =      Set Variable If      '${status}'=='check'     true     '${status}'=='uncheck'     false
    ${loc_tag_name} =    String.Format String    ${PHONEBOOK_CHECK_TAGGING_CONTACT}    ${tag_name}
	Sleep   0.5
	Wait Until Element Is Visible    ${loc_tag_name}   timeout=5
	${get_status} =   Get Element Attribute    ${loc_tag_name}    aria-checked
	${get_status2} =    Convert To String    ${get_status}
	Run Keyword Unless   '${get_status2}'=='${loc_status}'    Click Element    ${loc_tag_name}
#	Run Keyword If   Should Not Be Equal As Strings    '${get_status}'    '${loc_status}'    Click Element    ${loc_tag_name}
	Sleep   0.5

Sort Phonebook
    [Arguments]    ${filter}
    ${loc_sort} =    String.Format String    ${PHONEBOOK_SORT_COLUMN}    ${filter}
    Wait Until Element Is Visible    ${loc_sort}   timeout=5
    Click Element    ${loc_sort}
    Sleep   0.5

Filter Page Phonebook
    [Arguments]    ${row_number}
    Wait Until Element Is Visible    ${PHONEBOOK_ROW_PER_PAGE}   timeout=5
    Click Element    ${PHONEBOOK_ROW_PER_PAGE}
    Sleep   0.5
    ${loc_row} =    String.Format String    ${PHONEBOOK_SELECT_ROW_PER_PAGE}    ${row_number}
    Wait Until Element Is Visible    ${loc_row}   timeout=5
    Click Element    ${loc_row}
    Sleep   0.5

#   9/12/2020
Verify Phonebook Data
    [Arguments]    ${filter2}=${EMPTY}    ${content}=${EMPTY}
    ${index_filter2} =   get index from list    ${filter2_list}    ${filter2}
    Sleep   0.5
    ${loc_index_conent} =    String.Format String    ${PHONEBOOK_TABLE_ROW_CONENT}    ${index_filter2}
    Sleep   0.5
    Wait Until Element Is Visible    ${loc_index_conent}   timeout=5
    ${get_content} =    Get text    ${loc_index_conent}
    ${filter3_remove} =    Remove String    ${content}    "
    Should Be Equal    '${get_content}'    '${filter3_remove}'
    Sleep   0.5

Verify Tagging Phonebook
    [Arguments]    ${tag_name}    ${status}
    ${loc_status} =      Set Variable If      '${status}'=='check'     filled      '${status}'=='uncheck'       outline
    ${loc_tag_name} =    String.Format String    ${PHONEBOOK_BTN_TAGGING_CONTACT}    ${tag_name}     ${loc_status}
	Sleep   0.5
	Wait Until Element Is Visible    ${loc_tag_name}   timeout=7
	Sleep   0.5

########################################################################################################################
#   ============================================  SCREENPOP KEYWORDS ===================================================
########################################################################################################################

# 16/03/2020
Verify Screenpop Name Displays
    [Documentation]    Verify Screenpop name display on taskbar in Screenpop page
    [Arguments]    ${screenpop_name}
    # Get all tab screenpop
    ${screenpop_all_name}=    Set Variable    ${EMPTY}
    @{screenpop_spans}=    Get WebElements    ${LOC_SCREENPOP_LIST_SPAN_SCREENPOP}
    :FOR    ${screenpop_span}     IN    @{screenpop_spans}
    \    ${screenpop_txt}=    Get Text    ${screenpop_span}
    \    ${screenpop_all_name}=    Catenate    ${screenpop_all_name}    ${screenpop_txt}
    Log To Console    screenpop = ${screenpop_all_name}
    ${screenpop_name}=     String.Convert To Uppercase    ${screenpop_name}
    Should Contain    ${screenpop_all_name}    ${screenpop_name}

########################################################################################################################
#   =========================================  WIDGET SETTINGS KEYWORDS ================================================
########################################################################################################################

# ================================================ ABOUT ===============================================================
# 03/03/2020
Verify Version And Build
    [Arguments]    ${version}   ${build}
    # Verify Version
    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_ABOUT_VERSION}    timeout=10
    ${loc_version} =     Get Text   ${LOC_WIDGETSETTINGS_SETTINGS_ABOUT_VERSION}
    Should Be Equal     ${loc_version}      ${version}
    Sleep   1
    # Verify Build
    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_ABOUT_BUILD}    timeout=10
    ${loc_build} =    Get Text   ${LOC_WIDGETSETTINGS_SETTINGS_ABOUT_BUILD}
    Should Be Equal     ${loc_build}      ${build}
    Sleep   1

# =========================================== EMAIL SIGNATURE ==========================================================

#   3/6/2020
Save email signature
    [Documentation]     Click Save email signature button
    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BTN_SAVE}    timeout=30
    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BTN_SAVE}
    Sleep   1

#   08/05/2020
Open Email Signature Tab
    [Documentation]     Open Email signature tab
    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE}    timeout=30
    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE}
    Sleep   1

# 03/03/2020
#Create Email Signature
#    [Arguments]    ${email_signature}
#    # Clear old email signature
#    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}    timeout=30
#    Run keyword if  '${email_signature}'=='${EMPTY}'    Input Text   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}   ${EMPTY}
#    ...     ELSE    Press Keys  ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}    ${email_signature}
#    Sleep   2

#   07/05/2020
Auto Insert Email Signature
    [Arguments]    ${state}
    Wait Until Element Is Visible   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_CHECK_AUTO_INSERT}  timeout=10
    ${check_state} =    Get Element Attribute   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_CHECK_AUTO_INSERT}  aria-checked
    Run Keyword Unless   '${check_state}'=='${state}'   Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_CHECK_AUTO_INSERT}
    Sleep   0.5

#   08/05/2020
Bold Email Signature
    [Arguments]    ${state}
    Wait Until Element Is Visible   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BOLD}  timeout=30
    ${check_state} =    Get Element Attribute   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BOLD}  class
    ${get_state} =   Run Keyword If     '${check_state}'=='toolbar-actions__item aoc-bold bold toolbar-actions__item--highlight'    Set Variable    true
    ${get_state} =   Run Keyword If     '${check_state}'=='toolbar-actions__item aoc-bold bold'    Set Variable    false
    Sleep   1
    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}    timeout=30
    Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}
    Run Keyword Unless   '${get_state}'=='${state}'   Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BOLD}
    Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}
    Input Text  ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}    123123
    Sleep   1

Choose Editor Signature
    [Arguments]    ${btn}
    @{get_all_edit_btn} =    Get WebElements    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_ANY_EDIT_BTN}
    ${btn_total}=    Get Length    ${get_all_edit_btn}
    Sleep   0.5
    FOR     ${i}    IN RANGE    -1   ${btn_total}
    \   ${name_btn} =    Get Element Attribute    ${get_all_edit_btn}[${i}]     aria-label
    \   Run Keyword If  '${name_btn}'=='${btn}'   Run keywords   Click Element   ${get_all_edit_btn}[${i}]   AND   Exit For Loop
    Sleep   1

Choose Font Size Signature
    [Arguments]    ${font_size}
    Wait Until Element Is Visible   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE}  20s
    Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE}
    Sleep   1
    Run Keyword If  '${font_size}'=='8' or '${font_size}'=='Small'   Run Keywords    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE_8}    AND   Sleep   1
    ...     ELSE IF  '${font_size}'=='12' or '${font_size}'=='Normal'   Run Keywords    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE_12}    AND   Sleep   1
    ...     ELSE IF  '${font_size}'=='14' or '${font_size}'=='Large'    Run Keywords    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE_14}    AND   Sleep   1
    ...     ELSE IF  '${font_size}'=='16' or '${font_size}'=='Huge'   Run Keywords    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE_16}    AND   Sleep   1
    Sleep   1

#   2/6/2020
Insert Link Signature
    [Arguments]    ${link}
    Choose Editor Signature   Insert Link
    Wait Until Element Is Visible   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_EDIT_LINK}  20s
    Input Text   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_EDIT_LINK}   ${link}
    Sleep   1
    Wait Until Element Is Visible   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_SUBMIT_LINK}  20s
    Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_SUBMIT_LINK}
    Sleep   1

#   15/5/2020
Undo Email Signature
    [Arguments]    ${email_signature}
    Wait Until Element Is Visible   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_UNDO}  10s
    Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_UNDO}
    Sleep   1
    # verify undo
    ${length_sign} =  get length   ${email_signature}
    # take the last word of ${email_signature}
    ${last_word} =   Fetch From Right    ${email_signature}   ${SPACE}
    ${leng_last_word} =   get length    ${last_word}
    # cut the last word of ${email_signature
    ${index_last_word} =   evaluate   ${length_sign}-${leng_last_word}-1
    ${new_sign} =   Get Substring   ${email_signature}   0    ${index_last_word}
    # get new signature from web
    ${content_signature} =   Get Text   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_CONTENT}
    Should be equal   ${content_signature}    ${new_sign}
    Sleep   1

#   15/5/2020
Redo Email Signature
    [Arguments]    ${email_signature}
    Wait Until Element Is Visible   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_REDO}  10s
    Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_REDO}
    Sleep   1
    ${content_signature} =   Get Text   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_CONTENT}
    Should be equal   ${content_signature}    ${email_signature}
    Sleep   1

#================================================== LANGUAGE ===========================================================
#   27/07/2020
Select Language
    [Arguments]    ${language}
    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE}    timeout=30
    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE_SELECT}    timeout=30
    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE_SELECT}
    Sleep   1
    @{list_language} =    Get WebElements   ${LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE_SELECT_LIST_NAME}
    @{loc_list_language} =  Get WebElements   ${LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE_SELECT_LIST}
    ${length_list_language} =    Get Length   ${list_language}
    :FOR    ${i}    IN RANGE    0   ${length_list_language}
    \   ${get_text_language} =   Get Text    ${list_language}[${i}]
    \   Run Keyword If   '${get_text_language}'=='${language}'    Click Element     ${loc_list_language}[${i}]
    \   Run Keyword If   '${get_text_language}'=='${language}'     Exit For Loop
    Sleep   1

########################################################################################################################
#   ===========================================  WEBSTATISTIC KEYWORDS =================================================
########################################################################################################################

#   29/12/2020
Select Skillset Statistic
    [Arguments]    ${skillset}
    ${loc_select_skillset} =    String.Format String    ${LOC_WEBSTATISTIC_SELECT_SKILLSET}    ${skillset}
    Sleep   0.5
    Wait Until Element Is Visible    ${loc_select_skillset}   timeout=5
    Click Element    ${loc_select_skillset}
    Sleep   0.5

#   30/12/2020
Select Chart Type Statistic
    [Arguments]    ${chart_type}
    ${class_chart_type} =    String.Format String    ${CLASS_BTN_CHART}    ${chart_type}
	Sleep   0.5
	Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_BTN_CHART}   timeout=5
	${get_class_chart_type} =   Get Element Attribute    ${LOC_WEBSTATISTIC_BTN_CHART}    class
	Run Keyword Unless   '${class_chart_type}'=='${get_class_chart_type}'    Click Element    ${LOC_WEBSTATISTIC_BTN_CHART}
	Sleep   0.5

#   11/1/2021
Check Alert Statistic
    [Arguments]    ${status}
	Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_BTN_CHART}   timeout=5
	${get_alert_status} =   Get Element Attribute    ${LOC_WEBSTATISTIC_ALERT}    aria-checked
	Run Keyword Unless   '${status}'=='${get_alert_status}'    Click Element    ${LOC_WEBSTATISTIC_ALERT}
	Sleep   0.5

#   29/12/2020
Verify Chart Statistic
   [Arguments]      ${chart_name}   ${Reference_Image_Path}    ${Test_Image_Path}
    WebStatisticLocator.DownloadChart   ${chart_name}     ${Test_Image_Path}
    Sleep   1
    ${check_compare_images} =    WebStatisticLocator.compare_images    ${Reference_Image_Path}    ${Test_Image_Path}
    Log To Console      ${check_compare_images}
    Run Keyword if   '${check_compare_images}'=='False'    Fail    Chart displays wrong data

#   11/1/2021
Verify Service Level
    [Arguments]      ${percentage}
    Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_SERVICE_LEVEL}   timeout=5
    ${get_percent} =     Get Text    ${LOC_WEBSTATISTIC_SERVICE_LEVEL}
    Should Be Equal     ${percentage}    ${get_percent}
    Sleep   0.5

########################################################################################################################
#   =========================================  KEYWORDS =================================================
########################################################################################################################

########################################################################################################################
#   =========================================  KEYWORDS =================================================
########################################################################################################################

########################################################################################################################
#   =========================================  KEYWORDS =================================================
########################################################################################################################