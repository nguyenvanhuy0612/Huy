*** Settings ***
Documentation    20 TCs for Sanity Suite
Resource    ../../resources/Resource_Workspace_Sanity.robot


*** Test Cases ***
# Created by:       htmoanh
# Created date:     12/02/2020

#=======================================================================================================================

#Created date:     24/02/2020
# TEST CASE 1: Workspaces_TC-01 - Make sure can login voice only Agent on Workspaces
Workspaces_TC-01 - Make sure can login voice only Agent on Workspaces
    [Documentation]  Voice only Agent can login, start work, go ready, not ready and finish work without error
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Voice only Agent login into Workspaces and click Activate button
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01   Voice only Agent login into Workspaces and click Activate button
    Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}
    Login.Activate Agent
    Sleep   1

    # STEP 2: Click Start Work button
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02   Click Start Work button
    AgentToolbar.Agent Start Work
    Sleep   1

    # STEP 3: Click Menu Contains state and choose Ready Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03   Click Menu Contains state and choose Ready Agent to ready Agent
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 4: Click Menu Contains state and choose Not ready Agent with Default reason code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04   Click Menu Contains state and choose Not Ready Agent with Default reason code
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   1

    # STEP 5: Click Menu Contains state and choose Finish Work Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05   Click Menu Contains state and choose Finish Work Agent
    AgentToolbar.Agent Finish Work

#=======================================================================================================================


#Created date:     24/02/2020
# TEST CASE 2: Workspaces_TC-02 - Make sure can login MM only Agent on Workspaces
Workspaces_TC-02 - Make sure can login MM only Agent on Workspaces
    [Documentation]  MM only Agent can login, start work, go ready, not ready and finish work without error
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: MM only Agent login into Workspaces and click Activate button
    # Agent Oanhho2, station: 100002
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01   MM Agent login into Workspaces and click Activate button
    Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}
    Login.Activate Agent
    Sleep   1

    # STEP 2: Click Start Work button
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02   Click Start Work button
    AgentToolbar.Agent Start Work
    Sleep   1

    # STEP 3: Click Menu Contains state and choose Ready Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03   Click Menu Contains state and choose Ready Agent to ready Agent
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 4: Click Menu Contains state and choose Not ready Agent with Default reason code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04   Click Menu Contains state and choose Not Ready Agent with Default reason code
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   1

    # STEP 5: Click Menu Contains state and choose Finish Work Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05   Click Menu Contains state and choose Finish Work Agent
    AgentToolbar.Agent Finish Work

#=======================================================================================================================

#Created date:     24/02/2020
# TEST CASE 3: Workspaces_TC-03 - Make sure can login blended Agent on Workspaces
Workspaces_TC-03 - Make sure can login blended Agent on Workspaces
    [Documentation]  Blended Agent can login, start work, go ready, not ready and finish work without error
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Blended Agent login into Workspaces and click Activate button
    # Agent Oanhho3, station: 100003
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01   Blended Agent login into Workspaces and click Activate button
    Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}
    Login.Activate Agent
    Sleep   1

    # STEP 2: Click Start Work button
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02   Click Start Work button
    AgentToolbar.Agent Start Work
    Sleep   1

    # STEP 3: Click Menu Contains state and choose Ready Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03   Click Menu Contains state and choose Ready to ready Agent
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 4: Click Menu Contains state and choose Not ready Agent with Default reason code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04   Click Menu Contains state and choose Not Ready Agent with Default reason code
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   1

    # STEP 5: Click Menu Contains state and choose Finish Work Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05   Click Menu Contains state and choose Finish Work Agent
    AgentToolbar.Agent Finish Work

#=======================================================================================================================

