*** Settings ***
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
    # Agent Oanhho1, station: 100001
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
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
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
# TEST CASE 07: Workspaces_TC-07 - Error message display when try to login Agent on Workspaces with wrong password and re-login Agent with right password successfully
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
Workspaces_TC-08 Agent can select an Activity code. Make sure the code displays correctly on Workspaces
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
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${MM_AGENT1.SKILLSET_WC}

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
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT2.USERNAME}    ${VO_AGENT2.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...    AvayaIX.AvayaIX Log Out     AND
#    ...    AvayaIX.Close AvayaIX    AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers
    # STEP 1: Agent makes DN call out to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent makes DN call out to Customer
    AgentToolbar.Agent Calls Out         ${CUST1_PHONE}
    Sleep   2

    # STEP 2: Customer acctepts call from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02     Customer acctepts call from Agent
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 3: Agent releases call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Agent releases call
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

#=======================================================================================================================

#Created date:     09/03/2020
# TEST CASE 15: Workspaces_TC-15 - Agent can re-call to Customer on Workspaces
Workspaces_TC-15 - Agent can re-call to Customer on Workspaces
    [Documentation]  Workspaces_TC-15 - Agent can re-call to Customer on Workspaces
    [Setup]     Run Keywords
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT2.USERNAME}    ${VO_AGENT2.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...    AvayaIX.AvayaIX Log Out     AND
#    ...    AvayaIX.Close AvayaIX    AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Agent makes DN call out to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent makes DN call out to Customer
    AgentToolbar.Agent Calls Out         ${CUST1_PHONE}

    # STEP 2: Customer acctepts call from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02     Customer acctepts call from Agent
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 3: Agent releases call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Agent releases call
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 4: Agent redials call to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Agent redials call to Customer
    AgentToolbar.Agent Redial
    Sleep   2

    # STEP 5: Customer acctepts call from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Customer acctepts call from Agent
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 6: Customer releases call from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06     Customer releases call from Agent
    OneXCommunicator.OneX Release Call
    Sleep   3

##=======================================================================================================================

#Created date:     10/03/2020
# TEST CASE 16: Workspaces_TC-16 - Check the Interaction log tab work fine by click to call
Workspaces_TC-16 - Check the Interaction log tab work fine by click to call
    [Documentation]  Workspaces_TC-16 - Check the Interaction log tab work fine by click to call
    [Setup]     Run Keywords
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT2.USERNAME}    ${VO_AGENT2.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...    AvayaIX.AvayaIX Log Out     AND
#    ...    AvayaIX.Close AvayaIX    AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Customer makes DN call to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent
    OneXCommunicator.OneX Call Out       ${AGENT2_PHONE_NUMBER}     #${CDN1}
    Sleep   3

    # STEP 2: Switch to agent's browser and Agent accepts DN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   7

    # STEP 3: Agent Finds And Ends A Contact Session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent Finds And Ends A Contact Session
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 4: Agent call out to Customer by Interaction Log
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent call out to Customer by Interaction Log
    InteractionLog.Interaction Log Call    ${CUST1_URI}
    Sleep   7

    # STEP 5: Customer acctepts call from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Customer acctepts call from Agent
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 6: Agent releases call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06     Agent releases call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.End Interaction Log Call   ${CUST1_URI}

#=======================================================================================================================

#Created date:  05/03/2020
# TEST CASE 17: Workspaces_TC-17 - Check the Changing agent status to Ready work fine
Workspaces_TC-17 - Check the Changing agent status to Ready work fine
    [Documentation]  Workspaces_TC-17 - Check the Changing agent status to Ready work fine
    [Setup]     Run Keywords
    #   Login blended agent to workspaces
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
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${VO_AGENT2.USERNAME}    ${VO_AGENT2.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...    AvayaIX.AvayaIX Log Out     AND
#    ...    AvayaIX.Close AvayaIX    AND
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

    # STEP 1: Customer makes CDN call to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   1

    # STEP 2: Switch to agent's browser and Agent accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3: Agent 1 makes call CDN out to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 makes call CDN out to Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Calls Out         ${CDN1}
    Sleep   2

    # STEP 4: Switch to agent2's browser and Agent accepts CDN call from Agent 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent2's browser and Agent accepts CDN call from Agent 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1
    WorkCard.Agent Accepts A Contact     ${AGENT1_VOICE_URI}
    Sleep   3

    # STEP 5: Agent 1 unhold And Ends CDN call from Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent unhold And Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Unhold A Contact    ${CUST1_URI_CDN}
    Sleep   2
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 6: Agent 1 unhold And Ends CDN call to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent unhold And Ends CDN cal to Agent 2
    WorkCard.Agent Unhold A Contact    ${CDN1}
    Sleep   1
    WorkCard.Agent Ends A Contact     ${CDN1}
    Sleep   2

#=======================================================================================================================

#Created date:     17/03/2020
# TEST CASE 19: Workspaces_TC-19 - Check Customer details display correctly when Agent accepts MM contact
Workspaces_TC-19 - Check Customer details display correctly when Agent accepts MM contact
    [Documentation]  Workspaces_TC-19 - Check Customer details display correctly when Agent accepts MM contact
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
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

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT5_SKILLSET_WC}

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
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   10
    Outlook.Close Outlook

    # STEP 6: Blended Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Blended Agent accepts Email
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 7: Verify Customer Details display information correctly for MM contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Customer Details display information correctly for MM contact
    NavigationMenu.Open Customer Details
    CustomerDetails.Verify Customer Details     ${CUST1_EMAIL}
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
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT2.USERNAME}    ${VO_AGENT2.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...    AvayaIX.AvayaIX Log Out     AND
#    ...    AvayaIX.Close AvayaIX    AND
    ...    OneXCommunicator.Close OneX      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Customer makes CDN call to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   7

    # STEP 2: Agent accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 3: Verify Customer Details does not display information for voice contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Customer Details does not display information for voice contact
    NavigationMenu.Open Customer Details
    CustomerDetails.Verify Have No Customer Details     ${CUST1_URI_CDN}
    Sleep   2

    # STEP 4: Agent Finds And Ends A Contact Session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent Finds And Ends A Contact Session
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     06/03/2020
# TEST CASE 21: Workspaces_TC-21 - Check the Closing voice or MM contacts work fine
Workspaces_TC-21 - Check the Closing voice or MM contacts work fine
    [Documentation]  Workspaces_TC-21 - Check the Closing voice or MM contacts work fine
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
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...    AvayaIX.AvayaIX Log Out     AND
#    ...    AvayaIX.Close AvayaIX    AND
    ...    OneXCommunicator.Close OneX      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Open Outlook, from customer sent to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Sleep   2
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   10
    Outlook.Close Outlook

    # STEP 2: Blended Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Blended Agent accepts Email
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   10
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent releases Email contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent releases Email contact
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}
    #WorkCard.Agent Finds And Completes A Contact Session    ${CUST1_EMAIL}

    # STEP 4: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}

    # STEP 5: Switch to agent's browser and Agent accepts WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent's browser and Agent accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   2
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   1

    # STEP 6: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

    # STEP 7: Customer makes CDN call to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Customer makes CDN call to Agent
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   7

    # STEP 8: Agent accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent accepts CDN call
    WorkCard.Agent Accepts A Contact    ${CUST1_URI_CDN}
    Sleep   5

    # STEP 9: Agent Finds And Ends A Contact Session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent Finds And Ends A Contact Session
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}

