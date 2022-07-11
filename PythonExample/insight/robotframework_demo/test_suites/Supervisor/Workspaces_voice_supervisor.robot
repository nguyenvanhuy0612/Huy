*** Settings ***
Resource    ../../resources/Resources_Workspaces_voice_supervisor.robot

*** Test Cases ***
# Created by:       htmoanh
# Created date:     12/08/2020


#=======================================================================================================================
#***************                                                                                         ***************
#*************** CC-19993 AACCACCS Workspaces Client support for Supervisors for Observing Voice contact ***************
#***************                                                                                         ***************
#=======================================================================================================================

#Created date:     13/08/2020
# TEST CASE 01: Workspaces_Supervisor-TC001 Both agent and Sup_agent on workspaces, As a Voice only sup_agent, I able to observe voice contacts handled by agents
Workspaces_Supervisor-TC001 Both agent and Sup_agent on workspaces, As a Voice only sup_agent, I able to observe voice contacts handled by agents
    [Documentation]  Workspaces_Supervisor-TC001 Both agent and Sup_agent on workspaces, As a Voice only sup_agent, I able to observe voice contacts handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Sleep   30  AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Sleep   30  AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     14/08/2020
# TEST CASE 02: Workspaces_Supervisor-TC002 Both agent and Sup_agent on workspaces, As a blended sup_agent, I able to observe voice contacts handled by agents
Workspaces_Supervisor-TC002 Both agent and Sup_agent on workspaces, As a blended sup_agent, I able to observe voice contacts handled by agents
    [Documentation]  Workspaces_Supervisor-TC002 Both agent and Sup_agent on workspaces, As a blended sup_agent, I able to observe voice contacts handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

# JIRA CC-22294 - Open
#Created date:     18/08/2020
# TEST CASE 03: Workspaces_Supervisor-TC003 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the observing voice contact
Workspaces_Supervisor-TC003 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the observing voice contact
    [Documentation]  Workspaces_Supervisor-TC003 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the observing voice contact
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 0 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_0}    ${BROWSER_AGENT_ALIAS_0}    ${AGENT0_USERNAME}    ${AGENT0_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_0}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 0 observe sup/agent 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_0}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 0 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_0}
    WorkCard.Supervisor End Observe     ${AGENT1_FIRSTNAME}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================
#
#Created date:     17/08/2020
# TEST CASE 04: Workspaces_Supervisor-TC004 Both agent and Sup_agent on workspaces, As a agent, I able to dropped the observed call
Workspaces_Supervisor-TC004 Both agent and Sup_agent on workspaces, As a agent, I able to dropped the observed call
    [Documentation]  Workspaces_Supervisor-TC004 Both agent and Sup_agent on workspaces, As a agent, I able to dropped the observed call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2
#
#=======================================================================================================================

#Created date:     18/08/2020
# TEST CASE 05: Workspaces_Supervisor-TC005 Both agent and Sup_agent on workspaces, As a caller, I able to dropped the observed call
Workspaces_Supervisor-TC005 Both agent and Sup_agent on workspaces, As a caller, I able to dropped the observed call
    [Documentation]  Workspaces_Supervisor-TC005 Both agent and Sup_agent on workspaces, As a caller, I able to dropped the observed call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     18/08/2020
# TEST CASE 06: Workspaces_Supervisor-TC006 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer CDN to DN - before agent complete transfer
Workspaces_Supervisor-TC006 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer CDN to DN - before agent complete transfer
    [Documentation]  Workspaces_Supervisor-TC006 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer CDN to DN - before agent complete transfer
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 make transfer DN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 5 goes ready accepts transfered DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 completes transfer DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     19/08/2020
# TEST CASE 7: Workspaces_Supervisor-TC07 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer CDN to DN - after agent complete transfer
Workspaces_Supervisor-TC07 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer CDN to DN - after agent complete transfer
    [Documentation]  Workspaces_Supervisor-TC07 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer CDN to DN - after agent complete transfer
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make transfer DN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts transfered DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes transfer DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     19/08/2020
# TEST CASE 08: Workspaces_Supervisor-TC008 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer CDN to CDN - observe the agent 1
Workspaces_Supervisor-TC08 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer CDN to CDN - observe the agent 1
    [Documentation]  Workspaces_Supervisor-TC008 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer CDN to CDN - observe the agent 1
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 make transfer CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 5 accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 completes transfer DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CDN1}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     19/08/2020
# TEST CASE 09: Workspaces_Supervisor-TC009 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer CDN to CDN - observe the agent 2
Workspaces_Supervisor-TC09 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer CDN to CDN - observe the agent 2
    [Documentation]  Workspaces_Supervisor-TC09 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer CDN to CDN - observe the agent 2
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make transfer CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT3_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${AGENT3_VOICE_URI}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CDN1}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     20/08/2020
# TEST CASE 10: Workspaces_Supervisor-TC010 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference CDN to DN - before agent complete transfer
Workspaces_Supervisor-TC010 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference CDN to DN - before agent complete transfer
    [Documentation]  Workspaces_Supervisor-TC010 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference CDN to DN - before agent complete transfer
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 make conference DN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 5 accepts conference DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT3_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 ends conference call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     20/08/2020
# TEST CASE 11: Workspaces_Supervisor-TC011 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference CDN to DN - after agent complete transfer
Workspaces_Supervisor-TC011 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference CDN to DN - after agent complete transfer
    [Documentation]  Workspaces_Supervisor-TC011 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference CDN to DN - after agent complete transfer
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference DN call to Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 accepts conference DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT3_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 5 ends conference call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 ends conference call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     20/08/2020
# TEST CASE 12: Workspaces_Supervisor-TC012 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer CDN to CDN - observe the agent 1
Workspaces_Supervisor-TC012 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer CDN to CDN - observe the agent 1
    [Documentation]  Workspaces_Supervisor-TC012 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer CDN to CDN - observe the agent 1
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 make conference CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 5 accepts conference CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT3_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 completes conference CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${CDN1}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 3 ends conference call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 ends conference call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     21/08/2020
# TEST CASE 13: Workspaces_Supervisor-TC013 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the confefence CDN to CDN - observe the agent 2
Workspaces_Supervisor-TC013 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the confefence CDN to CDN - observe the agent 2
    [Documentation]  Workspaces_Supervisor-TC013 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the confefence CDN to CDN - observe the agent 2
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 accepts conference CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT3_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes conference CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${CDN1}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 3 ends call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 ends call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     21/08/2020
# TEST CASE 14: Workspaces_Supervisor-TC014 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe voice contacts while agent working on MM contacts
Workspaces_Supervisor-TC014 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe voice contacts while agent working on MM contacts
    [Documentation]  Workspaces_Supervisor-TC014 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe voice contacts while agent working on MM contacts
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   60    AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT3_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT3_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT3_FIRSTNAME}
    Sleep   1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 7    Agent 2 ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================