#Created date:     25/02/2020
# TEST CASE 4: Workspaces_TC-04 - Make sure can login Agent on Workspaces with multi browsers
Workspaces_TC-04 - Make sure can login Agent on Workspaces with multi browsers
    [Documentation]  Some Agents can login, start work, go ready, not ready and finish work without error
    [Teardown]    Run Keywords
    ...     AvayaIXworkplaceLib.End All Calls      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    Run Keyword And Ignore Error    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Agent login into Workspaces, click Activate button, start work and go ready on Agent alias 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01   Agent login into Workspaces, click Activate button, start work and go ready on Agent alias 1
    Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT2.USERNAME}    ${VO_AGENT2.PASSWORD}
    Login.Activate Agent
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready

    # STEP 2: Agent login into Workspaces and go Not ready with Default reason code on Agent alias 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02   Agent login into Workspaces and go Not ready with Default reason code on Agent alias 2
    Login.Login Agent    ${BROWSER_AGENT2}    ${BROWSER_AGENT_ALIAS_2}    ${VO_AGENT2.USERNAME}    ${VO_AGENT2.PASSWORD}
    Login.Activate Agent
    Sleep   2
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 3: Switch to Agent1's browser and Ready Agent 1 again
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to Agent1's browser and Ready Agent 1 again
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   2
    AgentToolbar.Agent Go Ready

     # STEP 4: Customer makes CDN call to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer makes CDN call to Agent
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${CDN_55086}
    Sleep   7

     # STEP 5: Switch to agent alias 1 and accept the CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent alias 1 and accept the CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE_E164}
    Sleep   2

    # STEP 6: Switch to agent alias 2, Agent Finds And Ends A Contact Session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent alias 2, Agent Finds And Ends A Contact Session
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact      ${CUST8.PHONE_E164}
    Sleep   3

    # STEP 7: Switch to agent alias 1 and choose Finish Work Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 7   Switch to agent alias 1 and choose Finish Work Agent
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Finish Work

#=======================================================================================================================

#Created date:     25/02/2020
# TEST CASE 5: Workspaces_TC-05 - Login Agent with name contains format uppercase
Workspaces_TC-05 - Login Agent with name contains format uppercase
    [Documentation]  Agent with name contains format uppercase can login, start work, go ready, not ready and finish work without error
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Click Start Work button
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01   Click Start Work button
    AgentToolbar.Agent Start Work
    Sleep   3

    # STEP 2: Click Menu Contains state and choose Ready Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02   Click Menu Contains state and choose Ready Agent
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 3: Click Menu Contains state and choose Not ready Agent with Default reason code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03   Click Menu Contains state and choose Not Ready Agent with Default reason code
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   1

#=======================================================================================================================

#Created date:     26/02/2020
# TEST CASE 6: Workspaces_TC-06 - Workspace page should display first name of Agent
Workspaces_TC-06 - Workspace page should display first name of Agent
    [Documentation]  Activate page and Start work should display first name of Agent
    [Setup]     Run Keywords
    #    Voice only Agent login into Workspace
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Verify Ativate Page Should Display First Name Of Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01   Verify Ativate Page Should Display Full Name Of Agent
    Login.Verify Ativate Page Should Display Full Name Of Agent     ${MM_AGENT1.FULLNAME}
    Login.Activate Agent
    Sleep   1

    # STEP 2: Start Work and Verify Start Work Page Should Display First Name Of Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02   Start Work Verify Start Work Page Should Display Full Name Of Agent
    AgentToolbar.Agent Start Work
    AgentToolbar.Verify Start Work Page Should Display Full Name Of Agent        ${MM_AGENT1.FIRSTNAME}
    Sleep   1

##=======================================================================================================================
#
#Created date:     19/03/2020
Workspaces_TC-07 - Error message display when try to login Agent on Workspaces with wrong password and re-login Agent with right password successfully
    [Documentation]  Workspaces_TC-07 - Error message display when try to login Agent on Workspaces with wrong password and re-login Agent with right password successfully
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

#     STEP 1: Voice only Agent login into Workspaces with wrong password
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01   Voice only Agent login into Workspaces and click Activate button
    Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}_Tma

    # STEP 2: Verify Error message display when try to login Agent on Workspaces with wrong password
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02   Verify Error message display when try to login Agent on Workspaces with wrong password
    Login.Verify Error Login
    Sleep   3

    # STEP 3: Blended Agent 1 re-login into Workspaces with right password
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent 1 login into Workspaces, start work and go ready with right password
    Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}
    Login.Activate Agent
    AgentToolbar.Agent Start Work

