*** Settings ***
Resource    ../../resources/Resource_Workspaces_supervisor_change_status.robot

*** Test Cases ***
# Created by:       htmoanh
# Created date:     15/09/2020
# Resource    Resources_WS_Sanity.robot

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#************** CC-20009 AACC-ACCS Workspaces Client support for Supervisors to remotely logout an agent ***************
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#Created date:     15/09/2020
# TEST CASE 01: Supervisor logout Agent_ TC01_Make sure that Supervisor is able to logout a MM only agent from the Workspace
Supervisor logout Agent_ TC01_Make sure that Supervisor is able to logout a MM only agent from the Workspace
    [Documentation]  Supervisor logout Agent_ TC01_Make sure that Supervisor is able to logout a MM only agent from the Workspace
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${SUP_USERNAME}    ${SUP_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Supervisor force logout Agent
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Change Agent Status     ${AGENT5_FIRSTNAME}    Finish Work
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Agent is forced to finish work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Verify Start Work Page

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent try to login again
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Start Work
    Sleep   1

#=======================================================================================================================

#Created date:     15/09/2020
# TEST CASE 02: Supervisor logout Agent_ TC02_Make sure that Supervisor is able to logout a Vocie only agent from the Workspace
Supervisor logout Agent_ TC02_Make sure that Supervisor is able to logout a Vocie only agent from the Workspace
    [Documentation]  Supervisor logout Agent_ TC02_Make sure that Supervisor is able to logout a Vocie only agent from the Workspace
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${SUP_USERNAME}    ${SUP_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Supervisor force logout Agent
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Change Agent Status     ${AGENT2_FIRSTNAME}    Finish Work
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Agent is forced to finish work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Verify Start Work Page

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent try to login again
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Start Work
    Sleep   1

#=======================================================================================================================

#Created date:     15/09/2020
# TEST CASE 03: Supervisor logout Agent_ TC03_Make sure that Supervisor is able to logout a blended agent from the Workspace
Supervisor logout Agent_ TC03_Make sure that Supervisor is able to logout a blended agent from the Workspace
    [Documentation]  Supervisor logout Agent_ TC03_Make sure that Supervisor is able to logout a blended agent from the Workspace
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${SUP_USERNAME}    ${SUP_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Supervisor force logout Agent
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Change Agent Status     ${AGENT3_FIRSTNAME}    Finish Work
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Agent is forced to finish work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Verify Start Work Page

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent try to login again
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Start Work
    Sleep   1

#=======================================================================================================================

#Created date:     16/09/2020
# TEST CASE 04: Supervisor logout Agent_ TC04_Make sure that the Supervisor is able to log multiple agents from the Workspace
Supervisor logout Agent_ TC04_Make sure that the Supervisor is able to log multiple agents from the Workspace
    [Documentation]  Supervisor logout Agent_ TC04_Make sure that the Supervisor is able to log multiple agents from the Workspace
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${SUP_USERNAME}    ${SUP_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Supervisor force logout Agent 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Change Agent Status     ${AGENT2_FIRSTNAME}    Finish Work
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Supervisor force logout Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Change Agent Status     ${AGENT3_FIRSTNAME}    Finish Work
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Agent 1 is forced to finish work
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Verify Start Work Page

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Agent 2 is forced to finish work
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Verify Start Work Page

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 1 try to login again
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Start Work
    Sleep   1

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 try to login again
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Start Work
    Sleep   1

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#****************** CC-20010 AACCACCS Workspaces Client support for Supervisors to Change agent status *****************
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#Created date:     16/09/2020
# TEST CASE 01: Supervisor change status_TC001_Supervisor can see Agent status on My agents widget
Supervisor change status_TC001_Supervisor can see Agent status on My agents widget
    [Documentation]  Supervisor change status_TC001_Supervisor can see Agent status on My agents widget
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${SUP_USERNAME}    ${SUP_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify that Supervisor see status of Agent is Not ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Verify Agent Status     ${AGENT5_FIRSTNAME}    Not Ready
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent go ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify that Supervisor see status of Agent is Ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Verify Agent Status     ${AGENT5_FIRSTNAME}    Ready
    Sleep   3

#=======================================================================================================================

#Created date:     16/09/2020
# TEST CASE 02: Supervisor change status_TC002_Supervisor can change agent status from Ready to Not Ready
Supervisor change status_TC002_Supervisor can change agent status from Ready to Not Ready
    [Documentation]  Supervisor change status_TC002_Supervisor can change agent status from Ready to Not Ready
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${SUP_USERNAME}    ${SUP_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify that Supervisor see status of Agent is Ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Verify Agent Status     ${AGENT5_FIRSTNAME}    Ready
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Supervisor change status of Agent to Not ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Change Agent Status     ${AGENT5_FIRSTNAME}    Not Ready
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Agent is forced to Not ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Verify Not Ready   ${EMPTY}
    Sleep   1

#=======================================================================================================================

#Created date:     17/09/2020
# TEST CASE 03: Supervisor change status_TC003_Supervisor can change agent is working on voice contact from Ready to Not Ready
Supervisor change status_TC003_Supervisor can change agent is working on voice contact from Ready to Not Ready
    [Documentation]  Supervisor change status_TC003_Supervisor can change agent is working on voice contact from Ready to Not Ready
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${SUP_USERNAME}    ${SUP_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    OneXCommunicator.Close OneX      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify that Supervisor see status of Agent is Ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Verify Agent Status     ${AGENT2_FIRSTNAME}    Ready
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Supervisor change status of Agent to Not ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Change Agent Status     ${AGENT2_FIRSTNAME}    Not Ready
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Agent is forced to Not Ready Pending
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Verify Pending NRD
    Sleep   1

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Agent is forced to Not ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Verify Not Ready   ${EMPTY}
    Sleep   1

#=======================================================================================================================

#Created date:     17/09/2020
# TEST CASE 04: Supervisor change status_TC004_Supervisor can change agent is working on MM contact from Ready to Not Ready
Supervisor change status_TC004_Supervisor can change agent is working on MM contact from Ready to Not Ready
    [Documentation]  Supervisor change status_TC004_Supervisor can change agent is working on MM contact from Ready to Not Ready
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${SUP_USERNAME}    ${SUP_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    OneXCommunicator.Close OneX      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify that Supervisor see status of Agent is Ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Verify Agent Status     ${AGENT3_FIRSTNAME}    Ready
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC1}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT3_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT3_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT3_FIRSTNAME}
    Sleep   1

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Supervisor change status of Agent to Not ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Change Agent Status     ${AGENT3_FIRSTNAME}    Not Ready
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Agent is forced to Not Ready Pending
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Verify Pending NRD
    Sleep   1

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 6    Agent 2 ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Agent is forced to Not ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Verify Not Ready   ${EMPTY}
    Sleep   1

#=======================================================================================================================

