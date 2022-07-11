*** Settings ***
Resource    ../../resources/Resource_Workspaces_webchat.robot

*** Test Cases ***
# Created by:       htmoanh
# Created date:     06/04/2020

##=======================================================================================================================
#
#Created date:     06/04/2020
#TEST CASE 1: Workspaces_EWC_TC01 - Blended Agent can answer a webchat from customer on Workspaces
Workspaces_EWC_TC01 - Blended Agent can answer a webchat from customer on Workspaces
    [Documentation]  Workspaces_EWC_TC01 - Blended Agent can answer a webchat from customer on Workspaces
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
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
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

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
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     OK. Let me see...

    # STEP 5: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     06/04/2020
# TEST CASE 02: Workspaces_EWC_TC02 - Blended Agent can transfer to service to another skillset from customer on Workspaces
Workspaces_EWC_TC02 - Blended Agent can transfer to service to another skillset from customer on Workspaces
    [Documentation]  Workspaces_EWC_TC02 - Blended Agent can transfer to service to another skillset from customer on Workspaces
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT4_FIRSTNAME}
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT4_FIRSTNAME}
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
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT4_SKILLSET_WC2}
    Sleep   5

    # STEP 5: Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   5
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}!!!!
    Sleep   3
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}!!!!

    # STEP 6: Switch to Customer's browser and Customer sends Message to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to Customer's browser and Customer sends Message to Agent 2
    Webchat.Customer Sends Message To Agent     Oh, Nice to meet you!
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Oh, Nice to meet you!

    # STEP 7: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 7    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     06/04/2020
# TEST CASE 03: Workspaces_EWC_TC03 - Blended Agent can transfer to service to same skillset from customer on Workspaces
Workspaces_EWC_TC03 - Blended Agent can transfer to service to same skillset from customer on Workspaces
    [Documentation]  Workspaces_EWC_TC03 - Blended Agent can transfer to service to same skillset from customer on Workspaces
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT4_FIRSTNAME}
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT4_FIRSTNAME}
    Sleep   1

    # STEP 3: Switch to Customer's browser and Customer sends Message to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to Customer's browser and Customer sends Message to Agent
    Webchat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
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
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT4_SKILLSET_WC1}
    Sleep   5

    # STEP 5: Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}!!!!
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}!!!!

    # STEP 6: Switch to Customer's browser and Customer sends Message to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to Customer's browser and Customer sends Message to Agent 2
    Webchat.Customer Sends Message To Agent     Oh, Nice to meet you!
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Oh, Nice to meet you!

    # STEP 7: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     07/04/2020
# TEST CASE 04: Workspaces_EWC_TC04 - Blended Agent can reject the transferred webchat contact
Workspaces_EWC_TC04 - Blended Agent can reject the transferred webchat contact
    [Documentation]  Workspaces_EWC_TC04 - Blended Agent can reject the transferred webchat contact
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT4_FIRSTNAME}
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT4_FIRSTNAME}
    Sleep   1

    # STEP 3: Switch to Customer's browser and Customer sends Message to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to Customer's browser and Customer sends Message to Agent
    Webchat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
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
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT4_SKILLSET_WC2}
    Sleep   5
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 5: Switch to agent2's browser, Agent reject transfered WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent2's browser, Agent reject transfered WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Rejects A Contact   ${CUST1_EMAIL}

    # STEP 6: Verify Agent 2 go to Not ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Agent 2 go to Not ready
    AgentToolbar.Verify Not Ready   ${EMPTY}
    Sleep   2

    # STEP 7: Agent goes ready and accepts transfered WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent goes ready and accepts transfered WC
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}!!!!
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}!!!!

    # STEP 8: Switch to Customer's browser and Customer sends Message to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Switch to Customer's browser and Customer sends Message to Agent 2
    Webchat.Customer Sends Message To Agent     Oh, Nice to meet you!
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Oh, Nice to meet you!

    # STEP 10: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     07/04/2020
# TEST CASE 05: Workspaces_EWC_TC05 - Agent can decline webchat contact
Workspaces_EWC_TC05 - Agent can decline webchat contact
    [Documentation]  Workspaces_EWC_TC05 - Agent can decline webchat contact
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}

    # STEP 2: Switch to agent's browser, Agent reject WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser, Agent reject WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Rejects A Contact   ${CUST1_EMAIL}

    # STEP 3: Verify Agent go to Not ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Agent go to Not ready
    AgentToolbar.Verify Not Ready    ${EMPTY}
    Sleep   4

    # STEP 4: Agent goes ready and accepts WC and chat with customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent goes ready and accepts WC and chat with customer
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   1

    # STEP 5: Switch to Customer's browser and Customer sends Message to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to Customer's browser and Customer sends Message to Agent
    Webchat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 6: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 6    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================
#
#Created date:     07/04/2020
# TEST CASE 06: Workspaces_EWC_TC06 - Triggered screenpop will be pop-up on agent1 on Workspaces
Workspaces_EWC_TC06 - Triggered screenpop will be pop-up on agent1 on Workspaces
    [Documentation]  Workspaces_EWC_TC06 - Triggered screenpop will be pop-up on agent1 on Workspaces
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 2: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}

    # STEP 3: Switch to agent's browser and Agent accepts WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1

    # STEP 4: Open Settings, verify Screenpop Name Displays after Agent accepted contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Open Settings, verify Screenpop Name Displays after Agent accepted contact
    NavigationMenu.Open Screenpop
    Sleep   2
    Screenpop.Verify Screenpop Name Displays     ${SCREENPOP_NAME2}
    Sleep   3
    NavigationMenu.Open Chat
    Sleep   1

    # STEP 5: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     08/04/2020
# TEST CASE 07: Workspaces_EWC_TC07 - Triggered screenpop will be pop-up on agent2 after agent1 transfers a WC to a service on Workspaces
Workspaces_EWC_TC07 - Triggered screenpop will be pop-up on agent2 after agent1 transfers a WC to a service on Workspaces
    [Documentation]  Workspaces_EWC_TC07 - Triggered screenpop will be pop-up on agent2 after agent1 transfers a WC to a service on Workspaces
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...     Close All Browsers      AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
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
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT4_SKILLSET_WC2}
    Sleep   5

    # STEP 5: Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT4_FIRSTNAME}!!!!
    Sleep   1
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT4_FIRSTNAME}!!!!

    # STEP 6: Open Settings, verify Screenpop Name Displays after Agent 2 accepted trasfered contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Open Settings, verify Screenpop Name Displays after Agent 2 accepted trasfered contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Screenpop
    Sleep   2
    Screenpop.Verify Screenpop Name Displays     ${SCREENPOP_NAME2}
    Sleep   3
    NavigationMenu.Open Chat
    Sleep   1

    # STEP 7: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     08/04/2020