#=======================================================================================================================

#Created date:     20/03/2020
#TEST CASE 22: Workspaces_TC-22 - Make sure Agent on Workspaces is not changed state to NRD after reload browser
Workspaces_TC-22 - Make sure Agent on Workspaces is not changed state to NRD after reload browser
    [Documentation]  Workspaces_TC-22 - Make sure Agent on Workspaces is not changed state to NRD after reload browser
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Blended Agent go ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Blended Agent go ready
    AgentToolbar.Agent Go Ready
    Sleep   2

    # STEP 2: Reload page
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02     Reload page
    Reload Page
    Sleep   2
    Handle Alert    accept
    Sleep   5

    # STEP 3: Verify Agent still ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Verify Agent still ready
    AgentToolbar.Verify Ready
#    AgentToolbar.Verify Not Ready    ${EMPTY}
    Sleep   1

    # STEP 4: Blended Agent go not ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Blended Agent go not ready
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   1

    # STEP 5: Reload page again
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Reload page again
    Reload Page
    Sleep   2
    Handle Alert    accept
    Sleep   5

    # STEP 6: Verify Agent still not ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06     Verify Agent still not ready
    AgentToolbar.Verify Not Ready     ${RRD_CODE1}
    Sleep   1

#=======================================================================================================================

#Created date:     20/03/2020
#TEST CASE 23: Workspaces_TC-23 - Make sure Agent on Workspaces can control voice contact after reload browser
Workspaces_TC-23 - Make sure Agent on Workspaces can control voice contact after reload browser
    [Documentation]  Workspaces_TC-23 - Make sure Agent on Workspaces can control voice contact after reload browser
    [Setup]     Run Keywords
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login Agent
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT2.USERNAME}    ${VO_AGENT2.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Close AvayaIX    AND
    ...     OneXCommunicator.Close OneX      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Customer makes CDN call to Agent 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   3

    # STEP 2: Agent 1 accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts CDN call
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3: Reload page
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Reload page
    Reload Page
    Sleep   2
    Handle Alert    accept
    Sleep   5

    # STEP 4: Verify Agent still work normally with call workcard
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Verify Agent still work normally with call workcard
    WorkCard.Verify Working Contact   ${CUST1_URI_CDN}
    Sleep   1

    # STEP 5: Agent 1 ends call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 1 ends call
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   1

#=======================================================================================================================

#Created date:     20/03/2020
#TEST CASE 24: Workspaces_TC-24 - Make sure Agent on Workspaces can chat with Customer after reload browser
Workspaces_TC-24 - Make sure Agent on Workspaces can chat with Customer after reload browser
    [Documentation]  Workspaces_TC-24 - Make sure Agent on Workspaces can chat with Customer after reload browser
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT5_SKILLSET_WC}
    Sleep   20

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

    # STEP 3: Reload page of Workspaces
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Reload page of Workspaces
    Reload Page
    Sleep   2
    Handle Alert    accept
    Sleep   25

    # STEP 4: Customer send chat to Agent and verify this message display on Agent chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 5: Agent send chat to Customer and verify this message display on Customer chat
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05     Agent send chat to Customer and verify this message display on Customer chat
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   OK. Let me see...
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT4_FIRSTNAME}     OK. Let me see...

    # STEP 6: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

