##### WorkCard_v2.robot #####

*** Settings ***
Resource   ../../../resources/SystemResources.robot
Resource   ../agent_toolbar/AgentToolbar.robot

Variables    WorkCardLocator.py
Variables   ../../web_chat/WebChatLocator.py

*** Keywords ***
########################################################################################################################
############################################  UTILITY KEYWORDS #########################################################
########################################################################################################################

#Get WorkCard ID
#    [Documentation]    Get WorkCard ID by contact info (name, email or phone number) of workcard.
#    [Arguments]    ${contact_info}
#    ${locator}=    String.Replace String    ${LOC_WORKCARD_ID}    ${CONTACT_INFO_VAR}    ${contact_info}
#    Wait Until Element Is Visible    ${locator}    5s
#    ${workcard_id}=     Get Element Attribute    ${locator}    card-id
#    [Return]    ${workcard_id}

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

########################################################################################################################
############################################  KEYWORDS ##########################################################
########################################################################################################################

#Agent Clicks On A Work Card
#    [Documentation]    Agent Finds And Clicks On A Work Card
#    [Arguments]    ${contact_info}
#    ${workcard_header_title_locator} =    String.Replace String    ${LOC_WORKCARD_HEADER_TITLE}    ${CONTACT_INFO_VAR}    ${contact_info}
#    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    2s    Page Should Contain Element    ${workcard_header_title_locator}
#    Click Element    ${workcard_header_title_locator}
#    Sleep   1

Agent Clicks On A Work Card
    [Documentation]    Agent Finds And Clicks On A Work Card
    [Arguments]    ${contact_info}=${EMPTY}
    ${loc_workcard1} =    String.Replace String    ${LOC_WORKCARD}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    10s    Page Should Contain Element    ${loc_workcard1}
    Click Element    ${loc_workcard1}
    Sleep   1


Agent Accepts A Contact
    [Documentation]    Agent Finds And Accepts A Contact Session
    [Arguments]    ${contact_info}      ${timeout}=${CONTACT_ROUTING_TIMEOUT}
    ${accept_contact_button_locator}=    String.Format String    ${LOC_WORKCARD_BTN_ACCEPT_NEW_CONTACT}    ${contact_info}
#    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    2s    Run Keywords
#    ...     Page Should Contain Element    ${accept_contact_button_locator}      loglevel=NONE      AND
#    ...     ${agent status}=    Get Current Agent State     AND
#    ...     Run Keyword If    '${agent status}'=='Not Ready'    Agent Go Ready
    ${time}=     Convert Time      ${timeout}
    FOR    ${index}    IN RANGE    ${time}
        ${status}   ${value}=     Run Keyword And Ignore Error        Page Should Contain Element    ${accept_contact_button_locator}     loglevel=NONE
        Exit For Loop If    '${status}'=='PASS'
        ${agent status}=    Get Current Agent State
        Run Keyword If    '${agent status}'=='Not Ready'    Run Keyword And Ignore Error    Agent Go Ready      timeout=10
        Sleep    1
    END
    Click Element    ${accept_contact_button_locator}
    Sleep    ${TIMEOUT_EXTRA_SHORT}
    ${end_contact_button_locator}=    String.Format String      ${LOC_WORKCARD_BTN_END_CONTACT_VERIFY}    ${contact_info}
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
    FOR   ${i}  IN RANGE   0   ${count_hold}
       Click Element   ${get_all_hold_btn}[${i}]
       Sleep   2
       Click Element   ${LOC_WORKCARD_BTN_END_ANY_CONTACT}
       Sleep   2
       ${check_interaction_btn} =     Run Keyword And Return Status    Wait Until Element Is Visible    ${LOC_WORKCARD_BTN_END_INTERACTION}    timeout=10
       Run Keyword If    '${check_interaction_btn}'=='True'    Click Element   ${LOC_WORKCARD_BTN_END_INTERACTION}
       Sleep   1
    END
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

# Huy 8/6/2021
Transfer To Service
    [Documentation]    Click Transfer To Service and choose service to transfer contact. (for MM contact)
    [Arguments]    ${contact_info}    ${service_name_to_transfer}
    ${card id}=      String.Format String    ${F_LOC_WORKCARD_ID}        ${contact_info}
    Wait Until Element Is Visible    ${card id}     timeout=15s
    ${id}=      Get Element Attribute    ${card id}    interaction-id
    ${transfer button}=      String.Format String    ${F_LOC_WORKCARD_BTN_XFER}      ${contact_info}
    Wait Until Element Is Visible    ${transfer button}     timeout=15s
    Sleep    1
    Click Element    ${transfer button}     action_chain=True
    ${service}=     Set Variable    id:ow_navigate_next_Transfer_${id}
    Wait Until Element Is Visible   ${service}  5
    Sleep    1
    Click Element    ${service}     action_chain=True
    ${search}=   Set Variable    xpath://input[@puppeteer-id='consult-menu__services_search-input_Transfer_${id}']
    Wait Until Element Is Visible    ${search}  5
    Sleep    1
    Input Text    ${search}     ${service_name_to_transfer}
    ${xfer service}=    Set Variable    xpath://button[@puppeteer-id='consult-menu__services-list-item_${id}'][text()='${service_name_to_transfer}']
    Wait Until Element Is Visible    ${xfer service}    5
    Click Element    ${xfer service}    action_chain=True
    Sleep    1