#=======================================================================================================================
#***************                                                                                         ***************
#************* CC-20001 AACCACCS Workspaces Client support for Supervisors for Barging-in on Voice contact *************
#***************                                                                                         ***************
#=======================================================================================================================

#Created date:     24/08/2020
Supervisor_Barge-in_CC-20001-TC001 Both agent and Sup_agent on workspaces, As a Voice only sup_agent, I able to barge in voice contacts handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 barges
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     25/08/2020
Supervisor_Barge-in_CC-20001-TC002 Both agent and Sup_agent on workspaces, As a blended sup_agent, I able to barge in voice contacts handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 barges
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     25/08/2020
Supervisor_Barge-in_CC-20001-TC003 Both agent and Sup_agent on workspaces, As a agent, I able to dropped the barged in call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 barges
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     26/08/2020
Supervisor_Barge-in_CC-20001-TC004 Both agent and Sup_agent on workspaces, As a caller, I able to dropped the CDN call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 barges
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     26/08/2020
Supervisor_Barge-in_CC-20001-TC005 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in the transfer CDN to DN - before agent complete transfer
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 barges Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 make transfer DN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 5 goes ready accepts transfered DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 2 completes transfer DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     27/08/2020
Supervisor_Barge-in_CC-20001-TC006 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in the transfer CDN to DN - after agent complete transfer
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make transfer DN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts transfered DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes transfer DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 barges Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI_CDN}
    Sleep   5

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     27/08/2020
Supervisor_Barge-in_CC-20001-TC007 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in the transfer CDN to CDN - observe the agent 1
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Sleep    1   AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Sleep    1   AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT4_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 barges Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 make transfer CDN call to Agent 3
#    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
#    AgentToolbar.Agent Go Ready
#    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 5 goes ready accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
#    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT4_VOICE_URI}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 2 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CDN1}
    Sleep   3

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10   Agent 5 end call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     27/08/2020
Supervisor_Barge-in_CC-20001-TC008 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in the transfer CDN to CDN - observe the agent 2
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make transfer CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT4_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CDN1}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 barges Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI_CDN}
    Sleep   5

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     28/08/2020
Supervisor_Barge-in_CC-20001-TC009 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in the conference CDN to DN - before agent complete conference
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 barges Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 make conference DN call to Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 5 goes ready accepts conference DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 2 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Sup/Agent 2 end conference
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     28/08/2020
Supervisor_Barge-in_CC-20001-TC010 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in the conference CDN to DN - after agent complete conference
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference DN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts conference DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact      ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 coaches Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 barges Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI_CDN}
    Sleep   5

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Agent 2 end conference
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     28/08/2020
Supervisor_Barge-in_CC-20001-TC011 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in the transfer CDN to CDN - observe the agent 1
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT4_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 barges Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 make conference CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 5 goes ready accepts conference CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT4_VOICE_URI}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 2 completes conference CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${CDN1}
    Sleep   3

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Agent 2 end contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     03/09/2020
Supervisor_Barge-in_CC-20001-TC012 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in the conference CDN to CDN - observe the agent 2
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 accepts conference CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes conference CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact      ${CDN1}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 barges Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI_CDN}
    Sleep   5

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Agent 2 end contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     03/09/2020
Supervisor_Barge-in_CC-20001-TC013 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in voice contacts while agent working on MM contacts
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   60    AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT4_SKILLSET_WC}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT4_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT4_FIRSTNAME}
    Sleep   1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT4_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 barges Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI_CDN}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 2 ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     14/09/2020
Supervisor_Barge-in_CC-20001-TC014 Both agent and Sup_agent on workspaces, As a sup_agent, I able to stop barge in voice call for an agent, then barge in again
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT4_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 barges
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   8

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 observe again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT4_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 coaches again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Sup/Agent 1 barges again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI_CDN}
    Sleep   5

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Sup/Agent 1 end barge-in contact again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Agent 2 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#***** CC-20004 AACCACCS Workspaces Client support for Supervisors for Whisper coaching an agent on Voice contact ******
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#Created date:     04/09/2020
Supervisor_Whisper_CC-20004-TC001 Both agent and Sup_agent on workspaces, As a Voice only sup_agent, I able to coach voice contacts handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT0_USERNAME}    ${AGENT0_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 end coaching contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Coaching    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     04/09/2020
Supervisor_Whisper_CC-20004-TC002 Both agent and Sup_agent on workspaces, As a blended sup_agent, I able to coach voice contacts handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT4_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 end coaching contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Coaching    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2
#
#=======================================================================================================================

#Created date:     04/09/2020
Supervisor_Whisper_CC-20004-TC003 Both agent and Sup_agent on workspaces, As a sup_agent, I able to coach many times
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT4_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 end coaching contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Coaching    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 2 again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT4_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 coaches Agent 2 again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end coaching contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Coaching    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     07/09/2020
Supervisor_Whisper_CC-20004-TC004 Both agent and Sup_agent on workspaces, As a agent, I able to dropped the coached call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     07/09/2020
Supervisor_Whisper_CC-20004-TC005 Both agent and Sup_agent on workspaces, As a sup_agent, I able to coach agent 1, then agent the transfer CDN to DN
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT4_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 make transfer DN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 5 goes ready accepts transfered DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT4_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 completes transfer DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     07/09/2020
Supervisor_Whisper_CC-20004-TC006 Both agent and Sup_agent on workspaces, As a sup_agent, I able to coach the consult CDN to DN call, then complete transfer
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make transfer DN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts transfered DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT4_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT4_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 completes transfer DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     08/09/2020
Supervisor_Whisper_CC-20004-TC007 Both agent and Sup_agent on workspaces, As a sup_agent, I able to coach agent 1, then agent the transfer CDN to CDN
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT4_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 make transfer CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 5 goes ready accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT4_VOICE_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CDN1}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   5

