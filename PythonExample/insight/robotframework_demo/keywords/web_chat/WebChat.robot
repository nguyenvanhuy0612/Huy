*** Settings ***
Resource    ../../resources/SystemLibraries.robot

Resource    ../workspace/interaction_area/WorkCard.robot
Variables   WebChatLocator.py
Variables   ../../keywords/workspace/interaction_area/WorkCardLocator.py
Library     Selenium2Library
Library     String
Library     Collections


*** Keywords ***

Open Browser To Webchat Page
    [Documentation]    Open Browser To Webchat Page
    [Arguments]     ${browser_type}    ${browser_alias}
    ${options}=    Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    Create WebDriver    Chrome    ${browser_alias}      chrome_options=${options}
    Go To    ${web chat trust Link https}
    ${stt}=     Run Keyword And Return Status    Wait Until Page Contains Element    id:details-button      3s
    Run Keyword If    ${stt} == True    Run Keywords    Click Button    id:details-button   AND     Sleep    1  AND     Click Element    id:proceed-link
    Wait Until Page Contains    HTTP Status 404     3s
    Go To    ${WEB_CHAT_URL}
    Maximize Browser Window
    Webchat Page Should Be Open

Webchat Page Should Be Open
    [Documentation]    Verify webchat homepage is opened with right url and title
    Location Should Be    ${WEB_CHAT_URL}
    Title Should Be    Home

#Config Webchat URL
#    [Documentation]    Configure webchat URL and agent attributes
#
#    Click Element   ${A_A}
#    Sleep   1
#    Click Element    ${LOC_WEBCHAT_SHOW_CONFIG_BUTTON}
#    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${LOC_WEBCHAT_ALERT_BOX}    timeout=20
#    Click Element    ${LOC_WEBCHAT_CONFIG_CHILD_WINDOW_TITLE}
#
#    # Configure URL
#    Click Element    ${LOC_WEBCHAT_LIVE_CHAT_BUTTON}
#    sleep    2
#    Input Text    ${LOC_WEBCHAT_OCP_URL}    ${OCP_CLUSTER_IP}
#    Input Text    ${LOC_WEBCHAT_CONTEXTSTORE_URL}    ${OCEANA_CLUSTER_IP}
#    Input Text    ${LOC_WEBCHAT_COBROWSE_URL}    ${OCEANA_CLUSTER_IP}
#    Click Element    ${LOC_WEBCHAT_CONFIG_URL_LIST}    # Close URL Configuration
#    sleep    2

Customer Init A Chat Session
    [Documentation]    Init a chat session with cust_info and email_chatscript option (value: yes or no)
    [Arguments]    ${cust_info}    ${email_chatscript}  ${cust_skillset}
    Wait Until Element Is Visible    ${LOC_WEBCHAT_INIT_CHAT_BUTTON}    5
    Click Element   ${LOC_WEBCHAT_INIT_CHAT_BUTTON}
    Sleep   2
    Wait Until Element Is Visible    ${LOC_WEBCHAT_CUST_NAME}    timeout=10s
    Input Text      ${LOC_WEBCHAT_CUST_NAME}      ${cust_info}[0]    # FIRST_NAME
    Input Text      ${LOC_WEBCHAT_CUST_EMAIL}     ${cust_info}[1]    # EMAIL

    Click Element   ${LOC_WEBCHAT_SKILLSET}
    Sleep   1
    ${_loc_wc_skill} =    String.Replace String    ${LOC_WEBCHAT_SELECT_SKILLSET}    ${CONTACT_SKILLSET_VAR}    ${cust_skillset}
    Wait Until Element Is Visible    ${_loc_wc_skill}    timeout=10s
    Click Element   ${_loc_wc_skill}
    Sleep   2

    Run Keyword If    '${email_chatscript}' == 'yes'    Select Checkbox    ${LOC_WEBCHAT_CHECKBOX_EMAIL_TRANSCRIPT}
    Click Element   ${LOC_WEBCHAT_CHAT_NOW_BUTTON}
    Sleep   2
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Element    ${LOC_WEBCHAT_WINDOW_WELCOME_MESSAGE}