# TEST CASE 08: Workspaces_EWC_TC08 - Workspaces will notify if customer is typing
Workspaces_EWC_TC08 - Workspaces will notify if customer is typing
    [Documentation]  Workspaces_EWC_TC08 - Workspaces will notify if customer is typing
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Customer send chat to Agent and verify Agent has notify if customer is typing
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify Agent has notify if customer is typing
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    is typing...

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:    20/04/2020
# TEST CASE 09: Workspaces_EWC_TC09 - Workspaces will notify if customer is typing
Workspaces_EWC_TC09 - Customer will notify if Agent is typing
    [Documentation]  Workspaces_EWC_TC09 - Customer will notify if Agent is typing
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

     # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser, Agent accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Customer send chat to Agent and verify Customer has notify if Agent is typing
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify Customer has notify if Agent is typing
    WebChat.Verify Agent Is Typing      ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_FIRSTNAME}   ${BROWSER_CUST_ALIAS_1}     ${CUST1_EMAIL}

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

##=======================================================================================================================

#Created date:     08/04/2020
# TEST CASE 10: Workspaces_EWC_TC10 - Agent can push Suggested Phrases on Workspaces
Workspaces_EWC_TC10 - Agent can push Suggested Phrases on Workspaces
    [Documentation]  Workspaces_EWC_TC10 - Agent can push Suggested Phrases on Workspaces
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

     # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}

    # STEP 2: Switch to agent's browser and Agent accepts WC and send auto phrase 1 to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and send auto phrase 1 to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent Sends Auto Phrases    ${CUST1_EMAIL}   ${AUTO_PHRASES1}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     ${AUTO_PHRASES1}

    # STEP 3: Agent sends auto phrase 2 to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent sends auto phrase 2 to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Sends Auto Phrases    ${CUST1_EMAIL}   ${AUTO_PHRASES2}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     ${AUTO_PHRASES2}

    # STEP 4: Agent sends auto phrase 3 to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent sends auto phrase 3 to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Sends Auto Phrases    ${CUST1_EMAIL}   ${AUTO_PHRASES3}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     ${AUTO_PHRASES3}

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     09/04/2020
# TEST CASE 11: Workspaces_EWC_TC11 - As an Agent, he wants On Hold Comfort Groups are sent to Customer
Workspaces_EWC_TC11 - As an Agent, he wants On Hold Comfort Groups are sent to Customer
    [Documentation]  Workspaces_EWC_TC11 - As an Agent, he wants On Hold Comfort Groups are sent to Customer
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Agent start work and go Not ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent start work and go Not ready
    AgentToolbar.Agent Start Work

    # STEP 2: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   1

    # STEP 3: Verify On hold message 1 display on customer chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify On hold message 1 display on customer chat
    Sleep   12
    WebChat.Verify Message On Customer Chat     ${ON_HOLD1}     ${EMPTY}

    # STEP 4: Verify On hold message 2 display on customer chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify On hold message 2 display on customer chat
    Sleep   12
    WebChat.Verify Message On Customer Chat     ${ON_HOLD2}     ${EMPTY}

    # STEP 5: Verify On hold message 3 display on customer chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify On hold message 3 display on customer chat
    Sleep   12
    WebChat.Verify Message On Customer Chat     ${ON_HOLD3}     ${EMPTY}

    # STEP 6: Switch to agent's browser and Agent accepts WC and send auto phrase 1 to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent's browser and Agent accepts WC and send auto phrase 1 to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent Sends Auto Phrases    ${CUST1_EMAIL}   ${AUTO_PHRASES1}
    Sleep   3
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     ${AUTO_PHRASES1}

    # STEP 7: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     09/04/2020
# TEST CASE 12: Workspaces_EWC_TC12 - As an Agent, he wants Comfort messages are sent to customer and agent
Workspaces_EWC_TC12 - As an Agent, he wants Comfort messages are sent to customer and agent
    [Documentation]  Workspaces_EWC_TC12 - As an Agent, he wants Comfort messages are sent to customer and agent
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

     # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   3

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    Hi Agent, I have some Issues

    # STEP 4: Verify Comfort messages 1 are sent to customer and agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Verify Comfort messages 1 are sent to customer and agent
    Sleep   12
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     ${COMFORT_MESSAGE1}
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    ${COMFORT_MESSAGE1}

    # STEP 5: Verify Comfort messages 2 are sent to customer and agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Verify Comfort messages 2 are sent to customer and agent
    Sleep   10
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     ${COMFORT_MESSAGE2}
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    ${COMFORT_MESSAGE2}

    # STEP 6: Verify Comfort messages 3 are sent to customer and agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06     Verify Comfort messages 3 are sent to customer and agent
    Sleep   10
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     ${COMFORT_MESSAGE3}
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    ${COMFORT_MESSAGE3}

    # STEP 7: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================
#
#Created date:     09/04/2020
# TEST CASE 13: Workspaces_EWC_TC13 - Agent work fine when accepts, then release an EWC and DN call
Workspaces_EWC_TC13 - Agent work fine when accepts, then release an EWC and DN call
    [Documentation]  Workspaces_EWC_TC13 - Agent work fine when accepts, then release an EWC and DN call
    [Setup]     Run Keywords
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Close AvayaIX    AND
    ...     OneXCommunicator.Close OneX      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers   AND
    ...     Sleep  2

     # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   3

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 4: Customer makes DN call to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer makes DN call to Agent
    OneXCommunicator.OneX Call Out      ${AGENT4_PHONE_NUMBER}
    Sleep   3

    # STEP 5: Agent accepts DN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 6: Agent continues chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent continues chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}    Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 7: Agent Finds And Ends A Contact Session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent Finds And Ends A Contact Session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}

    # STEP 8: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