#=======================================================================================================================

#Created date:     08/09/2020
Supervisor_Whisper_CC-20004-TC008 Both agent and Sup_agent on workspaces, As a sup_agent, I able to coach agent 2, then agent the transfer CDN to CDN
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make transfer CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT4_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${AGENT4_VOICE_URI}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${AGENT4_VOICE_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CDN1}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end coaching contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Coaching    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     08/09/2020
Supervisor_Whisper_CC-20004-TC009 Both agent and Sup_agent on workspaces, As a sup_agent, I able to coach the consult CDN to CDN call, then complete transfer
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make transfer CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT4_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT4_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CDN1}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     09/09/2020
Supervisor_Whisper_CC-20004-TC010 Both agent and Sup_agent on workspaces, As a sup_agent, I able to coach agent 2, after agent the transfer CDN to CDN
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make transfer CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT4_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CUST1_URI_CDN}    #{CDN1}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end coaching contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Coaching    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     09/09/2020
Supervisor_Whisper_CC-20004-TC011 Both agent and Sup_agent on workspaces, As a sup_agent, I able to coach agent 1, then agent the conference CDN to DN
    [Setup]     Run Keywords
    #   rt_Auto_Oanh\source_code\aaccSetting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Sleep   2     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 make conference DN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 5 goes ready accepts conference DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT3_VOICE_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end coaching contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Coaching    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 2 end call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     10/09/2020
Supervisor_Whisper_CC-20004-TC012 Both agent and Sup_agent on workspaces, As a sup_agent, I able to coach the consult CDN to DN call, then complete conference
    [Setup]     Run Keywords
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference DN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${AGENT4_PHONE_NUMBER}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts conference DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${AGENT4_VOICE_URI}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end coaching contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Coaching    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 2 end call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2
#
#=======================================================================================================================

# phai bo TC nay (ko the coach agent 2 sau khi conference CDN to DN)
#Created date:     10/09/2020
Supervisor_Whisper_CC-20004-TC013 Both agent and Sup_agent on workspaces, As a sup_agent, I able to coach agent 2, after agent the conference CDN to DN
    [Setup]     Run Keywords
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference DN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts conference DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end coaching contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Coaching    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 2 end call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     10/09/2020
Supervisor_Whisper_CC-20004-TC014 Both agent and Sup_agent on workspaces, As a sup_agent, I able to coach agent 1, then agent makes the conference CDN to CDN
    [Setup]     Run Keywords
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 make conference CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 5 goes ready accepts conference CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 completes conference CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${CDN1}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end coaching contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Coaching    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 2 end call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     11/09/2020
Supervisor_Whisper_CC-20004-TC015 Both agent and Sup_agent on workspaces, As a sup_agent, I able to coach the consult CDN to CDN call, then complete conference
    [Setup]     Run Keywords
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Sleep   2     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts conference CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 completes conference CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${CDN1}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end coaching contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Coaching    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 2 end call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     11/09/2020
Supervisor_Whisper_CC-20004-TC016 Both agent and Sup_agent on workspaces, As a sup_agent, I able to coach agent 2, after agent the conference CDN to CDN
    [Setup]     Run Keywords
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts conference CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes conference CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${CDN1}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end coaching contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Coaching    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 2 end call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     11/09/2020
Supervisor_Whisper_CC-20004-TC017 Both agent and Sup_agent on workspaces, As a sup_agent, I able to coach voice contacts while agent working on MM contacts
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   60    AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT3_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT3_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT3_FIRSTNAME}
    Sleep   1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 coaches Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Coaching     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end coaching contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Coaching    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 2 ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#************* CC-19999 AACCACCS Workspaces Client support for Supervisors for Observing non-skillset calls ************
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#Created date:     17/09/2020
# TEST CASE 01: Workspaces_Supervisor_Observe DN-TC001 Both agent and Sup_agent on workspaces, As a Voice only sup_agent, I able to observe DN call handled by agents
Workspaces_Supervisor_Observe DN-TC001 Both agent and Sup_agent on workspaces, As a Voice only sup_agent, I able to observe DN call handled by agents
    [Documentation]  Workspaces_Supervisor_Observe DN-TC001 Both agent and Sup_agent on workspaces, As a Voice only sup_agent, I able to observe DN call handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT0_USERNAME}    ${AGENT0_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT1_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     18/09/2020
# TEST CASE 02: Workspaces_Supervisor_Observe DN-TC002 Both agent and Sup_agent on workspaces, As a blended sup_agent, I able to observe DN call handled by agents
Workspaces_Supervisor_Observe DN-TC002 Both agent and Sup_agent on workspaces, As a blended sup_agent, I able to observe DN call handled by agents
    [Documentation]  Workspaces_Supervisor_Observe DN-TC002 Both agent and Sup_agent on workspaces, As a blended sup_agent, I able to observe DN call handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     18/09/2020
# TEST CASE 03: Workspaces_Supervisor_Observe DN-TC003 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the observing DN call
Workspaces_Supervisor_Observe DN-TC003 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the observing DN call
    [Documentation]  Workspaces_Supervisor_Observe DN-TC003 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the observing DN call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 0 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_0}    ${BROWSER_AGENT_ALIAS_0}    ${AGENT0_USERNAME}    ${AGENT0_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_0}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT3_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 0 observe sup/agent 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_0}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 0 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_0}
    WorkCard.Supervisor End Observe     ${AGENT1_FIRSTNAME}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   2

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     18/09/2020
# TEST CASE 04: Workspaces_Supervisor_Observe DN-TC004 Both agent and Sup_agent on workspaces, As a sup_agent, I able to stop observing DN call for an agent, then observe again
Workspaces_Supervisor_Observe DN-TC004 Both agent and Sup_agent on workspaces, As a sup_agent, I able to stop observing DN call for an agent, then observe again
    [Documentation]  Workspaces_Supervisor_Observe DN-TC004 Both agent and Sup_agent on workspaces, As a sup_agent, I able to stop observing DN call for an agent, then observe again
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     21/09/2020
# TEST CASE 05: Workspaces_Supervisor_Observe DN-TC005 Both agent and Sup_agent on workspaces, As a agent, I able to dropped the observed DN call
Workspaces_Supervisor_Observe DN-TC005 Both agent and Sup_agent on workspaces, As a agent, I able to dropped the observed DN call
    [Documentation]  Workspaces_Supervisor_Observe DN-TC005 Both agent and Sup_agent on workspaces, As a agent, I able to dropped the observed DN call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   2

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   1

