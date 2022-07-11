*** Settings ***
Resource    ../resources/Resources_CC_19902_Workspaces_Customer_Journey.robot


*** Test Cases ***
# Created by:       htmoanh
# Created date:     10/11/2020


#Created date:     11/11/2020
CC19902 01 As MM Agent, Agent-Supervisor, I want Customer Journey displays information when I accept a chat from new customer
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
    WebChat.Customer Init A Chat Session     ${CUST5_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST5_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip    ${CUST5_EMAIL}   WC   ${EMPTY}
    Show Current Touchpoint    ${CUST5_EMAIL}     WC   Text Chat from Customer

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST5_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     11/11/2020
CC19902 02 As blended Agent, Agent-Supervisor, I want Customer Journey displays information when I accept a chat from new customer
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
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
    WebChat.Customer Init A Chat Session     ${CUST7_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST7_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip    ${CUST7_EMAIL}   WC    ${EMPTY}
    Show Current Touchpoint    ${CUST7_EMAIL}     WC    Text Chat from Customer

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST7_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     11/11/2020
CC19902 03 As MM Agent, Agent-Supervisor, I want Customer Journey displays information when I accept a chat from old customer
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

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip    ${CUST1_EMAIL}   WC    ${EMPTY}
    Show Current Touchpoint    ${CUST1_EMAIL}     WC    Text Chat from Customer

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     12/11/2020
CC19902 04 As Blended Agent, Agent-Supervisor, I want Customer Journey displays information when I accept a chat from old customer
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
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
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip    ${CUST2_EMAIL}   WC    ${EMPTY}
    Show Current Touchpoint    ${CUST2_EMAIL}     WC    Text Chat from Customer

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     12/11/2020
CC19902 05 As Agent, Agent-Supervisor, I want Customer Journey to display information when I accept transferred chat
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
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   3

    # STEP 3': Blended Agent 2 go ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent 2 go ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 4: Switch to agent1's browser and Agent 1 transfer WC to service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT1_SKILLSET_WC1}
    Sleep   5

    # STEP 5: Switch to agent2's browser, Agent accepts transfered WC
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent2's browser, Agent accepts transfered WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip    ${CUST1_EMAIL}   WC    ${EMPTY}
    Show Current Touchpoint    ${CUST1_EMAIL}     WC    Transfer to Skillset
    Show Current Touchpoint    ${CUST1_EMAIL}     WC    AgentId: ${AGENT1_ID}
    Show Current Touchpoint    ${CUST1_EMAIL}     WC    Text Chat from Customer

    # STEP 7: Agent 2 ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 ends webchat session
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     12/11/2020
CC19902 06 As Agent, Agent-Supervisor, I want Customer Journey to display information when I accept a chat that after returning to queue
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

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    The agent does not answer chat and waiting until the contact RETURN TO QUEUE
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   15  #320
#    Wait Until Element Is Visible    xpath://div[@title='Not Ready']   timeout=320

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent goes ready again and accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent sends Message to Customer    ${CUST6_EMAIL}   Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent ${AGENT2_FIRSTNAME}

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to Customer's browser and Customer sends Message to Agent
    Webchat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST6_EMAIL}   Hi Agent, I have some Issues

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST6_EMAIL}
    Sleep   2

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_2}    ${BROWSER_CUST_ALIAS_2}
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent goes ready again and accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    Sleep   3

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip    ${CUST6_EMAIL}    WC   ${EMPTY}
    Show Previous Touchpoint    ${CUST6_EMAIL}     WC   Agent Created
    Show Previous Touchpoint    ${CUST6_EMAIL}     WC   AgentId: ${AGENT2_ID}
    Show Previous Touchpoint    ${CUST6_EMAIL}     WC   Text Chat History
    Show Previous Touchpoint    ${CUST6_EMAIL}     WC   Chat History with Whispers
    Show Previous Touchpoint    ${CUST6_EMAIL}     WC   Text Chat from Customer

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST6_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     13/11/2020
CC19902 07 As Agent, Agent-Supervisor, I want Customer Journey displays information for a chat that have been abandoned by a customer
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

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer ends chat
    WebChat.Customer Ends A Chat Session
    Sleep   2

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer launchs a session chat and send it to agent again
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_2}    ${BROWSER_CUST_ALIAS_2}
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent goes ready again and accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip    ${CUST6_EMAIL}    WC    ${EMPTY}
    Show Previous Touchpoint    ${CUST6_EMAIL}     WC   Text Chat History
    Show Previous Touchpoint    ${CUST6_EMAIL}     WC   Text Chat from Customer

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 6    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST6_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     16/11/2020
CC19902 08 As Agent, Agent-Supervisor, I want Customer Journey displays information for a chat that have been abandoned by a customer after RETURN TO QUEUE
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

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer ends chat
    Sleep   105

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer ends chat
    WebChat.Customer Ends A Chat Session
    Sleep   2

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer launchs a session chat and send it to agent again
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_2}    ${BROWSER_CUST_ALIAS_2}
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent goes ready again and accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip    ${CUST6_EMAIL}    WC    ${EMPTY}
    Show Previous Touchpoint    ${CUST6_EMAIL}     WC   Text Chat History
    Show Previous Touchpoint    ${CUST6_EMAIL}     WC   Text Chat from Customer

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 7    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST6_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     16/11/2020
CC19902 09 As Agent, Agent-Supervisor, I want Customer Journey displays information for a chat that have been abandoned by a customer while the Chat is being transferred
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
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 2: Switch to agent1's browser and Agent accepts WC and chat to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent1's browser and Agent accepts WC and chat to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    Sleep   3

    # STEP 3': Blended Agent 2 go ready
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent 2 go ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 4: Switch to agent1's browser and Agent 1 transfer WC to service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Switch to agent1's browser and Agent 1 transfer WC to service
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    WorkCard.Transfer To Service      ${CUST6_EMAIL}      ${AGENT1_SKILLSET_WC1}
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer ends chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Ends A Chat Session
    Sleep   2
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Customer launchs a session chat and send it to agent again
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_2}    ${BROWSER_CUST_ALIAS_2}
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent goes ready again and accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip    ${CUST6_EMAIL}    WC    ${EMPTY}
    Show Previous Touchpoint    ${CUST6_EMAIL}     WC   Text Chat History
    Show Previous Touchpoint    ${CUST6_EMAIL}     WC   Text Chat History with Whispers
    Show Previous Touchpoint    ${CUST6_EMAIL}     WC   Transfer to Skillset
    Show Previous Touchpoint    ${CUST6_EMAIL}     WC   Text Chat from Customer

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST6_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     17/11/2020
CC19902 10 As Agent, Agent-Supervisor, I want Customer Journey displays information of the chat that I rejected
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
    ...     Close All Browsers    AND
    ...     Sleep  2

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT1_SKILLSET_WC1}

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 rejects WC contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Rejects A Contact    ${CUST6_EMAIL}
    Sleep   3

    # STEP 3':
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent 2 go ready
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts WC
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip    ${CUST6_EMAIL}    WC    ${EMPTY}
    Show Current Touchpoint    ${CUST6_EMAIL}      WC    Text Chat from Customer

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 6    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST6_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     17/11/2020
CC19902 11 As Agent, Agent-Supervisor, I want Customer Journey displays information when I accepts an email from new customer
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Open Outlook, from customer sent to Server the Email with attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email with attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}     ${ATTACH_LINK_1}
    Sleep   1
    Outlook.Send Email
    Sleep   20
    Outlook.Delete Old Email
    Sleep   1
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email, verify the attachment displays correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email, verify the attachment displays correctly
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip     ${CUST1_EMAIL}    EM    ${SUBJECT_MAIL1}
    CustomerJourney.Show Current Touchpoint     ${CUST1_EMAIL}      EM    EMail from Customer
    CustomerJourney.Verify Touchpoint Transcript    From: ${CUST1_EMAIL}
    CustomerJourney.Verify Touchpoint Transcript    To: ${AGENT1_MAIL}
    CustomerJourney.Verify Touchpoint Transcript    Subject: ${SUBJECT_MAIL1}
    CustomerJourney.Verify Touchpoint Transcript    ${MESSAGE_EMAIL1}
    CustomerJourney.Verify Attachment In Transcript    1CLWujF.png

    # STEP 4: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email Contact
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================

