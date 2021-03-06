*** Settings ***
Resource    ../../resources/Resource_Workspaces_WC_Localize.robot

*** Test Cases ***
# Created by:       htmoanh
# Created date:     27/07/2020

#=======================================================================================================================

#Created date:     28/07/2020
#TEST CASE 1: Workspaces_LocalizeWC_TC01_German - As agent, accepts the WC, check messages display correctly
Workspaces_LocalizeWC_TC01_German - As agent, accepts the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC01_German - As agent, accepts the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     Sleep   1   AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Deutsch
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Deutsch
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     Geben Sie eine Nachricht ein

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     Noch keine Kundennachricht erhalten
    Sleep   0.5

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    schreibt ???

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify Notify Chat Message is: Last message received
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     Letzte Nachricht erhalten

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#Created date:     31/07/2020
#TEST CASE 2: Workspaces_LocalizeWC_TC02_German - As agent, customer releases the WC, check messages display correctly
Workspaces_LocalizeWC_TC02_German - As agent, customer releases the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC02_German - As agent, customer releases the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     Sleep   1   AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Deutsch
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Deutsch
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     Geben Sie eine Nachricht ein

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     Noch keine Kundennachricht erhalten
    Sleep   0.5

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   4

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Notify Chat Message is: Customer has disconnected
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     getrennt
    Sleep   2
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#Created date:     05/08/2020
# TEST CASE 03: Workspaces_LocalizeWC_TC03_German - As agent, transfers to service the WC, check messages display correctly
Workspaces_LocalizeWC_TC03_German - As agent, transfers to service the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC03_German - As agent, transfers to service the WC, check messages display correctly
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 1 changes language to Deutsch and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Deutsch
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   1

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 changes language to Deutsch and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Deutsch
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT1_SKILLSET_WC1}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Message On Agent Chat after transfer: forwarded this contact from
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   leitete diesen Kontakt von

    # STEP 8: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 1 changes language to English (US)
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 2 changes language to English (US)
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#=======================================================================================================================

#Created date:     28/07/2020
#TEST CASE 5: Workspaces_LocalizeWC_TC05_Spain - As agent, accepts the WC, check messages display correctly
Workspaces_LocalizeWC_TC05_Spain - As agent, accepts the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC05_Spain - As agent, accepts the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Espa??ol (LA)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Espa??ol (LA)
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     Escriba un mensaje...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     A??n no se recibi?? un mensaje del cliente

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    est?? escribiendo...

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify Notify Chat Message is: Last message received
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ??ltimo mensaje recibido a

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#Created date:     31/07/2020
#TEST CASE 6: Workspaces_LocalizeWC_TC06_Spain - As agent, customer releases the WC, check messages display correctly
Workspaces_LocalizeWC_TC06_Spain - As agent, customer releases the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC06_Spain - As agent, customer releases the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Espa??ol (LA)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Espa??ol (LA)
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    est?? escribiendo...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Notify Chat Message is: Customer has disconnected
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     se ha desconectado
    Sleep   2
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================
#Created date:     06/08/2020
# TEST CASE 07: Workspaces_LocalizeWC_TC07_Spain - As agent, transfers to service the WC, check messages display correctly
Workspaces_LocalizeWC_TC07_Spain - As agent, transfers to service the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC07_Spain - As agent, transfers to service the WC, check messages display correctly
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 1 changes language to Espa??ol (LA) and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Espa??ol (LA)
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   5
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   3
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   1

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 changes language to Espa??ol (LA) and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Espa??ol (LA)
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT1_SKILLSET_WC1}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   10

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Message On Agent Chat after transfer: forwarded this contact from
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    El agente ${AGENT1_FIRSTNAME} ${AGENT1_FIRSTNAME} transfiri?? este contacto del perfil ${AGENT1_SKILLSET_WC1} al perfil ${AGENT1_SKILLSET_WC1} en
#    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   transfiri?? este contacto del perfil

    # STEP 8: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 1 changes language to English (US)
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 2 changes language to English (US)
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#=======================================================================================================================