# Oanh
Transfer To Service old
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
    Sleep    1
    Click Element    ${loc_service_name}
    Sleep    1

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

Agent Accepts Any New Contact
    [Documentation]    Agent accepts any new contact ringing on WS
    Wait Until Element Is Visible    ${LOC_WORKCARD_ACCEPT_NEW_CONTACT}     timeout=15s
    Click Element    ${LOC_WORKCARD_ACCEPT_NEW_CONTACT}
    Sleep    1
    Wait Until Element Is Visible    ${LOC_WORKCARD_END_CONTACT}    15s

Agent Release Any Contact
    [Documentation]    Agent release any current contact on WS
    Wait Until Element Is Visible    ${LOC_WORKCARD_END_CONTACT}     timeout=15s
    Click Element       ${LOC_WORKCARD_END_CONTACT}
    Sleep    1
    Wait Until Element Is Not Visible    ${LOC_WORKCARD_END_CONTACT}    15s

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

########################################################################################################################
############################################  VERIFY KEYWORDS ##########################################################
########################################################################################################################

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

#Huy, 18-05-2021
Verify End Button Present In WorkCard
    [Documentation]    In customer workcard with title names, verify end button is present
    [Arguments]    ${title}
    Sleep    1
    ${loc verify end button}=   String.Format String    ${LOC_VERIFY_WORKCARD_END_BUTTON}   ${title}
    Wait Until Element Is Visible    ${loc verify end button}      30
    Sleep    1

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



#   created by:     nthung
#   created date:   22-Aug-2018
#       ${expected_header_title} can be SMS phone number
Verify Header Title On WorkCard Display Correctly
    [Arguments]    ${contact_info}    ${expected_header_title}
    ${header_title_loc}=    String.Replace String    ${LOC_WORKCARD_HEADER_TITLE}    ${CONTACT_INFO_VAR}    ${contact_info}
    ${actual_header_title} =  Get Text    ${header_title_loc}
    Should Be Equal    ${expected_header_title}    ${actual_header_title}



# Author: hnguyenphuc
# Created date: 25-Sep-2018
# Variable:
#       ${contact_info}: Email, Phone Number of customer
Verify Number Of Missed Messages Displayed On WorkCard
    [Documentation]    Verify number of missed message displayed on card header of word card
    [Arguments]    ${contact_info}    ${expected_missed_messages_num}
    ${loc_header_missed_message_ele}=   String.Replace String    ${LOC_WORKCARD_HEADER_MISSED_MESSAGE}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Element Is Visible    ${loc_header_missed_message_ele}    timeout=${TIMEOUT_SHORT}
    ${actual_missed_messages_num} =     Get Element Attribute    ${loc_header_missed_message_ele}    data-missed
    Should Be Equal    ${actual_missed_messages_num}    ${expected_missed_messages_num}

# Author: hnguyenphuc
# Created date: 25-Sep-2018
# Variable:
#       ${contact_info}: Email, Phone Number of customer
Verify Number Of Missed Message Dissapeared
    [Documentation]    Verify Number Of Missed Message Dissapeared
    [Arguments]    ${contact_info}
    ${loc_header_missed_message_ele} =   String.Replace String     ${LOC_WORKCARD_HEADER_MISSED_MESSAGE}    ${CONTACT_INFO_VAR}    ${contact_info}
    Element Should Not Be Visible    ${loc_header_missed_message_ele}    timeout=${TIMEOUT_SHORT}

