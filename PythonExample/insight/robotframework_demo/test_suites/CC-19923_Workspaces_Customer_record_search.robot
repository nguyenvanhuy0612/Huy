*** Settings ***
Resource    ../resources/Resources_CC_19923_Workspaces_Customer_record_search.robot


*** Test Cases ***

#=======================================================================================================================


#Created date:     17/02/2021
CC19923 003 Customer email or chat will be created successfully when a customer email or webchat sends to agent
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST6_NAME}   #${CUST6_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST6_NAME}   Hello Customer, I'm Agent
#    WorkCard.Agent sends Message to Customer    ${CUST6_EMAIL}   Hello Customer, I'm Agent
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT5_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST6_NAME}   Hi Agent, I have some Issues
#    WorkCard.Verify Message On Agent Chat    ${CUST6_EMAIL}   Hi Agent, I have some Issues

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST6_NAME}    #${CUST6_EMAIL}
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify the customer created successfully and will be displayed in customer search list
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST6_EMAIL}     ${EMPTY}
    Verify Customer Search      ${EMPTY}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#=======================================================================================================================

#Created date:     17/02/2021
CC19923 009 Search an email or webchat customer in customer search on voice only agent.
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
    NavigationMenu.Open Customer Search
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify that cannot search customer on voice only agent
    Wait Until Element Is Visible    //div[@class='widget__content ps']//div[contains(@class,'empty')]     20

#=======================================================================================================================

#Created date:     18/02/2021
CC19923 010 Search an email or webchat customer in customer search on MM only agent
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify email customers will be listed in the widget and verify the information of customers
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${CUST6_NAME}    ${CUST6_EMAIL}     ${EMPTY}
    Verify Customer Search      ${EMPTY}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#Created date:     18/02/2021
CC19923 011 Search an email or webchat customer in customer search on blend agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify email customers will be listed in the widget and verify the information of customers
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${CUST6_NAME}    ${CUST6_EMAIL}     ${EMPTY}
    Verify Customer Search      ${EMPTY}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#Created date:     19/02/2021
CC19923 012 Search a voice customer in customer search on voice only agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
    NavigationMenu.Open Customer Search
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify that cannot search customer on voice only agent
    Wait Until Element Is Visible    //div[@class='widget__content ps']//div[contains(@class,'empty')]     20

#=======================================================================================================================

#Created date:     19/02/2021
CC19923 013 Search a voice customer in customer search on MM only agent
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify email customers will be listed in the widget and verify the information of customers
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    a    a@a.com     123
    Verify Customer Search      ${EMPTY}    a    a@a.com
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}

#=======================================================================================================================

#Created date:     19/02/2021
CC19923 014 Search a voice customer in customer search on blend agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify email customers will be listed in the widget and verify the information of customers
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    a    a@a.com     123
    Verify Customer Search      ${EMPTY}    a    a@a.com
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 015 Search an email or webchat customer in customer search by Surname
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${CUST6_NAME}    ${EMPTY}    ${EMPTY}     ${EMPTY}
    Verify Customer Search      ${CUST6_NAME}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 016 Search an email or webchat customer in customer search by Name
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${CUST6_NAME}    ${EMPTY}     ${EMPTY}
    Verify Customer Search      ${CUST6_NAME}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 017 Search an email or webchat customer in customer search by Email
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST6_EMAIL}     ${EMPTY}
    Verify Customer Search      ${CUST6_NAME}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 018 Search an email or webchat customer in customer search by Surname and Name
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${CUST6_NAME}    ${CUST6_NAME}    ${EMPTY}     ${EMPTY}
    Verify Customer Search      ${CUST6_NAME}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 019 Search an email or webchat customer in customer search by Surname and Phone
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      a    ${EMPTY}    ${EMPTY}     123
    Verify Customer Search      a    a    a@a.com

#=======================================================================================================================

#Created date:     /02/2021
CC19923 020 Search an email or webchat customer in customer search by Surname and Email
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${CUST6_NAME}    ${EMPTY}    ${CUST6_EMAIL}     ${EMPTY}
    Verify Customer Search      ${CUST6_NAME}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 021 Search an email or webchat customer in customer search by Surname, name and phone
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      a    a    ${EMPTY}     123
    Verify Customer Search      a    a    a@a.com

#=======================================================================================================================

#Created date:     /02/2021
CC19923 022 Search an email or webchat customer in customer search by Surname, name, phone and email
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      a    a    a@a.com     123
    Verify Customer Search      a    a    a@a.com

#=======================================================================================================================

#Created date:     /02/2021
CC19923 023 Search an email or webchat customer in customer search by Name and phone
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    a    ${EMPTY}     123
    Verify Customer Search      a    a    a@a.com

#=======================================================================================================================

#Created date:     /02/2021
CC19923 024 Search an email or webchat customer in customer search by Name and email
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    a    a@a.com     ${EMPTY}
    Verify Customer Search      a    a    a@a.com

#=======================================================================================================================

#Created date:     /02/2021
CC19923 025 Search an email or webchat customer in customer search by Name, Phone and email
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    a    a@a.com     123
    Verify Customer Search      a    a    a@a.com

#=======================================================================================================================

#Created date:     /02/2021
CC19923 026 Search an email or webchat customer in customer search by Phone and email
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    a@a.com     123
    Verify Customer Search      a    a    a@a.com

#=======================================================================================================================

#Created date:     /02/2021
CC19923 027 Search an email or webchat customer in customer search by characters such as the first letter of the name t or full name
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ws_*    ${EMPTY}     ${EMPTY}
    Verify Customer Search      ${CUST1_NAME}    ${CUST1_NAME}    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 028 Search an email or webchat customer in customer search without @abc.def
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}     ${CUST1_NAME}     ${EMPTY}
    Page Should Not Contain Element    //md-list-item[1]//div[@class='md-list-item-text layout-align-center-start layout-column']     20