#=======================================================================================================================

#Created date:     21/09/2020
# TEST CASE 06: Workspaces_Supervisor_Observe DN-TC006 Both agent and Sup_agent on workspaces, As a caller, I able to dropped the observed DN call
Workspaces_Supervisor_Observe DN-TC006 Both agent and Sup_agent on workspaces, As a caller, I able to dropped the observed DN call
    [Documentation]  Workspaces_Supervisor_Observe DN-TC006 Both agent and Sup_agent on workspaces, As a caller, I able to dropped the observed DN call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   2

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer end DN call
    OneXCommunicator.OneX Release Call
    Sleep   4

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   1

#=======================================================================================================================

#Created date:     21/09/2020
# TEST CASE 07: Workspaces_Supervisor_Observe DN-TC007 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer DN to DN - before agent complete transfer
Workspaces_Supervisor_Observe DN-TC007 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer DN to DN - before agent complete transfer
    [Documentation]  Workspaces_Supervisor_Observe DN-TC007 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer DN to DN - before agent complete transfer
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 make transfer DN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 5 goes ready accepts transfered DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 completes transfer DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   4

#=======================================================================================================================

#Created date:     22/09/2020
# TEST CASE 08: Workspaces_Supervisor_Observe DN-TC008 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer DN to DN - after agent complete transfer
Workspaces_Supervisor_Observe DN-TC008 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer DN to DN - after agent complete transfer
    [Documentation]  Workspaces_Supervisor_Observe DN-TC008 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer DN to DN - after agent complete transfer
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make transfer DN call to Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts transfered DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes transfer DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   4

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     22/09/2020
# TEST CASE 08: Workspaces_Supervisor_Observe DN-TC009 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer DN to CDN - observe the agent 1
Workspaces_Supervisor_Observe DN-TC009 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer DN to CDN - observe the agent 1
    [Documentation]  Workspaces_Supervisor_Observe DN-TC009 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer DN to CDN - observe the agent 1
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 make transfer CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI}      ${CDN1}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 5 accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CDN1}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Customer end call
    OneXCommunicator.OneX Release Call
    Sleep   4

#=======================================================================================================================

#Created date:     22/09/2020
# TEST CASE 10: Workspaces_Supervisor_Observe DN-TC010 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer DN to CDN - observe the agent 2
Workspaces_Supervisor_Observe DN-TC010 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer DN to CDN - observe the agent 2
    [Documentation]  Workspaces_Supervisor_Observe DN-TC010 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer DN to CDN - observe the agent 2
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make transfer CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI}      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${AGENT2_VOICE_URI}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CDN1}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   4

#=======================================================================================================================

#Created date:     23/09/2020
# TEST CASE 11: Workspaces_Supervisor_Observe DN-TC011 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference DN to DN - before agent complete conference
Workspaces_Supervisor_Observe DN-TC011 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference DN to DN - before agent complete conference
    [Documentation]  Workspaces_Supervisor_Observe DN-TC011 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference DN to DN - before agent complete conference
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 make conference DN call to Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 5 goes ready accepts conference DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 2 end conference
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Customer end call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     23/9/2020
# TEST CASE 12: Workspaces_Supervisor_Observe DN-TC012 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference DN to DN - after agent complete conference
Workspaces_Supervisor_Observe DN-TC012 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference DN to DN - after agent complete conference
    [Documentation]  Workspaces_Supervisor_Observe DN-TC012 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference DN to DN - after agent complete conference
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference DN call to Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts conference DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact      ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 2 end conference
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Customer end DN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     23/09/2020
# TEST CASE 13: Workspaces_Supervisor_Observe DN-TC013 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference DN to CDN - observe the agent 1
Workspaces_Supervisor_Observe DN-TC013 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference DN to CDN - observe the agent 1
    [Documentation]  Workspaces_Supervisor_Observe DN-TC013 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference DN to CDN - observe the agent 1
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 make conference CDN call to Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI}      ${CDN1}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 5 goes ready accepts conference CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 completes conference CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${CDN1}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 2 end conference
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Customer end call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     24/9/2020
# TEST CASE 14: Workspaces_Supervisor_Observe DN-TC014 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference DN to CDN - observe the agent 2
Workspaces_Supervisor_Observe DN-TC014 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference DN to CDN - observe the agent 2
    [Documentation]  Workspaces_Supervisor_Observe DN-TC014 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference DN to CDN - observe the agent 2
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference DN call to Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts conference CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${AGENT2_VOICE_URI}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact      ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 2 end conference
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Customer end DN call
    OneXCommunicator.OneX Release Call
    Sleep   4

#=======================================================================================================================