##Created date:     18/11/2020
#CC19902 12 As Agent, Agent-Supervisor, I want Customer Journey displays information when I accepts an email from old customer
#    [Setup]     Run Keywords
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1
##    [Teardown]    Run Keywords
##    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
##    ...     WorkCard.Agent End Any Inbound Contact      AND
##    ...     AgentToolbar.Agent Finish Work      AND
##    ...     AgentToolbar.Agent Exit      AND
##    ...     Close All Browsers
#
#    # STEP 1: Open Outlook, from customer sent to Server the Email with attachment
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email with attachment
#    Outlook.Open Outlook
#    Outlook.Send Email With Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}     ${ATTACH_LINK_1}
#    Sleep   1
#    Outlook.Send Email
#    Sleep   20
#    Outlook.Delete Old Email
#    Sleep   1
#    Outlook.Close Outlook
#
#    # STEP 2: Agent accepts Email, verify the attachment displays correctly
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email, verify the attachment displays correctly
#    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
#    Sleep   5
#    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
#    Sleep   3
#
#    # STEP 4: Agent ends Email Contact
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email Contact
#    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
#
#    # STEP 1: Open Outlook, from customer sent to Server the Email with attachment
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email with attachment
#    Outlook.Open Outlook
#    Outlook.Send Email With Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}     ${ATTACH_LINK_1}
#    Sleep   1
#    Outlook.Send Email
#    Sleep   20
#    Outlook.Delete Old Email
#    Sleep   1
#    Outlook.Close Outlook
#
#    # STEP 2: Agent accepts Email, verify the attachment displays correctly
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email, verify the attachment displays correctly
#    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
#    Sleep   5
#    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
#    Sleep   3
#
#    # STEP 5:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify contact interaction in the tooltip of Touchpoint
#    NavigationMenu.Open Customer Journey
#    CustomerJourney.Verify Touchpoint Tooltip     ${CUST1_EMAIL}    EM    ${SUBJECT_MAIL1}
#    CustomerJourney.Show Previous Touchpoint     ${CUST1_EMAIL}     EM    EMail from Customer
#    CustomerJourney.Verify Touchpoint Transcript    From: ${CUST1_EMAIL}
#    CustomerJourney.Verify Touchpoint Transcript    To: ${AGENT1_MAIL}
#    CustomerJourney.Verify Touchpoint Transcript    Subject: ${SUBJECT_MAIL1}
#    CustomerJourney.Verify Touchpoint Transcript    ${MESSAGE_EMAIL1}
#    CustomerJourney.Verify Attachment In Transcript    1CLWujF.png
#
#    # STEP 4: Agent ends Email Contact
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email Contact
#    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================

##Created date:     18/11/2020
#CC19902 13 As Agent, Agent-Supervisor, I want Customer Journey displays information when I accept a transferred email
#    [Documentation]  Workspaces_TC8 - Email - Agent can Transfer Email to another skillset without attachment
#    [Setup]     Run Keywords
#    #   Login blended agent 1 to workspaces, start work and go ready
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1    AND
#    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     Sleep   1
#    [Teardown]    Run Keywords
#    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
#    ...     WorkCard.Agent End Any Inbound Contact      AND
#    ...     AgentToolbar.Agent Finish Work      AND
#    ...     AgentToolbar.Agent Exit      AND
#    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
#    ...     WorkCard.Agent End Any Inbound Contact      AND
#    ...     AgentToolbar.Agent Finish Work      AND
#    ...     AgentToolbar.Agent Exit      AND
#    ...     Close All Browsers
#
#    # STEP 1: Open Outlook, from customer sent to Server the Email without attachment
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
#    Outlook.Open Outlook
#    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}
#    Outlook.Send Email
#    Sleep   20
#    Outlook.Close Outlook
#
#    # STEP 2: Agent accepts Email
#    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
#    Sleep   5
#    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
#    Sleep   1
#    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
#    Sleep   1
#
#    # STEP 3: Agent chooses the skillset then transfer Email to service
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent chooses the skillset then transfer Email to service
#    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT1_SKILLSET_EM}
#    Sleep   1
#
#    # STEP 4: Agent 2 go ready and accepts transferred Email
#    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 go ready and accepts transferred Email
#    AgentToolbar.Agent Go Ready
#    Sleep   1
#    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
#    Sleep   1
#
#    # STEP 5:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify contact interaction in the tooltip of Touchpoint
#    NavigationMenu.Open Customer Journey
#    CustomerJourney.Verify Touchpoint Tooltip     ${CUST1_EMAIL}    EM    ${SUBJECT_MAIL1}
#    CustomerJourney.Show Current Touchpoint     ${CUST1_EMAIL}      EM    EMail from Customer
#    CustomerJourney.Verify Touchpoint Transcript    From: ${CUST1_EMAIL}
#    CustomerJourney.Verify Touchpoint Transcript    To: ${AGENT1_MAIL}
#    CustomerJourney.Verify Touchpoint Transcript    Subject: ${SUBJECT_MAIL1}
#    CustomerJourney.Verify Touchpoint Transcript    ${MESSAGE_EMAIL1}
#
#    # STEP 6: Agent ends Email Contact
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends Email Contact
#    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
#
#=======================================================================================================================