# Created date:     29/04/2020
#TEST CASE 14: Workspaces_EWC_TC14 -Verify Interaction Log displays missed WC
Workspaces_EWC_TC14 -Verify Interaction Log displays missed WC
    [Documentation]  Workspaces_EWC_TC14 -Verify Interaction Log displays missed WC
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Agent goes Not ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent goes Not ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   4
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 3: Verify Interaction Log displays missed WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Interaction Log displays missed WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Verify Missed Contact   ${CUST1_EMAIL}   ${AGENT2_SKILLSET_WC1}    Webchat

    # STEP 4: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    Sleep   2
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 5: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 6: Agent send chat to Customer and verify this message display on Customer chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Agent send chat to Customer and verify this message display on Customer chat
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   OK. Let me see...
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     OK. Let me see...

    # STEP 7: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     10/04/2020
# TEST CASE 15: Workspaces_EWC_TC15 - MM only Agent can decline, answer a webchat from customer on Workspaces
Workspaces_EWC_TC15 - MM only Agent can decline, answer a webchat from customer on Workspaces
    [Documentation]  Workspaces_EWC_TC15 - MM only Agent can decline, answer a webchat from customer on Workspaces
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 2: Switch to agent's browser, Agent reject WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser, Agent reject WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Rejects A Contact   ${CUST1_EMAIL}

    # STEP 3: Verify Agent go to Not ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Agent go to Not ready
    AgentToolbar.Verify Not Ready    ${EMPTY}
    Sleep   1

    # STEP 4: Agent goes ready and accepts WC and chat with customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent goes ready and accepts WC and chat with customer
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   1

    # STEP 5: Switch to Customer's browser and Customer sends Message to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to Customer's browser and Customer sends Message to Agent
    Webchat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 6: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 6    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     13/04/2020
# TEST CASE 16: Workspaces_EWC_TC16 - MM only Agent can transfer to service a webchat from customer on Workspaces
Workspaces_EWC_TC16 - MM only Agent can transfer to service a webchat from customer on Workspaces
    [Documentation]  Workspaces_EWC_TC16 - MM only Agent can transfer to service a webchat from customer on Workspaces
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
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
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT1_SKILLSET_WC2}
    Sleep   5

    # STEP 5: Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}!!!!
    Sleep   1
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}!!!!

    # STEP 6: Switch to Customer's browser and Customer sends Message to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to Customer's browser and Customer sends Message to Agent 2
    Webchat.Customer Sends Message To Agent     Oh, Nice to meet you!
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Oh, Nice to meet you!

    # STEP 7: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 7    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:    21/04/2020
# TEST CASE 17: Workspaces_EWC_TC17 - Verify Agent Label displays on Agent chat correctly
Workspaces_EWC_TC17 - Verify Agent Label displays on Agent chat correctly
    [Documentation]  Workspaces_EWC_TC17 - Verify Agent Label displays on Agent chat correctly
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser, Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser, Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   4
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   3
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Verify Agent Label displays on Agent chat correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Verify Agent Label displays on Agent chat correctly
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Label    ${CUST1_EMAIL}    ${AGENT2_FIRSTNAME}

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:    21/04/2020
# TEST CASE 18: Workspaces_EWC_TC18 - Verify Agent Label displays on Customer chat correctly
Workspaces_EWC_TC18 - Verify Agent Label displays on Customer chat correctly
    [Documentation]  Workspaces_EWC_TC18 - Verify Agent Label displays on Customer chat correctly
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser, Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser, Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Verify Agent Label displays on Customer chat correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Verify Agent Label displays on Customer chat correctly
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Agent Label    ${AGENT2_FIRSTNAME}

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:    21/04/2020
# TEST CASE 19: Workspaces_EWC_TC19 - Verify Customer Label displays on Agent chat correctly
Workspaces_EWC_TC19 - Verify Customer Label displays on Agent chat correctly
    [Documentation]  Workspaces_EWC_TC19 - Verify Customer Label displays on Agent chat correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser, Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser, Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Switch to Customer's browser and Customer sends Message to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to Customer's browser and Customer sends Message to Agent
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    Webchat.Customer Sends Message To Agent     Oh, Nice to meet you!
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Oh, Nice to meet you!

    # STEP 4: Verify Customer Label displays on Agent chat correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Verify Customer Label displays on Agent chat correctly
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Label    ${CUST1_EMAIL}    ${CUST1_NAME}

    # STEP 5: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:    22/04/2020
# TEST CASE 20: Workspaces_EWC_TC20 - Verify Agent can see the Url which is sent by Customer
Workspaces_EWC_TC20 - Verify Agent can see the Url which is sent by Customer
    [Documentation]  Workspaces_EWC_TC20 - Verify Agent can see the Url which is sent by Customer
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser, Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser, Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Switch to Customer's browser and Customer sends url to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to Customer's browser and Customer sends url to Agent
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    Webchat.Customer Sends Url To Agent     ${PUSH_URL1}
    Sleep   1

    # STEP 4: Verify Url displays in Agent's chat correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Verify Url displays in Agent's chat correctly
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   ${PUSH_URL1}

    # STEP 5: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     22/04/2020
# TEST CASE 21: Workspaces_EWC_TC21 - Make sure that the Label of Agent 2 displays correctly on Customer chat after he accepted transfer WC
Workspaces_EWC_TC21 - Make sure that the Label of Agent 2 displays correctly on Customer chat after he accepted transfer WC
    [Documentation]  Workspaces_EWC_TC21 - Make sure that the Label of Agent 2 displays correctly on Customer chat after he accepted transfer WC
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   1

    # STEP 3: Verify Agent 1 Label displays on Customer chat correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Verify Agent 1 Label displays on Customer chat correctly
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Agent Label    ${AGENT2_FIRSTNAME}

    # STEP 3': Blended Agent 2 go ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03'    Blended Agent 2 go ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 4: Switch to agent1's browser and Agent 1 transfer WC to  service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT2_SKILLSET_WC1}
#    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   5

    # STEP 5: Switch to agent2's browser, Agent accepts transfered WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent2's browser, Agent accepts transfered WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3

    # STEP 6: Verify Agent 2 Label displays on Customer chat correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06     Verify Agent 2 Label displays on Customer chat correctly
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Agent Label    ${AGENT4_FIRSTNAME}

    # STEP 7: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 7    Agent 2 ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     23/04/2020