#=======================================================================================================================

#Created date:     /02/2021
CC19923 029 Search an email or webchat customer in customer search by a wildcard character
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}     ${CUST1_NAME}*     ${EMPTY}
    Verify Customer Search      ${CUST1_NAME}    ${CUST1_NAME}    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 030 Search a voice customer in customer search by Surname
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${CUST1_NAME}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 031 Search a voice customer in customer search by Name
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by Name
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${CUST1_NAME}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 032 Search a voice customer in customer search by Phone
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by Phone
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}     ${EMPTY}     ${CUST1_PHONE}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 033 Search a voice customer in customer search by Surname and Name
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by Surname and Name
    NavigationMenu.Open Customer Search
    Select Customer Search      ${CUST1_NAME}    ${CUST1_NAME}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 034 Search a voice customer in customer search by Surname and Phone
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by Surname and Phone
    NavigationMenu.Open Customer Search
    Select Customer Search      ${CUST1_NAME}    ${EMPTY}     ${EMPTY}     ${CUST1_PHONE}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 035 Search a voice customer in customer search by Surname, name and phone
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by Surname, Name and Phone
    NavigationMenu.Open Customer Search
    Select Customer Search      ${CUST1_NAME}    ${CUST1_NAME}     ${EMPTY}     ${CUST1_PHONE}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 036 Search a voice customer in customer search by Name and phone
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by Name and Phone
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${CUST1_NAME}     ${EMPTY}     ${CUST1_PHONE}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 037 Search a voice customer in customer search by characters such as the first letter of the name t or full name
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching characters such as the first letter of the name
    Select Customer Search      ${EMPTY}    ws_*    ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 038 Search a voice customer in customer search by a wildcard character
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by a wildcard character
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ws_*    ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 039 Search an email customer to not have phone number in customer search and verify the icons with tooltip show history and click to email
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Email button display when searching
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST2_EMAIL}    ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 040 Search an email customer having phone number in customer search and verify the icons with tooltip show history, Click to call and click to email
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button, Click to Call and Click to Email button display when searching
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST1_EMAIL}    ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}     10


#=======================================================================================================================
# Huy, May 13, 2021
CC-19923_TC041 - Search a email or webchat customer in customer search after agent calls out
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session
    # delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent makes outbound call to customer
    AvayaIXworkplaceLib.Login Phone     ${CUST8.PHONE}      ${CUST8.PHONE_PASSWORD}     ${CUST8.SERVER_INFO}
    AgentToolbar.Agent Calls Out        ${CUST8.PHONE}
    Sleep    3
    ${loc dn end btn}=  String.Format String    ${LOC_VERIFY_WORKCARD_END_BUTTON}   ${CUST8.PHONE}
    Wait Until Element Is Visible    ${loc dn end btn}      ${TIMEOUT_LONG}
    AvayaIXworkplaceLib.Accept Call     ${BL_AGENT1.PHONE_NUMBER}
    Sleep    5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Click on the customer search sidebar icon
    # 3.3 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    email=${CUST8.Email}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3.4 Verify email customer in search result
    Verify Email Customer In Search Result  ${CUST8.Email}

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent release call
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE}


#=======================================================================================================================
# Huy, May 13, 2021
CC-19923_TC042 - Search a email or webchat customer in customer search after a customer makes inbound call to agent
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session
    # delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes inbound call to agent
    AvayaIXworkplaceLib.Login Phone     ${CUST8.PHONE}      ${CUST8.PHONE_PASSWORD}     ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${BL_AGENT1.PHONE_NUMBER}
    Sleep    3
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE}
    Sleep    5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Click on the customer search sidebar icon
    # 3.3 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    email=${CUST8.Email}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3.4 Verify email customer in search result
    Verify Email Customer In Search Result  ${CUST8.Email}

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent release call
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE}


#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#Created date:     /02/2021
CC19923 043 Search an email or webchat customer in customer search after agent is staying a MM contact
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
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

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST2_NAME}    #${CUST2_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify the information of customers after agent is staying a MM contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}     ${CUST2_EMAIL}     ${EMPTY}
    Verify Customer Search      ${CUST2_NAME}    ${CUST2_NAME}    ${CUST2_EMAIL}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends WC Contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}



#=======================================================================================================================
# Huy, May 12, 2021
CC-19923_TC044 - Search a voice customer in customer search after agent calls out
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session
    # delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent makes outbound call to customer
    AvayaIXworkplaceLib.Login Phone     ${CUST8.PHONE}      ${CUST8.PHONE_PASSWORD}     ${CUST8.SERVER_INFO}
    AgentToolbar.Agent Calls Out        ${CUST8.PHONE}
    Sleep    3
    AvayaIXworkplaceLib.Accept Call     ${BL_AGENT1.PHONE_NUMBER}
    Sleep    5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Click on the customer search sidebar icon
    # 3.3 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    phone=${CUST8.PHONE}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3.4 Verify customer phone in search result
    Click On The First Customer In The Search Results
    Verify Customer Telephone Number  ${CUST8.PHONE}

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent release call
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE}


#=======================================================================================================================
# Huy, May 13, 2021
CC-19923_TC045 - Search a voice customer in customer search after a customer makes inbound call to agent
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session
    # delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes inbound call to agent
    AvayaIXworkplaceLib.Login Phone     ${CUST8.PHONE}      ${CUST8.PHONE_PASSWORD}     ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${BL_AGENT1.PHONE_NUMBER}
    Sleep    3
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE}
    Sleep    5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Click on the customer search sidebar icon
    # 3.3 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    surname=${CUST8.Lastname}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3.4 Verify customer phone in search result
    Click On The First Customer In The Search Results
    Verify Customer Telephone Number  ${CUST8.PHONE}

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent release call
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE}