##Created date:     18/11/2020
#CC19902 14 As Agent, Agent-Supervisor, I want Customer Journey displays information of an email contact that have been RETURN TO QUEUE before answering
#    [Setup]     Run Keywords
#    #   Login blended agent 1 to workspaces, start work and go ready
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1    AND
#    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     Sleep   1
#    [Teardown]    Run Keywords
#    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
#    ...     WorkCard.Agent End Any Inbound Contact      AND
#    ...     AgentToolbar.Agent Finish Work      AND
#    ...     AgentToolbar.Agent Exit      AND
#    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
#    ...     WorkCard.Agent End Any Inbound Contact      AND
#    ...     AgentToolbar.Agent Finish Work      AND
#    ...     AgentToolbar.Agent Exit      AND
#    ...     Close All Browsers
#
#    # STEP 1: Open Outlook, from customer sent to Server the Email without attachment
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
#    Outlook.Open Outlook
#    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}
#    Outlook.Send Email
#    Sleep   20
#    Outlook.Close Outlook
#
#    # STEP 2: Agent accepts Email
#    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
#    Sleep   5
#    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
#    Sleep   1
#    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
#    Sleep   1
#
#    # STEP 3: Agent chooses the skillset then transfer Email to service
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent chooses the skillset then transfer Email to service
#    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT1_SKILLSET_EM}
#    Sleep   1
#
#    # STEP 4: Agent 2 go ready and accepts transferred Email
#    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 go ready and accepts transferred Email
#    AgentToolbar.Agent Go Ready
#    Sleep   1
#    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
#    Sleep   1
#
#    # STEP 5:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify contact interaction in the tooltip of Touchpoint
#    NavigationMenu.Open Customer Journey
#    CustomerJourney.Verify Touchpoint Tooltip     ${CUST1_EMAIL}    EM    ${SUBJECT_MAIL1}
#    CustomerJourney.Show Current Touchpoint      ${CUST1_EMAIL}     EM    EMail from Customer
#    CustomerJourney.Verify Touchpoint Transcript    From: ${CUST1_EMAIL}
#    CustomerJourney.Verify Touchpoint Transcript    To: ${AGENT1_MAIL}
#    CustomerJourney.Verify Touchpoint Transcript    Subject: ${SUBJECT_MAIL1}
#    CustomerJourney.Verify Touchpoint Transcript    ${MESSAGE_EMAIL1}
#
#    # STEP 6: Agent ends Email Contact
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends Email Contact
#    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================

#=======================================================================================================================

#Created date:     20/11/2020
CC19902 16 As Agent, Agent-Supervisor, Verify Customer Journey widget does not display for ad-hoc Email
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email
    AgentToolbar.Agent Create Email
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Customer Journey Widget button is disabled
#    //button[@id='ow_open_Customer_Journey']
    ${status_cj_btn} =     Get Element Attribute    ${LOC_WORKSPACE_NAVIGATION_MENU_CUSTOMER_JOURNEY}    disabled
    Should Be Equal    ${status_cj_btn}    true
    Sleep   2

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent Ad-hoc Email
    Agent End Outbound Contact

#=======================================================================================================================

# Created date:     20/11/2020
CC19902 17 As voice only Agent,Agent-Supervisor, I want Customer Journey displays information when I accept a CDN from new customer
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
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
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

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out      ${CDN2}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts CDN call
    WorkCard.Agent Accepts A Contact     ${CUST2_URI_CDN}
    Sleep   3

#    # STEP 3:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 ends call
#    WorkCard.Agent Ends A Contact     ${CUST2_URI_CDN}
#    Sleep   1
#
#    # STEP 4:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Waiting until next interval, Customer makes CDN call to Agent 1
#    Sleep   900
#    OneXCommunicator.OneX Call Out      ${CDN2}
#    Sleep   3
#
#    # STEP 5:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 1 accepts CDN call
#    WorkCard.Agent Accepts A Contact     ${CUST2_URI_CDN}
#    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip    ${CUST2_URI_CDN}    Voice   ${AGENT3_SKILLSET_VOICE1}
    CustomerJourney.Show Current Touchpoint     ${CUST2_URI_CDN}     Voice    Voice Contact handled by ${AGENT5_FIRSTNAME} ${AGENT5_LASTNAME}

    # STEP 7: Agent 1 ends call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 1 ends call
    WorkCard.Agent Ends A Contact     ${CUST2_URI_CDN}
    Sleep   1

#=======================================================================================================================

# Created date:     23/11/2020
CC19902 18 As blended Agent, Agent-Supervisor, I want Customer Journey displays information when I accept a CDN from new customer
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
#    ...     Sleep   1
#    ...     AvayaIX.Close AvayaIX    AND
#    ...     Sleep   1
    ...     OneXCommunicator.Close OneX      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts CDN call
    WorkCard.Agent Accepts A Contact     ${CUST2_URI_CDN}
    Sleep   3

#    # STEP 3:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 ends call
#    WorkCard.Agent Ends A Contact     ${CUST2_URI_CDN}
#    Sleep   1
#
#    # STEP 4:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Waiting until next interval, Customer makes CDN call to Agent 1
#    Sleep   900
#    OneXCommunicator.OneX Call Out      ${CDN1}
#    Sleep   3
#
#    # STEP 5:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 1 accepts CDN call
#    WorkCard.Agent Accepts A Contact     ${CUST2_URI_CDN}
#    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip    ${CUST2_URI_CDN}    Voice    ${AGENT3_SKILLSET_VOICE1}
    CustomerJourney.Show Current Touchpoint     ${CUST2_URI_CDN}     Voice    Voice Contact handled by ${AGENT4_FIRSTNAME} ${AGENT4_LASTNAME}

    # STEP 7: Agent 1 ends call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 1 ends call
    WorkCard.Agent Ends A Contact     ${CUST2_URI_CDN}
    Sleep   1

