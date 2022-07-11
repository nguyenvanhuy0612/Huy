*** Settings ***
Resource   ../../../../resources/SystemResources.robot
Resource    ../../navigation_menu/NavigationMenu.robot
Resource    ../../../base_module/Utils.robot
Variables  CustomerHistorySearchLocator.py
Library    Selenium2Library
Library     DateTime
Library    ../../../base_module/BaseKeyword.py



*** Keywords ***
# 17/07/2020
Search Customer
    [Arguments]    ${search_by}   ${content_search}
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_SELECT_SEARCH}     20
    Click Element   ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_SELECT_SEARCH}
    Sleep   0.5
    # choose search by
    ${loc_search_by} =   String.Format String    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_SELECT_SEARCH_BY}    ${search_by}
    Wait Until Element Is Visible    ${loc_search_by}     20
    Click Element    ${loc_search_by}
    Sleep   0.5
    Run Keyword If    '${search_by}'=='Date'    Search By Date
    ...     ELSE     Search By Email Subject Address     ${search_by}    ${content_search}
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_SEARCH}     20
    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_SEARCH}
    Sleep   1

Search By Email Subject Address
    [Arguments]    ${search_by}     ${content_search}
    # input content search
    ${loc_ipt_search} =    String.Format String    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_SEARCH_FIELD}    ${search_by}
    Wait Until Element Is Visible    ${loc_ipt_search}     20
    Input text   ${loc_ipt_search}   ${content_search}
    Sleep   1

Search By Date
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_FROM_DATE}     10
    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_FROM_DATE}
    Sleep   1
    Click Element   ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_CURRENT_DATE}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_TO_DATE}     10
    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_TO_DATE}
    Sleep   1
    Click Element   ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_CURRENT_DATE}
    Sleep   1

#Search By Date
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_FROM_DATE}     20
#    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_FROM_DATE}
#    Sleep   1
#    Press Keys   ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_FROM_DATE}   RETURN
#    Sleep   1
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_TO_DATE}     20
#    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_TO_DATE}
#    Sleep   1
#    Press Keys   ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_TO_DATE}   RETURN
#    Sleep   1

Verify Customer History Search
    [Arguments]    ${contact_type}   ${a}=${EMPTY}   ${b}=${EMPTY}   ${c}=${EMPTY}    ${d}=${EMPTY}
#    [Arguments]    EM   ${from}   ${to}   ${subject}    ${content}
#    [Arguments]    WC   ${from}   ${customer_name}   ${chat_from}   ${content}
    Run keyword if   '${contact_type}'=='EM'    Verify Email Search     ${a}   ${b}   ${c}  ${d}
    ...    ELSE IF   '${contact_type}'=='WC'    Verify Webchat Search     ${a}   ${b}   ${d}


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
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_CONTENT_LINE}    timeout=20s
#    @{content_element}=    Get WebElements     ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_CONTENT_LINE}
#    ${content_total}=    Get Length    ${content_element}
#    FOR     ${i}    IN RANGE    -1   ${content_total}
#    \   ${content_line} =  Get Text    ${content_element}[${i}]
#    \   ${check} =   Run Keyword And Return Status    Should contain    ${content_line}   ${content}
#    \   Run Keyword If  '${check}'=='True'   Run keywords   Log to console   Content Email display correctly   AND   Exit For Loop
##    \   Run Keyword If  '${content_line}'=='${content}'   Run keywords   Log to console   Content Email display correctly   AND   Exit For Loop
    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_CONTENT}    timeout=20s
    ${content_email} =    Get Text     ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_CONTENT}
    Should Contain    ${content_email}     ${content}
    Sleep   1


Verify Webchat Search
    [Arguments]    ${from}   ${customer_name}   ${chat_content}
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
    Should Contain     ${loc_name}   ${customer_name}
    Sleep   0.5

    # verify content chat search
#    @{message_elements}=   Run keyword if     '${chat_from}'=='Agent'     Get WebElements     ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_CHAT_FROM_AGENT}
#    ...     ELSE    Get WebElements     ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_CHAT_FROM_CUSTOMER}
#    ${count_chat} =   Get Length  ${message_elements}
#    log to console      ******count_chat********${count_chat}
#    ${end} =    evaluate    ${count_chat}-1
#    FOR     ${i}    IN RANGE    0   ${count_chat}
#    \   Selenium2Library.Scroll Element Into View    @{message_elements}[${i}]
#    \   ${get_text_chat}=   Get Text    @{message_elements}[${i}]
#    \   log to console      ******${i}********${get_text_chat}+++++++++++++++++++++++++++++${chat_content}
#    \   Run keyword if     "${chat_content}" in "${get_text_chat}"   Exit for loop
#    \   Run keyword if    "${i}"=="${end}"   Fail     Transcript does not contain: ${chat_content}
    ${get_chat_content} =    Get Text   ${LOC_WORKSPACE_CUSTOMER_HISTORY_CHAT_CONTENT}
    Should Contain     ${get_chat_content}   ${chat_content}

#    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_BTN_SHOW_FIRST_DETAIL}
    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_SEARCH}
    Sleep   1

#and '${chat_content}' in '${get_text_chat}'









#=======================================================================================================================
#=======================================================================================================================