#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#Created date:     /02/2021
CC19923 046 Search a voice customer in customer search after agent is staying a MM contact
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
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

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}    #${CUST1_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify the information of customers after agent is staying a MM contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}     ${CUST1_EMAIL}     ${EMPTY}
    Verify Customer Search      ${CUST1_NAME}    ${CUST1_NAME}    ${CUST1_EMAIL}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends WC Contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}


#=======================================================================================================================
# Huy, May 17, 2021
CC-19923_TC047 - Calls out by the icon Click to call of a email or webchat customer on voice only agent in customer search list
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a voice only agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Click on the customer search sidebar icon.

    # Click to customer search layout
    NavigationMenu.Open Customer Search
    # Customer seach page should not displayed for Voice only agent
    Page Should Not Contain Element     ${CUSTOMER_SEARCH_BTN_SEARCH}   30s

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Enter search criteria to find a email/webchat customer in the CCMM database and select search

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    In customer search list, choose a customer have both email and phone and click the icon with tooltip "click to call" to call out customer.


#=======================================================================================================================
# Huy, May 17, 2021
CC-19923_TC048 - Calls out by the icon Click to call of a email or webchat customer on MM only agent in customer search list
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a MM only agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Click on the customer search sidebar icon
    # Click to customer search layout
    NavigationMenu.Open Customer Search

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Enter search criteria to find a email/webchat customer in the CCMM database and select search
    # 1. delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    AgentToolbar.Verify Toast Message Contains    success
    # 2. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    email=${CUST8.Email}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3. Verify email customer in search result
    Verify Email Customer In Search Result  ${CUST8.Email}

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    In customer search list, choose a customer have both email and phone and click the icon with tooltip "click to call" to call out customer.
    CustomerSearch.Verify Call Out Button GrayOut for Multimedia Agent     ${CUST8.PHONE}


#=======================================================================================================================
# Huy, May 18, 2021
CC-19923_TC049 - Calls out by the icon Click to call of a email or webchat customer on blend agent in customer search list
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP	STEP 01    Login a blend agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP	STEP 02    Click Start Work to ensure you have a Multimedia session

	# STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP	STEP 03    Click on the customer search sidebar icon
    # Click to customer search layout
    NavigationMenu.Open Customer Search

	# STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP	STEP 04    Enter search criteria to find a email/webchat customer in the CCMM database and select search
    # 1. delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    AgentToolbar.Verify Toast Message Contains    success
    # 2. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    email=${CUST8.Email}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3. Verify email customer in search result
    Verify Email Customer In Search Result  ${CUST8.Email}

	# STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP	STEP 05    In customer search list, choose a customer have both email and phone and click the icon with tooltip "click to call" to call out customer
	AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
	CustomerSearch.Click To Call Out Button		${CUST8.PHONE}
	Verify End Button Present In WorkCard		${CUST8.PHONE}
	WorkCard.Agent Ends A Contact    ${CUST8.PHONE}


#=======================================================================================================================
# Huy, May 18, 2021
CC-19923_TC050 - Blend agent calls out by the icon Click to call of a email or webchat customer in information detail customer in customer search
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP	STEP 01    Login a blend agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP	STEP 02    Click Start Work to ensure you have a Multimedia session

	# STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP	STEP 03    Click on the customer search sidebar icon
    # Click to customer search layout
    NavigationMenu.Open Customer Search

	# STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP	STEP 04    Enter search criteria to find a email/webchat customer in the CCMM database and select search
    # 1. delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    AgentToolbar.Verify Toast Message Contains    success
    # 2. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    email=${CUST8.Email}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3. Verify email customer in search result
    Verify Email Customer In Search Result  ${CUST8.Email}

	# STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP	STEP 05    In customer search list, choose a customer have both email and phone and click the icon with tooltip "click to call" to call out customer
	CustomerSearch.Click To Call Out Button		${CUST8.PHONE}
	Verify End Button Present In WorkCard		${CUST8.PHONE}
	WorkCard.Agent Ends A Contact    ${CUST8.PHONE}


#=======================================================================================================================
# Huy, May 18, 2021
CC-19923_TC051 - Calls out by the icon Click to call of a voice customer on voice only agent in customer search list
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a voice only agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Click on the customer search sidebar icon.

    # Click to customer search layout
    NavigationMenu.Open Customer Search
    # Customer seach page should not displayed for Voice only agent
    Page Should Not Contain Element     ${CUSTOMER_SEARCH_BTN_SEARCH}   30s

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Enter search criteria to find a email/webchat customer in the CCMM database and select search

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    In customer search list, choose a customer have both email and phone and click the icon with tooltip "click to call" to call out customer.


#=======================================================================================================================
# Huy, May 19, 2021
CC-19923_TC052 - Calls out by the icon Click to call of a voice customer on MM only agent in customer search list
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}     AND
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


	Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a MM only agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Click on the customer search sidebar icon.
    # Click to customer search layout
    NavigationMenu.Open Customer Search

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Enter search criteria to find a voice customer in the CCMM database and select search
	# 1. delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    AgentToolbar.Verify Toast Message Contains    success
    # 2. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    email=${CUST8.Email}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3. Verify email customer in search result
    Verify Email Customer In Search Result  ${CUST8.Email}

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    In customer search list, choose a customer and click the icon with tooltip "click to call" to call out customer
	CustomerSearch.Verify Call Out Button GrayOut for Multimedia Agent     ${CUST8.PHONE}