#=======================================================================================================================

# Created date:     24/11/2020
CC19902 19 As Agent, Agent-Supervisor, I want Customer Journey displays information when I accept a CDN from old customer
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
#    ...     Sleep   1
#    ...     AvayaIX.Close AvayaIX    AND
#    ...     Sleep   1
    ...     OneXCommunicator.Close OneX      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts CDN call
    WorkCard.Agent Accepts A Contact     ${CUST2_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip    ${CUST2_URI_CDN}    Voice    ${AGENT3_SKILLSET_VOICE1}
    CustomerJourney.Show Current Touchpoint      ${CUST2_URI_CDN}    Voice    Voice Contact handled by ${AGENT4_FIRSTNAME} ${AGENT4_LASTNAME}

    # STEP 4: Agent 1 ends call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 1 ends call
    WorkCard.Agent Ends A Contact     ${CUST2_URI_CDN}
    Sleep   1

#=======================================================================================================================
#
## Created date:     24/11/2020
#CC19902 20 As Agent, Agent-Supervisor, I want Customer Journey widget is not available when I accept a DN from customer
#    [Setup]     Run Keywords
#    #   Setting Agent phone
##    ...     AvayaIX.Open AvayaIX    AND
##    ...     AvayaIX.AvayaIX Log Out     AND
##    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
#    #   Setting Customer phone
#    ...     OneXCommunicator.Open OneX      AND
#    ...     OneXCommunicatorLocator.click_login    AND
##    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
#    #   Login blended agent to workspaces, start work and go ready
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1
#    [Teardown]    Run Keywords
##    ...     AvayaIX.AvayaIX Log Out     AND
##    ...     Sleep   1
##    ...     AvayaIX.Close AvayaIX    AND
##    ...     Sleep   1
#    ...     OneXCommunicator.Close OneX      AND
#    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
#    ...    WorkCard.Agent End Any Inbound Contact      AND
#    ...     AgentToolbar.Agent Finish Work      AND
#    ...     AgentToolbar.Agent Exit      AND
#    ...     Close All Browsers
#
#    # STEP 1:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes DN call to Agent 1
#    OneXCommunicator.OneX Call Out      ${AGENT4_PHONE_NUMBER}
#    Sleep   3
#
#    # STEP 2:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts DN call
#    WorkCard.Agent Accepts A Contact     ${CUST2_URI}
#    Sleep   3
#
#    # STEP 3:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 ends call
#    WorkCard.Agent Ends A Contact     ${CUST2_URI}
#    Sleep   1
#
#    # STEP 4:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Waiting until next interval, Customer makes DN call to Agent 1
#    Sleep   900
#    OneXCommunicator.OneX Call Out      ${AGENT4_PHONE_NUMBER}
#    Sleep   3
#
#    # STEP 5:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 1 accepts DN call
#    WorkCard.Agent Accepts A Contact     ${CUST2_URI}
#    Sleep   3
#
#    # STEP 6:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify contact interaction in the tooltip of Touchpoint
#    NavigationMenu.Open Customer Journey
#    CustomerJourney.Verify Touchpoint Tooltip    ${CUST2_URI}    Voice    ${AGENT3_SKILLSET_VOICE1}
##    CustomerJourney.Show Current Touchpoint     ${CUST2_URI}    Voice    ???????????????????????????????
#
#    # STEP 7: Agent 1 ends call
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 1 ends call
#    WorkCard.Agent Ends A Contact     ${CUST2_URI}
#    Sleep   1

#=======================================================================================================================

#Created date:     25/11/2020
CC19902 21 As Agent,Agent-Supervisor, I want Customer Journey displays information when I accept transferred CDN
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 3
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 3 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 3 make transfer CDN call to Agent 4
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 4 accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${AGENT3_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 3 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Transfer Contact     ${CDN1}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 4 ends transferred call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Wait until next interval and Agent 4 accepts CDN from customer
    Sleep   900
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09   Verify contact interaction in the tooltip of Touchpoint
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip     ${CUST1_URI_CDN}    Voice    ${AGENT3_SKILLSET_VOICE1}
    CustomerJourney.Show Current Touchpoint       ${CUST1_URI_CDN}    Voice    Voice Contact handled by ${AGENT4_FIRSTNAME} ${AGENT4_LASTNAME}

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 4 ends call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================
#
##Created date:     25/11/2020
#CC19902 22 As Agent, Agent-Supervisor, I want Customer Journey displays information when I accept CDN call and transfer it via DN
#    [Setup]     Run Keywords
#    #   Setting Customer phone
#    ...     OneXCommunicator.Open OneX      AND
#    ...     OneXCommunicatorLocator.click_login    AND
##    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
#    #   Login blended sup/agent 1 to workspaces
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    #   Login blended agent 2 to workspaces
#    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     Sleep   1
#    [Teardown]    Run Keywords
#    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
#    ...    WorkCard.Agent End Any Inbound Contact      AND
#    ...    AgentToolbar.Agent Finish Work   AND
#    ...    AgentToolbar.Agent Exit      AND
#    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
#    ...    WorkCard.Agent End Any Inbound Contact      AND
#    ...    AgentToolbar.Agent Finish Work   AND
#    ...    AgentToolbar.Agent Exit      AND
#    ...    OneXCommunicator.Close OneX      AND
#    ...    Close All Browsers
#
#    # STEP 1:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 3
#    OneXCommunicator.OneX Call Out     ${CDN1}
#    Sleep   3
#
#    # STEP 2:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 3 accepts CDN call
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
#    Sleep   3
#
#    # STEP 4:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 3 make transfer DN call to Agent 4
#    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
#    AgentToolbar.Agent Go Ready
#    Sleep   1
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${AGENT4_PHONE_NUMBER}
#    Sleep   3
#
#    # STEP 5:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 4 accepts transfered DN call
#    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
#    WorkCard.Agent Accepts A Contact     ${AGENT3_VOICE_URI}
#    Sleep   3
#
#    # STEP 6:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 3 completes transfer DN
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    WorkCard.Agent Transfer Contact     ${CUST1_URI_CDN}
#    Sleep   3
#
#    # STEP 7:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 4 ends transferred call
#    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
#    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
#    Sleep   2
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
#
#    # STEP 8:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Wait until next interval and Agent 4 accepts CDN from customer
#    Sleep   900
#    OneXCommunicator.OneX Call Out     ${CDN1}
#    Sleep   3
#    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
#    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
#
#    # STEP 9:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 09   Verify contact interaction in the tooltip of Touchpoint
#    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
#    NavigationMenu.Open Customer Journey
#    CustomerJourney.Verify Touchpoint Tooltip     ${CUST1_URI_CDN}    Voice    ${AGENT3_SKILLSET_VOICE1}
##    CustomerJourney.Show Current Touchpoint     ${CUST1_URI_CDN}     Voice    ??????????????????
#
#    # STEP 10:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 4 ends call
#    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
#    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
#    Sleep   2
#
#=======================================================================================================================

#Created date:     25/11/2020
CC19902 23 As Agent, Agent-Supervisor, I want Customer Journey displays information when I accept DN call and transfer it via CDN
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 3
    OneXCommunicator.OneX Call Out     ${AGENT3_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 3 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 3 make transfer CDN call to Agent 4
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer Extension Call      ${CUST1_URI}      ${CDN1}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 4 accepts transfered CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${AGENT3_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 3 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Transfer Contact     ${CUST1_URI}
    Sleep   3

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 4 ends transferred call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Wait until next interval and Agent 4 accepts CDN from customer
#    Sleep   900
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09   Verify contact interaction in the tooltip of Touchpoint
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip     ${CUST1_URI_CDN}    Voice    ${AGENT3_SKILLSET_VOICE1}
    CustomerJourney.Show Current Touchpoint       ${CUST1_URI_CDN}    Voice    Voice Contact handled by ${AGENT4_FIRSTNAME} ${AGENT4_LASTNAME}

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 4 ends call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     26/11/2020
CC19902 24 As Agent, Agent-Supervisor, I want Customer Journey displays information when I accepts consulted or conference CDN voice
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference CDN call to Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts conference CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${AGENT3_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 1 completes conference CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Consult Contact      ${CDN1}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 1 end contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 end contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Wait until next interval and Agent 4 accepts CDN from customer
    Sleep   900
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09   Verify contact interaction in the tooltip of Touchpoint
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip     ${CUST1_URI_CDN}    Voice    ${AGENT3_SKILLSET_VOICE1}
    CustomerJourney.Show Current Touchpoint       ${CUST1_URI_CDN}    Voice    Voice Contact handled by ${AGENT4_FIRSTNAME} ${AGENT4_LASTNAME}

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 4 ends call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     26/11/2020
CC19902 25 As Agent, Agent-Supervisor, I want Customer Journey displays information for the call has been conference from DN to CDN
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes DN call to Agent 1
    OneXCommunicator.OneX Call Out     ${AGENT3_PHONE_NUMBER}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference CDN call to Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Consult Extension Call      ${CUST1_URI}      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts conference CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${AGENT3_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 1 completes conference CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Consult Contact      ${CDN1}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 1 end contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 end contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Wait until next interval and Agent 4 accepts CDN from customer
#    Sleep   900
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09   Verify contact interaction in the tooltip of Touchpoint
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip     ${CUST1_URI_CDN}    Voice    ${AGENT3_SKILLSET_VOICE1}
    CustomerJourney.Show Current Touchpoint       ${CUST1_URI_CDN}    Voice    Voice Contact handled by ${AGENT4_FIRSTNAME} ${AGENT4_LASTNAME}

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 4 ends call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     26/11/2020
CC19902 26 As Agent, Agent-Supervisor, I want Customer Journey displays information for the call has been conference from CDN to DN
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 make conference DN call to Agent 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Consult Extension Call      ${CUST1_URI_CDN}      ${AGENT4_PHONE_NUMBER}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts conference DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${AGENT3_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 1 completes conference DN
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Consult Contact      ${AGENT4_VOICE_URI}
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 1 end contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 2 end contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST1_URI_CDN}
    Sleep   2

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Wait until next interval and Agent 4 accepts CDN from customer
#    Sleep   900
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09   Verify contact interaction in the tooltip of Touchpoint
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip     ${CUST1_URI_CDN}    Voice    ${AGENT3_SKILLSET_VOICE1}
    CustomerJourney.Show Current Touchpoint       ${CUST1_URI_CDN}    Voice    Voice Contact handled by ${AGENT4_FIRSTNAME} ${AGENT4_LASTNAME}

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent 4 ends call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

# Created date:     30/11/2020
CC19902 27 As Agent, Agent-Supervisor, I want Customer Journey displays information for a voice that customer abandoned before alerting on Workspace
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

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 2    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Waiting until next interval, Customer makes CDN call to Agent 1
    Sleep   900
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 1 accepts CDN call
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip     ${CUST1_URI_CDN}    Voice    ${AGENT3_SKILLSET_VOICE1}
    CustomerJourney.Show Current Touchpoint     ${CUST1_URI_CDN}      Voice    Voice Contact Abandoned

    # STEP 6: Agent 1 ends call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 1 ends call
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   1

#=======================================================================================================================

# Created date:     30/11/2020
CC19902 28 As Agent, Agent-Supervisor, I want Customer Journey to display information for a voice that customer abandons while alerting on Workspace
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

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 2    Customer end CDN call
    OneXCommunicator.OneX Release Call
    Sleep   2

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Waiting until next interval, Customer makes CDN call to Agent 1
    Sleep   900
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 1 accepts CDN call
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip     ${CUST1_URI_CDN}    Voice    ${AGENT3_SKILLSET_VOICE1}
    CustomerJourney.Show Current Touchpoint     ${CUST1_URI_CDN}      Voice    Voice Contact Abandoned
    CustomerJourney.Show Current Touchpoint     ${CUST1_URI_CDN}      Voice    AgentId:   #dang bi issue ve Agent ID

    # STEP 6: Agent 1 ends call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent 1 ends call
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   1

#=======================================================================================================================

#Created date:     30/11/2020
CC19902 29 As Agent,Agent-Supervisor, I want Customer Journey to display information for a voice that the customer abandons while the call is being transferred
    [Setup]     Run Keywords
    #   Setting Customer phone
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    #   Login blended sup/agent 1 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    #   Login blended agent 2 to workspaces
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    ...    OneXCommunicator.Close OneX      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent 3
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 3 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 3 make transfer CDN call to Agent 4
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer Extension Call      ${CUST1_URI_CDN}      ${CDN1}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 3 completes transfer CDN
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Transfer Contact     ${CDN1}
    Sleep   3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Wait until next interval and Agent 4 accepts CDN from customer
    Sleep   900
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   3
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07   Verify contact interaction in the tooltip of Touchpoint
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip     ${CUST1_URI_CDN}    Voice    ${AGENT3_SKILLSET_VOICE1}
    CustomerJourney.Show Current Touchpoint      ${CUST1_URI_CDN}     Voice    Voice Contact Abandoned
    CustomerJourney.Show Current Touchpoint      ${CUST1_URI_CDN}     Voice    AgentId:   #dang bi issue ve Agent ID

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 8    Agent 4 ends call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

# Created date:     01/12/2020
CC19902 28 As Agent, Agent-Supervisor, I want Customer Journey to display information for a voice that customer abandons while alerting on Workspace
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 2 Ends DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Waiting until next interval, Agent call out to Customer again
    Sleep   900
    AgentToolbar.Agent Calls Out    ${CUST1_PHONE}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer accepts call from Agent
    OneXCommunicator.OneX Accept Call
    Sleep   3

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip    ${CUST1_URI}    Voice    Direct call to agent
    CustomerJourney.Show Current Touchpoint     ${CUST1_URI}     Voice    Voice Contact handled by ${AGENT3_FIRSTNAME} ${AGENT3_FIRSTNAME}
    CustomerJourney.Show Current Touchpoint     ${CUST1_URI}     Voice    AgentId:   #dang bi issue ve Agent ID

    # STEP 7: Agent 1 ends call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 1 ends call
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   1

#=======================================================================================================================

#Created date:     1/12/2020
CC19902 31 As Agent, Agent-Supervisor, I want Customer Journey displays information when I accept two emails
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email with attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}     ${ATTACH_LINK_1}
    Sleep   1
    Outlook.Send Email
    Sleep   2
    Outlook.Delete Old Email
    Sleep   1
    Outlook.Close Outlook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Open Outlook, from customer 2 sent to Server the Email with attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}     ${ATTACH_LINK_1}
    Outlook.Choose Account   ${CUST2_EMAIL}
    Sleep   1
    Outlook.Send Email
    Sleep   5
    Outlook.Delete Old Email
    Sleep   1
    Outlook.Close Outlook

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts Email from Customer 1, verify the attachment displays correctly
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip     ${CUST1_EMAIL}    EM    ${SUBJECT_MAIL1}
    CustomerJourney.Show Current Touchpoint     ${CUST1_EMAIL}      EM    EMail from Customer
    CustomerJourney.Verify Touchpoint Transcript    From: ${CUST1_EMAIL}
    CustomerJourney.Verify Touchpoint Transcript    To: ${AGENT1_MAIL}
    CustomerJourney.Verify Touchpoint Transcript    Subject: ${SUBJECT_MAIL1}
    CustomerJourney.Verify Touchpoint Transcript    ${MESSAGE_EMAIL1}
    CustomerJourney.Verify Attachment In Transcript    1CLWujF.png

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent accepts Email from Customer 2, verify the attachment displays correctly
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    WorkCard.Agent Unhold A Contact    ${CUST1_EMAIL}

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends Email 1 Contact
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    WorkCard.Agent Unhold A Contact    ${CUST2_EMAIL}

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip    ${CUST2_EMAIL}    EM    ${SUBJECT_MAIL1}
    CustomerJourney.Show Current Touchpoint     ${CUST2_EMAIL}     EM    EMail from Customer
    CustomerJourney.Verify Touchpoint Transcript    From: ${CUST2_EMAIL}
    CustomerJourney.Verify Touchpoint Transcript    To: ${AGENT1_MAIL}
    CustomerJourney.Verify Touchpoint Transcript    Subject: ${SUBJECT_MAIL1}
    CustomerJourney.Verify Touchpoint Transcript    ${MESSAGE_EMAIL1}
    CustomerJourney.Verify Attachment In Transcript    1CLWujF.png

    # STEP 7: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent ends Email 2 Contact
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}

#=======================================================================================================================

# Created date:     2/12/2020
CC19902 32 As Agent, Agent-Supervisor, I want Customer Journey displays information when I accept 1 voice and one MM contact
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
#    ...     Sleep   1
#    ...     AvayaIX.Close AvayaIX    AND
#    ...     Sleep   1
    ...     OneXCommunicator.Close OneX      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email with attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}     ${ATTACH_LINK_1}
    Sleep   1
    Outlook.Send Email
    Sleep   2
    Outlook.Delete Old Email
    Sleep   1
    Outlook.Close Outlook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts CDN call
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip     ${CUST1_URI_CDN}    Voice    ${AGENT3_SKILLSET_VOICE1}
    CustomerJourney.Show Current Touchpoint      ${CUST1_URI_CDN}     Voice    Voice Contact handled by ${AGENT4_FIRSTNAME} ${AGENT4_LASTNAME}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent accepts Email from Customer 1, verify the attachment displays correctly
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}

    # STEP 5: Agent 1 ends call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 1 ends call
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   1

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip    ${CUST1_EMAIL}    EM    ${SUBJECT_MAIL1}
    CustomerJourney.Show Current Touchpoint     ${CUST1_EMAIL}     EM    EMail from Customer
    CustomerJourney.Verify Touchpoint Transcript    From: ${CUST1_EMAIL}
    CustomerJourney.Verify Touchpoint Transcript    To: ${AGENT1_MAIL}
    CustomerJourney.Verify Touchpoint Transcript    Subject: ${SUBJECT_MAIL1}
    CustomerJourney.Verify Touchpoint Transcript    ${MESSAGE_EMAIL1}
    CustomerJourney.Verify Attachment In Transcript    1CLWujF.png

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent ends Email 1 Contact
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================

# Created date:     4/12/2020
CC19902 33 As Agent, Agent-Supervisor, I want Customer Journey displays information when I accept 1 voice and maximun MM contact
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
#    ...     Sleep   1
#    ...     AvayaIX.Close AvayaIX    AND
#    ...     Sleep   1
    ...     OneXCommunicator.Close OneX      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers


    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts CDN call
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    CustomerJourney.Verify Touchpoint Tooltip    ${CUST1_URI_CDN}   Voice    ${AGENT3_SKILLSET_VOICE1}
    CustomerJourney.Show Current Touchpoint     ${CUST1_URI_CDN}    Voice    Voice Contact handled by ${AGENT4_FIRSTNAME} ${AGENT4_LASTNAME}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Open Outlook, from customer sent to Server the Email with attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}     ${ATTACH_LINK_1}
    Sleep   1
    Outlook.Send Email
    Sleep   2
    Outlook.Delete Old Email
    Sleep   1
    Outlook.Close Outlook

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent accepts Email from Customer 1, verify the attachment displays correctly
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep   10
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
#    CustomerJourney.Verify Touchpoint Tooltip    ${CUST1_EMAIL}    EM    ${SUBJECT_MAIL1}
    CustomerJourney.Show Current Touchpoint     ${CUST1_EMAIL}   EM    EMail from Customer
    CustomerJourney.Verify Touchpoint Transcript    From: ${CUST1_EMAIL}
    CustomerJourney.Verify Touchpoint Transcript    To: ${AGENT1_MAIL}
    CustomerJourney.Verify Touchpoint Transcript    Subject: ${SUBJECT_MAIL1}
    CustomerJourney.Verify Touchpoint Transcript    ${MESSAGE_EMAIL1}
    CustomerJourney.Verify Attachment In Transcript    1CLWujF.png

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Customer launchs a session chat 1 and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent accepts WC 1 and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}
    Sleep   3

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip   ${CUST2_EMAIL}   WC   ${EMPTY}
    Show Current Touchpoint     ${CUST2_EMAIL}   WC   Text Chat from Customer

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Customer launchs a session chat 2 and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_2}    ${BROWSER_CUST_ALIAS_2}
    WebChat.Customer Init A Chat Session     ${CUST3_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 11:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 11    Agent accepts WC 2 and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST3_EMAIL}
    Sleep   3

    # STEP 12:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 12    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip   ${CUST3_EMAIL}   WC   ${EMPTY}
    Show Current Touchpoint     ${CUST3_EMAIL}   WC   Text Chat from Customer

    # STEP 13:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 13    Customer launchs a session chat 3 and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_3}    ${BROWSER_CUST_ALIAS_3}
    WebChat.Customer Init A Chat Session     ${CUST4_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 14:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 14    Agent accepts WC 3 and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST4_EMAIL}
    Sleep   3

    # STEP 15:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 15    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip   ${CUST4_EMAIL}   WC   ${EMPTY}
    Show Current Touchpoint     ${CUST4_EMAIL}   WC   Text Chat from Customer

    # STEP 16:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 16    Customer launchs a session chat 4 and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_4}    ${BROWSER_CUST_ALIAS_4}
    WebChat.Customer Init A Chat Session     ${CUST5_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 17:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 17    Agent accepts WC 4 and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST5_EMAIL}
    Sleep   3

    # STEP 18:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 18    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip   ${CUST5_EMAIL}   WC   ${EMPTY}
    Show Current Touchpoint     ${CUST5_EMAIL}   WC   Text Chat from Customer

    # STEP 19: Agent 1 ends call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 19    Agent 1 ends call
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   1

    # STEP 20:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 20    Agent ends Email 1 Contact
    WorkCard.Agent Unhold A Contact    ${CUST1_EMAIL}
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

    # STEP 21:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 21    Agent ends WC 1 Contact
    WorkCard.Agent Unhold A Contact    ${CUST2_EMAIL}
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}

    # STEP 22:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 22    Agent ends WC 2 Contact
    WorkCard.Agent Unhold A Contact    ${CUST3_EMAIL}
    WorkCard.Agent Ends A Contact     ${CUST3_EMAIL}

    # STEP 23:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 23    Agent ends EWC 3 Contact
    WorkCard.Agent Unhold A Contact    ${CUST4_EMAIL}
    WorkCard.Agent Ends A Contact     ${CUST4_EMAIL}

    # STEP 24:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 24    Agent ends WC 4 Contact
    WorkCard.Agent Unhold A Contact    ${CUST5_EMAIL}
    WorkCard.Agent Ends A Contact     ${CUST5_EMAIL}