#Created date:     28/07/2020
#TEST CASE 9: Workspaces_LocalizeWC_TC09_France - As agent, accepts the WC, check messages display correctly
Workspaces_LocalizeWC_TC09_France - As agent, accepts the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC09_France - As agent, accepts the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Fran??ais
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Fran??ais
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     Entrez un message...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     Aucun message client re??u pour l'instant

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    est en train d'??crire...

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify Notify Chat Message is: Last message received
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     Dernier message re??u

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#Created date:     31/07/2020
#TEST CASE 10: Workspaces_LocalizeWC_TC10_France - As agent, customer releases the WC, check messages display correctly
Workspaces_LocalizeWC_TC10_France - As agent, customer releases the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC10_France - As agent, customer releases the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Fran??ais
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Fran??ais
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     Entrez un message...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     Aucun message client re??u pour l'instant

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Notify Chat Message is: Customer has disconnected
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     s'est d??connect??
    Sleep   2
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================



#=======================================================================================================================

#=======================================================================================================================

#Created date:     29/07/2020
#TEST CASE 13: Workspaces_LocalizeWC_TC13_Italy - As agent, accepts the WC, check messages display correctly
Workspaces_LocalizeWC_TC13_Italy - As agent, accepts the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC13_Italy - As agent, accepts the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Italiano
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Italiano
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     Digitare un messaggio...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     Ancora nessun messaggio cliente ricevuto

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    sta digitando...

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify Notify Chat Message is: Last message received
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     Ultimo messaggio ricevuto

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#Created date:     4/08/2020
#TEST CASE 14: Workspaces_LocalizeWC_TC14_Italy - As agent, customer releases the WC, check messages display correctly
Workspaces_LocalizeWC_TC14_Italy - As agent, customer releases the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC14_Italy - As agent, customer releases the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Italiano
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Italiano
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     Digitare un messaggio...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     Ancora nessun messaggio cliente ricevuto

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Notify Chat Message is: Customer has disconnected
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     si ?? disconnesso.
    Sleep   2
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#Created date:     06/08/2020
# TEST CASE 15: Workspaces_LocalizeWC_TC15_Italy - As agent, transfers to service the WC, check messages display correctly
Workspaces_LocalizeWC_TC15_Italy - As agent, transfers to service the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC15_Italy - As agent, transfers to service the WC, check messages display correctly
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 1 changes language to Fran??ais and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Fran??ais
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   10
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   1

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 changes language to Fran??ais and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Fran??ais
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT1_SKILLSET_WC1}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   10

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Message On Agent Chat after transfer: forwarded this contact from
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    L'agent ${AGENT1_FIRSTNAME} ${AGENT1_FIRSTNAME} a transf??r?? ce contact de la comp??tence ${AGENT1_SKILLSET_WC1} ?? la comp??tence ${AGENT1_SKILLSET_WC1}
#    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   transfiri?? este contacto del perfil

    # STEP 8: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 1 changes language to English (US)
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 2 changes language to English (US)
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#=======================================================================================================================

#Created date:     29/07/2020
#TEST CASE 17: Workspaces_LocalizeWC_TC17_Portugese - As agent, accepts the WC, check messages display correctly
Workspaces_LocalizeWC_TC17_Portugese - As agent, accepts the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC17_Portugese - As agent, accepts the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Portugu??s (BR)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Portugu??s (BR)
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     Digite uma mensagem...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     Nenhuma mensagem de cliente recebida ainda

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    est?? digitando...

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify Notify Chat Message is: Last message received
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ??ltima mensagem recebida

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#Created date:     03/08/2020
#TEST CASE 18: Workspaces_LocalizeWC_TC18_Portugese - As agent, customer releases the WC, check messages display correctly
Workspaces_LocalizeWC_TC18_Portugese - As agent, customer releases the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC18_Portugese - As agent, customer releases the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     NavigationMenu.Open Settings    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Portugu??s (BR)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Portugu??s (BR)
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     Digite uma mensagem...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     Nenhuma mensagem de cliente recebida ainda

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Notify Chat Message is: Customer has disconnected
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     desconectou-se
    Sleep   2
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#Created date:     29/07/2020
#TEST CASE 21: Workspaces_LocalizeWC_TC21_Russia - As agent, accepts the WC, check messages display correctly
Workspaces_LocalizeWC_TC21_Russia - As agent, accepts the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC21_Russia - As agent, accepts the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to P????????????
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   P????????????
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     ?????????????? ??????????????????...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ?????? ???????????????????? ???? ???????????????? ??????????????????

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    ????????????????...

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify Notify Chat Message is: Last message received
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ?????????????????? ?????????????????? ????????????????

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)