#=======================================================================================================================

#Created date:     16/03/2020
# TEST CASE 08: Workspaces_TC-08 Agent can select an Activity code. Make sure the code displays correctly on Workspaces
Workspaces_TC-08 - Agent can select an Activity code. Make sure the code displays correctly on Workspaces
    [Documentation]  Workspaces_TC-08 Agent can select an Activity code. Make sure the code displays correctly on Workspaces
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${MM_AGENT1.SKILLSET_WC1}
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
    WebChat.Verify Message On Customer Chat     ${MM_AGENT1.FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3: Agent set Activity code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Agent set Activity code
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Set Activity Code    ${CUST1_EMAIL}      ${ACTIVITY_CODE1}

    # STEP 4: Verify Activity code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Verify Activity code
    WorkCard.Verify Activity Code    ${CUST1_EMAIL}      ${ACTIVITY_CODE1}

    # STEP 5: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     26/02/2020
# TEST CASE 9: Workspaces_TC-09 - Check Agent ID, station ID display correctly on Workspaces
Workspaces_TC-09 - Check Agent ID, station ID display correctly on Workspaces
    [Documentation]  Check Agent ID, station ID display correctly on Workspaces
    [Setup]     Run Keywords
    #   Login blended agent to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Start Work and Verify Agent ID, station ID display correctly on Workspaces
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01   Start Work Verify Agent ID, station ID display correctly on Workspaces
    AgentToolbar.Agent Start Work
    Sleep   1
#    AgentToolbar.Verify Start Work Page Should Display Full Name Of Agent        ${AGENT1_FULLNAME}
    AgentToolbar.Verify Agent ID       ${BL_AGENT1.ID}
    AgentToolbar.Verify Station ID     ${BL_AGENT1.PHONE_NUMBER}
    Sleep   1

#=======================================================================================================================
#Created date:     27/02/2020
# TEST CASE 10: Workspaces_TC-10 - Make sure can login some Agents on Workspaces with multi browsers on Client
Workspaces_TC-10 - Make sure can login some Agents on Workspaces with multi browsers on Client
    [Documentation]  Some Agents can login, start work, go ready, not ready and finish work without error
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Voice only Agent login into Workspaces and start work (Agent 1)
    # Agent Oanhho1, station: 100001
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01   Voice only Agent login into Workspaces and start work (Agent 1)
    Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}
    Login.Activate Agent
    Sleep   1
    AgentToolbar.Agent Start Work
    Sleep   1

    # STEP 2: Click Menu Contains state and choose Ready Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02   Click Menu Contains state and choose Ready to ready Agent 1
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 3: MM only Agent login into Workspaces and Start Work (Agent 2)
    # Agent Oanhho2, station: 100002
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03   MM only Agent login into Workspaces and Start Work (Agent 2)
    Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${VO_AGENT2.USERNAME}    ${VO_AGENT2.PASSWORD}
    Login.Activate Agent
    AgentToolbar.Agent Start Work
    Sleep   1

    # STEP 4: Click Menu Contains state and choose Ready Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04   Click Menu Contains state and choose Ready to ready Agent 2
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 5: Switch to Agent1's browser and choose Not ready Agent 1 with Default reason code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to Agent1's browser and choose Not ready Agent 1 with Default reason code
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   2

    # STEP 6: Switch to Agent2's browser and choose Not ready Agent 2 with Default reason code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to Agent2's browser and choose Not ready Agent 2 with Default reason code
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   1

    # STEP 7: Switch to Agent2's browser and choose Finish Work Agent 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 7   Switch to Agent2's browser and choose Finish Work Agent 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Finish Work

    # STEP 8: Switch to Agent2's browser and choose Finish Work Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8   Switch to Agent2's browser and choose Finish Work Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Finish Work