# TEST CASE 22: Workspaces_EWC_TC22 - The WC is disappeared on Agent 2 if Customer close WC during Agent 1 transfer it to service
Workspaces_EWC_TC22 - The WC is disappeared on Agent 2 if Customer close WC during Agent 1 transfer it to service
    [Documentation]  Workspaces_EWC_TC22 - The WC is disappeared on Agent 2 if Customer close WC during Agent 1 transfer it to service
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   1

    # STEP 3: Verify Agent 1 Label displays on Customer chat correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Verify Agent 1 Label displays on Customer chat correctly
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Agent Label    ${AGENT2_FIRSTNAME}

    # STEP 3': Blended Agent 2 go ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03'    Blended Agent 2 go ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   3

    # STEP 4: Switch to agent1's browser and Agent 1 transfer WC to  service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT2_SKILLSET_WC1}
#    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   5

    # STEP 5: Customer close chat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 6: Verify Have No Presenting Contact on Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06     Verify Have No Presenting Contact on Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Agent Idle

#=======================================================================================================================

#Created date:     23/04/2020
# TEST CASE 23: Workspaces_EWC_TC23 - Make sure that having messages notification is sent to Customer while Agent is trasfering the WC
Workspaces_EWC_TC23 - Make sure that having messages notification is sent to Customer while Agent is trasfering the WC
    [Documentation]  Workspaces_EWC_TC23 - Make sure that having messages notification is sent to Customer while Agent is trasfering the WC
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   1

    # STEP 3: Blended Agent 2 go ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent 2 go ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 4: Switch to agent1's browser and Agent 1 transfer WC to  service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT2_SKILLSET_WC1}
    Sleep   1

    # STEP 5: Verify having messages notification is sent to Customer while Agent is trasfering the WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify having messages notification is sent to Customer while Agent is trasfering the WC
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${EMPTY}     Agent has left the chat
    Sleep   1

    # STEP 6: Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3

    # STEP 7: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 7    Agent 2 ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================
#
#Created date:     23/04/2020
# TEST CASE 24: Workspaces_EWC_TC24 - Make sure that having messages notification is sent to Customer after Agent 2 accepted transferred WC
Workspaces_EWC_TC24 - Make sure that having messages notification is sent to Customer after Agent 2 accepted transferred WC
    [Documentation]  Workspaces_EWC_TC24 - Make sure that having messages notification is sent to Customer after Agent 2 accepted transferred WC
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   1

    # STEP 3: Blended Agent 2 go ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent 2 go ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 4: Switch to agent1's browser and Agent 1 transfer WC to  service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT2_SKILLSET_WC1}
    Sleep   1

    # STEP 5: Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3

    # STEP 6: Verify having messages notification is sent to Customer after Agent 2 accepted the WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify having messages notification is sent to Customer after Agent 2 accepted the WC
    Switch Browser      ${BROWSER_CUST_ALIAS1}
    WebChat.Verify Message On Customer Chat     ${EMPTY}     An agent has joined the chat
    Sleep   1

    # STEP 7: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 7    Agent 2 ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}
#
#=======================================================================================================================

#Created date:     /04/2020
# TEST CASE 25: Workspaces_EWC_TC25 - Agent can process 2 EWC contacts at same time on Workspaces
Workspaces_EWC_TC25 - Agent can process 2 EWC contacts at same time on Workspaces
    [Documentation]  Workspaces_EWC_TC25 - Agent can process 2 EWC contacts at same time on Workspaces
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer 1 launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer 1 launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   1

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 4: Customer 2 launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer 2 launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_2}    ${BROWSER_CUST_ALIAS_2}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   1

    # STEP 5: Switch to agent's browser and Agent accepts WC and chat with Customer 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent's browser and Agent accepts WC and chat with Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}
    WorkCard.Agent sends Message to Customer    ${CUST2_EMAIL}   2222222222222222222, I'm ${AGENT2_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_2}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     2222222222222222222, I'm ${AGENT2_FIRSTNAME}

    # STEP 6: Customer 2 send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06     Customer 2 send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_2}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST2_EMAIL}   Hi Agent, I have some Issues

    # STEP 7: Agent send chat to Customer 1 and verify this message display on Customer chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Agent send chat to Customer 1 and verify this message display on Customer chat
    WorkCard.Agent Unhold A Contact     ${CUST1_EMAIL}
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   OK. Let me see...
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     OK. Let me see...

    # STEP 8: Agent send chat to Customer 2 and verify this message display on Customer chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08     Agent send chat to Customer 2 and verify this message display on Customer chat
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Unhold A Contact     ${CUST2_EMAIL}
    WorkCard.Agent sends Message to Customer    ${CUST2_EMAIL}   You can access https://avaya.com
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_2}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     You can access https://avaya.com

    # STEP 9: Agent ends webchat session with Customer 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent ends webchat session with Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Unhold A Contact     ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 10: Agent ends webchat session with Customer 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent ends webchat session with Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Unhold A Contact     ${CUST2_EMAIL}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     /04/2020
# TEST CASE 26: Workspaces_EWC_TC26 - Verify the default welcome message is displayed correctly on workspace
Workspaces_EWC_TC26 - Verify the default welcome message is displayed correctly on workspace
    [Documentation]  Workspaces_EWC_TC26 - Verify the default welcome message is displayed correctly on workspace
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Agent start work and go Not ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent start work and go Not ready
    AgentToolbar.Agent Start Work

    # STEP 2: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   1

    # STEP 3: Switch to agent's browser and Agent accepts WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}

    # STEP 4: Verify the default welcome message is displayed correctly on Customer chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify the default welcome message is displayed correctly on Customer chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     Welcome to the Avaya Contact Center. How can I help you?    ${EMPTY}    #${DEFAULT_WELCOME_MESSAGE}     ${EMPTY}

    # STEP 5: Verify the default welcome message is displayed correctly on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify the default welcome message is displayed correctly on Agent chat
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Welcome to the Avaya Contact Center. How can I help you?  #${DEFAULT_WELCOME_MESSAGE}

    # STEP 6: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     27/04/2020
