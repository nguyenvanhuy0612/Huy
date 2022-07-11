*** Settings ***
#Library     ../../keywords/outlook/outlookLib.py    WITH NAME    Outlook


*** Variables ***

*** Test Cases ***
#Created date:     /02/2021
CC19923 082 Search an email or webchat customer in customer history by Date, Customer email and To Address
    import library      ../keywords/outlook/outlookLib      with name   outlookLib
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    outlookLib.customer sent an email     ${AGENT5_MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    None    ${CUST2_EMAIL}


    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}      #${CUST2_EMAIL}
    # Sleep   1
    # WidgetEmail.Verify Email Attachment     ${CUST2_NAME}   ${ATTACHMENT_NAME1}
#    WidgetEmail.Verify Email Attachment     ${CUST2_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Date, Email and Subject
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Date   ${CUST2_EMAIL}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer    Subject    THIS IS MAIL FROM OANH_CUSTOMER
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer    Email    ${CUST2_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}