#=======================================================================================================================
#Created date:  04/03/2020
# TEST CASE 11: Workspaces_TC-11 - Check changing Agent status to Not Ready work fine with NRR code, it should display on agent
Workspaces_TC-11 - Check changing Agent status to Not Ready work fine, it should display on agent
    [Documentation]  Workspaces_TC-11 - Check changing Agent status to Not Ready work fine with NRR code, it should display on agent
    [Setup]     Run Keywords
    #   Login blended agent to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

  # STEP 1: Blended Agent go ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Blended Agent go ready
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 2: Change Agent status to Not Ready work fine with NRR code, verify it should display on agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Change Agent status to Not Ready work fine with NRR code, verify it should display on agent
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE2}
    Sleep   3
    AgentToolbar.Verify Not Ready     ${RRD_CODE2}

#=======================================================================================================================
#Created date:  04/03/2020
# TEST CASE 12: Workspaces_TC-12 - Check changing Agent status to Not Ready with NRR code when on a contact work fine
Workspaces_TC-12 - Check changing Agent status to Not Ready when on a contact work fine
    [Documentation]  Workspaces_TC-12 - Check changing Agent status to Not Ready when on a contact work fine
    [Setup]     Run Keywords
    #   Login blended agent to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}     ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

  # STEP 1: Blended Agent go ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Blended Agent go ready
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 2: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${MM_AGENT1.SKILLSET_WC1}

    # STEP 3: Switch to agent's browser and Agent accepts WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1

    # STEP 4: Change Agent status to Not Ready work fine with NRR code, verify Pending NRD should display on agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Change Agent status to Not Ready work fine with NRR code, verify Pending NRD should display on agent
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE2}
    Sleep   3
    # Verify Pending NRD Should Display Correctly while Agent is prossessing contact
    AgentToolbar.Verify Pending NRD
    Sleep   2

    # STEP 5: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 6: Verify Not ready Code Should Display Correctly after Agent released contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Not ready Code Should Display Correctly after Agent released contact
    AgentToolbar.Verify Not Ready      ${RRD_CODE2}
    Sleep   2

#=======================================================================================================================

#Created date:  04/03/2020
# TEST CASE 13: Workspaces_TC-13 - NRD code displays correctly after changing to another NRD code
Workspaces_TC-13 - NRD code displays correctly after changing to another NRD code
    [Documentation]  Workspaces_TC-13 - NRD code displays correctly after changing to another NRD code
    [Setup]     Run Keywords
    #   Login blended agent to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

  # STEP 1: Blended Agent go ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Blended Agent go ready
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 2: Change Agent status to Not Ready work fine with NRR code, verify it should display on agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Change Agent status to Not Ready work fine with NRR code, verify it should display on agent
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE2}
    Sleep   3
    AgentToolbar.Verify Not Ready     ${RRD_CODE2}
    Sleep   2

    # STEP 3: Verify Not ready Code display correctly after changing to another NRD code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Not ready Code display correctly after changing to another NRD code
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE3}
    Sleep   3
    AgentToolbar.Verify Not Ready    ${RRD_CODE3}
    Sleep   2

#=======================================================================================================================