#TEST CASE 27: Workspaces_EWC_TC27 - Agent can chat with Customer after he accepted CDN call
Workspaces_EWC_TC27 - Agent can chat with Customer after he accepted CDN call
    [Documentation]  Workspaces_EWC_TC27 - Agent can chat with Customer after he accepted CDN call
    [Setup]     Run Keywords
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2   AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...    AvayaIX.AvayaIX Log Out     AND
#    ...    AvayaIX.Close AvayaIX    AND
    ...    OneXCommunicator.Close OneX   AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers   AND
    ...    Sleep  2

    # STEP 1: Customer makes CDN call to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   7

    # STEP 2: Agent accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 3: Customer launchs a session chat without Customer's name and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer launchs a session chat without Customer's name and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   7

    # STEP 4: Switch to agent's browser, Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent's browser, Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 5: Switch to Customer's browser and Customer sends Message to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to Customer's browser and Customer sends Message to Agent
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    Webchat.Customer Sends Message To Agent     Oh, Nice to meet you!
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Oh, Nice to meet you!

    # STEP 6: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 7: Agent Finds And Ends A Contact Session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent Finds And Ends A Contact Session
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}

#=======================================================================================================================

#Created date:     24/04/2020
# TEST CASE 28: Workspaces_EWC_TC28 - Make sure that cannot transfer WC when the contact in onhold
Workspaces_EWC_TC28 - Make sure that cannot transfer WC when the contact in onhold
    [Documentation]  Workspaces_EWC_TC28 - Make sure that cannot transfer WC when the contact in onhold
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   1

    # STEP 3: Verify Agent 1 Label displays on Customer chat correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Verify Agent 1 Label displays on Customer chat correctly
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Agent Label    ${AGENT2_FIRSTNAME}

    # STEP 3': Blended Agent 2 go ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03'    Blended Agent 2 go ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 4: Switch to agent1's browser and Agent 1 transfer WC to  service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT2_SKILLSET_WC1}
#    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   5

    # STEP 5: Verify Agent 2 Label displays on Customer chat correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Verify Agent 2 Label displays on Customer chat correctly
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Agent Label    ${EMPTY}

    # STEP 6: Switch to agent2's browser, Agent accepts transfered WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent2's browser, Agent accepts transfered WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1

    # STEP 7: Verify Agent 2 Label displays on Customer chat correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Verify Agent 2 Label displays on Customer chat correctly
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Agent Label    ${AGENT4_FIRSTNAME}

    # STEP 5: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 2 ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     13/04/2020
# TEST CASE 29: Workspaces_EWC_TC29 - Check customer when agent closes an EWC Contact
Workspaces_EWC_TC29 - Check customer when agent closes an EWC Contact
    [Documentation]   Workspaces_EWC_TC29 - Check customer when agent closes an EWC Contact
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
    ...     Close All Browsers   AND
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
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 5: Verify message on customer chat when agent closes an EWC Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Verify message on customer chat when agent closes an EWC Contact
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Agent Have Left Conversation

#=======================================================================================================================

#Created date:     13/04/2020
# TEST CASE 30: Workspaces_EWC_TC30 - Check agent when customer closes an EWC Contact
Workspaces_EWC_TC30 - Check agent when customer closes an EWC Contact
    [Documentation]   Workspaces_EWC_TC30 - Check agent when customer closes an EWC Contact
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
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
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 4: Customer close chat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 5: Verify notice Customer have left Conversation on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Verify notice Customer have left Conversation on Agent chat
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Customer Have Left Conversation     ${CUST1_EMAIL}

    # STEP 6: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

##=======================================================================================================================

#Created date:     10/04/2020
# TEST CASE 31: Workspaces_EWC_TC31 - Check agent can process maximum 5 EWC contact same time
Workspaces_EWC_TC31 - Check agent can process maximum 5 EWC contact same time
    [Documentation]   Workspaces_EWC_TC31 - Check agent can process maximum 5 EWC contact same time
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: 5 Customers launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    5 Customers launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   1

    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_2}    ${BROWSER_CUST_ALIAS_2}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   1

    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_3}    ${BROWSER_CUST_ALIAS_3}
    WebChat.Customer Init A Chat Session     ${CUST3_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   1

    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_4}    ${BROWSER_CUST_ALIAS_4}
    WebChat.Customer Init A Chat Session     ${CUST4_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   1

    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_5}    ${BROWSER_CUST_ALIAS_5}
    WebChat.Customer Init A Chat Session     ${CUST5_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   1

    # STEP 2: Switch to agent's browser, Agent accepts 5 WC and chat with Customers
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser, Agent accepts 5 WC and chat with Customers
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   111, I'm ${AGENT2_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     111, I'm ${AGENT2_FIRSTNAME}
    Sleep   9

    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}
    WorkCard.Agent sends Message to Customer    ${CUST2_EMAIL}   222, I'm ${AGENT2_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_2}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     222, I'm ${AGENT2_FIRSTNAME}
    Sleep   9

    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST3_EMAIL}
    WorkCard.Agent sends Message to Customer    ${CUST3_EMAIL}   333, I'm ${AGENT2_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_3}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     333, I'm ${AGENT2_FIRSTNAME}
    Sleep   9

    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST4_EMAIL}
    WorkCard.Agent sends Message to Customer    ${CUST4_EMAIL}   444, I'm ${AGENT2_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_4}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     444, I'm ${AGENT2_FIRSTNAME}
    Sleep   9

    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST5_EMAIL}
    WorkCard.Agent sends Message to Customer    ${CUST5_EMAIL}   555, I'm ${AGENT2_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_5}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     555, I'm ${AGENT2_FIRSTNAME}
    Sleep   9

    # STEP 3: Customer 6 launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer 6 launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_6}    ${BROWSER_CUST_ALIAS_6}
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   1

    # STEP 4: Switch to agent's browser and Verify have no contact is presenting on Workspaces
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent's browser and Verify have no contact is presenting on Workspaces
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Verify Have No Presenting Contact

    # STEP 5: Agent release the 5th Contact then accept Customer 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent release the 5th Contact then accept Customer 6
    WorkCard.Agent Ends A Contact     ${CUST5_EMAIL}
    Sleep   5
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    WorkCard.Agent sends Message to Customer    ${CUST6_EMAIL}   2222222222222222222, I'm ${AGENT2_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_6}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     2222222222222222222, I'm ${AGENT2_FIRSTNAME}

    # STEP 6: Agent release all EWC contacts
    Utils.TEST CASE HAS RUN INTO STEP    STEP 6    Agent release all EWC contacts
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST6_EMAIL}

    WorkCard.Agent Unhold A Contact     ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

    WorkCard.Agent Unhold A Contact     ${CUST2_EMAIL}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}

    WorkCard.Agent Unhold A Contact     ${CUST3_EMAIL}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST3_EMAIL}

    WorkCard.Agent Unhold A Contact     ${CUST4_EMAIL}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST4_EMAIL}