# Created date:     18/03/2020
# TEST CASE 25: Workspaces_TC-25 - Time in the state of the agent is reset after the agent changes status
Workspaces_TC-25 - Time in the state of the agent is reset after the agent changes status
    [Documentation]  Workspaces_TC-25 - Time in the state of the agent is reset after the agent changes status
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
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

    # STEP 2: Set Not ready Agent with Default reason code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01   Set Not Ready Agent with Default reason code
    Sleep   10
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 3: Verify Time in the state of the agent is reset after the agent changes status
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02   Verify Time in the state of the agent is reset after the agent changes status
    AgentToolbar.Verify Reset Timer
    Sleep   10

    # STEP 4: Go Ready Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03   Go Ready Agent
    AgentToolbar.Agent Go Ready

    # STEP 5: Verify Time in the state of the agent is reset after the agent changes status
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04   Verify Time in the state of the agent is reset after the agent changes status
    AgentToolbar.Verify Reset Timer
    Sleep   1

#=======================================================================================================================
#Created date:  05/03/2020
# TEST CASE 26: Workspaces_TC-26 - Check that ACW code is displayed on agent as pending while agent is working on contact
Workspaces_TC-26 - Check that ACW code is displayed on agent as pending while agent is working on contact
    [Documentation]  Workspaces_TC-26 - Check that ACW code is displayed on agent as pending while agent is working on contact
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
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
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT5_SKILLSET_WC}

    # STEP 2: Switch to agent's browser and Agent accepts WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1

    # STEP 3: Change Agent status to ACW code, verify Pending ACW should display on agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Change Agent status to ACW code, verify Pending ACW should display on agent
    AgentToolbar.Agent Go ACW     ${ACW_CODE2}
    Sleep   3
    # Verify Pending NRD Should Display Correctly while Agent is prossessing contact
    AgentToolbar.Verify Pending ACW
    Sleep   2

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:  05/03/2020
# TEST CASE 27: Workspaces_TC-27 - Check that ACW code is displayed on agent after agent release contact
Workspaces_TC-27 - Check that ACW code is displayed on agent after agent release contact
    [Documentation]  Workspaces_TC-27 - Check that ACW code is displayed on agent after agent release contact
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
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
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT5_SKILLSET_WC}

    # STEP 2: Switch to agent's browser and Agent accepts WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1

    # STEP 3: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends webchat session
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 4: Change Agent status to ACW code, verify it should display on agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Change Agent status to ACW code, verify it should display on agent
    AgentToolbar.Agent Go ACW     ${ACW_CODE2}
    Sleep   5
    # Verify ACW code Should Display Correctly after Agent released contact
    AgentToolbar.Verify ACW     ${ACW_CODE2}
    Sleep   2

#=======================================================================================================================