Customer Sends Message To Agent
    [Documentation]    Customer Send Message To Agent
    [Arguments]    ${message}
    Wait Until Element Is Visible    ${LOC_WEBCHAT_CHAT_FIELD}     15s
    Click Element   ${LOC_WEBCHAT_CHAT_FIELD}
    Input Text    ${LOC_WEBCHAT_CHAT_FIELD}    ${message}
    Sleep   1
    # Click send button to send message to agent
    Wait Until Element Is Visible    ${LOC_WEBCHAT_BTN_SEND_BUTTON}     15s
    Click Element    ${LOC_WEBCHAT_BTN_SEND_BUTTON}
    Sleep   1

Customer Sends Url To Agent
    [Documentation]    Customer Send url To Agent
    [Arguments]    ${url}
    Wait Until Element Is Visible    ${LOC_WEBCHAT_INT_URL}     15s
    Click Element   ${LOC_WEBCHAT_INT_URL}
    Input Text    ${LOC_WEBCHAT_INT_URL}    ${url}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_WEBCHAT_BTN_SEND_URL}     15s
    Click Element    ${LOC_WEBCHAT_BTN_SEND_URL}
    Sleep   1

Customer Ends A Chat Session
    [Documentation]    Customer close a chat session
    Wait Until Element Is Visible    ${LOC_WEBCHAT_WINDOW_CLOSE_BUTTON}     15s
    Click Element    ${LOC_WEBCHAT_WINDOW_CLOSE_BUTTON}
    Sleep   1

#   20/30/2020
Verify Message On Customer Chat
    [Documentation]  Verify the last message on customer chat display correctly
    [Arguments]    ${name_label}   ${message}
    # Get all Agent message
    @{message_elements}=    Get WebElements     ${LOC_WEBCHAT_WINDOW_CHAT}
    ${message_total}=    Get Length    ${message_elements}
    ${max_length}=    Evaluate    ${message_total}-1
    Log To Console      message_total = ${message_total}
    # Huy edit, 18-05-2021
    ${last_message} =   Get From List   ${message_elements}    ${max_length}
    ${last_message_text} =  Get Text    ${last_message}
    Log To Console      last_message_text = ${last_message_text}
    Should contain   ${last_message_text}    ${name_label}
    Should contain   ${last_message_text}    ${message}

Verify Push URLs On Customer Chat
    [Documentation]  Verify the last message on customer chat display correctly
    [Arguments]    ${url}
    # Get all Agent message
    @{url_elements}=    Get WebElements     ${LOC_WEBCHAT_WINDOW_URL}
    ${url_total}=    Get Length    ${url_elements}
    ${max_length}=    Evaluate    ${url_total}-1
    Log To Console      url_total = ${url_total}
    ${last_url} =    Set Variable   @{url_elements}[${max_length}]
    ${last_url_text} =  Get Text    ${last_url}
    Log To Console      last_url = ${last_url_text}
    Should contain   ${last_url_text}    ${url}

Verify Agent Have Left Conversation
    @{message_elements}=    Get WebElements     ${LOC_WEBCHAT_WINDOW_CHAT}
    ${message_total}=    Get Length    ${message_elements}
    ${max_1_length}=    Evaluate    ${message_total}-2
    ${last_1_message} =    Set Variable   @{message_elements}[${max_1_length}]
    ${last_1_message_text} =  Get Text    ${last_1_message}
    Should contain   ${last_1_message_text}    Agent has left the chat
    ${max_length}=    Evaluate    ${message_total}-1
    ${last_message} =    Set Variable   @{message_elements}[${max_length}]
    ${last_message_text} =  Get Text    ${last_message}
    Should contain   ${last_message_text}    Connection closed