#=======================================================================================================================
# Huy, May 19, 2021
CC-19923_TC053 - Calls out by the icon Click to call of a voice customer on blend agent in customer search list
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     AvayaIXworkplaceLib.End All Calls   AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers


	Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a blended agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Click on the customer search sidebar icon.
    # Click to customer search layout
    NavigationMenu.Open Customer Search

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Enter search criteria to find a voice customer in the CCMM database and select search
	# 1. delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    AgentToolbar.Verify Toast Message Contains    success
    # 2. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    email=${CUST8.Email}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3. Verify email customer in search result
    Verify Email Customer In Search Result  ${CUST8.Email}

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    In customer search list, choose a customer and click the icon with tooltip "click to call" to call out customer.
	AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
	CustomerSearch.Click To Call Out Button		${CUST8.PHONE}
	Verify End Button Present In WorkCard		${CUST8.PHONE}
	WorkCard.Agent Ends A Contact    ${CUST8.PHONE}

#=======================================================================================================================
# Huy, May 19, 2021
CC-19923_TC054 - Blend agent calls out by the icon Click to call of a voice customer in information detail customer in customer search
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     AvayaIXworkplaceLib.End All Calls   AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers


	Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a blended agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Click on the customer search sidebar icon.
    # Click to customer search layout
    NavigationMenu.Open Customer Search

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Enter search criteria to find a voice customer in the CCMM database and select search
	# 1. delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    AgentToolbar.Verify Toast Message Contains    success
    # 2. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    email=${CUST8.Email}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3. Verify email customer in search result
    Verify Email Customer In Search Result  ${CUST8.Email}

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    In customer search list, choose a customer and click the icon with tooltip "click to call" to call out customer.
	AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
	CustomerSearch.Click To Call Out Button		${CUST8.PHONE}
	Verify End Button Present In WorkCard		${CUST8.PHONE}
	WorkCard.Agent Ends A Contact    ${CUST8.PHONE}

#=======================================================================================================================
# Huy, May 19, 2021
CC-19923_TC055 - Calls out by the icon Click to call a email or webchat customer when agent is not ready reason code
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     AvayaIXworkplaceLib.End All Calls   AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers


	Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a blended agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Change status of agent is not ready reason code.
    AgentToolbar.Agent Go Not Ready    ${NRD.DEFAULT_CODE}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Click on the customer search sidebar icon.
    # Click to customer search layout
    NavigationMenu.Open Customer Search

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Enter search criteria to find a voice customer in the CCMM database and select search
	# 1. delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    AgentToolbar.Verify Toast Message Contains    success
    # 2. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    email=${CUST8.Email}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3. Verify email customer in search result
    Verify Email Customer In Search Result  ${CUST8.Email}

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    In customer search list, choose a customer and click the icon with tooltip "click to call" to call out customer.
	AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
	CustomerSearch.Click To Call Out Button		${CUST8.PHONE}
	Verify End Button Present In WorkCard		${CUST8.PHONE}
	WorkCard.Agent Ends A Contact    ${CUST8.PHONE}


#=======================================================================================================================
# Huy, May 25, 2021
CC-19923_TC056 - Calls out by the icon Click to call a voice customer when agent is not ready reason code
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     AvayaIXworkplaceLib.End All Calls   AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers


	Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a blended agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Change status of agent is not ready reason code.
    AgentToolbar.Agent Go Not Ready    ${NRD.DEFAULT_CODE}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Click on the customer search sidebar icon.
    # Click to customer search layout
    NavigationMenu.Open Customer Search

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Enter search criteria to find a voice customer in the CCMM database and select search
	# 1. delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    AgentToolbar.Verify Toast Message Contains    success
    # 2. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    phone=${CUST8.PHONE}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3. Verify email customer in search result
    Verify Email Customer In Search Result  ${CUST8.Email}

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    In customer search list, choose a customer and click the icon with tooltip "click to call" to call out customer.
	AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
	CustomerSearch.Click To Call Out Button		${CUST8.PHONE}
	Verify End Button Present In WorkCard		${CUST8.PHONE}
	WorkCard.Agent Ends A Contact    ${CUST8.PHONE}


#=======================================================================================================================
# Huy, May 25, 2021
CC-19923_TC057 - Calls out by the icon Click to call a email or webchat customer when agent makes call to supervisor
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_0}    ${BROWSER_AGENT_ALIAS_0}    ${BL_SUP1.USERNAME}    ${BL_SUP1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     AvayaIXworkplaceLib.End All Calls   AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_0}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers


	Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a blended agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent makes call to supervisor
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Calls Supervisor
    Switch Browser    ${BROWSER_AGENT_ALIAS_0}
    WorkCard.Agent Accepts A Contact    ${BL_AGENT1.PHONE_NUMBER}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Click on the customer search sidebar icon.
    # Click to customer search layout
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Customer Search

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Enter search criteria to find a email/webchat customer in the CCMM database and select search
	# 1. delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    AgentToolbar.Verify Toast Message Contains    success
    # 2. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    email=${CUST8.Email}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3. Verify email customer in search result
    Verify Email Customer In Search Result  ${CUST8.Email}

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    In customer search list, choose a customer and click the icon with tooltip "click to call" to call out customer.
	AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
	CustomerSearch.Click To Call Out Button		${CUST8.PHONE}
	Verify End Button Present In WorkCard		${CUST8.PHONE}
	WorkCard.Agent Ends A Contact    ${CUST8.PHONE}
	Sleep    5
	WorkCard.Agent Unhold A Contact    ${BL_SUP1.PHONE_NUMBER}
	Sleep    5
	WorkCard.Agent Ends A Contact    ${BL_SUP1.PHONE_NUMBER}