# created by: lcntuan
# created date: 23-Oct-18
#       ${contact_info}: The contact info of the workcard, would be customer email for chat or customer phone number for SMS
#       ${acw_timeout}: After contact work timeout (set by ACM)
Verify ACW Status Of A Contact Session
    [Documentation]    Verify ACW Status Of A Contact Session
    [Arguments]    ${contact_info}    ${acw_timeout}
    ${complete_btn_loc}=    String.Replace String    ${LOC_WORKCARD_BTN_COMPLETE_CONTACT}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Element Is Visible    ${complete_btn_loc}    timeout=30
    ${ACW_time_loc}=    String.Replace String    ${LOC_WORKCARD_HEADER_TIMER}    ${CONTACT_INFO_VAR}    ${contact_info}
    ${ACW_time_remaining} =    Get Text    ${ACW_time_loc}
    @{ACW_time_remaining_split_1}=    Split String    ${ACW_time_remaining}
    @{ACW_time_remaining_split_2}=    Split String    @{ACW_time_remaining_split_1}[-1]    :
    ${ACW_time_remaining} =    Evaluate    @{ACW_time_remaining_split_2}[0] * 60 + @{ACW_time_remaining_split_2}[1]
    ${ACW_time_offset} =    Evaluate    ${acw_timeout} - ${ACW_time_remaining}
    ${ACW_card_sum_loc} =    String.Replace String    ${LOC_WORKCARD_HEADER_SUMMARY_TEXT}    ${CONTACT_INFO_VAR}    ${contact_info}
    ${ACW_card_sum_text} =    Get Text    ${ACW_card_sum_loc}
    Should Be True    '${ACW_card_sum_text}' == 'After Contact Work (Timed)'
    Should Be True    ${ACW_time_remaining} <= ${acw_timeout}
    Should Be True    ${ACW_time_offset} <= 4

Verify Transfer To Services In Interaction Details
    [Documentation]    Verify Transfer To Service in Interaction Details table.
    [Arguments]    ${contact_info}    ${state}
    Open More Option    ${contact_info}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    WorkCard.Checks Interaction Details    ${workcard_id}
    Sleep     ${TIMEOUT_EXTRA_SHORT}
    # Get state of Transferred to Service.
    #       ${transfer_to_service_state} == Yes : tranferred contact.
    #       ${transfer_to_service_state} == No : nomal contact.
    ${loc_transfer_to_service_state}=    String.Replace String    ${LOC_WORKCARD_TRANSFER_TO_SERVICE_STATE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${transfer_to_service_state}=    Get Text    ${loc_transfer_to_service_state}
    # Close interaction detail popup
    Click Element    ${loc_transfer_to_service_state}
    # Get state of transfer icon:
    #       ${icon_state} == true : transfer icon is displayed.
    #       ${icon_state} == false : transfer icon is not displayed.
    ${icon_state}=    Run Keyword And Return Status    Element Should Be Visible    ${LOC_WORKCARD_ICON_TRANSFER}
    # Verify icon transfer to service.
    Run Keyword If    '${state}' == 'True'    Should Be True    '${icon_state}' == 'True'
        ...    ELSE    Should Be True    '${icon_state}' == 'False'
    # Verify Transferred To Service in Interaction Details.
    Run Keyword If    '${state}' == 'True'    Should Be True    '${transfer_to_service_state}' == 'Yes'
        ...    ELSE    Should Be True    '${transfer_to_service_state}' == 'No'

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

#
#:FOR    ${attempt}    IN RANGE    1    4
#    \    Sleep    ${TIMEOUT_SHORT}
#    \    ${card_containers}=    Get WebElements    ${LOC_WORKCARD_LIST}
#    \    ${num_of_workcards} =    Get Length    ${card_containers}
#    \    Run Keyword If    ${num_of_workcards} == 0    Exit For Loop
#
#
#Agent sends Message to Customer
#   [Arguments]    ${contact_info}    ${message}
#   WorkCard.Agent Clicks On A Work Card   ${contact_info}
#   Sleep    1
#   ${workcard_id} =    Get WorkCard ID    ${contact_info}
#   ${loc_type_mess}=    String.Replace String    ${LOC_TYPE_A_MESSAGE}    ${WORKCARD_ID_VAR}    ${workcard_id}
#   Click Element    ${loc_type_mess}
#   Input Text    ${loc_type_mess}  ${message}
#   Sleep    1
#   ${loc_send_mess}=    String.Replace String    ${LOC_SEND_MESSAGE}    ${WORKCARD_ID_VAR}    ${workcard_id}
#   Click Element    ${loc_send_mess}
#   Sleep    1
#
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
    ${last_message} =    Set Variable   ${message_elements}[${max_length}]
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
#    # delete some characters
#    ${count} =    Evaluate    ${char_mess_count}-10000
#    Sleep   0.5
#    :FOR    ${i}    IN RANGE    0   ${count}
#    \    Click Element    ${loc_type_mess}
#    \    Sleep  0.5
#    \    Press Keys    ${loc_type_mess}    BACKSPACE
#    \    Sleep  0.5
#    Sleep   1
#    Wait Until Element Is Visible   ${loc_send_mess}    5s

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
############################################  DEPRECATED KEYWORDS ######################################################
########################################################################################################################