#=======================================================================================================================

#Created date:     03/08/2020
#TEST CASE 22: Workspaces_LocalizeWC_TC22_Russia - As agent, customer releases the WC, check messages display correctly
Workspaces_LocalizeWC_TC22_Russia - As agent, customer releases the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC22_Russia - As agent, customer releases the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     NavigationMenu.Open Settings    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to P????????????
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   P????????????
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     ?????????????? ??????????????????...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ?????? ???????????????????? ???? ???????????????? ??????????????????

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Notify Chat Message is: Customer has disconnected
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ????????????????????
    Sleep   2
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#Created date:     07/08/2020
# TEST CASE 23: Workspaces_LocalizeWC_TC23_Russia - As agent, transfers to service the WC, check messages display correctly
Workspaces_LocalizeWC_TC23_Russia - As agent, transfers to service the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC23_Russia - As agent, transfers to service the WC, check messages display correctly
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 1 changes language to P???????????? and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   P????????????
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   10
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   1

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 changes language to P???????????? and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   P????????????
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT1_SKILLSET_WC1}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   15

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Message On Agent Chat after transfer: forwarded this contact from
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    ???????????????? ${AGENT1_FIRSTNAME} ${AGENT1_FIRSTNAME} ?????????????? ???????? ?????????????? ???? ???????????????????????????????? ???????????? ${AGENT1_SKILLSET_WC1} ???????????????????????????????? ???????????? ${AGENT1_SKILLSET_WC1}
#    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   transfiri?? este contacto del perfil

    # STEP 8: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 1 changes language to English (US)
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 2 changes language to English (US)
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#=======================================================================================================================

#Created date:     30/07/2020
#TEST CASE 25: Workspaces_LocalizeWC_TC25_Chinese - As agent, accepts the WC, check messages display correctly
Workspaces_LocalizeWC_TC25_Chinese - As agent, accepts the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC25_Chinese - As agent, accepts the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to ?????? (??????)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   ?????? (??????)
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     ????????????...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ??????????????????????????????

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    ????????????...

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify Notify Chat Message is: Last message received
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ?????????????????????????????????

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#Created date:     03/08/2020
#TEST CASE 26: Workspaces_LocalizeWC_TC26_Chinese - As agent, customer releases the WC, check messages display correctly
Workspaces_LocalizeWC_TC26_Chinese - As agent, customer releases the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC26_Chinese - As agent, customer releases the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     NavigationMenu.Open Settings    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to ?????? (??????)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   ?????? (??????)
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     ????????????...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ??????????????????????????????

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Notify Chat Message is: Customer has disconnected
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ?????????
    Sleep   2
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#Created date:     07/08/2020
# TEST CASE 27: Workspaces_LocalizeWC_TC27_Chinese - As agent, transfers to service the WC, check messages display correctly
Workspaces_LocalizeWC_TC27_Chinese - As agent, transfers to service the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC27_Chinese - As agent, transfers to service the WC, check messages display correctly
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 1 changes language to ?????? (??????) and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   ?????? (??????)
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   10
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   1

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 changes language to ?????? (??????) and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   ?????? (??????)
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT1_SKILLSET_WC1}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   15

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Message On Agent Chat after transfer: forwarded this contact from
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    ?????? ${AGENT1_FIRSTNAME} ${AGENT1_FIRSTNAME} ??????
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    ??????????????????????????? ${AGENT1_SKILLSET_WC1} ?????????????????? ${AGENT1_SKILLSET_WC1}


    # STEP 8: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 1 changes language to English (US)
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 2 changes language to English (US)
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#=======================================================================================================================