#=======================================================================================================================
# Huy, May 25, 2021
CC-19923_TC058 - Calls out by the icon Click to call a voice customer when agent makes call to supervisor
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_0}    ${BROWSER_AGENT_ALIAS_0}    ${BL_SUP1.USERNAME}    ${BL_SUP1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     AvayaIXworkplaceLib.End All Calls   AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_0}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers


	Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a blended agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent makes call to supervisor
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Calls Supervisor
    Switch Browser    ${BROWSER_AGENT_ALIAS_0}
    WorkCard.Agent Accepts A Contact    ${BL_AGENT1.PHONE_NUMBER}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Click on the customer search sidebar icon.
    # Click to customer search layout
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Customer Search

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Enter search criteria to find a voice customer in the CCMM database and select search
	# 1. delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    AgentToolbar.Verify Toast Message Contains    success
    # 2. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    phone=${CUST8.PHONE}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3. Verify email customer in search result
    Verify Email Customer In Search Result  ${CUST8.Email}

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    In customer search list, choose a customer and click the icon with tooltip "click to call" to call out customer.
	AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
	CustomerSearch.Click To Call Out Button		${CUST8.PHONE}
	Verify End Button Present In WorkCard		${CUST8.PHONE}
	WorkCard.Agent Ends A Contact    ${CUST8.PHONE}
	Sleep    5
	WorkCard.Agent Unhold A Contact    ${BL_SUP1.PHONE_NUMBER}
	Sleep    5
	WorkCard.Agent Ends A Contact    ${BL_SUP1.PHONE_NUMBER}


#=======================================================================================================================
#Created date:     /02/2021
CC-19923_TC063 - Calls out by the icon Click to call a email or webchat customer when agent accepts a MM contact
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     AvayaIXworkplaceLib.End All Calls   AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers


	Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a blended agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts a MM contact
        # 2.1 Agent accept an EWC
    # 2.1.1 Customer send new chat to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep    2
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${BL_AGENT1.SKILLSET_WC1}
    Sleep   7
    # 2.1.2 Agent accepst chat
	Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    Sleep   3
    # 2.2 Create customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Click on the customer search sidebar icon.
    # Click to customer search layout
    NavigationMenu.Open Customer Search

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Enter search criteria to find a voice customer in the CCMM database and select search
	# 1. delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    #AgentToolbar.Verify Toast Message Contains    success
    # 2. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    phone=${CUST8.PHONE}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3. Verify email customer in search result
    Verify Email Customer In Search Result  ${CUST8.Email}

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    In customer search list, choose a customer and click the icon with tooltip "click to call" to call out customer.
	AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
	CustomerSearch.Click To Call Out Button		${CUST8.PHONE}
	Verify End Button Present In WorkCard		${CUST8.PHONE}
	WorkCard.Agent Ends A Contact    ${CUST8.PHONE}



#=======================================================================================================================
#Created date:     /02/2021
CC-19923_TC064 - Calls out by the icon Click to call a voice customer when agent accepts a MM contact
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     AvayaIXworkplaceLib.End All Calls   AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers


	Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a blended agent on workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts a MM contact
    # 2.1 Agent accept an EWC
    # 2.1.1 Customer send new chat to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep    2
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${BL_AGENT1.SKILLSET_WC1}
    Sleep   7
    # 2.1.2 Agent accepst chat
	Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    Sleep   3
    # 2.2 Create customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Click on the customer search sidebar icon.
    # Click to customer search layout
    NavigationMenu.Open Customer Search

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Enter search criteria to find a voice customer in the CCMM database and select search
	# 1. delete and create a new customer cust 8
    DataManagement.Delete Customer By Email    ${CUST8.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{CUST8}
    AgentToolbar.Verify Toast Message Contains    success
    # 2. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    email=${CUST8.Email}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3. Verify email customer in search result
    Verify Email Customer In Search Result  ${CUST8.Email}

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    In customer search list, choose a customer and click the icon with tooltip "click to call" to call out customer.
	AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
	CustomerSearch.Click To Call Out Button		${CUST8.PHONE}
	Verify End Button Present In WorkCard		${CUST8.PHONE}
	WorkCard.Agent Ends A Contact    ${CUST8.PHONE}


#=======================================================================================================================
#Created date:     /02/2021
CC19923 065 Retrieve history of an email or webchat customer on voice only agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
    NavigationMenu.Open Customer Search
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify that cannot search customer on voice only agent
    Wait Until Element Is Visible    //div[@class='widget__content ps']//div[contains(@class,'empty')]     20

#=======================================================================================================================

#Created date:     /02/2021
CC19923 066 Retrieve history of an email or webchat customer on MM only agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button, Click to Call and Click to Email button display when searching
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST1_EMAIL}    ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify can see the history og customer by clicking the Show History button
    Click Element    ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}
    Sleep   1
    Page Should Contain Element     ${LOC_WORKSPACE_CUSTOMER_HISTORY_BTN_SHOW_FIRST_DETAIL}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 067 Retrieve history of an email or webchat customer on blend agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button, Click to Call and Click to Email button display when searching
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST1_EMAIL}    ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify can see the history og customer by clicking the Show History button
    Click Element    ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}
    Sleep   1
    Page Should Contain Element     ${LOC_WORKSPACE_CUSTOMER_HISTORY_BTN_SHOW_FIRST_DETAIL}     10



#=======================================================================================================================
#Created date:     /02/2021
CC-19923_TC068 - Send an email from customer search on a voice only agent
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a voice only agent on workspaces.
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Click Start Work to ensure you have a Multimedia session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Click on the customer search sidebar icon
    # Click to customer search layout
    NavigationMenu.Open Customer Search
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Enter search criteria to find a email customer in the CCMM database and select search
    # 2.1 Agent accept an EWC
    # 2.1.1 Customer send new chat to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep    2
    WebChat.Customer Init A Chat Session     cust_info=${CUST6_INFO}   cust_skillset=${MM_AGENT1.SKILLSET_WC1}   email_chatscript=No
    Sleep   7
    # 2.1.2 Agent accepst chat
	Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    Sleep   3
    # 2.2 Create customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    NavigationMenu.Open Customer Search

    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    In customer search list, choose a customer and click the icon with tooltip "Click to email" to send an email on Workspaces.
    NavigationMenu.Open Customer Search
    Select Customer Search      email=${CUST1_EMAIL}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_CLICK_TO_EMAIL}     10
    # On go