#=======================================================================================================================

#Created date:     2/12/2020
CC19902 34 Robustness - Customer Journey displays after customer refresh of browser
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
    WebChat.Customer Init A Chat Session     ${CUST5_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST5_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip    ${CUST5_EMAIL}   WC   ${EMPTY}
    Show Current Touchpoint      ${CUST5_EMAIL}   WC   Text Chat from Customer

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer Reload page
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    Reload Page
#    Sleep   2
#    Handle Alert    accept
    Sleep   10

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify contact interaction in the tooltip of Touchpoint still display
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Customer Journey
    Selenium2Library.Scroll Element Into View   ${LOC_CUSTOMER_JOURNEY_REFETCH_BTN}
    Click element    ${LOC_CUSTOMER_JOURNEY_REFETCH_BTN}
    Sleep   1
#    Verify Touchpoint Tooltip   WC   Text Chat History
    Show Current Touchpoint    ${CUST5_EMAIL}     WC   Text Chat History
    Show Current Touchpoint    ${CUST5_EMAIL}     WC   AgentId: ${AGENT2_ID}
    Show Current Touchpoint    ${CUST5_EMAIL}     WC   Text Chat History with Whispers
    Show Current Touchpoint    ${CUST5_EMAIL}     WC   Text Chat from Customer

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   2
    WorkCard.Agent Ends A Contact     ${CUST5_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     2/12/2020
CC19902 35 Robustness - Customer Journey displays after agent refresh of browser
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
    WebChat.Customer Init A Chat Session     ${CUST5_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST5_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip    ${CUST5_EMAIL}   WC   ${EMPTY}
    Show Current Touchpoint     ${CUST5_EMAIL}    WC   Text Chat from Customer

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Reload page
    Reload Page
    Sleep   2
    Handle Alert    accept
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify contact interaction in the tooltip of Touchpoint still display
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip    ${CUST5_EMAIL}   WC   ${EMPTY}
    Show Current Touchpoint     ${CUST5_EMAIL}    WC   Text Chat from Customer

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST5_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     3/12/2020
CC19902 36 Robustness - Customer Journey displays after browser is killed
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
    WebChat.Customer Init A Chat Session     ${CUST5_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST5_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip    ${CUST5_EMAIL}   WC   ${EMPTY}
    Show Current Touchpoint     ${CUST5_EMAIL}    WC   Text Chat from Customer

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Kill browser of Agent
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Close Browser
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Re-login Agent
    Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}
    Login.Activate Agent
    Sleep   1

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify contact interaction in the tooltip of Touchpoint still display
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip    ${CUST5_EMAIL}   WC   ${EMPTY}
    Show Current Touchpoint     ${CUST5_EMAIL}    WC   Text Chat from Customer

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST5_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     3/12/2020
CC19902 37 Verify the customer journey widget displayed correctly when we set Time range selection
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
    WebChat.Customer Init A Chat Session     ${CUST5_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST5_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify contact interaction in the tooltip of Touchpoint
    NavigationMenu.Open Customer Journey
    Verify Touchpoint Tooltip   ${CUST5_EMAIL}   WC   ${EMPTY}
    Select Time Range Touchpoint    Last 7 days
    Show Current Touchpoint     ${CUST5_EMAIL}   WC   Text Chat from Customer

    Selenium2Library.Scroll Element Into View   ${LOC_CUSTOMER_JOURNEY_REFETCH_BTN}
    Click element    ${LOC_CUSTOMER_JOURNEY_REFETCH_BTN}
    Sleep   0.5
    Select Time Range Touchpoint    Last 15 days
    Show Current Touchpoint     ${CUST5_EMAIL}   WC   Text Chat from Customer

    Selenium2Library.Scroll Element Into View   ${LOC_CUSTOMER_JOURNEY_REFETCH_BTN}
    Click element    ${LOC_CUSTOMER_JOURNEY_REFETCH_BTN}
    Sleep   0.5
    Select Time Range Touchpoint    Last 30 days
    Show Current Touchpoint     ${CUST5_EMAIL}   WC   Text Chat from Customer

    Selenium2Library.Scroll Element Into View   ${LOC_CUSTOMER_JOURNEY_REFETCH_BTN}
    Click element    ${LOC_CUSTOMER_JOURNEY_REFETCH_BTN}
    Sleep   0.5
    Select Time Range Touchpoint    Last 60 days
    Show Current Touchpoint     ${CUST5_EMAIL}   WC   Text Chat from Customer

    Selenium2Library.Scroll Element Into View   ${LOC_CUSTOMER_JOURNEY_REFETCH_BTN}
    Click element    ${LOC_CUSTOMER_JOURNEY_REFETCH_BTN}
    Sleep   0.5
    Select Time Range Touchpoint    Show all
    Show Current Touchpoint     ${CUST5_EMAIL}   WC   Text Chat from Customer

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST5_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     3/11/2020
CC19902 38 Verify the WC Touchpoints do not display when turning off CJ label
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
    WebChat.Customer Init A Chat Session     ${CUST5_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST5_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Touchpoint does not display when turning off Chat label
    NavigationMenu.Open Customer Journey
    ${loc_touchpoint_label}=    String.Format String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT_LABEL}    label chat
    Wait Until Element Is Visible    ${loc_touchpoint_label}   timeout=5
    Click Element   ${loc_touchpoint_label}
    Sleep   1
    ${loc_touchpoint}=    String.Format String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT1}    CH
    @{touchpoint_elements}=    Get WebElements     ${loc_touchpoint}
    ${touchpoint_total}=    Get Length    ${touchpoint_elements}
    Should Be Equal    '${touchpoint_total}'    '1'

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Touchpoint displays when turning on Chat label again
    Click Element   ${loc_touchpoint_label}
    Sleep   1
    ${loc_touchpoint}=    String.Format String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT1}    CH
    @{touchpoint_elements}=    Get WebElements     ${loc_touchpoint}
    ${touchpoint_total}=    Get Length    ${touchpoint_elements}
    Should Not Be Equal    '${touchpoint_total}'    '1'

    # STEP 5: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST5_EMAIL}
    Sleep   2

#=======================================================================================================================

#Created date:     3/11/2020
CC19902 38 Verify the WC Touchpoints do not display when turning off CJ label
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

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email with attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}     ${ATTACH_LINK_1}
    Sleep   1
    Outlook.Send Email
    Sleep   2
    Outlook.Delete Old Email
    Sleep   1
    Outlook.Close Outlook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email from Customer 1, verify the attachment displays correctly
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Touchpoint does not display when turning off Chat label
    NavigationMenu.Open Customer Journey
    ${loc_touchpoint_label}=    String.Format String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT_LABEL}    label email
    Wait Until Element Is Visible    ${loc_touchpoint_label}   timeout=5
    Click Element   ${loc_touchpoint_label}
    Sleep   1
    ${loc_touchpoint}=    String.Format String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT1}    EM
    @{touchpoint_elements}=    Get WebElements     ${loc_touchpoint}
    ${touchpoint_total}=    Get Length    ${touchpoint_elements}
    Should Be Equal    '${touchpoint_total}'    '1'

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Touchpoint displays when turning on Chat label again
    Click Element   ${loc_touchpoint_label}
    Sleep   1
    ${loc_touchpoint}=    String.Format String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT1}    EM
    @{touchpoint_elements}=    Get WebElements     ${loc_touchpoint}
    ${touchpoint_total}=    Get Length    ${touchpoint_elements}
    Should Not Be Equal    '${touchpoint_total}'    '1'

    # STEP 5: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