#Created date:  06/03/2020
# TEST CASE 28: Workspaces_TC-28 - Check that ACW code displays correctly after changing to another ACW code
Workspaces_TC-28 - Check that ACW code displays correctly after changing to another ACW code
    [Documentation]  Workspaces_TC-28 - Check that ACW code displays correctly after changing to another ACW code
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
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
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT5_SKILLSET_WC}

    # STEP 2: Switch to agent's browser and Agent accepts WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1

    # STEP 3: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends webchat session
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 4: Change Agent status to ACW code, verify it should display on agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Change Agent status to ACW code, verify it should display on agent
    AgentToolbar.Agent Go ACW     ${ACW_CODE2}
    Sleep   3
    # Verify ACW code Should Display Correctly after Agent released contact
    AgentToolbar.Verify ACW     ${ACW_CODE2}
    Sleep   2

    # STEP 5: Change Agent status to another ACW code, verify it should display on agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Change Agent status to another ACW code, verify it should display on agent
    AgentToolbar.Agent Go ACW     ${ACW_CODE1}
    Sleep   3
    # Verify ACW code Should Display Correctly after Agent released contact
    AgentToolbar.Verify ACW     ${ACW_CODE1}
    Sleep   2

#=======================================================================================================================

#Created date:     03/03/2020
# TEST CASE 29: Workspaces_TC-29 - Search data of Team field work fine on workspace
Workspaces_TC-29 - Search data of Team field work fine on workspace
    [Documentation]  Workspaces_TC-29 - Search data of Team field work fine on workspace
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
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

    # STEP 1: Agent search another Agent in his Team
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01   Agent search another Agent in his Team
    WidgetWelcomePage.Search Agent Team     ${AGENT5_FULLNAME}      ${AGENT5_ID}

#=======================================================================================================================

#Created date:     13/03/2020
#TEST CASE 30: Workspaces_TC-30 - Select agent check address and click to call
Workspaces_TC-30 - Select agent check address and click to call
    [Documentation]  Workspaces_TC-30 - Select agent check address and click to call
    [Setup]     Run Keywords
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${VO_AGENT2.USERNAME}    ${VO_AGENT2.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Close AvayaIX    AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Agent 1 open phonebook then make call out to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Agent 1 open phonebook then make call out to Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    AgentToolbar.Address Book Call Out     ${AGENT2_PHONE_NUMBER}

    # STEP 2: Agent 2 accepts call from Agent 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 2 accepts call from Agent 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${AGENT1_VOICE_URI}
    Sleep   3

    # STEP 3: Agent 2 ends call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 ends call
    WorkCard.Agent Ends A Contact     ${AGENT1_VOICE_URI}

#=======================================================================================================================

#Created date:     16/03/2020
# TEST CASE 31: Workspaces_TC-31 - Check the Screenpop display after Agent accepted contact
Workspaces_TC-31 - Check the Screenpop display after Agent accepted contact
    [Documentation]  Workspaces_TC-31 - Check the Screenpop display after Agent accepted contact
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
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
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT5_SKILLSET_WC}

    # STEP 2: Switch to agent's browser and Agent accepts WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1

    # STEP 3: Open Settings, verify Screenpop Name Displays after Agent accepted contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Open Settings, verify Screenpop Name Displays after Agent accepted contact
    NavigationMenu.Open Screenpop
    Sleep   2
    Screenpop.Verify Screenpop Name Displays     ${SCREENPOP_NAME2}
    Sleep   3
    NavigationMenu.Open Chat
    Sleep   1

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     02/03/2020
# TEST CASE 32: Workspaces_TC-32 - Agent can accepts Web chat and chat to Customer wihout error
Workspaces_TC-32 - Agent can accepts Web chat and chat to Customer wihout error
    [Documentation]  Workspaces_TC-32 - Agent can accepts Web chat and chat to Customer wihout error
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...    AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT5_SKILLSET_WC}

    # STEP 2: Switch to agent's browser and Agent accepts WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1

    # STEP 3: Agent sends Message to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   1

    # STEP 4: Switch to Customer's browser and Customer sends Message to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to Customer's browser and Customer sends Message to Agent
    Switch Browser  ${BROWSER_CUST_ALIAS_1}
    Webchat.Customer Sends Message To Agent     Customer sends message to agent
    Sleep   1

    # STEP 5: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     03/03/2020