#Created date:     09/03/2020
# TEST CASE 14: Workspaces_TC-14 - Agent can make DN call out to customer on Workspaces
Workspaces_TC-14 - Agent can make DN call out to customer on Workspaces
    [Documentation]  Workspaces_TC-14 - Agent can make DN call out to customer on Workspaces
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT2.USERNAME}    ${VO_AGENT2.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     AvayaIXworkplaceLib.End All Calls      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers
    # STEP 1: Agent makes DN call out to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent makes DN call out to Customer
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AgentToolbar.Agent Calls Out         ${CUST8.PHONE}
    Sleep   2

    # STEP 2: Customer acctepts call from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02     Customer acctepts call from Agent
    AvayaIXworkplaceLib.Accept Call    ${VO_AGENT2.PHONE_NUMBER}
    Sleep   3

    # STEP 3: Agent releases call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Agent releases call
    WorkCard.Agent Ends A Contact     ${CUST8.PHONE}
    Sleep   2


#=======================================================================================================================

#Created date:     09/03/2020
# TEST CASE 15: Workspaces_TC-15 - Agent can re-call to Customer on Workspaces
Workspaces_TC-15 - Agent can re-call to Customer on Workspaces
    [Documentation]  Workspaces_TC-15 - Agent can re-call to Customer on Workspaces
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT2.USERNAME}    ${VO_AGENT2.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     AvayaIXworkplaceLib.End All Calls      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Agent makes DN call out to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent makes DN call out to Customer
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AgentToolbar.Agent Calls Out         ${CUST8.PHONE}
    Sleep   2

    # STEP 2: Customer acctepts call from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02     Customer acctepts call from Agent
    AvayaIXworkplaceLib.Accept Call    ${VO_AGENT2.PHONE_NUMBER}
    Sleep   3

    # STEP 3: Agent releases call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Agent releases call
    WorkCard.Agent Ends A Contact     ${CUST8.PHONE}
    Sleep   2

    # STEP 4: Agent redials call to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Agent redials call to Customer
    AgentToolbar.Agent Redial
    Sleep   2

    # STEP 5: Customer acctepts call from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Customer acctepts call from Agent
    AvayaIXworkplaceLib.Accept Call    ${VO_AGENT2.PHONE_NUMBER}
    Sleep   3

    # STEP 6: Customer releases call from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06     Customer releases call from Agent
    AvayaIXworkplaceLib.Release First Call
    Sleep   3

##=======================================================================================================================

#Created date:     10/03/2020
# TEST CASE 16: Workspaces_TC-16 - Check the Interaction log tab work fine by click to call
Workspaces_TC-16 - Check the Interaction log tab work fine by click to call
    [Documentation]  Workspaces_TC-16 - Check the Interaction log tab work fine by click to call
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT2.USERNAME}    ${VO_AGENT2.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     AvayaIXworkplaceLib.End All Calls      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Customer makes DN call to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${VO_AGENT2.PHONE_NUMBER}
    Sleep    1


    # STEP 2: Switch to agent's browser and Agent accepts DN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST8.PHONE}
    Sleep   7

    # STEP 3: Agent Finds And Ends A Contact Session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent Finds And Ends A Contact Session
    WorkCard.Agent Ends A Contact     ${CUST8.PHONE}
    Sleep   2

    # STEP 4: Agent call out to Customer by Interaction Log
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent call out to Customer by Interaction Log
    InteractionLog.Interaction Log Call    ${CUST8.PHONE}
    Sleep   7

    # STEP 5: Customer acctepts call from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Customer acctepts call from Agent
    AvayaIXworkplaceLib.Accept Call     ${VO_AGENT2.PHONE_NUMBER}
    Sleep   3

    # STEP 6: Agent releases call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06     Agent releases call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.End Interaction Log Call   ${CUST8.PHONE}

#=======================================================================================================================
#Created date:  05/03/2020
# TEST CASE 17: Workspaces_TC-17 - Check the Changing agent status to Ready work fine
Workspaces_TC-17 - Check the Changing agent status to Ready work fine
    [Documentation]  Workspaces_TC-17 - Check the Changing agent status to Ready work fine
    [Setup]     Run Keywords
    #   Login blended agent to workspaces
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

    # STEP 1: Change Agent status to Not Ready work fine with NRR code, verify it should display on agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Change Agent status to Not Ready work fine with NRR code, verify it should display on agent
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE2}
    Sleep   3
    Verify Not Ready    ${RRD_CODE2}
    Sleep   2

    # STEP 2: Change Agent status to Ready again, verify Ready status should display on agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Change Agent status to Ready again, verify Ready status should display on agent
    AgentToolbar.Agent Go Ready
    Sleep   1
    AgentToolbar.Verify Ready
    Sleep   2