#=======================================================================================================================

#Created date:     14/04/2020
# TEST CASE 32: Workspaces_EWC_TC32 - Check the partition list on chat window displays data correctly
Workspaces_EWC_TC32 - Check the partition list on chat window displays data correctly
    [Documentation]  Workspaces_EWC_TC32 - Check the partition list on chat window displays data correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
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
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 5: Verify Participants List
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Verify Participants List
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Participants List   ${CUST1_EMAIL}   ${CUST1_NAME}   ${AGENT4_FIRSTNAME}     ${EMPTY}

    # STEP 6: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     04/05/2020
#TEST CASE 33: Workspaces_EWC_TC33 - CC-19093 - The transcript should be displayed data for WC contact
Workspaces_EWC_TC33 - CC-19093 - The transcript should be displayed data for WC contact
    [Documentation]  Workspaces_EWC_TC33 - CC-19093 - The transcript should be displayed data for WC contact
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST3_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST3_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST3_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST3_EMAIL}   Hi Agent, I have some Issues

    # STEP 4: Customer close chat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 5: Get transcript
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Get transcript
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    @{TRANSCRIPT} =    WorkCard.Get Transcript    ${CUST3_EMAIL}
    WorkCard.Agent Ends A Contact     ${CUST3_EMAIL}

    # STEP 6: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_2}    ${BROWSER_CUST_ALIAS_2}
    WebChat.Customer Init A Chat Session     ${CUST3_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 7: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST3_EMAIL}
    Sleep   1

    # STEP 8: Verify transcript
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify transcript
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Verify Transcript    ${CUST3_EMAIL}   @{TRANSCRIPT}

    # STEP 8: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Ends A Contact     ${CUST3_EMAIL}

#=======================================================================================================================

#Created date:     24/04/2020
#TEST CASE 34: Workspaces_EWC_TC34 - The WC infor display correctly in Interaction Details
Workspaces_EWC_TC34 - The WC infor display correctly in Interaction Details
    [Documentation]  Workspaces_EWC_TC34 - The WC infor display correctly in Interaction Details
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
    ...     Close All Browsers   AND
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
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Verify Interaction Details
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Verify Interaction Details
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Interaction Details     ${CUST1_EMAIL}   Chat    ${AGENT2_SKILLSET_WC1}
#    [Arguments]    ${contact_info}   ${channel}     ${service}

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     24/04/2020
# TEST CASE 35: Workspaces_EWC_TC35 - Make sure that cannot transfer WC when the contact in onhold
Workspaces_EWC_TC35 - Make sure that cannot transfer WC when the contact in onhold
    [Documentation]  Workspaces_EWC_TC35 - Make sure that cannot transfer WC when the contact in onhold
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   1

    # STEP 3: Agent 1 hold WC contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Agent 1 hold WC contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Hold A Contact    ${CUST1_EMAIL}

    # STEP 4: Verify that cannot transfer WC when the contact in onhold
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Verify that cannot transfer WC when the contact in onhold
    ${transfer_button_locator} =    String.Replace String    ${LOC_WORKCARD_BTN_TRANSFER}    ${CONTACT_INFO_VAR}    ${CUST1_EMAIL}
    Page Should Not Contain Element     ${transfer_button_locator}    5

    # STEP 5: Agent 1 Unhold WC contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Agent 1 Unhold WC contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Unhold A Contact    ${CUST1_EMAIL}

    # STEP 6: Verify that can transfer WC after Agent unhold WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06     Verify that can transfer WC after Agent unhold WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT2_SKILLSET_WC1}
    Sleep   2

    # STEP 7: Switch to agent2's browser, Agent accepts transfered WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Switch to agent2's browser, Agent accepts transfered WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1

    # STEP 8: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 2 ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

##=======================================================================================================================
#
#Created date:     27/04/2020
#TEST CASE 36: Workspaces_EWC_TC36 - Default Customer label display on chat if Customer didn't fill in his name before
Workspaces_EWC_TC36 - Default Customer label display on chat if Customer didn't fill in his name before
    [Documentation]  Workspaces_EWC_TC36 - Default Customer label display on chat if Customer didn't fill in his name before
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat without Email and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat without Email and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST7_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser, Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser, Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST7_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST7_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Switch to Customer's browser and Customer sends Message to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to Customer's browser and Customer sends Message to Agent
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    Webchat.Customer Sends Message To Agent     Oh, Nice to meet you!
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST7_EMAIL}   Oh, Nice to meet you!

    # STEP 4: Verify Default Customer Label displays on Agent chat correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Verify Default Customer Label displays on Agent chat correctly
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Label    ${CUST7_EMAIL}    ${CUSTOMER_LABEL1}     #${DEFAULT_CUSTOMER_LABEL}

    # STEP 5: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST7_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     28/04/2020
#TEST CASE 37: Workspaces_EWC_TC37 - The contact no more ringing on Workspaces after Agent change his status to Not ready
Workspaces_EWC_TC37 - The contact no more ringing on Workspaces after Agent change his status to Not ready
    [Documentation]  Workspaces_EWC_TC37 - The contact no more ringing on Workspaces after Agent change his status to Not ready
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent does not ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent does not ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 3: Verify Have No Presenting Contact on Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Verify Have No Presenting Contact on Agent
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle

    # STEP 4: Agent goes ready and accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent goes ready and accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 5: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 6: Agent send chat to Customer and verify this message display on Customer chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06     Agent send chat to Customer and verify this message display on Customer chat
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   OK. Let me see...
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     OK. Let me see...

    # STEP 7: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================
#
#Created date:     28/04/2020
#TEST CASE 38: Workspaces_EWC_TC38 - The contact no more ringing on Workspaces after Agent finish work
Workspaces_EWC_TC38 - The contact no more ringing on Workspaces after Agent finish work
    [Documentation]  Workspaces_EWC_TC38 - The contact no more ringing on Workspaces after Agent finish work
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent Finish Work
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent Finish Work
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    AgentToolbar.Agent Finish Work
    Sleep   1

    # STEP 3: Verify Have No Presenting Contact on Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Verify Have No Presenting Contact on Agent
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle

    # STEP 4: Agent starts work, goes ready and accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent starts work, goes ready and accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep   10
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 5: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 6: Agent send chat to Customer and verify this message display on Customer chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06     Agent send chat to Customer and verify this message display on Customer chat
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   OK. Let me see...
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     OK. Let me see...

    # STEP 7: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     13/04/2020