# TEST CASE 33: Workspaces_TC-33 - Make sure Agent can transfer WC to service to another Agent
Workspaces_TC-33 - Make sure Agent can transfer WC to service to another Agent
    [Documentation]  Workspaces_TC-33 - Make sure Agent can transfer WC to service to another Agent
    [Setup]     Run Keywords
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work          AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT5_SKILLSET_WC}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   1

    # STEP 3: Switch to Customer's browser and Customer sends Message to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to Customer's browser and Customer sends Message to Agent
    Switch Browser  ${BROWSER_CUST_ALIAS_1}
    Webchat.Customer Sends Message To Agent     Customer sends message to agent
    Sleep   1

    # STEP 4: Blended Agent 2 login into Workspaces, start work and go ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent 2 login into Workspaces, start work and go ready
    Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}
    Login.Activate Agent
    Sleep   1
    AgentToolbar.Agent Start Work
    Sleep   1
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 5: Switch to agent1's browser and Agent 1 transfer WC to  service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT3_SKILLSET_WC}
    Sleep   5

    # STEP 6: Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent2's browser, Agent accepts transfered WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent 2
    Sleep   1

    # STEP 7: Switch to Customer's browser and Customer sends Message to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Switch to Customer's browser and Customer sends Message to Agent
    Switch Browser  ${BROWSER_CUST_ALIAS_1}
    Webchat.Customer Sends Message To Agent     Customer sends message to agent
    Sleep   1

    # STEP 8: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

# Created date:     18/03/2020
# TEST CASE 34: Workspaces_TC-34 - Check the contact intrinsics details display data correctly for voice contact
Workspaces_TC-34 - Check the contact intrinsics details display data correctly for voice contact
    [Documentation]  Workspaces_TC-34 - Check the contact intrinsics details display data correctly for voice contact
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
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT2.USERNAME}    ${VO_AGENT2.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     Sleep   1
#    ...     AvayaIX.Close AvayaIX    AND
#    ...     Sleep   1
    ...     OneXCommunicator.Close OneX      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Customer makes CDN call to Agent 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   3

    # STEP 2: Agent 1 accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts CDN call
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3: Verify Intrinsics details display data correctly for voice contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Verify Intrinsics details display data correctly for voice contact
    CustomerDetails.Verify Intrinsics        ${CUST1_URI_CDN}     ${CDN1_URI}   ${CDN1}   ${AGENT2_PHONE_NUMBER}    ${CUST1_PHONE}   ${AGENT2_SKILLSET_VOICE1}
    # [Arguments]    ${contact_info}      ${cdn_uri}      ${cdn}      ${station_id}    ${cust_dn}   ${skillset}

    # STEP 4: Agent 1 ends call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 1 ends call
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   1

#=======================================================================================================================

#Created date:     10/03/2020
# TEST CASE 35: Workspaces_TC-35 - Check the Calling your supervisor work fine
Workspaces_TC-35 - Check the Calling your supervisor work fine
    [Documentation]  Workspaces_TC-35 - Check the Calling your supervisor work fine
    [Setup]     Run Keywords
    #   Setting Agent 2 phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${SUP_USERNAME}    ${SUP_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1       AND
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Close AvayaIX    AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Agent 2 makes Supervisor call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 2 makes Supervisor call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Calls Supervisor
    Sleep   2
#
    # STEP 2: Switch to Sup/Agent1's browser and Sup/Agent 1 accepts call from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to Agent1's browser and Agent 1 accepts call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${AGENT1_VOICE_URI}
    Sleep   7

    # STEP 3: Switch to Agent2's browser and release call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to Agent2's browser and release call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${SUP_VOICE_URI}
    Sleep   1

#=======================================================================================================================

#Created date:     27/02/2020
# TEST CASE 36: Workspaces_TC-36 - Blended Agent can accept, hold or un-hold then realease a DN call on Workspaces
Workspaces_TC-36 - Blended Agent can accept, hold or un-hold then realease a DN call on Workspaces
    [Documentation]  Blended Agent can accept, hold or un-hold then realease a DN call on Workspaces
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
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Close AvayaIX    AND
    ...     OneXCommunicator.Close OneX      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Customer makes DN call to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent
    OneXCommunicator.OneX Call Out      ${AGENT1_PHONE_NUMBER}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts DN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 3: Agent holds DN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent holds DN call
    WorkCard.Agent Hold A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 4: Agent unholds DN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent unholds DN call
    WorkCard.Agent Unhold A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 5: Agent Finds And Ends A Contact Session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent Finds And Ends A Contact Session
    WorkCard.Agent Ends A Contact     ${CUST1_URI}

#=======================================================================================================================
#
#Created date:     27/02/2020
# TEST CASE 37: Workspaces_TC-37 - Blended Agent can accept, hold or un-hold then realease a CDN call on Workspaces
Workspaces_TC-37 - Blended Agent can accept, hold or un-hold then realease a CDN call on Workspaces
    [Documentation]  Blended Agent can accept, hold or un-hold then realease a DN call on Workspaces
    [Setup]     Run Keywords
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Close AvayaIX    AND
    ...     OneXCommunicator.Close OneX      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Customer makes CDN call to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 3: Agent holds CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent holds CDN call
    WorkCard.Agent Hold A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 4: Agent unholds CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent unholds CDN call
    WorkCard.Agent Unhold A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 5: Agent Finds And Ends A Contact Session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent Finds And Ends A Contact Session
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}