#=======================================================================================================================

#=======================================================================================================================

#Created date:     /02/2021
CC19923 069 Send an email from customer search on a MM only agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button, Click to Call and Click to Email button display when searching
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST1_EMAIL}    ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}     10

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify can see the history og customer by clicking the Show History button
    Click Element    ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}
    Sleep   1
    Handle Alert    accept
    Sleep   2
    Close Mail Application

#=======================================================================================================================

#Created date:     /02/2021
CC19923 070 Send an email from customer search on a blend agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button, Click to Call and Click to Email button display when searching
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST1_EMAIL}    ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}     10

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify can see the history og customer by clicking the Show History button
    Click Element    ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}
    Sleep   1
    Handle Alert    accept
    Sleep   2
    Close Mail Application

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#Created date:     /02/2021
CC19923 074 Search an email or webchat customer in customer history by date
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Date
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Date   ${CUST2_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

    # STEP 0:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00     Reload page
    Reload Page
    Sleep   2
    Handle Alert    accept
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}   #${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_NAME}   Hello Customer, I'm Agent
#    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT5_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_NAME}   Hi Agent, I have some Issues
#    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}    #${CUST1_EMAIL}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify can search WC contact in customer history by Date
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Date   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    WC   ${CUST1_EMAIL}    ${CUST1_NAME}    ${EMPTY}    Hello Customer, I'm Agent

#=======================================================================================================================

#Created date:     /02/2021
CC19923 075 Search an email or webchat customer in customer history by customer email
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Email
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Email   ${CUST2_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

    # STEP 0:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00     Reload page
    Reload Page
    Sleep   2
    Handle Alert    accept
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}   #${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_NAME}   Hello Customer, I'm Agent
#    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT5_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_NAME}   Hi Agent, I have some Issues
#    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}    #${CUST1_EMAIL}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify can search a WC contact in customer history by Email
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Email   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    WC   ${CUST1_EMAIL}    ${CUST1_NAME}    ${EMPTY}    Hello Customer, I'm Agent

#=======================================================================================================================

#Created date:     /02/2021
CC19923 076 Search an email or webchat customer in customer history by subject
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Subject
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Subject   THIS IS MAIL FROM OANH_CUSTOMER
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 077 Search an email or webchat customer in customer history by to address
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

   # STEP 00: Customer open Outlook and delete all old email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Customer open Outlook and delete all old email
    Outlook.Open Outlook
    Sleep   3
    Outlook.Delete Old Email
    Sleep   1

    # STEP 1: Agent creates new Email and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT5_MAIL}    ${SUBJECT_EMAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify can search an email contact in customer history by To Address
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   To    ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM    ${AGENT5_MAIL}   ${CUST1_EMAIL}    ${SUBJECT_MAIL1}    ${CONTENT_EMAIL1}
#    CustomerHistorySearch.Verify Customer History Search    EM    WS_WC1@acc7dc.com    ${CUST1_EMAIL}    Password Reminder    Find below your login details for our web portal.

#=======================================================================================================================

#Created date:     /02/2021
CC19923 078 Search an email or webchat customer in customer history by Date and Customer email
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Date and Email
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Date   ${CUST2_EMAIL}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer   Email   ${CUST2_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

    # STEP 0:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00     Reload page
    Reload Page
    Sleep   2
    Handle Alert    accept
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}   #${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_NAME}   Hello Customer, I'm Agent
#    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT5_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_NAME}   Hi Agent, I have some Issues
#    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}    #${CUST1_EMAIL}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify can search WC contact in customer history by Date and Customer email
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Date   ${CUST1_EMAIL}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer   Email   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    WC   ${CUST1_EMAIL}    ${CUST1_NAME}    ${EMPTY}    Hello Customer, I'm Agent

#=======================================================================================================================

#Created date:     /02/2021
CC19923 079 Search an email or webchat customer in customer history by Date and subject
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Date and Subject
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Date   ${CUST2_EMAIL}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer    Subject    THIS IS MAIL FROM OANH_CUSTOMER
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 080 Search an email or webchat customer in customer history by Date and to Address
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

    # STEP 00: Customer open Outlook and delete all old email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Customer open Outlook and delete all old email
    Outlook.Open Outlook
    Sleep   3
    Outlook.Delete Old Email
    Sleep   1

    # STEP 1: Agent creates new Email and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT5_MAIL}    ${SUBJECT_EMAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Date and To address
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Date   ${CUST1_EMAIL}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer   To   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM    ${AGENT5_MAIL}   ${CUST1_EMAIL}    ${SUBJECT_MAIL1}    ${CONTENT_EMAIL1}
    #CustomerHistorySearch.Verify Customer History Search    EM    WS_WC1@acc7dc.com    ${CUST1_EMAIL}    Password Reminder    Find below your login details for our web portal.

#=======================================================================================================================

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

#=======================================================================================================================