# TEST CASE 39: Workspaces_EWC_TC39 - Agent can page push URL on Workspaces
Workspaces_EWC_TC39 - Agent can page push URL on Workspaces
    [Documentation]  Workspaces_EWC_TC39 - Agent can page push URL on Workspaces
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

     # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}

    # STEP 2: Switch to agent's browser and Agent accepts WC and send Push URLs 1 to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and send Push URLs 1 to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    WorkCard.Agent Page Push URLs    ${CUST1_EMAIL}   ${PUSH_URL1}
    Sleep   3
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Push URLs On Customer Chat      ${PUSH_URL1}

    # STEP 3: Agent sends Push URLs 2 to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent sends Push URLs 2 to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Page Push URLs    ${CUST1_EMAIL}   ${PUSH_URL2}
    Sleep   3
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Push URLs On Customer Chat     ${PUSH_URL2}

    # STEP 4: Agent sends Push URLs 3 to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent sends Push URLs 3 to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Page Push URLs    ${CUST1_EMAIL}   ${PUSH_URL3}
    Sleep   3
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Push URLs On Customer Chat    ${PUSH_URL3}

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

##=======================================================================================================================

#Created date:     14/04/2020
# TEST CASE 40: Workspaces_EWC_TC40 Agent can select an Activity code. Make sure the code displays correctly on Workspaces
Workspaces_EWC_TC40 Agent can select an Activity code. Make sure the code displays correctly on Workspaces
    [Documentation]  Workspaces_EWC_TC40 Agent can select an Activity code. Make sure the code displays correctly on Workspaces
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
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
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4: Agent set Activity code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Agent set Activity code
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Set Activity Code    ${CUST1_EMAIL}      ${ACTIVITY_CODE1}

    # STEP 5: Verify Activity code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Verify Activity code
    WorkCard.Verify Activity Code    ${CUST1_EMAIL}      ${ACTIVITY_CODE1}

    # STEP 6: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     14/04/2020
# TEST CASE 41: Workspaces_EWC_TC41 Agent can select an disposition code. Make sure the code displays correctly on agent
Workspaces_EWC_TC41 Agent can select an disposition code. Make sure the code displays correctly on agent
    [Documentation]  Workspaces_EWC_TC41 Agent can select an disposition code. Make sure the code displays correctly on agent
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
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
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4: Agent set Disposition code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Agent set Disposition code
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Set Disposition Code    ${CUST1_EMAIL}     ${DISPOSITION_CODE1}

    # STEP 5: Verify Disposition code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Verify Disposition code
    WorkCard.Verify Disposition Code    ${CUST1_EMAIL}      ${DISPOSITION_CODE1}

    # STEP 6: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     15/04/2020
# TEST CASE 42: Workspaces_EWC_TC42 Agent can reply WC contact with less than 10000 characters
Workspaces_EWC_TC42 Agent can reply WC contact with less than 10000 characters
    [Documentation]  Workspaces_EWC_TC42 Agent can reply WC contact with less than 10000 characters
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
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
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 4: Agent send chat to Customer with less than 10000 characters and verify this message display on Customer chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Agent send chat to Customer with less than 10000 characters and verify this message display on Customer chat
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}      Please wait....
    Sleep   1
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}      ${MESSAGE_LESS_THAN_10000}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     ${MESSAGE_LESS_THAN_10000}
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer end chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    Customer Ends A Chat Session
    Sleep   2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Reload Page
    Sleep   2
    Handle Alert    accept
    Sleep   5
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   5

#    # STEP 5: Agent ends webchat session
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends webchat session
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    Sleep   1
#    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
#    Sleep   5

#=======================================================================================================================

#Created date:     15/04/2020
# TEST CASE 43: Workspaces_EWC_TC43 Agent can reply WC contact with equals 10000 characters
Workspaces_EWC_TC43 Agent can reply WC contact with equals 10000 characters
    [Documentation]  Workspaces_EWC_TC43 Agent can reply WC contact with equals 10000 characters
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
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
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 4: Agent send chat to Customer with less than 10000 characters and verify this message display on Customer chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Agent send chat to Customer with less than 10000 characters and verify this message display on Customer chat
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}      Please wait....
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}      ${MESSAGE_EQUAL_10000}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     ${MESSAGE_EQUAL_10000}

#    # STEP 5: Agent ends webchat session
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends webchat session
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    Sleep   1
#    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
#    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer end chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    Customer Ends A Chat Session
    Sleep   2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Reload Page
    Sleep   2
    Handle Alert    accept
    Sleep   5
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   5

#=======================================================================================================================

#Created date:     05/05/2020
# TEST CASE 44: Workspaces_EWC_TC44 Agent cannot reply WC contact with more than 10000 characters
Workspaces_EWC_TC44 Agent cannot reply WC contact with more than 10000 characters
    [Documentation]  Workspaces_EWC_TC44 Agent cannot reply WC contact with more than 10000 characters
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   3

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent 123 456
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent 123 456

    # STEP 3: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 4: Agent try to send chat to Customer with more than 10000 characters
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Agent try to send chat to Customer with less than 10000 characters
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}      Please wait....
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}      ${MESSAGE_MORE_THAN_10000}
    Sleep   2

    # STEP 5: Switch to Customer browser and verify that the chat more than 10000 characters cannot sent to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to Customer browser and verify that the chat more than 10000 characters cannot sent to Customer
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Please wait....

#    # STEP 6: Agent ends webchat session
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    Sleep   1
#    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
#    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer end chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    Customer Ends A Chat Session
    Sleep   2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Reload Page
    Sleep   2
    Handle Alert    accept
    Sleep   5
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   5

#=======================================================================================================================

