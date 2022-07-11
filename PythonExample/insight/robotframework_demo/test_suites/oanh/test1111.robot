*** Settings ***
Resource    ../../resources/SystemResources.robot

*** Test Cases ***

#
##Created date:     /02/2021
#CC19923 072 Send an email from customer search when agent accepts a MM contact from customer
#    [Setup]     Run Keywords
#    #   Login blended agent 1 to workspaces, start work and go ready
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1
##    [Teardown]    Run Keywords
##    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
##    ...    WorkCard.Agent End Any Inbound Contact      AND
##    ...    AgentToolbar.Agent Finish Work   AND
##    ...    AgentToolbar.Agent Exit      AND
##    ...    Close All Browsers
#
#    # STEP 1: Customer launchs a session chat and send it to agent
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
#    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
#    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
#    Sleep   7
#
#    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#
#    Sleep   1
#    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}    #${CUST1_EMAIL}
#    Sleep   3
#
#    # STEP 3:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Show History button, Click to Call and Click to Email button display when searching
#    NavigationMenu.Open Customer Search
#    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST1_EMAIL}    ${EMPTY}
#    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}     10
#
#    # STEP 4:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can see the history og customer by clicking the Show History button
#    Click Element    ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}
#    Sleep   1
#    Handle Alert    accept
#    Sleep   5
#    Close Mail Application
#
#    # STEP 5:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends WC Contact
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}







#Created date:     /02/2021
CC19923 081 Search an email or webchat customer in customer history by Date, Customer email and Subject
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
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}      ${ATTACH_LINK_1}
    Outlook.Choose Account     ${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}      #${CUST2_EMAIL}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST2_NAME}   ${ATTACHMENT_NAME1}
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



#
#




##Created date:     /02/2021
#CC19923 074 Search an email or webchat customer in customer history by date    [Setup]     Run Keywords
#    #   Login blended agent 1 to workspaces, start work and go ready
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1
##    [Teardown]    Run Keywords
##    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
##    ...    WorkCard.Agent End Any Inbound Contact      AND
##    ...    AgentToolbar.Agent Finish Work   AND
##    ...    AgentToolbar.Agent Exit      AND
##    ...    Close All Browsers
#
#    # STEP 1:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
#    Outlook.Open Outlook
#    Outlook.Send Email With Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}      ${ATTACH_LINK_1}
#    Outlook.Choose Account     ${CUST2_EMAIL}
#    Outlook.Send Email
#    Sleep   20
#    Outlook.Close Outlook
#
#    # STEP 2:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
#    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}      #${CUST2_EMAIL}
#    Sleep   1
#    WidgetEmail.Verify Email Attachment     ${CUST2_NAME}   ${ATTACHMENT_NAME1}
##    WidgetEmail.Verify Email Attachment     ${CUST2_EMAIL}   ${ATTACHMENT_NAME1}
#    Sleep   3
#
#    # STEP 4:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email contact
#    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}
#
#    # STEP 3:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
#    Sleep   5
#    NavigationMenu.Open Customer Search
#    Sleep   2
#    CustomerHistorySearch.Search Customer   Email   ${CUST2_EMAIL}
#    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