#Created date:     24/09/2020
# TEST CASE 15: Workspaces_Supervisor_Observe DN-TC015 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe DN call while agent working on MM contacts
Workspaces_Supervisor_Observe DN-TC015 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe DN call while agent working on MM contacts
    [Documentation]  Workspaces_Supervisor_Observe DN-TC015 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe DN call while agent working on MM contacts
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   60    AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 3
    OneXCommunicator.OneX Call Out     ${AGENT3_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 3 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT3_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT3_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT3_FIRSTNAME}
    Sleep   1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   2

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 7    Agent 2 ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     24/09/2020
# TEST CASE 16: Workspaces_Supervisor_Observe DN-TC016 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe DN out call handled by agents
Workspaces_Supervisor_Observe DN-TC016 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe DN out call handled by agents
    [Documentation]  Workspaces_Supervisor_Observe DN-TC016 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe DN out call handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT0_USERNAME}    ${AGENT0_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent makes DN call to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Calls Out    ${CUST1_PHONE}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer accepts call from Agent
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${AGENT1_VOICE_URI}
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 Ends DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     25/09/2020
# TEST CASE 17: Workspaces_Supervisor_Observe DN-TC017 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe CDN out call handled by agents
Workspaces_Supervisor_Observe DN-TC017 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe CDN out call handled by agents
    [Documentation]  Workspaces_Supervisor_Observe DN-TC017 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe CDN out call handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work
    ...     AgentToolbar.Agent Go Ready     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 5 makes CDN call to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Calls Out    ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${AGENT5_VOICE_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${AGENT5_VOICE_URI}
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 5    Agent 2 end conference
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${AGENT5_VOICE_URI}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Sup/Agent is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     28/09/2020
Workspaces_Supervisor_Observe DN-TC018 Both agent and Sup_agent on workspaces, As a sup_agent, I able to stop observing DN out call for an agent, then observe again
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT0_USERNAME}    ${AGENT0_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent makes DN call to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Calls Out    ${CUST1_PHONE}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer accepts call from Agent
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${AGENT1_VOICE_URI}
    Sleep   7

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${AGENT1_VOICE_URI}
    Sleep   2

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 Ends DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     28/09/2020
Workspaces_Supervisor_Observe DN-TC019 Both agent and Sup_agent on workspaces, As a agent, I able to dropped the observed DN call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT0_USERNAME}    ${AGENT0_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent makes DN call to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Calls Out    ${CUST1_PHONE}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer accepts call from Agent
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 Ends DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     29/09/2020
Workspaces_Supervisor_Observe DN-TC020 Both agent and Sup_agent on workspaces, As a caller, I able to dropped the observed DN call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT0_USERNAME}    ${AGENT0_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent makes DN call to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Calls Out    ${CUST1_PHONE}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer accepts call from Agent
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer end DN call
    OneXCommunicator.OneX Release Call
    Sleep   4

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     /10/2020
Workspaces_Supervisor_Observe DN-TC021 Sup_agent have URI is different to Login ID, I able to observe DN calll handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     /10/2020
Workspaces_Supervisor_Observe DN-TC022 Sup_agent have URI is different to Login ID, I able to stop observing DN call for an agent, then observe again
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   7

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

#=======================================================================================================================
#Created date:     /10/2020
Workspaces_Supervisor_Observe DN-TC023 Sup_agent have URI is different to Login ID, Agent able to stop observing DN call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   1

#=======================================================================================================================

#Created date:     /10/2020
Workspaces_Supervisor_Observe DN-TC024 Sup_agent have URI is different to Login ID, Customer able to stop observing DN call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   2

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer end DN call
    OneXCommunicator.OneX Release Call
    Sleep   4

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   1

#=======================================================================================================================

#Created date:     /10/2020
Workspaces_Supervisor_Observe DN-TC025 Sup_agent have URI is different to Login ID, I able to observe the transfer DN to DN - before agent complete transfer
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 make transfer DN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI}      ${AGENT3_PHONE_NUMBER}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 5 accepts transfered DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 completes transfer DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${AGENT3_VOICE_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Customer end call
    OneXCommunicator.OneX Release Call
    Sleep   5

#=======================================================================================================================

#Created date:     /10/2020
Workspaces_Supervisor_Observe DN-TC026 Sup_agent have URI is different to Login ID,I able to observe the transfer DN to CDN - observe the agent 1
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 make transfer CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI}      ${CDN1}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 5 accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CDN1}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Customer end call
    OneXCommunicator.OneX Release Call
    Sleep   4

#=======================================================================================================================

#Created date:     /10/2020
Workspaces_Supervisor_Observe DN-TC027 Sup_agent have URI is different to Login ID, I able to observe the conference DN to DN - after agent complete conference
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference DN call to Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts conference DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact      ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 2 end conference
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Customer end DN call
    OneXCommunicator.OneX Release Call
    Sleep   4

#=======================================================================================================================

#Created date:     /10/2020
Workspaces_Supervisor_Observe DN-TC028 Sup_agent have URI is different to Login ID, I able to observe the conference DN to CDN - observe the agent 2
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference DN call to Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts conference DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${AGENT2_VOICE_URI}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact      ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 2 end conference
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Customer end DN call
    OneXCommunicator.OneX Release Call
    Sleep   4

#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#*********** CC-19995 AACCACCS Workspaces Client support for Supervisors for Observing second Voice contact ************
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================