#=======================================================================================================================
#Created date:     20/03/2020
# TEST CASE 18: Workspaces_TC-18 - Check Agent can make call CDN out while having CDN call
Workspaces_TC-18 - Check Agent can make call CDN out while having CDN call
    [Documentation]  Workspaces_TC-18 - Check Agent can make call CDN out while having CDN call
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT2.USERNAME}    ${BL_AGENT2.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords

    ...     AvayaIXworkplaceLib.End All Calls      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Customer makes CDN call to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${CDN_55086}
    Sleep    1

    # STEP 2: Switch to agent's browser and Agent accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST8.PHONE_E164}
    Sleep   3

    # STEP 3: Agent 1 makes call CDN out to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 makes call CDN out to Agent 2
    AgentToolbar.Agent Calls Out         ${CDN_55086}
    Sleep   2

    # STEP 4: Switch to agent2's browser and Agent accepts CDN call from Agent 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent2's browser and Agent accepts CDN call from Agent 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1
    WorkCard.Agent Accepts A Contact     ${BL_AGENT1.PHONE_NUMBER}
    Sleep   3

    # STEP 5: Agent 1 unhold And Ends CDN call from Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent unhold And Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Unhold A Contact    ${CUST8.PHONE_E164}
    Sleep   2
    WorkCard.Agent Ends A Contact     ${CUST8.PHONE_E164}
    Sleep   2

    # STEP 6: Agent 1 unhold And Ends CDN call to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 1 unhold And Ends CDN cal to Agent 2
    WorkCard.Agent Unhold A Contact    ${CDN_55086}
    Sleep   1
    WorkCard.Agent Ends A Contact     ${CDN_55086}
    Sleep   2


#=======================================================================================================================
#Created date:     17/03/2020
# TEST CASE 19: Workspaces_TC-19 - Check Customer details display correctly when Agent accepts MM contact
Workspaces_TC-19 - Check Customer details display correctly when Agent accepts MM contact
    [Documentation]  Workspaces_TC-19 - Check Customer details display correctly when Agent accepts MM contact
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT2.USERNAME}    ${MM_AGENT2.PASSWORD}     AND
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
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${MM_AGENT2.SKILLSET_WC1}

    # STEP 2: Switch to agent's browser and Agent accepts WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   2
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   1

    # STEP 3: Verify Customer Details display information correctly for MM contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Customer Details display information correctly for MM contact
    NavigationMenu.Open Customer Details
    CustomerDetails.Verify Customer Details     ${CUST1_EMAIL}
    Sleep   2

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   1

    # STEP 5: Open Outlook, from customer sent to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Open Outlook, from customer sent to Server the Email without attachment
    outlookLib.Customer Sent An Email      ${MM_AGENT2.MAIL1}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST1_EMAIL}
    Sleep   10


    # STEP 6: Blended Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Blended Agent accepts Email
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 7: Verify Customer Details display information correctly for MM contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Customer Details display information correctly for MM contact
    NavigationMenu.Open Customer Details
    CustomerDetails.Verify Customer Details     ${CUST8_EMAIL}
    Sleep   2

    # STEP 8: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends webchat session
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   1

#=======================================================================================================================
#Created date:     17/03/2020
# TEST CASE 20: Workspaces_TC-20 - Check Customer Details does not display information for voice contact
Workspaces_TC-20 - Check Customer Details does not display information for voice contact
    [Documentation]  Workspaces_TC-20 - Check Customer Details does not display information for voice contact
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT2.USERNAME}    ${VO_AGENT2.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     AvayaIXworkplaceLib.End All Calls      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Customer makes CDN call to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number      ${CDN_55086}
    Sleep   7

    # STEP 2: Agent accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE_E164}
    Sleep   2

    # STEP 3: Verify Customer Details does not display information for voice contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Customer Details does not display information for voice contact
    NavigationMenu.Open Customer Details
    CustomerDetails.Verify Have No Customer Details     ${CUST8.PHONE_E164}
    Sleep   2

    # STEP 4: Agent Finds And Ends A Contact Session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent Finds And Ends A Contact Session
    WorkCard.Agent Ends A Contact     ${CUST8.PHONE_E164}
    Sleep   2