#    # STEP 5:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer launchs a session chat and send it to agent
#    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
#    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
#    Sleep   7
#
#    # STEP 6:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent's browser and Agent accepts WC and chat with Customer
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    Sleep   1
#    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}   #${CUST1_EMAIL}
#    Sleep   3
#    # Agent sends Message to Customer
#    WorkCard.Agent sends Message to Customer    ${CUST1_NAME}   Hello Customer, I'm Agent
##    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
#    Sleep   5
#    Switch Browser      ${BROWSER_CUST_ALIAS_1}
#    WebChat.Verify Message On Customer Chat     ${AGENT5_FIRSTNAME}     Hello Customer, I'm Agent
#
#    # STEP 7:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
#    Switch Browser      ${BROWSER_CUST_ALIAS_1}
#    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
#    Sleep   5
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    WorkCard.Verify Message On Agent Chat    ${CUST1_NAME}   Hi Agent, I have some Issues
##    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues
#
#    # STEP 8:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends webchat session
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    Sleep   3
#    WorkCard.Agent Ends A Contact     ${CUST1_NAME}    #${CUST1_EMAIL}
#    Sleep   2
#
#    # STEP 9:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify Email Template can be search in Customer Search
#    Sleep   5
#    NavigationMenu.Open Customer Search
#    Sleep   2
#    CustomerHistorySearch.Search Customer   Email   ${CUST1_EMAIL}
#    CustomerHistorySearch.Verify Customer Search    WC   ${CUST1_EMAIL}    ${CUST1_NAME}    ${EMPTY}    Hello Customer, I'm Agent








##=======================================================================================================================

##=======================================================================================================================

##=======================================================================================================================
#
##Created date:     /01/2021
#CC-19922- 045 - WS_Verify that an agent is notified quickly if accepting an Chat after the Threshold
#    [Setup]     Run Keywords
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1
##    [Teardown]    Run Keywords
##    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
##    ...     WorkCard.Agent End Any Inbound Contact      AND
##    ...     AgentToolbar.Agent Finish Work      AND
##    ...     AgentToolbar.Agent Exit      AND
##    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
##    ...     Close All Browsers
#
#    # STEP 1:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer 1 launchs a session chat and send it to agent
#    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
#    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC2}
#    Sleep   7
#
#    # STEP 2:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer 2 launchs a session chat and send it to agent
#    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_2}    ${BROWSER_CUST_ALIAS_2}
#    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC2}
#    Sleep   7
#
#    # STEP 3:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer 3 launchs a session chat and send it to agent
#    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_3}    ${BROWSER_CUST_ALIAS_3}
#    WebChat.Customer Init A Chat Session     ${CUST3_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC2}
#    Sleep   7
#
#    # STEP 4:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent's browser and Agent accepts WC 1
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    Sleep   1
#    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}    #${CUST1_EMAIL}
#    Sleep   3
#
#    # STEP 5:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer 4 launchs a session chat and send it to agent
#    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_4}    ${BROWSER_CUST_ALIAS_4}
#    WebChat.Customer Init A Chat Session     ${CUST4_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC2}
#    Sleep   7
#
#    # STEP 6:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Warning sign displays correctly
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    NavigationMenu.Open Web Statistic
#    Select Skillset Statistic    ${AGENT3_SKILLSET_WC2}
#    Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_WARNING_SIGN}   timeout=10
#
#    # STEP 07:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Service level display correctly
#    NavigationMenu.Open Web Statistic
#    Select Skillset Statistic    ${AGENT3_SKILLSET_WC2}
#    Verify Service Level    0%
#
#    # STEP 08:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends WC Contact
#    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
#    Sleep   3
#
#    WorkCard.Agent Accepts A Contact    ${CUST2_NAME}    #${CUST1_EMAIL}
#    Sleep   3
#    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST1_EMAIL}
#    Sleep   3
#
#    WorkCard.Agent Accepts A Contact    ${CUST3_NAME}    #${CUST1_EMAIL}
#    Sleep   3
#    WorkCard.Agent Ends A Contact     ${CUST3_NAME}     #${CUST1_EMAIL}
#    Sleep   3
#
#    WorkCard.Agent Accepts A Contact    ${CUST4_NAME}    #${CUST1_EMAIL}
#    Sleep   3
#    WorkCard.Agent Ends A Contact     ${CUST4_NAME}     #${CUST1_EMAIL}
#    Sleep   3

##=======================================================================================================================

##=======================================================================================================================

##=======================================================================================================================

##=======================================================================================================================

##=======================================================================================================================

##=======================================================================================================================

##=======================================================================================================================