#=======================================================================================================================

#Created date:     10/03/2020
# TEST CASE 38: Workspaces_TC-38 - Agent can supervised transfer a DN call on Workspaces
Workspaces_TC-38 - Agent can supervised transfer a DN call on Workspaces
    [Documentation]  Workspaces_TC-38 - Agent can supervised transfer a DN call on Workspaces
    [Setup]     Run Keywords
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Close AvayaIX    AND
    ...     OneXCommunicator.Close OneX      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Customer makes DN call to Agent 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes DN call to Agent 1
    OneXCommunicator.OneX Call Out      ${AGENT1_PHONE_NUMBER}     #${CDN1}
    Sleep   3

    # STEP 2: Agent 1 accepts DN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3: Agent 1 make supervisor transfer a DN call to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 make supervisor transfer a DN call to Agent 2
    WorkCard.Transfer Team Call      ${CUST1_URI}      ${AGENT3_FULLNAME}
    Sleep   1

    # STEP 4: Agent 2 accepts transfered call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts transfered call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${AGENT1_VOICE_URI}
    Sleep   3

    # STEP 5: Agent 1 completes transfer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 1 completes transfer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Transfer Contact     ${AGENT3_VOICE_URI}
    Sleep   3

    # STEP 6: Agent 2 ends transfered call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 ends transfered call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}

#=======================================================================================================================

#Created date:     11/03/2020
# TEST CASE 39: Workspaces_TC-39 - Agent can supervised transfer a CDN call on Workspaces
Workspaces_TC-39 - Agent can supervised transfer a CDN call on Workspaces
    [Documentation]  Workspaces_TC-39 - Agent can supervised transfer a CDN call on Workspaces
    [Setup]     Run Keywords
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Close AvayaIX    AND
    ...     OneXCommunicator.Close OneX      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Customer makes CDN call to Agent 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   3

    # STEP 2: Agent 1 accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3: Agent 1 make transfer a CDN call to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 make transfer a CDN call to Agent 2
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   1

    # STEP 4: Agent 2 goes ready and accepts transfered CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 goes ready accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT1_VOICE_URI}
    Sleep   3

    # STEP 5: Agent 1 completes transfer CDN
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 1 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Transfer Contact     ${CDN1}
    Sleep   3

    # STEP 6: Agent 2 ends transfered call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 2 ends transfered call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}

#=======================================================================================================================

#Created date:     11/03/2020
# TEST CASE 40: Workspaces_TC-40 - Agent can make a supervised DN conference call on Workspaces
Workspaces_TC-40 - Agent can make a supervised DN conference call on Workspaces
    [Documentation]  Workspaces_TC-40 - Agent can make a supervised DN conference call on Workspaces
    [Setup]     Run Keywords
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Close AvayaIX    AND
    ...     OneXCommunicator.Close OneX      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Customer makes DN call to Agent 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes DN call to Agent 1
    OneXCommunicator.OneX Call Out     ${AGENT1_PHONE_NUMBER}
    Sleep   3

    # STEP 2: Agent 1 accepts DN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3: Agent 1 make consult a DN call to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 make consult a DN call to Agent 2
    WorkCard.Consult Extension Call      ${CUST1_URI}      ${AGENT3_PHONE_NUMBER}   #${AGENT5_VOICE_URI}
    Sleep   1

    # STEP 4: Agent 2 goes ready accepts consult DN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts consult DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT1_VOICE_URI}
    Sleep   3

    # STEP 5: Agent 1 completes conference DN
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 1 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Consult Contact     ${AGENT3_VOICE_URI}
    Sleep   3

    # STEP 6: Agent 1 ends confernce call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 1 ends conference call
    WorkCard.Agent Ends A Contact     ${CUST1_URI}

    # STEP 7: Agent 2 ends conference call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 ends conference call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}