#Verify Customer Search
#    [Arguments]    ${from}   ${to}   ${subject}    ${content}
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_BTN_SHOW_FIRST_DETAIL}     20
#    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_BTN_SHOW_FIRST_DETAIL}
#    Sleep   0.5
#    # verify Email from
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_FROM}     20
#    ${loc_from} =    Get Element Attribute   ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_FROM}     aria-label
#    Should be equal     ${loc_from}   ${from}
#    Sleep   0.5
#    # verify Email to
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_TO}     20
#    ${loc_to} =    Get Element Attribute   ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_TO}     aria-label
#    Should be equal     ${loc_to}   ${to}
#    Sleep   0.5
#    # verify Email Subject
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_SUBJECT}     20
#    ${loc_subject} =    Get Text   ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_SUBJECT}
#    Should contain     ${loc_subject}   ${subject}
#    Sleep   1
#    # verify content Email search
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_CONTENT_LINE}    timeout=20s
#    @{content_element}=    Get WebElements     ${LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_CONTENT_LINE}
#    ${content_total}=    Get Length    ${content_element}
#    FOR     ${i}    IN RANGE    -1   ${content_total}
#    \   ${content_line} =  Get Text    ${content_element}[${i}]
#    \   ${check} =   Run Keyword And Return Status    Should contain    ${content_line}   ${content}
#    \   Run Keyword If  '${check}'=='True'   Run keywords   Log to console   Content Email display correctly   AND   Exit For Loop
##    \   Run Keyword If  '${content_line}'=='${content}'   Run keywords   Log to console   Content Email display correctly   AND   Exit For Loop
#    Sleep   1


## created by: ntdiem
## created date: 26-Oct-18
##    ${cust_email}: email of customer
#Agent Searches History Of Contacts By Customer Email
#    [Documentation]    Agent use customer history search to search a contact by customer email
#    [Arguments]         ${cust_email}   ${time_start_contact}
#    NavigationMenu.Agent Click On Customer Search Button
#    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ICON_SELECT}
#    Click Element At Coordinates    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BY_CUST_EMAIL}    0    0
#    Sleep    1s
#    Input Text       ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_CUST_EMAIL}    ${cust_email}
#    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_SEARCH}
#    Sleep    1s
#    # Select row per page = 100
#    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ROWS__PER_PAGE_ICON__SELECT}
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_NUM_ROWS__PER_PAGE}
#    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_NUM_ROWS__PER_PAGE}
#    sleep  1s
#    Selenium2Library.Scroll Element Into View    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ROWS__PER_PAGE}
#    Wait Until Element is visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ROWS__PER_PAGE}     timeout=5s
#    ${row_per_page}=     Get Text        ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ROWS__PER_PAGE}
#    Should Be True    '${row_per_page}' == '100'
#    # Move to last page
#    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_PAGE_ICON__SELECT}
#    Sleep  1s
#    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_CHOOSE_PAGE}
#    Sleep  1s
#    Selenium2Library.Scroll Element Into View    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ROWS__PER_PAGE}
#    ${time_modify} =    BaseKeyword.Format Time  ${time_start_contact}     %m/%d/%y %H:%M    %m/%d/%y %I:%M %p
#    # Search the contact in 5 last contact at last page
##    :FOR    ${i}    IN RANGE    0    5
#    ${time_date} =   Get Text    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_DATE_TIME_OF_CONTACT}
#    ${time_date_on_chs}=    String.Replace String    ${time_date}     \n     ${SPACE}
#    ${date_on_chs}=    Fetch From Left     ${time_date_on_chs}     ${SPACE}
#    @{date_modify}=    Split String    ${date_on_chs}     /
#    ${month}=     Convert To Integer    @{date_modify}[1]
#    ${month_modify}=     Run Keyword If      ${month}<10       Catenate    0    ${month}
#    @{date2}=    Run Keyword If    '${month_modify}'=!'NONE'    Catenate   SEPARATOR=/     '@{date_modify}[0]'    '${month_modify}'    '@{date_modify}[2]'
#    @{time}=    Split String    ${time_date_on_chs}     ${date_on_chs}
##    ${time_on_webchat}=    Utils.Remove Second In Time     @{time}[1]
#    Run Keyword If    '${month_modify}'=='NONE'    Should Contain    '${time_modify}'    '@{date2}'
#    Should Be True   '@{time}[1]' in '${time_modify}'
#    Should Be True   '${date_on_chs}' in '${time_modify}'
##    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ICON_ADD_OF_CONTACT}





#    Get date and time of contact
#    Get time the contact send to agent
#    Run Keyword If Get date and time of contact = Get time the contact send to agent

#    # Get number of records
#    ${text}=      Get Text        ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_RECORDS}
#    @{records}=      Split String    ${text}
#    ${num_of_records}=   Set Variable   @{records}[-1]
#    # divide get interger
#    ${result_int}=    Evaluate  ${num_of_records} / ${row_per_page}
#   divide get module
#   ${result_module}=      ${num_of_records}/${row_per_page}
#   Get total page with row per page = 100
#   ${num_of_page}=     ${result_int} + ${result_module}
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_NUM_ROWS__PER_PAGE}
#    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_NUM_ROWS__PER_PAGE}
#    sleep  2s
#    Click Element    ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ROWS__PER_PAGE_ICON__SELECT}
#    ${row_per_page}=     Get Text        ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ROWS__PER_PAGE}
#    Should Be True    '${row_per_page}' == '100'
#   divide get interger
#   ${result_int}=      ${num_of_records}/${row_per_page}
#   divide get module
#   ${result_module}=      ${num_of_records}/${row_per_page}
#   Get num of last page
#   ${num_of_page}=     ${result_int} + ${result_module}
#   Choose last page
#    ${text}=      Get Text        ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_RECORDS}
#    @{records}=      Split String    ${text}
#    ${num_of_records}=   Set Variable   @{records}[-1]
#    ${current_page}=     Get Text        ${LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_PAGE}
#    run keyword if  ${page}==${ow_page}     move cursor to last page
#    Select last contact     ${status}   ${subject}
#    Verify contact is close/open    ${cust_email}   ${status} - open/close

#${status}   ${subject}