#=======================================================================================================================

# Created date:     7/12/2020
CC19902 40 Verify the Voice Touchpoints do not display when turning off CJ label
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
#    ...     Sleep   1
#    ...     AvayaIX.Close AvayaIX    AND
#    ...     Sleep   1
    ...     OneXCommunicator.Close OneX      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes CDN call to Agent 1
    OneXCommunicator.OneX Call Out      ${CDN1}
    Sleep   3

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts CDN call
    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Touchpoint does not display when turning off Voice label
    NavigationMenu.Open Customer Journey
    ${loc_touchpoint_label}=    String.Format String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT_LABEL}    label voice
    Wait Until Element Is Visible    ${loc_touchpoint_label}   timeout=5
    Click Element   ${loc_touchpoint_label}
    Sleep   1
    ${loc_touchpoint}=    String.Format String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT1}    VO
    @{touchpoint_elements}=    Get WebElements     ${loc_touchpoint}
    ${touchpoint_total}=    Get Length    ${touchpoint_elements}
    Should Be Equal    '${touchpoint_total}'    '1'

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Touchpoint displays when turning on Voice label again
    Click Element   ${loc_touchpoint_label}
    Sleep   1
    ${loc_touchpoint}=    String.Format String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT1}    VO
    @{touchpoint_elements}=    Get WebElements     ${loc_touchpoint}
    ${touchpoint_total}=    Get Length    ${touchpoint_elements}
    Should Not Be Equal    '${touchpoint_total}'    '1'

    # STEP 5: Agent 1 ends call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 1 ends call
    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
    Sleep   1

#=======================================================================================================================