#=======================================================================================================================
##
#Created date:     11/03/2020
# TEST CASE 41: Workspaces_TC-41 - Agent can make a supervised CDN conference call on Workspaces
Workspaces_TC-41 - Agent can make a supervised CDN conference call on Workspaces
    [Documentation]  Workspaces_TC-41 - Agent can make a supervised CDN conference call on Workspaces
    [Setup]     Run Keywords
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Close AvayaIX    AND
    ...     OneXCommunicator.Close OneX      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Customer makes CDN call to Agent 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2: Agent 1 accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3: Agent 1 make consult a CDN call to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 make consult a CDN call to Agent 2
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   1

    # STEP 4: Agent 2 goes ready accepts consult CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 goes ready accepts consult CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${AGENT1_VOICE_URI}
    Sleep   3

    # STEP 5: Agent 1 completes conference CDN
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 1 completes conference CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Consult Contact     ${CDN1}
    Sleep   3

    # STEP 6: Agent 1 ends confernce call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 1 ends conference call
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}

    # STEP 7: Agent 2 ends conference call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 ends conference call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}

#=======================================================================================================================

#Created date:     12/03/2020
# TEST CASE 42: Workspaces_TC-42 - Agent can make a blind conference call on Workspaces
Workspaces_TC-42 - Agent can make a blind conference call on Workspaces
    [Documentation]  Workspaces_TC-42 - Agent can make a blind conference call on Workspaces
    [Setup]     Run Keywords
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Close AvayaIX    AND
    ...     OneXCommunicator.Close OneX      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Customer makes CDN call to Agent 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   3

    # STEP 2: Agent 1 accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3: Agent 1 make blind conference CDN call to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 make blind conference CDN call to Agent 2
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   2
    WorkCard.Agent Consult Contact     ${CDN1}
    Sleep   1

    # STEP 4: Agent 2 goes ready accepts consult CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 goes ready accepts consult CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 5: Agent 2 ends confernce call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 ends conference call
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}

    # STEP 6: Agent 1 ends conference call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 1 ends conference call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}

#=======================================================================================================================
#
#Created date:     12/03/2020
# TEST CASE 43: Workspaces_TC-43 - Agent can make a blind transfer call on Workspaces
Workspaces_TC-43 - Agent can make a blind transfer call on Workspaces
    [Documentation]  Workspaces_TC-43 - Agent can make a blind transfer call on Workspaces
    [Setup]     Run Keywords
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Close AvayaIX    AND
    ...     OneXCommunicator.Close OneX      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Customer makes CDN call to Agent 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   3

    # STEP 2: Agent 1 accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3: Agent 1 make blind transfer a CDN call to Agent 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 make blind transfer a CDN call to Agent 2
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3
    WorkCard.Agent Transfer Contact     ${CDN1}
    Sleep   1

    # STEP 4: Agent 2 goes ready and accepts transfered CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 goes ready accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 5: Agent 2 ends transfered call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 ends transfered call
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}

#=======================================================================================================================

#Created date:     09/03/2020
# TEST CASE 44: Workspaces_TC-44 - Agent 1 can make CDN call to Agent 2 on Workspaces
Workspaces_TC-44 - Agent 1 can make CDN call to Agent 2 on Workspaces
    [Documentation]  Workspaces_TC-44 - Agent 1 can make CDN call to Agent 2 on Workspaces
    [Setup]     Run Keywords
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1       AND
    #   Login blended agent 2 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Close AvayaIX    AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Agent 2 makes CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent 2 makes CDN call
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Calls Out         ${CDN1}
    Sleep   2

    # STEP 2: Switch to Agent1's browser and Agent 1 accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to Agent1's browser and Agent 1 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${AGENT3_VOICE_URI}
    Sleep   2

    # STEP 3: Switch to Agent2's browser and release CDN
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to Agent2's browser and release CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CDN1}
    Sleep   1

#=======================================================================================================================

#Created date:     03/03/2020
# TEST CASE 45: Workspaces_TC-45 - Agent can manual insert email signature sucessfully
Workspaces_TC-45 - Agent can manual insert email signature sucessfully
    [Documentation]  Workspaces_TC-45 - Agent can manual insert email signature sucessfully
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Open Outlook, from customer sent to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Sleep   2
    Outlook.Send Email Without Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent cteate the Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent cteate the Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMAIL_SIGNATURE}
    WidgetSettings.Save email signature

    # STEP 3: Agent goes ready and accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent goes ready accepts Email
    AgentToolbar.Agent Go Ready
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 4: Agent clicks Reply Email button, inserts Email signature then sends out Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent clicks Reply Email button, inserts Email signature then sends out Email without attachment
    WidgetEmail.Agent Replies Email
    Sleep   1
    WidgetEmail.Insert Email Signature
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent deletes the Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMPTY}
    WidgetSettings.Save email signature

#=======================================================================================================================