#Created date:     16/04/2020
# TEST CASE 45: Workspaces_EWC_TC45 - CC-18637 - Make sure that Agent can send a message after comfort message is sent to Customer
Workspaces_EWC_TC45 - CC-18637 - Make sure that Agent can send a message after comfort message is sent to Customer
    [Documentation]  Workspaces_EWC_TC45 - CC-18637 - Make sure that Agent can send a message after comfort message is sent to Customer
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

     # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   3

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 4: Verify Comfort messages 1 are sent to customer and agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Verify Comfort messages 1 are sent to customer and agent
    Sleep   10
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     ${COMFORT_MESSAGE1}
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    ${COMFORT_MESSAGE1}

    # STEP 5: Verify Comfort messages 2 are sent to customer and agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Verify Comfort messages 2 are sent to customer and agent
    Sleep   10
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}      ${COMFORT_MESSAGE2}
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    ${COMFORT_MESSAGE2}

    # STEP 6: Verify Comfort messages 3 are sent to customer and agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06     Verify Comfort messages 3 are sent to customer and agent
    Sleep   10
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     ${COMFORT_MESSAGE3}
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    ${COMFORT_MESSAGE3}

    # STEP 7: Agent sends chat to Customer and verify this message display on Custoemr chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent sends chat to Customer and verify this message display on Custoemr chat
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   1234567890 1234567890 1234567890
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}    1234567890 1234567890 1234567890

    # STEP 8: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

##=======================================================================================================================
##=======================================================================================================================
##=======================================================================================================================

#Created date:     16/04/2020
# TEST CASE 46: Workspaces_EWC_TC46 - CC-18763 - Status of webchat shows Open in transcript while agent is handling the webchat contact
Workspace_EWC_TC46 - CC-18763 - Status of Webchat shows Open in transcript while Agent is handling the Webchat contact
    [Documentation]  Workspaces_EWC_TC46 - CC-18763 - Status of webchat shows Open in transcript while agent is handling the webchat contact
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   3

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST2_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST2_EMAIL}   Hi Agent, I have some Issues

    # STEP 4: Verify status of this contact is Open
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Verify status of this contact is Open
    NavigationMenu.Verify Contact Status    ${CUST2_EMAIL}   Open

    # STEP 5: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     17/04/2020
# TEST CASE 47: Workspaces_EWC_TC47 - Status of previous webchat contact should be Closed after closed the contactt
Workspaces_EWC_TC47 - Status of previous webchat contact should be Closed after closed the contact
    [Documentation]  Workspaces_EWC_TC47 - Status of previous webchat contact should be Closed after closed the contact
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   3

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST2_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Verify status of this contact is Open
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Verify status of this contact is Open
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Verify Contact Status    ${CUST2_EMAIL}   Open    ${EMPTY}
    ${DATE} =   NavigationMenu.Get Time Of Current Contact    ${CUST2_EMAIL}

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}

    # STEP 5: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_2}    ${BROWSER_CUST_ALIAS_2}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   3

    # STEP 6: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST2_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_2}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 7: Verify status of previous contact is Closed
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Verify status of previous contact is Closed
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Verify Contact Status    ${CUST2_EMAIL}   Closed    ${DATE}

    # STEP 8: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}

#=======================================================================================================================

#Created date:     16/04/2020
# TEST CASE 48: Workspaces_EWC_TC48 - CC-18807 - Make sure that Customer has left chat and Agent cannot send messages afrer Customer refresh browser
Workspaces_EWC_TC48 - CC-18807 - Make sure that Customer has left chat and Agent cannot send messages afrer Customer refresh browser
    [Documentation]   Workspaces_EWC_TC48 - CC-18807 - Make sure that Customer has left chat and Agent cannot send messages afrer Customer refresh browser
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   3

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST2_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}    Hello Customer, I'm Agent

    # STEP 3: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST2_EMAIL}   Hi Agent, I have some Issues

    # STEP 4: Customer reload page
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Customer reload page
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    Reload Page
    Sleep   2

    # STEP 5: Verify notice Customer have left Conversation on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Verify notice Customer have left Conversation on Agent chat
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Customer Have Left Conversation     ${CUST2_EMAIL}

    # STEP 6: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     17/04/2020
# TEST CASE 49: Workspaces_EWC_TC49 - CC-18808 - Make sure that work card is disappeard when Customer has left the chat before Agent accepts it
Workspaces_EWC_TC49 - CC-18808 - Make sure that work card is disappeard when Customer has left the chat before Agent accepts it
    [Documentation]   Workspaces_EWC_TC49 - CC-18808 - Make sure that work card is disappeard when Customer has left the chat before Agent accepts it
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC1}
    Sleep   3

    # STEP 2: Switch to agent's browser and Verify having WC Contact is presenting on Workspaces
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Verify having WC Contact is presenting on Workspaces
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Verify Working Contact    ${CUST2_EMAIL}
    Sleep   1

    # STEP 3: Customer reload page
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer reload page
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    Reload Page
    Sleep   2

    # STEP 4: Verify Have No Presenting Contact on Workspaces
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Verify Have No Presenting Contact on Workspaces
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle

#=======================================================================================================================

# Created date:     04/05/2020
#TEST CASE 50: Workspaces_EWC_TC50 -Verify Interaction Log displays Inbound WC
Workspaces_EWC_TC50 -Verify Interaction Log displays Inbound WC
    [Documentation]  Workspaces_EWC_TC50 -Verify Interaction Log displays Inbound WC
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 4: Verify Interaction Log displays inbound WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Interaction Log displays inbound WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Verify Inbound Contact   ${CUST1_EMAIL}   ${AGENT2_SKILLSET_WC1}    Webchat

#=======================================================================================================================

# Created date:     04/05/2020
#TEST CASE 51: Workspaces_EWC_TC51 - Verify have notified message sent to Agent 2 after he accepted the transferred WC
Workspaces_EWC_TC51 - Verify have notified message sent to Agent 2 after he accepted the transferred WC
    [Documentation]  Workspaces_EWC_TC51 - Verify have notified message sent to Agent 2 after he accepted the transferred WC
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}   Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   1

    # STEP 3': Blended Agent 2 go ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03'    Blended Agent 2 go ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 4: Switch to agent1's browser and Agent 1 transfer WC to  service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT2_SKILLSET_WC1}
    Sleep   5

    # STEP 5: Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1

    # STEP 6: Verify Transferred Message display on Chat window of Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Transferred Message display on Chat window of Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Transferred Message      ${CUST1_EMAIL}     ${AGENT2_FULLNAME} ${AGENT2_FULLNAME}  ${AGENT2_SKILLSET_WC1}   ${AGENT2_SKILLSET_WC1}
#    [Arguments]    ${contact_info}    ${agent_full_name}    ${from_skill}   ${to_skill}

    # STEP 7: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 7    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}