#Created date:     9/10/2020
Workspaces_Supervisor-TC001 Both agent and Sup_agent on workspaces, As a Voice only sup_agent, I able to observe voice contacts handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes CDN call to Agent 3
    AvayaIX.AvayaIX Call Out    ${CDN1}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST2_URI_CDN}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST2_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 Ends CDN call from Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 3 Ends CDN call from Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST2_URI_CDN}
    Sleep   2

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     9/10/2020
Workspaces_Supervisor_Observe CDN_CC-19995-TC002 Both agent and Sup_agent on workspaces, As a blended sup_agent, I able to observe 2 voice contacts handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes CDN call to Agent 3
    AvayaIX.AvayaIX Call Out    ${CDN1}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST2_URI_CDN}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST2_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 Ends CDN call from Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 3 Ends CDN call from Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST2_URI_CDN}
    Sleep   2

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     12/10/2020
Workspaces_Supervisor_Observe CDN_CC-19995-TC003 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the observing voice contact and 1 CDN call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT0_USERNAME}    ${AGENT0_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer 1 makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer 2 makes CDN call to Agent 1
    AvayaIX.AvayaIX Call Out    ${CDN1}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 1 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST2_URI_CDN}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 0 observe the observing from Agent 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   7

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 0 observe CDN of Agent 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST2_URI_CDN}
    Sleep   7

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end CDN call from Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST2_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 2 Ends CDN call from Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Agent Idle
    Sleep   2

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Verify Sup/Agent 0 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     12/10/2020
Workspaces_Supervisor_Observe CDN_CC-19995-TC004 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the observing voice contact and 1 DN call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT0_USERNAME}    ${AGENT0_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes DN call to Agent 1
    AvayaIX.AvayaIX Call Out    ${AGENT1_PHONE_NUMBER}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST2_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 0 observe the observing from Agent 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   7

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 0 observe DN of Agent 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST2_URI}
    Sleep   7

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Sup/Agent 1 end DN call from Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST2_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 3 Ends CDN call from Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Agent Idle
    Sleep   2

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Verify Sup/Agent 0 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     12/10/2020
Workspaces_Supervisor_Observe CDN_CC-19995-TC005 Both agent and Sup_agent on workspaces, As a sup_agent, I able to stop observing voice calls for an agent, then observe again
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes CDN call to Agent 3
    AvayaIX.AvayaIX Call Out    ${CDN1}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST2_URI_CDN}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST2_URI_CDN}
    Sleep   7

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Sup/Agent 1 observe Agent 2 again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   7

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Sup/Agent 1 observe Agent 3 again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI_CDN}
    Sleep   5

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Agent 2 Ends CDN call from Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 12:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 12    Agent 3 Ends CDN call from Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST2_URI_CDN}
    Sleep   5

    # STEP 13:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 13    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     13/10/2020
Workspaces_Supervisor_Observe CDN_CC-19995-TC006 Both agent and Sup_agent on workspaces, As an agent, I able to dropped the observed calls
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes CDN call to Agent 3
    AvayaIX.AvayaIX Call Out    ${CDN1}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST2_URI_CDN}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 Ends CDN call from Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 3 Ends CDN call from Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST2_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     13/10/2020
Workspaces_Supervisor_Observe CDN_CC-19995-TC007 Both agent and Sup_agent on workspaces, As a caller, I able to dropped the observed calls
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes CDN call to Agent 3
    AvayaIX.AvayaIX Call Out    ${CDN1}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST2_URI_CDN}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI_CDN}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST2_URI_CDN}
    Sleep   3

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Customer 1 end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   3

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Customer 2 end CDN call
    AvayaIX.AvayaIX Release Call
    Sleep   2

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     13/10/2020
Workspaces_Supervisor_Observe CDN_CC-19995-TC008 Both agent and Sup_agent on workspaces, As a sup_agent is working on MM contact, I able to observe 2 voice contacts handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes CDN call to Agent 3
    AvayaIX.AvayaIX Call Out    ${CDN1}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST2_URI_CDN}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT3_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   7

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI_CDN}
    Sleep   5

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Sup/Agent 1 ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Sup/Agent 1 end observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Sup/Agent 1 end observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST2_URI_CDN}
    Sleep   3

    # STEP 12:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 12    Customer 1 end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   3

    # STEP 13:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 13    Customer 2 end CDN call
    AvayaIX.AvayaIX Release Call
    Sleep   2

    # STEP 14:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 14    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#*********** CC-19995 AACCACCS Workspaces Client support for Supervisors for Observing second Voice contact ************
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================

#Created date:     14/10/2020
Workspaces_Supervisor_Observe DN_CC-20000-TC001 Both agent and Sup_agent on workspaces, As a Voice only sup_agent, I able to observe 2 DN calls handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes CDN call to Agent 3
    AvayaIX.AvayaIX Call Out    ${AGENT3_PHONE_NUMBER}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${CUST2_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST2_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 Ends CDN call from Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 3 Ends CDN call from Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST2_URI}
    Sleep   2

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     14/10/2020
Workspaces_Supervisor_Observe DN_CC-20000-TC002 Both agent and Sup_agent on workspaces, As a blended sup_agent, I able to observe 2 DN calls handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes CDN call to Agent 3
    AvayaIX.AvayaIX Call Out    ${AGENT3_PHONE_NUMBER}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${CUST2_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST2_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 Ends CDN call from Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 3 Ends CDN call from Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST2_URI}
    Sleep   2

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     14/10/2020
Workspaces_Supervisor_Observe DN_CC-20000-TC003 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the observing DN call and 1 DN call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT0_USERNAME}    ${AGENT0_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer 1 makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer 2 makes DN call to Agent 1
    AvayaIX.AvayaIX Call Out    ${AGENT1_PHONE_NUMBER}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 1 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST2_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 0 observe the observing from Agent 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 0 observe DN of Agent 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST2_URI}
    Sleep   7

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end DN call from Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST2_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent 2 Ends DN call from Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Verify Agent Idle
    Sleep   2

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Verify Sup/Agent 0 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     15/10/2020
Workspaces_Supervisor_Observe DN_CC-20000-TC004 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe 1 DN in and 1 DN out
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer 1 makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 3 makes the DN call out to customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Calls Out    ${CUST2_PHONE}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer 2 accepts DN call from Agent 3
    AvayaIX.AvayaIX Accept Call

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI}
    Sleep   7

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end DN call from Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 2 Ends DN call to Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST2_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     15/10/2020
Workspaces_Supervisor_Observe DN_CC-20000-TC005 Both agent and Sup_agent on workspaces, As a sup_agent, I able to stop observing DN call for an agent, then observe again
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes CDN call to Agent 3
    AvayaIX.AvayaIX Call Out    ${AGENT3_PHONE_NUMBER}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST2_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST2_URI_CDN}
    Sleep   7

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Sup/Agent 1 observe Agent 2 again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   7

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Sup/Agent 1 observe Agent 3 again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI_CDN}
    Sleep   5

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Agent 2 Ends CDN call from Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 12:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 12    Agent 3 Ends CDN call from Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST2_URI_CDN}
    Sleep   5

    # STEP 13:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 13    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     13/10/2020
Workspaces_Supervisor_Observe DN_CC-20000-TC006 Both agent and Sup_agent on workspaces, As an agent, I able to dropped the observed DN calls
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes CDN call to Agent 3
    AvayaIX.AvayaIX Call Out    ${AGENT3_PHONE_NUMBER}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST2_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 Ends CDN call from Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 3 Ends CDN call from Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST2_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     16/10/2020
