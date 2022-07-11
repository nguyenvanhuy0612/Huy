*** Settings ***
Resource    ../../resources/Resource_CC-20046_Workspaces_WC_Disconnect_Message.robot

*** Test Cases ***
# Created by:       htmoanh
# Created date:     03/11/2020

#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#**********     CC-20046 Workspaces on ACC. System Message who disconnected the chat- Customer or Agent     ************
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#Created date:     5/11/2020
Workspaces_WC_Disconnect_Message_CC-20046-TC001 As an agent, I want to know which party closed EWC contact for the chat session that Agent close first
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 4: Agent send chat to Customer and verify this message display on Customer chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Agent send chat to Customer and verify this message display on Customer chat
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   OK. Let me see...
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     OK. Let me see...

    # STEP 5: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify chat message in the Customer history after Agent end WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer    Email   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   Agent left chat
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   All Agents have left the conversation
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   Agent closed contact

#=======================================================================================================================

#Created date:     5/11/2020
Workspaces_WC_Disconnect_Message_CC-20046-TC002 As an agent or supervisor, I want to know which party closed EWC contact transfer different service for the chat session that Agent close first
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers     AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep   5
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT3_FIRSTNAME}
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT3_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT3_FIRSTNAME}
    Sleep   1

    # STEP 3: Switch to Customer's browser and Customer sends Message to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to Customer's browser and Customer sends Message to Agent
    Webchat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 3': Blended Agent 2 go ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03'    Blended Agent 2 go ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 4: Switch to agent1's browser and Agent 1 transfer WC to  service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT2_SKILLSET_WC2}
    Sleep   5

    # STEP 5: Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   5
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}!!!!
    Sleep   3
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}!!!!

    # STEP 6: Switch to Customer's browser and Customer sends Message to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to Customer's browser and Customer sends Message to Agent 2
    Webchat.Customer Sends Message To Agent     Oh, Nice to meet you!
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Oh, Nice to meet you!

    # STEP 7: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 7    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify chat message in the Customer history after Agent end WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer    Email   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   Agent left chat
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   All Agents have left the conversation
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   Agent closed contact

#=======================================================================================================================

#Created date:     5/11/2020
Workspaces_WC_Disconnect_Message_CC-20046-TC003 As an agent or supervisor, I want to know which party closed EWC contact transfer same service for the chat session that Agent close first
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers     AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep   5
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT3_FIRSTNAME}
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT3_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT3_FIRSTNAME}
    Sleep   1

    # STEP 3: Switch to Customer's browser and Customer sends Message to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to Customer's browser and Customer sends Message to Agent
    Webchat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 3': Blended Agent 2 go ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03'    Blended Agent 2 go ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 4: Switch to agent1's browser and Agent 1 transfer WC to service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT1_SKILLSET_WC1}
    Sleep   5

    # STEP 5: Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   5
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}!!!!
    Sleep   3
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}!!!!

    # STEP 6: Switch to Customer's browser and Customer sends Message to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to Customer's browser and Customer sends Message to Agent 2
    Webchat.Customer Sends Message To Agent     Oh, Nice to meet you!
    Sleep   7
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Oh, Nice to meet you!

    # STEP 7: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 7    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify chat message in the Customer history after Agent end WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer    Email   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   Agent left chat
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   All Agents have left the conversation
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   Agent closed contact

#=======================================================================================================================

#Created date:     6/11/2020
Workspaces_WC_Disconnect_Message_CC-20046-TC004 As an agent or supervisor, I want to know which party closed EWC contact for the chat session that Agent close first contact while system is sending comfort message
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Wait until the Comfort message is sent to Customer
    Sleep   30

    # STEP 5: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify chat message in the Customer history after Agent end WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer    Email   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   Agent left chat
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   All Agents have left the conversation
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   Agent closed contact

#=======================================================================================================================

#Created date:     6/11/2020
Workspaces_WC_Disconnect_Message_CC-20046-TC005 As an agent, I want to know which party closed EWC contact for the chat session that Agent close first in case browser is disconnected within 1 minute
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Close Agent browser
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Close Browser
    Sleep   30

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent login again
    Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}
    Login.Activate Agent
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify chat message in the Customer history after Agent end WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer    Email   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   Agent left chat
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   All Agents have left the conversation
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   Agent closed contact

#=======================================================================================================================

#Created date:     9/11/2020
Workspaces_WC_Disconnect_Message_CC-20046-TC006 As an agent, I want to know which party closed EWC contact for the transfer chat session that Agent close first in case browser is disconnected within 1 minute
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers     AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep   5
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   1

    # STEP 3: Switch to Customer's browser and Customer sends Message to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to Customer's browser and Customer sends Message to Agent
    Webchat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 4: Switch to agent1's browser and Agent 1 transfer WC to service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT1_SKILLSET_WC1}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Close Agent browser
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Close Browser
    Sleep   10

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent login again
    Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}
    Login.Activate Agent
    AgentToolbar.Agent Go Ready
    Sleep   5

    # STEP 7: Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   5
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}!!!!
    Sleep   3
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}!!!!

    # STEP 8: Switch to Customer's browser and Customer sends Message to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Switch to Customer's browser and Customer sends Message to Agent 2
    Webchat.Customer Sends Message To Agent     Oh, Nice to meet you!
    Sleep   7
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Oh, Nice to meet you!

    # STEP 9: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Verify chat message in the Customer history after Agent end WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer    Email   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   Agent left chat
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   All Agents have left the conversation
    CustomerHistorySearch.Verify Customer Search     WC     ${CUST1_EMAIL}    ${CUST1_NAME}   Agent   Agent closed contact

#=======================================================================================================================