#Created date:     /02/2021
CC19923 082 Search an email or webchat customer in customer history by Date, Customer email and To Address
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Log To Console    Setup.Start_Login.Login Agent: ${BROWSER_AGENT_1}|${BROWSER_AGENT_ALIAS_1}|${AGENT5_USERNAME}|${AGENT5_PASSWORD}      AND
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
    Log To Console    Start_customer sent an email: ${AGENT5_MAIL}|${SUBJECT_MAIL1}|${MESSAGE_EMAIL1}|${EMPTY}|${CUST2_EMAIL}
    customer sent an email      ${AGENT5_MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}


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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Date, Email and To Address
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Date   ${CUST2_EMAIL}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer    To    ${AGENT5_MAIL}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer    Email    ${CUST2_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

#=======================================================================================================================
    
CC-19923_TC083 - Search an email or webchat customer in customer history by Customer email and subject
    Log to console      CC-19923_TC083 - Search an email or webchat customer in customer history by Customer email and subject
        [Setup]     Run Keywords
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
    Customer Sent An Email      ${AGENT5_MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}


    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}      #${CUST2_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Customer Email and Subject
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer    Subject    ${SUBJECT_MAIL1}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer    Email    ${CUST2_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

#=======================================================================================================================

CC-19923_TC084 - Search an email or webchat customer in customer history by Customer email and To Address
    [Setup]     Run Keywords
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
    Log To Console    Start_customer sent an email: ${AGENT5_MAIL}|${SUBJECT_MAIL1}|${MESSAGE_EMAIL1}|${EMPTY}|${CUST2_EMAIL}
    Customer Sent An Email      ${AGENT5_MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}


    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}      #${CUST2_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Customer email and To Address
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer    To    ${AGENT5_MAIL}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer    Email    ${CUST2_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

#=======================================================================================================================

CC-19923_TC085 - Search an email or webchat customer in customer history by Customer email, subject and To Address
    Log To Console    CC-19923_TC085 - Search an email or webchat customer in customer history by Customer email, subject and To Address
        [Setup]     Run Keywords
    ...     Log To Console    Setup.Start_Login.Login Agent: ${BROWSER_AGENT_1}|${BROWSER_AGENT_ALIAS_1}|${AGENT5_USERNAME}|${AGENT5_PASSWORD}      AND
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
    Log To Console    Start_customer sent an email: ${AGENT5_MAIL}|${SUBJECT_MAIL1}|${MESSAGE_EMAIL1}|${EMPTY}|${CUST2_EMAIL}
    Customer Sent An Email      ${AGENT5_MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}


    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}      #${CUST2_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Customer email, subject and To Address
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer    Subject    ${SUBJECT_MAIL1}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer    To    ${AGENT5_MAIL}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer    Email    ${CUST2_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

#=======================================================================================================================

CC-19923_TC086 - Search an email or webchat customer in customer history by Subject and To Address
    Log To Console    CC-19923_TC086 - Search an email or webchat customer in customer history by Subject and To Address
        [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Log To Console    Setup.Start_Login.Login Agent: ${BROWSER_AGENT_1}|${BROWSER_AGENT_ALIAS_1}|${AGENT5_USERNAME}|${AGENT5_PASSWORD}      AND
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
    Log To Console    Start_customer sent an email: ${AGENT5_MAIL}|${SUBJECT_MAIL1}|${MESSAGE_EMAIL1}|${EMPTY}|${CUST2_EMAIL}
    Customer Sent An Email      ${AGENT5_MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}


    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}      #${CUST2_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by subject and To Address
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer    Subject    ${SUBJECT_MAIL1}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer    To    ${AGENT5_MAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

#=======================================================================================================================

# Huy 15/03/2021
CC-19923_TC087 - Search an email or webchat customer in customer history when agent accepts a inbound call from customer
    Log To Console    CC-19923_TC087 - Search an email or webchat customer in customer history when agent accepts a inbound call from customer
        [Setup]     Run Keywords
#           Login blended agent 1 to workspaces, start work and go ready
    ...     AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}     AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Log To Console   Teardown.Switch Browser     ${BROWSER_AGENT_ALIAS_1}   AND
    ...    AvayaIXworkplaceLib.Close Phone      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep    2
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3.SKILLSET_WC}
    Sleep   7

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST6_NAME}
    Sleep   3

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST6_NAME}
    Sleep   2

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer make call to agent
    AvayaIXworkplaceLib.Make Call To Number    ${AGENT3_PHONE_NUMBER}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent accepts a inbound call from customer
