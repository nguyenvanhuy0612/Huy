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
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    schreibt …

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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Español (LA)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Español (LA)
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
    WorkCard.Verify Notify Chat Message     Aún no se recibió un mensaje del cliente

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    está escribiendo...

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
    WorkCard.Verify Notify Chat Message     Último mensaje recibido a

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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Español (LA)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Español (LA)
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
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    está escribiendo...

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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 1 changes language to Español (LA) and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Español (LA)
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 changes language to Español (LA) and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Español (LA)
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
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    El agente ${AGENT1_FIRSTNAME} ${AGENT1_FIRSTNAME} transfirió este contacto del perfil ${AGENT1_SKILLSET_WC1} al perfil ${AGENT1_SKILLSET_WC1} en
#    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   transfirió este contacto del perfil

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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Français
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Français
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
    WorkCard.Verify Notify Chat Message     Aucun message client reçu pour l'instant

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    est en train d'écrire...

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
    WorkCard.Verify Notify Chat Message     Dernier message reçu

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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Français
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Français
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
    WorkCard.Verify Notify Chat Message     Aucun message client reçu pour l'instant

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Notify Chat Message is: Customer has disconnected
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     s'est déconnecté
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
    WorkCard.Verify Notify Chat Message     si è disconnesso.
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 1 changes language to Français and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Français
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 changes language to Français and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Français
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
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    L'agent ${AGENT1_FIRSTNAME} ${AGENT1_FIRSTNAME} a transféré ce contact de la compétence ${AGENT1_SKILLSET_WC1} à la compétence ${AGENT1_SKILLSET_WC1}
#    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   transfirió este contacto del perfil

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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Português (BR)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Português (BR)
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
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    está digitando...

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
    WorkCard.Verify Notify Chat Message     Última mensagem recebida

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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Português (BR)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Português (BR)
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Pусский
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Pусский
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
    WorkCard.Verify Label Of Input Message Text     Введите сообщение...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     Нет полученных от клиентов сообщений

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    печатает...

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
    WorkCard.Verify Notify Chat Message     Последнее сообщение получено

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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to Pусский
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Pусский
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
    WorkCard.Verify Label Of Input Message Text     Введите сообщение...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     Нет полученных от клиентов сообщений

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Notify Chat Message is: Customer has disconnected
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     отключился
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 1 changes language to Pусский and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Pусский
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 changes language to Pусский and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   Pусский
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
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    Оператор ${AGENT1_FIRSTNAME} ${AGENT1_FIRSTNAME} перевел этот контакт от квалификационной группы ${AGENT1_SKILLSET_WC1} квалификационной группе ${AGENT1_SKILLSET_WC1}
#    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   transfirió este contacto del perfil

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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to 中文 (简化)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   中文 (简化)
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
    WorkCard.Verify Label Of Input Message Text     输入消息...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     尚未收到任何客户消息

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    正在输入...

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
    WorkCard.Verify Notify Chat Message     接收最后一条消息的时间

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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to 中文 (简化)
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   中文 (简化)
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
    WorkCard.Verify Label Of Input Message Text     输入消息...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     尚未收到任何客户消息

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Notify Chat Message is: Customer has disconnected
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     已断开
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 1 changes language to 中文 (简化) and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   中文 (简化)
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 changes language to 中文 (简化) and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   中文 (简化)
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
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    座席 ${AGENT1_FIRSTNAME} ${AGENT1_FIRSTNAME} 已于
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    将此联系人从技能组 ${AGENT1_SKILLSET_WC1} 转接到技能组 ${AGENT1_SKILLSET_WC1}


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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to 日本語
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   日本語
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
    WorkCard.Verify Label Of Input Message Text     メッセージを入力...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     受信したカスタマーメッセージはまだありません

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    が入力中...

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
    WorkCard.Verify Notify Chat Message     最終メッセージ受信時間

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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to 日本語
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   日本語
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
    WorkCard.Verify Label Of Input Message Text     メッセージを入力...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     受信したカスタマーメッセージはまだありません

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Notify Chat Message is: Customer has disconnected
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     は切断されました
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 1 changes language to 日本語 and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   日本語
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 changes language to 日本語 and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   日本語
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
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    エージェント ${AGENT1_FIRSTNAME} ${AGENT1_FIRSTNAME} は、このコンタクトをスキルセット ${AGENT1_SKILLSET_WC1} から
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    にあるスキルセット ${AGENT1_SKILLSET_WC1} に転送しました。


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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to 한국어
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   한국어
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
    WorkCard.Verify Label Of Input Message Text     메시지 입력...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     아직 고객 메시지를 받지 못함

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Notify Chat Message is: is typing ...
    WorkCard.Verify Customer Is Typing      ${BROWSER_AGENT_ALIAS_1}     ${BROWSER_CUST_ALIAS_1}    입력 중...

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
    WorkCard.Verify Notify Chat Message     마지막 메시지가 다음에 수신됨

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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent changes language to 한국어
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   한국어
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
    WorkCard.Verify Label Of Input Message Text     메시지 입력...

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Notify Chat Message is: No customer message received yet
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     아직 고객 메시지를 받지 못함

    # STEP 6
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer close chat session
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   3

    # STEP 7
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Notify Chat Message is: Customer has disconnected
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Notify Chat Message     연결이 끊어졌습니다.
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 1 changes language to 한국어 and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   한국어
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 changes language to 한국어 and start work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Settings
    WidgetSettings.Select Language   한국어
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
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    ${AGENT1_FIRSTNAME} ${AGENT1_FIRSTNAME} 상담원이 이 컨택을
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}    의 스킬셋 ${AGENT1_SKILLSET_WC1}에서 스킬셋 ${AGENT1_SKILLSET_WC1}(으)로 호 전환하였습니다.

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