#Created date:     30/07/2020
#TEST CASE 29: Workspaces_LocalizeWC_TC29_Japan - As agent, accepts the WC, check messages display correctly
Workspaces_LocalizeWC_TC29_Japan - As agent, accepts the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC29_Japan - As agent, accepts the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to ?????????
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   ?????????
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     ????????????????????????...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ??????????????????????????????????????????????????????????????????

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    ????????????...

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify Notify Chat Message is: Last message received
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ?????????????????????????????????

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#Created date:     04/08/2020
#TEST CASE 30: Workspaces_LocalizeWC_TC30_Japanese - As agent, customer releases the WC, check messages display correctly
Workspaces_LocalizeWC_TC30_Japanese - As agent, customer releases the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC30_Japanese - As agent, customer releases the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
#    ...     NavigationMenu.Open Settings    AND
#    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to ?????????
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   ?????????
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     ????????????????????????...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ??????????????????????????????????????????????????????????????????

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Notify Chat Message is: Customer has disconnected
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ????????????????????????
    Sleep   2
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   5

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#Created date:     07/08/2020
# TEST CASE 31: Workspaces_LocalizeWC_TC31_Japanese - As agent, transfers to service the WC, check messages display correctly
Workspaces_LocalizeWC_TC31_Japanese - As agent, transfers to service the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC31_Japanese - As agent, transfers to service the WC, check messages display correctly
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 1 changes language to ????????? and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   ?????????
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   10
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   1

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 changes language to ????????? and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   ?????????
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT1_SKILLSET_WC1}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   15

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Message On Agent Chat after transfer: forwarded this contact from
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    ?????????????????? ${AGENT1_FIRSTNAME} ${AGENT1_FIRSTNAME} ???????????????????????????????????????????????? ${AGENT1_SKILLSET_WC1} ??????
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    ??????????????????????????? ${AGENT1_SKILLSET_WC1} ????????????????????????


    # STEP 8: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 1 changes language to English (US)
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 2 changes language to English (US)
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#=======================================================================================================================

#Created date:     30/07/2020
#TEST CASE 33: Workspaces_LocalizeWC_TC33_Korea - As agent, accepts the WC, check messages display correctly
Workspaces_LocalizeWC_TC33_Korea - As agent, accepts the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC33_Korea - As agent, accepts the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to ?????????
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   ?????????
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     ????????? ??????...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ?????? ?????? ???????????? ?????? ??????

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    ?????? ???...

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify Notify Chat Message is: Last message received
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ????????? ???????????? ????????? ?????????

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#Created date:     04/08/2020
#TEST CASE 34: Workspaces_LocalizeWC_TC34_Korea - As agent, customer releases the WC, check messages display correctly
Workspaces_LocalizeWC_TC34_Korea - As agent, customer releases the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC34_Korea - As agent, customer releases the WC, check messages display correctly
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
#    ...     NavigationMenu.Open Settings    AND
#    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to ?????????
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   ?????????
    Sleep   1

    # STEP 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   2
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Label Of Input Message Text is: Typing a message ...
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Label Of Input Message Text     ????????? ??????...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ?????? ?????? ???????????? ?????? ??????

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Notify Chat Message is: Customer has disconnected
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     ????????? ??????????????????.
    Sleep   2
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   5

    # STEP 8
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent changes language to English (US)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#Created date:     10/08/2020
# TEST CASE 35: Workspaces_LocalizeWC_TC35_Korea - As agent, transfers to service the WC, check messages display correctly
Workspaces_LocalizeWC_TC35_Korea - As agent, transfers to service the WC, check messages display correctly
    [Documentation]  Workspaces_LocalizeWC_TC35_Korea - As agent, transfers to service the WC, check messages display correctly
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WidgetSettings.Select Language   English (US)   AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 1 changes language to ????????? and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   ?????????
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   10
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   1

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 changes language to ????????? and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   ?????????
    Sleep   1
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT1_SKILLSET_WC1}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   15

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Message On Agent Chat after transfer: forwarded this contact from
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    ${AGENT1_FIRSTNAME} ${AGENT1_FIRSTNAME} ???????????? ??? ?????????
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    ??? ????????? ${AGENT1_SKILLSET_WC1}?????? ????????? ${AGENT1_SKILLSET_WC1}(???)??? ??? ?????????????????????.

    # STEP 8: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

    # STEP 9
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 1 changes language to English (US)
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

    # STEP 10
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 2 changes language to English (US)
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   English (US)

#=======================================================================================================================

#=======================================================================================================================