#    WorkCard.Agent Accepts A Contact     ${CUST8.URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Enter search criteria to find a email or webchat customer in the CCMM database and select search.
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer    Email    ${CUST6_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    WC   ${CUST6_EMAIL}

#=======================================================================================================================

#Huy 15/03/2021
CC-19923_TC088 - Search an email or webchat customer in customer history when agent accepts an email from customer
    Log To Console    CC-19923_TC088 - Search an email or webchat customer in customer history when agent accepts an email from customer
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
    Customer Sent An Email      ${AGENT5_MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep    2
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST6_NAME}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify can search an email contact in customer history by subject and To Address
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer    Subject    ${SUBJECT_MAIL1}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer    To    ${AGENT5_MAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

#=======================================================================================================================

# Huy 15/03/2021
CC-19923_TC089 - Search an email or webchat customer in customer history when agent accepts an webchat from customer
    Log To Console    CC-19923_TC089 - Search an email or webchat customer in customer history when agent accepts an webchat from customer
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
    Customer Sent An Email      ${AGENT5_MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Open Outlook, from customer sent to Server the Email without attachment
    Log To Console    Start_customer sent an email: ${AGENT5_MAIL}|${SUBJECT_MAIL1}|${MESSAGE_EMAIL1}|${EMPTY}|${CUST2_EMAIL}
    Customer Sent An Email      ${AGENT5_MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}


    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}      #${CUST2_EMAIL}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify can search an email contact in customer history by subject and To Address
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer    Subject    ${SUBJECT_MAIL1}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer    To    ${AGENT5_MAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

#=======================================================================================================================

# Huy 17/03/2021
CC-19923_TC090 - Search an email or webchat customer in customer history when agent makes a supervisor call
    Log To Console    CC-19923_TC090 - Search an email or webchat customer in customer history when agent makes a supervisor call
        [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep    2
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT5_SKILLSET_WC}
    Sleep   7

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST6_NAME}
    Sleep   3

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST6_NAME}
    Sleep   2

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent makes a supervisor call
    AgentToolbar.Agent Calls Supervisor

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify can search a Webchat contact in customer history by email
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer    Email    ${CUST6.EMAIL}
    CustomerHistorySearch.Verify Customer History Search    WC   ${CUST6.EMAIL}

#=======================================================================================================================

# Huy, 17/03/2021
CC-19923_TC94_CC-22338 Make sure correct error message when login voice only agent then search
    Log To Console  CC-19923_TC94_CC-22338 Make sure correct error message when login voice only agent then search
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VOICE_AGENT1_USERNAME}    ${VOICE_AGENT1_PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Click on Multimedia Contact search
    Sleep   5
    NavigationMenu.Open Multimedia Contact Search
    Sleep   1
    MultimediaContactSearch.Verify Multimedia Contact Search Not Display For Voice Only Agent
    Sleep    2

#=======================================================================================================================

# Huy, 17/03/2021
CC-19923_TC95_CC-23574 Should have the Scrollbar in the Address tab when the Workspaces page does not maximize
    Log To Console  CC-19923_TC95_CC-23574 Should have the Scrollbar in the Address tab when the Workspaces page does not maximize
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Issue still open

#=======================================================================================================================

# Huy, 17/03/2021
CC-19923_TC97_CC-23669 Searching by Customer Email should return the result of the Email out from Agent
    Log To Console  CC-19923_TC97_CC-23669 Searching by Customer Email should return the result of the Email out from Agent
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Issue still open

#=======================================================================================================================


CC-19923_TC091 - Modify the information of history customer on database cls.Customers file successfully
CC-19923_TC092 - Modify the information of history customer on AAAD successfully
CC-19923_TC001 - Customer email or chat will be created successfully on database cls.Customers file


#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================










##Created date:     /02/2021
#CC19923 003 Customer email or chat will be created successfully when a customer email or webchat sends to agent
#    [Setup]     Run Keywords
#    #   Login blended agent 1 to workspaces, start work and go ready
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1
#    [Teardown]    Run Keywords
#    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
#    ...    WorkCard.Agent End Any Inbound Contact      AND
#    ...    AgentToolbar.Agent Finish Work   AND
#    ...    AgentToolbar.Agent Exit      AND
#    ...    Close All Browsers
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
#    # STEP 3:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
#    Sleep   5
#    NavigationMenu.Open Customer Search
#    Sleep   2
#    CustomerHistorySearch.Search Customer   Email   ${CUST2_EMAIL}
#    CustomerHistorySearch.Verify Customer Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}
#
#    # STEP 4:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email contact
#    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}
#
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
#
##=======================================================================================================================
#
##=======================================================================================================================
#
##Created date:     /02/2021
#CC19923 009 Search a email or webchat customer in customer search on voice only agent.
#    [Setup]     Run Keywords
#    #   Login blended agent 1 to workspaces, start work and go ready
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1
#    [Teardown]    Run Keywords
#    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
#    ...    WorkCard.Agent End Any Inbound Contact      AND
#    ...    AgentToolbar.Agent Finish Work   AND
#    ...    AgentToolbar.Agent Exit      AND
#    ...    Close All Browsers
#
#    # STEP 3:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
#    NavigationMenu.Open Customer Search
#    Sleep   1
#
#    # STEP 2:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify that cannot search customer on voice only agent
#    Wait Until Element Is Visible    //div[@class='widget__content']//div[contains(@class,'empty')]     20
#
##=======================================================================================================================
#
##Created date:     /02/2021
#CC19923 010 Search a email or webchat customer in customer search on MM only agent
#    [Setup]     Run Keywords
#    #   Login blended agent 1 to workspaces, start work and go ready
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1
#    [Teardown]    Run Keywords
#    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
#    ...    WorkCard.Agent End Any Inbound Contact      AND
#    ...    AgentToolbar.Agent Finish Work   AND
#    ...    AgentToolbar.Agent Exit      AND
#    ...    Close All Browsers
#
#    # STEP 1:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
#    Outlook.Open Outlook
#    Outlook.Send Email Without Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
#    Outlook.Send Email
#    Sleep   20
#    Outlook.Close Outlook
#
#    # STEP 2:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
#    WorkCard.Agent Accepts A Contact     ${CUST1_NAME}      #${CUST1_EMAIL}
#    Sleep   1
#
#    # STEP 3:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
#    Sleep   5
#    NavigationMenu.Open Customer Search
#    Sleep   2
#    CustomerHistorySearch.Search Customer   Email   ${CUST1_EMAIL}
#    CustomerHistorySearch.Verify Customer Search    EM   ${CUST1_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}
#
#    # STEP 4:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email contact
#    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST2_EMAIL}
#
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
#
##=======================================================================================================================
#
##Created date:     /02/2021
#CC19923 011 Search a email or webchat customer in customer search on blend agent
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
#    # STEP 1:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
#    Outlook.Open Outlook
#    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
#    Outlook.Send Email
#    Sleep   20
#    Outlook.Close Outlook
#
#    # STEP 2:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
#    WorkCard.Agent Accepts A Contact     ${CUST1_NAME}      #${CUST1_EMAIL}
#    Sleep   1
#
#    # STEP 3:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
#    Sleep   5
#    NavigationMenu.Open Customer Search
#    Sleep   2
#    CustomerHistorySearch.Search Customer   Email   ${CUST1_EMAIL}
#    CustomerHistorySearch.Verify Customer Search    EM   ${CUST1_EMAIL}    ${AGENT3_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}
#
#    # STEP 4:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email contact
#    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST2_EMAIL}
#
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
#    WebChat.Verify Message On Customer Chat     ${AGENT3_FIRSTNAME}     Hello Customer, I'm Agent
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