#   20/04/2020
Verify Agent Is Typing
    [Arguments]    ${alias_agent}    ${agent_name}   ${alias_cust}   ${contact_info}
    Switch Browser    ${alias_agent}
    WorkCard.Agent Clicks On A Work Card   ${contact_info}
    Sleep    1
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_type_mess}=    String.Replace String    ${LOC_TYPE_A_MESSAGE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Click Element    ${loc_type_mess}
    Input Text    ${loc_type_mess}   Testing...
    Switch Browser    ${alias_cust}
    Wait Until Element Is Visible    ${LOC_WEBCHAT_AGENT_LABEL}    5s
    ${mess_status} =    Get Text   ${LOC_WEBCHAT_AGENT_LABEL}
    ${agent_state} =    Convert To String   ${agent_name} is typing
    Should be Equal     ${mess_status}      ${agent_state}
    Log To Console      Verify status Agent is typing successfully
    Sleep   1
    Switch Browser    ${alias_agent}
    ${loc_send_mess}=    String.Replace String    ${LOC_SEND_MESSAGE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Click Element    ${loc_send_mess}
    Sleep   1

#   20/04/2020
Verify If Have Agent Label
    [Arguments]    ${agent_name}
    Wait Until Element Is Visible    ${LOC_WEBCHAT_AGENT_LABEL}    5s
    ${mess_status} =    Get Text   ${LOC_WEBCHAT_AGENT_LABEL}
    Should be Equal     ${mess_status}      ${agent_name}
    Log To Console      Verify Agent Label correctly
    Sleep   1

Verify Agent Label
    [Arguments]    ${agent_name}=${EMPTY}
    Run Keyword If    '${agent_name}'=='${EMPTY}'    Log To Console      Have not any Agent label
        ...     ELSE    Verify If Have Agent Label    ${agent_name}

Verify Messsage From Customer To Agent
    [Documentation]  Verify Message From Customer To Agent on Webchat page
    [Arguments]    ${message_content}    ${customer_label}=${EMPTY}    ${customer_date_time}=${EMPTY}    ${position}=-1
    # Get all messages
    &{full_info}=    WebChat.Get Full Info Of Customer Message    ${position}
    ${expected_time}=    Run Keyword Unless    '${customer_date_time}'=='${EMPTY}'    Utils.Remove Second In Time    ${customer_date_time}
    ${actual_time}=    Run Keyword Unless    '${customer_date_time}'=='${EMPTY}'    Utils.Remove Second In Time    &{full_info}[time]
    # Verify
    Should Be Equal    &{full_info}[message]    ${message_content}
    Run Keyword Unless    '${customer_label}'=='${EMPTY}'    Should Be Equal    &{full_info}[label]    ${customer_label}
    Run Keyword Unless    '${customer_date_time}'=='${EMPTY}'    Utils.Verify 2 Times    ${actual_time}    ${expected_time}    60

Verify Chat Comfort Message At Customer
    [Documentation]    Verify comfort message at customer after delay time.
    [Arguments]    ${comfort_message_set}    ${delay_time}
    @{message_elements}=    Get WebElements     ${LOC_WEBCHAT_LIST_OF_AGENT_MESSAGE}
    ${message_total}=    Get Length    ${message_elements}
    ${loc_index}=    Set Variable    ${message_total}
    
    # 0-5 seconds mismatch expected on web client. So add 5s for delay time.
    ${new_delay_time}=    Evaluate    ${delay_time} + 6
    ${length}=    Get Length    ${comfort_message_set}
    :FOR    ${i}    IN RANGE    0    ${length}
    \    ${start_time}=    Get Time    epoch
    \    # Get locator of comfort message
    \    ${loc_index}=    Evaluate    ${loc_index} + 1
    \    ${loc_index}=    Convert To String    ${loc_index}
    \    ${loc_agent_response}=    String.Replace String    ${LOC_WEBCHAT_AGENT_RESPONSE}    ${DYNAMIC_VARIABLE_COMFORT_MESSAGE_INDEX}   ${loc_index}
    \    Wait Until Element Is Visible    ${loc_agent_response}    timeout=${new_delay_time}
    \    ${end_time}=    Get Time    epoch  
    \    # Verify comfort message at customer.
    \    ${text_agent_response}=    Get Text    ${loc_agent_response}
    \    # Remove right space in text.
    \    ${text_agent_response}=    String.Strip String    ${text_agent_response}    mode=right
    \    Should Be True    '${text_agent_response}' == '@{comfort_message_set}[${i}]'
    \    # Verify delay time of comfort message at customer.
    \    # Delay time at customer is counted from customer send message to comfort message display at customer.
    \    ${delay_time_at_customer}=    Evaluate    ${end_time} - ${start_time}
    \    Should Be True    ${delay_time_at_customer} >= ${delay_time}

Verify On Hold Message Created
    [Documentation]  Verify on hold message created and showed to customer
    [Arguments]    ${on_hold_message}
    # Get the text of on hold message created
    ${name} =    Get Text      ${LOC_WEBCHAT_ON_HOLD_MESSAGE_TEXT}
    # Compare the on hold message with original text
    Should Be True    "${name}" == "${on_hold_message} "

Verify On Hold URL Message
    [Documentation]  Verify on hold url message is displayed
    [Arguments]     ${on_hold_url_messages}    ${onhold_url_hold_time}
    ${delay_time_max} =    Evaluate    ${onhold_url_hold_time} + ${ON_HOLD_URL_EXTEND_TIME}
    ${delay_time_min} =    Evaluate    ${onhold_url_hold_time}

    :FOR    ${on_hold_url_message}    IN    @{on_hold_url_messages}
    \    ${start_time}=    Get Time    epoch
    \    # Verify message
    \    Wait Until Keyword Succeeds    ${onhold_url_hold_time}    1s    Verify System Message Displayed On Chat Message Container    ${on_hold_url_message}
    \    ${end_time}=    Get Time    epoch
    \    # Verify delay time of hold url message at customer.
    \    # Delay time at customer is counted from customer init a chat session
    \    ${delay_time_at_customer}=    Evaluate    ${end_time} - ${start_time}
    \    Should Be True    ${delay_time_at_customer} >= ${delay_time_min} and ${delay_time_at_customer} <= ${delay_time_max}

Verify System Message Displayed On Chat Message Container
    [Documentation]    Verify last system message displayed as expected
    [Arguments]     ${expected_system_message}    ${expected_label}=${EMPTY}    ${system_message_time}=${EMPTY}    ${position}=-1
    &{full_info}=    WebChat.Get Full Info Of System Message    ${position}
    ${actual_time}=    Run Keyword Unless    '${system_message_time}'=='${EMPTY}'    Utils.Remove Second In Time    &{full_info}[time]
    ${expected_time}=    Run Keyword Unless    '${system_message_time}'=='${EMPTY}'    Utils.Remove Second In Time    ${system_message_time}
    # Verify
    Should Be Equal    &{full_info}[message]    ${expected_system_message}
    Run Keyword Unless    '${expected_label}'=='${EMPTY}'    Should Be Equal    &{full_info}[label]    ${expected_label}
    Run Keyword Unless    '${system_message_time}'=='${EMPTY}'    Should Be Equal    ${actual_time}    ${expected_time}

Append Words Gotten From Word Spans 
    [Documentation]    Get word from span and append them to create message
    [Arguments]    @{word_spans}
    ${message_content}=    Create List
    :FOR    ${word_span}    IN     @{word_spans}
    \    ${text}=    Get Text    ${word_span}
    \    Append To List    ${message_content}    ${text} 
    ${message_content}=    Evaluate    "".join($message_content)   
    [Return]    ${message_content} 
    

Get Number On Hold URL Message
    [Documentation]  Get Number On Hold URL Message
    ${result}=      Get Element Count   ${LOC_WEBCHAT_WINDOW_ON_HOLD_URL_NUMBER}
    [Return]        ${result}

Customer Download File
    [Documentation]  Customer Download File from Agent
    [Arguments]    ${file_name}
    ${loc_message_link}=     String.Replace String    ${LOC_WEBCHAT_LINK_DOWNLOAD}    ${DYNAMIC_VARIABLE_LINK_DOWNLOAD_FILE}    ${file_name}
    Wait Until Element Is Visible   ${loc_message_link}    10
    Click element  ${loc_message_link}

############################################    DEPRECATED    ########################################

Get Last System Message
    [Documentation]   *DEPRECATED*   Get message on web chat based on message order
    @{word_spans}=    Get WebElements    ${LOC_WEBCHAT_LAST_SYSTEM_MESSAGE}     
    ${message_content}=    Append Words Gotten From Word Spans     @{word_spans}
    [Return]    ${message_content}


Get Message Based On Message Order
    [Documentation]  *DEPRECATED*   Get message on web chat based on message order
    [Arguments]    ${message_order}
    ${loc_message}=     String.Replace String    ${LOC_WEBCHAT_MESSAGE}    ${DYNAMIC_VARIABLE_MESSAGE_ORDER}    ${message_order}
    @{word_spans}=    Get WebElements    ${loc_message}     
    ${message_content}=    Append Words Gotten From Word Spans     @{word_spans}
    [Return]    ${message_content}