Workspaces_Supervisor_Observe DN_CC-20000-TC007 Both agent and Sup_agent on workspaces, As a caller, I able to dropped the observed DN calls
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes CDN call to Agent 3
    AvayaIX.AvayaIX Call Out    ${AGENT3_PHONE_NUMBER}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST2_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Customer 1 end DN call
    OneXCommunicator.OneX Release Call
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Customer 2 end DN call
    AvayaIX.AvayaIX Release Call
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     16/10/2020
Workspaces_Supervisor_Observe DN_CC-20000-TC008 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe 2 DN calls while agent working on MM contacts
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes DN call to Agent 3
    AvayaIX.AvayaIX Call Out    ${AGENT3_PHONE_NUMBER}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST2_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT1_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT1_FIRSTNAME}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI}
    Sleep   5

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Sup/Agent 1 ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Sup/Agent 1 end observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   2

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Sup/Agent 1 end observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST2_URI}
    Sleep   3

    # STEP 12:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 12    Customer 1 end DN call
    OneXCommunicator.OneX Release Call
    Sleep   3

    # STEP 13:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 13    Customer 2 end DN call
    AvayaIX.AvayaIX Release Call
    Sleep   2

    # STEP 14:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 14    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     19/10/2020
Workspaces_Supervisor_Observe DN_CC-20000-TC009 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe DN out call handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 2 makes DN call to Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Calls Out    ${CUST1_PHONE}
    Sleep   3

	# STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer 1 accepts call from Agent 2
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 3 makes the DN call out to customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Calls Out    ${CUST2_PHONE}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer 2 accepts DN call from Agent 3
    AvayaIX.AvayaIX Accept Call

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI}
    Sleep   7

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 end DN call to Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 3 Ends DN call to Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST2_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     20/10/2020
Workspaces_Supervisor_Observe DN_CC-20000-TC010 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe CDN out call handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 2 makes DN call to Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Calls Out    ${CUST1_PHONE}
    Sleep   3

	# STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer 1 accepts call from Agent 2
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 makes the CDN call out to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Calls Out    ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 3 accepts CDN call from Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Accepts A Contact     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe DN call out of Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe CDN call out of Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${AGENT3_PHONE_NUMBER}
    Sleep   7

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 end DN call to Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 2 Ends CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${AGENT3_PHONE_NUMBER}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     20/10/2020
Workspaces_Supervisor_Observe DN_CC-20000-TC011 Both agent and Sup_agent on workspaces, As a sup_agent, I able to stop observing DN out call for an agent, then observe again
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 2 makes DN call to Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Calls Out    ${CUST1_PHONE}
    Sleep   3

	# STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer 1 accepts call from Agent 2
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 3 makes the DN call out to customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Calls Out    ${CUST2_PHONE}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer 2 accepts DN call from Agent 3
    AvayaIX.AvayaIX Accept Call

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI}
    Sleep   7

	# STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   5

	# STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI}
    Sleep   5

	# STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Sup/Agent 1 observe Agent 2 again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Sup/Agent 1 observe Agent 3 again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI}
    Sleep   7

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Agent 2 end DN call to Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 12:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 12    Agent 3 Ends DN call to Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST2_URI}
    Sleep   2

	# STEP 13:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 13    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     20/10/2020
Workspaces_Supervisor_Observe DN_CC-20000-TC012 Sup_agent have URI is different to Login ID, I able to observe DN calll handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 2 makes DN call to Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Calls Out    ${CUST1_PHONE}
    Sleep   3

	# STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer 1 accepts call from Agent 2
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 3 makes the DN call out to customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Calls Out    ${CUST2_PHONE}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer 2 accepts DN call from Agent 3
    AvayaIX.AvayaIX Accept Call

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI}
    Sleep   7

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 end DN call to Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 3 Ends DN call to Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST2_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     21/10/2020
Workspaces_Supervisor_Observe DN_CC-20000-TC013 Sup_agent have URI is different to Login ID, I able to stop observing DN call for an agent, then observe again
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer makes CDN call to Agent 3
    AvayaIX.AvayaIX Call Out    ${AGENT3_PHONE_NUMBER}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST2_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST1_URI_CDN}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor End Observe     ${CUST2_URI_CDN}
    Sleep   7

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Sup/Agent 1 observe Agent 2 again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI_CDN}
    Sleep   7

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Sup/Agent 1 observe Agent 3 again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI_CDN}
    Sleep   5

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Agent 2 Ends CDN call from Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 12:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 12    Agent 3 Ends CDN call from Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST2_URI_CDN}
    Sleep   5

    # STEP 13:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 13    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     21/10/2020
Workspaces_Supervisor_Observe DN_CC-20000-TC014 Sup_agent have URI is different to Login ID, As a sup_agent, I able to observe DN out call handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 2 makes DN call to Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Calls Out    ${CUST1_PHONE}
    Sleep   3

	# STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer 1 accepts call from Agent 2
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 3 makes the DN call out to customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Calls Out    ${CUST2_PHONE}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer 2 accepts DN call from Agent 3
    AvayaIX.AvayaIX Accept Call

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI}
    Sleep   7

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 end DN call to Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 3 Ends DN call to Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST2_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================