#Created date:     28/02/2020
# TEST CASE 46: Workspaces_TC-46 - Blended Agent can process an email without attachment
Workspaces_TC-46 - Blended Agent can process an email without attachment
    [Documentation]  Blended Agent can process an email without attachment
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

    # STEP 1: Open Outlook, from customer sent to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     28/02/2020
# TEST CASE 47: Workspaces_TC-47 - Blended Agent can process an email with attachment
Workspaces_TC-47 - Blended Agent can process an email with attachment
    [Documentation]  Blended Agent can process an email without attachment
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

    # STEP 1: Open Outlook, from customer sent to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}      ${ATTACH_LINK_1}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   3

    # STEP 3: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends webchat session
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     02/03/2020
# TEST CASE 48: Workspaces_TC-48 - Blended Agent can reply an Email without attachment
Workspaces_TC-48 - Blended Agent can reply an Email without attachment
    [Documentation]  Workspaces_TC-48 - Blended Agent can reply an Email without attachment
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


    # STEP 1: Open Outlook, from customer sent to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent clicks Reply Email button then sends out Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent clicks Reply Email button then sends out Email without attachment
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     13/03/2020
# TEST CASE 49: Workspaces_TC-49 - Blended Agent can reply an Email with attachment
Workspaces_TC-49 - Blended Agent can reply an Email with attachment
    [Documentation]  Workspaces_TC-49 - Blended Agent can reply an Email with attachment
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


    # STEP 1: Open Outlook, from customer sent to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent clicks Reply Email button then sends out Email with attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent clicks Reply Email button then sends out Email with attachment
    WidgetEmail.Agent Replies Email
    Sleep   2
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${EMPTY}
    WidgetEmail.Insert Attachment    ${CUST1_EMAIL}     ${VALID_SPECIAL_NAME_LINK}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 4: Verify customer received email from Agent with Special Name Attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent with Special Name Attachment
    Sleep   70
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${VALID_SPECIAL_NAME}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     02/03/2020
# TEST CASE 50: Workspaces_TC-50 -Agent can Transfer Email to a service
Workspaces_TC-50 -Agent can Transfer Email to a service
    [Documentation]  Workspaces_TC-51 -Agent can Transfer Email to a service
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   10   AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...    AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Open Outlook, from customer sent to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent chooses the skillset then transfer Email to service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent chooses the skillset then transfer Email to service
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT5_SKILLSET_EM}
    Sleep   1

    # STEP 4: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends EM contact
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    #WorkCard.Agent Finds And Completes A Contact Session    ${CUST1_EMAIL}

##=======================================================================================================================

#Created date:     28/02/2020
# TEST CASE 51: Workspaces_TC-51 - Agent Initate an email without attachment
Workspaces_TC-51 - Agent Initate an email without attachment
    [Documentation]  Agent Initate an email without attachment
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

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
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM}
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_EMAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     12/03/2020
# TEST CASE 52: Workspaces_TC-52 - Agent Initate an email with attachment
Workspaces_TC-52 - Agent Initate an email with attachment
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00: Customer open Outlook and delete all old email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Customer open Outlook and delete all old email
    Outlook.Open Outlook
    Sleep   3
    Outlook.Delete Old Email
    Sleep   1

    # STEP 1: Agent creates new Email and attach Special File Type then sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email and attach Special File Type then sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM}
    WidgetEmail.Insert Attachment    ${EMPTY}     ${INLINE_IMAGE_NO_EXTENTION_LINK}
    Sleep   5
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email from Agent with Special File Type
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email from Agent with Special File Type
    Sleep   60
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_EMAIL1}    ${CUST1_EMAIL}   ${INLINE_IMAGE_NO_EXTENTION}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     13/03/2020
# TEST CASE 53: Workspaces_TC-53 - Shutdown browser while Agent on CDN call and relogin Agent
Workspaces_TC-53 - Shutdown browser while Agent on CDN call and relogin Agent
    [Documentation]  Workspaces_TC-53 - Shutdown browser while Agent on CDN call and relogin Agent
    [Setup]     Run Keywords
    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Close AvayaIX    AND
    ...     OneXCommunicator.Close OneX      AND
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Customer makes CDN call to Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   7

    # STEP 2: Agent accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 3: Shutdown browser
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Shutdown browser
    Close All Browsers
    Sleep   2

    # STEP 4: Relogin Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Relogin Agent
    Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${VO_AGENT1.USERNAME}    ${VO_AGENT1.PASSWORD}
    Sleep   1
    Login.Activate Agent
    Sleep   2

    # STEP 5: Agent Finds And Ends A Contact Session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent Finds And Ends A Contact Session
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
##