#Created date:     22/10/2020
Workspaces_Supervisor_Observe DN_CC-20000-TC015 Agent have URI is different to Login ID, I able to observe DN calll handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    AvayaIX.AvayaIX Log Out     AND
    ...    AvayaIX.Close AvayaIX    AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 2 makes DN call to Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Calls Out    ${CUST1_PHONE}
    Sleep   3

	# STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer 1 accepts call from Agent 2
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 3 makes the DN call out to customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Calls Out    ${CUST2_PHONE}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer 2 accepts DN call from Agent 3
    AvayaIX.AvayaIX Accept Call

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST2_URI}
    Sleep   7

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 end DN call to Customer 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 3 Ends DN call to Customer 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    WorkCard.Agent Ends A Contact     ${CUST2_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify Sup/Agent 1 is idle state
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Agent Idle
    Sleep   2

#=======================================================================================================================
#
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#********** CC-20002 AACCACCS Workspaces Client support for Supervisors for Barging-in on non-skillset call ************
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#Created date:     22/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC001 Both agent and Sup_agent on workspaces, As a Voice only sup_agent, I able to barge in DN call handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT0_USERNAME}    ${AGENT0_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT1_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

	# STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 barges
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     22/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC001 Both agent and Sup_agent on workspaces, As a Voice only sup_agent, I able to barge in DN call handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

	# STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 barges
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     23/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC003 Both agent and Sup_agent on workspaces, As a sup_agent, I able to stop barge in DN call for an agent, then barge-in again
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

	# STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 barges
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   7

	# STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 barges again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     23/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC004 Both agent and Sup_agent on workspaces, As a agent, I able to dropped the barge in DN call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

	# STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 barges
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

	# STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     23/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC005 Both agent and Sup_agent on workspaces, As a caller, I able to dropped the barge in DN call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

	# STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 barges
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

	# STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     27/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC006 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in the transfer DN to DN - before agent complete transfer
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 barges Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 make transfer DN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 5 goes ready accepts transfered DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 completes transfer DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${AGENT5_VOICE_URI}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     27/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC007 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the transfer DN to DN - after agent complete transfer
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   5

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make transfer DN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready to accept transfered DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes transfer DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${AGENT5_VOICE_URI}
    Sleep   3

	# STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 barges Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI}
    Sleep   7

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     28/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC008 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in the transfer DN to CDN - barge in the agent 1
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 barges Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 make transfer CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI}      ${CDN1}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 5 goes ready accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CUST1_URI}	#${CDN1}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     28/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC009 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in the transfer DN to CDN - barge in the agent 2
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   5

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make transfer CDN call to Agent 3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Transfer Extension Call      ${CUST1_URI}      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

	# STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${AGENT2_VOICE_URI}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 barges Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${AGENT2_VOICE_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CUST1_URI}	#${CDN1}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     28/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC010 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in the conference DN to DN - before agent complete conference
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

	# STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 barges Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${AGENT2_VOICE_URI}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 make conference DN call to Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 5 goes ready accepts conference DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${AGENT5_VOICE_URI}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 end conference
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Customer end call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     29/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC011 Both agent and Sup_agent on workspaces, As a sup_agent, I able to observe the conference DN to DN - after agent complete conference
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference DN call to Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI}      ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts conference DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${AGENT5_VOICE_URI}
    Sleep   5

	# STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

	# STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 barges Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in    ${CUST1_URI}
    Sleep   7

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 end conference
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Customer end call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     29/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC012 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in the conference DN to CDN - barge in the agent 1
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT2_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

	# STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 barges Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${AGENT2_VOICE_URI}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 make conference CDN call to Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI}      ${CND1}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 5 goes ready accepts conference CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 completes conference CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${CDN1}
    Sleep   5

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 end conference
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Customer end call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:     29/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC013 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in the conference DN to CDN - barge in the agent 2
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2     AND
    #   Login blended agent 3 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2     AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT2_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference CDN call to Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Consult Extension Call      ${CUST1_URI}      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 5 goes ready accepts conference CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_3}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT2_VOICE_URI}
    Sleep   3

	# STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${AGENT2_VOICE_URI}
    Sleep   5

	# STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 barges Agent 5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in    ${AGENT2_VOICE_URI}
    Sleep   7

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 completes conference CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${CDN1}
    Sleep   7

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 end conference
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Customer end call
    OneXCommunicator.OneX Release Call
    Sleep   2

#=======================================================================================================================

#Created date:    30/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC014 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in DN call while agent working on MM contacts
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   60    AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 3
    OneXCommunicator.OneX Call Out     ${AGENT3_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 3 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC1}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent ${AGENT3_FIRSTNAME}
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT3_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT3_FIRSTNAME}
    Sleep   1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 observe DN call of Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT3_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 barges Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in    ${CUST1_URI}
    Sleep   7

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     30/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC015 Both agent and Sup_agent on workspaces, As a sup_agent, I able to barge in DN out call handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT0_USERNAME}    ${AGENT0_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent makes DN call to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Calls Out    ${CUST1_PHONE}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer accepts call from Agent
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 barges Agent
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in    ${CUST1_URI}
    Sleep   7

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 Ends DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     30/10/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC016 Both agent and Sup_agent on workspaces, As a sup_agent, I able to stop barge in DN out call for an agent, then barge in again
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT0_USERNAME}    ${AGENT0_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent makes DN call to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Calls Out    ${CUST1_PHONE}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer accepts call from Agent
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 barges Agent
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in    ${CUST1_URI}
    Sleep   7

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   5

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 observe again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT1_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 barges Agent again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in    ${CUST1_URI}
    Sleep   7

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   5

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent 2 Ends DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     2/11/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC017 Sup_agent have URI is different to Login ID, I able to observe DN calll handled by agents
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

	# STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 barges
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     2/11/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC018 Sup_agent have URI is different to Login ID, I able to stop barge in DN call for an agent, then barge-in again
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

	# STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 barges
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   7

	# STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 barges again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI}
    Sleep   5

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     2/11/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC004 Both agent and Sup_agent on workspaces, As a agent, I able to dropped the barge in DN call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

	# STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 barges
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 Ends DN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

	# STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     2/11/2020
Workspaces_Supervisor_Barge-in DN_CC-20002-TC020 Sup_agent have URI is different to Login ID, Customer able to stop barge in DN call
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 2
    OneXCommunicator.OneX Call Out     ${AGENT5_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Sup/Agent 1 observe
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open My Agent
    Sleep   1
    WidgetMyAgent.Observe Contact    ${AGENT5_FIRSTNAME}    ${CUST1_URI}
    Sleep   5

	# STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Sup/Agent 1 barges
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Supervisor Barge-in   ${CUST1_URI}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

	# STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Sup/Agent 1 end barge-in contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#********** END END END END END END END END END END END END END END END END END END END END END END END END ************
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@