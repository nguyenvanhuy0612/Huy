*** Settings ***
Resource    ../resources/Resources_CC_20037_WS_Customer_record_update_and_create.robot



*** Test Cases ***
#=======================================================================================================================
#Created date:     18/02/2021
CC-20037_TC002 - MM only Agent is able to Add customer information on Workspaces while handling No contact
    [Setup]    Run Keywords    Sleep    5    AND
    #   Login MM only agent 1 to workspaces, start work and go ready
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a MM only Agent into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Create a customer Record while agent handling no contact
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success


#=======================================================================================================================
#Created date:     /2021
CC-20037_TC003 - MM only Agent is able to Add customer information on Workspaces while handling direct EM contact
    [Setup]    Run Keywords    Sleep    5    AND
    #   Login MM only agent 1 to workspaces, start work and go ready
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a MM only Agent into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Accept an EM contact
    Customer Sent An Email      ${MM_AGENT1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}

    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Create a customer Record while agent handling EM contact
    NavigationMenu.Open Customer Search
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Release the contact
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}

#=======================================================================================================================
#Created date:     /2021
CC-20037_TC004 - MM only Agent is able to Add customer information on Workspaces while handling direct WC contact
    [Setup]    Run Keywords    Sleep    5    AND
    #   Login MM only agent 1 to workspaces, start work and go ready
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a MM only Agent into Workspaces
    # Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep   2
    WebChat.Customer Init A Chat Session    ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${MM_AGENT1.SKILLSET_WC1}
    Sleep   2

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Accept an EWC contact
    # Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Create a customer Record while agent handling EM contact
    NavigationMenu.Open Customer Search
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Release the contact
    WorkCard.Agent Ends A Contact     ${CUST6_EMAIL}


#=======================================================================================================================
#Created date:     /2021
CC-20037_TC005 - MM only Agent is able to Add customer information on Workspaces while handling transferred EM contact to the same skillset
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${MM_AGENT3.USERNAME}    ${MM_AGENT3.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Another Agent accepted an EM contact and transfer to same EM skillset

    # Customer send email to agent 3
    Customer Sent An Email    ${MM_AGENT1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    5
    # Agent 3 accept EM
    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    Sleep   3
    # Agent 3 transfer to same skillset
    WorkCard.Transfer To Service    ${CUST2_EMAIL}      ${MM_AGENT1.SKILLSET_EM1}
    Sleep    3
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a transferred EM
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Create a customer Record while agent handling EM contact
    NavigationMenu.Open Customer Search
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Release the contact
    WorkCard.Agent Ends A Contact    ${CUST2_EMAIL}


#=======================================================================================================================
#Created date:     /2021
CC-20037_TC006 - MM only Agent is able to Add customer information on Workspaces while handling transferred EM contact to Skillset
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${MM_AGENT3.USERNAME}    ${MM_AGENT3.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Another Agent accepted an EM contact and transfer to same EM skillset

    # Customer send email to agent 3
    Customer Sent An Email    ${MM_AGENT1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    5
    # Agent 3 accept EM
    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    Sleep   3
    # Agent 3 transfer to same skillset
    WorkCard.Transfer To Service    ${CUST2_EMAIL}      ${MM_AGENT1.SKILLSET_EM2}
    Sleep    3
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a transferred EM
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Create a customer Record while agent handling EM contact
    NavigationMenu.Open Customer Search
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Release the contact
    WorkCard.Agent Ends A Contact    ${CUST2_EMAIL}


#=======================================================================================================================
#Created date:     /2021
CC-20037_TC007 - MM only Agent is able to Add customer information on Workspaces while handling transferred WC contact to the same skillset
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${MM_AGENT3.USERNAME}    ${MM_AGENT3.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Another Agent accepted an EWC contact and transfer to same EWC skillset
    # Customer send EWC contact
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep    2
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${MM_AGENT1.SKILLSET_WC1}
    Sleep    4
    # Agent accept EWC
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}

    Sleep    1
    WorkCard.Agent Accepts A Contact     ${CUST6_EMAIL}
    Sleep   3
    # Agent 3 transfer to same skillset
    WorkCard.Transfer To Service    ${CUST6_EMAIL}      ${MM_AGENT1.SKILLSET_WC1}
    Sleep    3
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a transferred EM
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Create a customer Record while agent handling EM contact
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Release the contact
    WorkCard.Agent Ends A Contact    ${CUST6_EMAIL}

#=======================================================================================================================
#Created date:     /2021
CC-20037_TC008 - MM only Agent is able to Add customer information on Workspaces while handling transferred WC contact to Skillset
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${MM_AGENT2.USERNAME}    ${MM_AGENT2.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Another Agent accepted an EWC contact and transfer to other EWC skillset
    # Customer send EWC contact
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep    2
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${MM_AGENT2.SKILLSET_WC1}
    Sleep    7
    # Agent accept EWC
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}

    Sleep    1
    WorkCard.Agent Accepts A Contact     ${CUST6_EMAIL}
    Sleep   3
    # Agent 3 transfer to same skillset
    WorkCard.Transfer To Service    ${CUST6_EMAIL}      ${MM_AGENT1.SKILLSET_WC2}
    Sleep    3
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}


    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a transferred EM
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Create a customer Record while agent handling EM contact
    Sleep    8
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Release the contact
    WorkCard.Agent Ends A Contact    ${CUST6_EMAIL}

#=======================================================================================================================
# Created date:     /2021
# TODO cannot transfer to agent
Skip - CC-20037_TC009 - MM only Agent is able to Add customer information on Workspaces while handling transferred WC contact to Agent
    [Tags]    Skip

#=======================================================================================================================
#Created date:     /2021
CC-20037_TC010 - Blended Agent is able to Add customer information on Workspaces while handling No contact
    [Setup]    Run Keywords    Sleep    5    AND
    #   Login MM only agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_4}    ${BROWSER_AGENT_ALIAS_4}    ${BL_AGENT4.USERNAME}    ${BL_AGENT4.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_4}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a BL Agent 4 into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Create a customer Record while agent handling no contact
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

#=======================================================================================================================
#Created date:     /2021
CC-20037_TC011 - Blended Agent is able to Add customer information on Workspaces while handling direct DN call
    [Setup]    Run Keywords    Sleep    5    AND
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a Blended Agent into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts DN call
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${BL_AGENT1.PHONE_NUMBER}
    WorkCard.Agent Accepts Any New Contact

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Create a customer Record while agent handling no contact
    Sleep    8
    NavigationMenu.Open Customer Search
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent release contact
    WorkCard.Agent Release Any Contact

#=======================================================================================================================
#Created date:     /2021
CC-20037_TC012 - Blended Agent is able to Add customer information on Workspaces while handling direct CDN call
    [Setup]    Run Keywords    Sleep    5    AND
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_3}    ${BROWSER_AGENT_ALIAS_3}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_3}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a Blended Agent into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts CDN call
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${CDN_55087}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE_E164}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Create a customer Record while agent handling no contact
    Sleep    8
    NavigationMenu.Open Customer Search
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent release contact
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE_E164}

#=======================================================================================================================
#Created date:     /2021
# TODO video call
Skip - CC-20037_TC013 - Blended Agent is able to Add customer information on Workspaces while handling direct Video contact
    [Tags]    Skip

#=======================================================================================================================
#Created date:     /2021
CC-20037_TC014 - Blended Agent is able to Add customer information on Workspaces while handling direct EM contact
    [Setup]    Run Keywords    Sleep    5    AND
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_4}    ${BROWSER_AGENT_ALIAS_4}    ${BL_AGENT4.USERNAME}    ${BL_AGENT4.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_4}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a Blended Agent into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    # Open Outlook, from customer sent to Server the Email without attachment
    Customer Sent An Email      ${BL_AGENT4.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep   5
    # Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    Sleep   3

    # STEP 3
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Create a customer Record while agent handling the contact
    NavigationMenu.Open Customer Search
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04   Release the contact
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}

#=======================================================================================================================
#Created date:     /2021
# TODO Oanh written
Skip - CC-20037_TC015 - Blended Agent is able to Add customer information on Workspaces while handling direct WC contact
    [Tags]    Skip
#=======================================================================================================================
#Created date:     /2021
CC-20037_TC016 - Blended Agent is able to Add customer information on Workspaces while handling transferred DN call from DN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT5.USERNAME}    ${BL_AGENT5.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a DN call and transferred this call to the Blended Agent.

    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${BL_AGENT5.PHONE_NUMBER}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE}

    WorkCard.Transfer Team Call     ${EMPTY}     ${BL_AGENT1.FULLNAME}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent accepts this call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT5.PHONE_NUMBER}

    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${EMPTY}
    Wait Until Element Is Not Visible    ${LOC_WORKCARD_HEADER}     10s

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent creates a customer Record while handling transferred Call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    5
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent release contact
    WorkCard.Agent Ends A Contact    ${EMPTY}

#=======================================================================================================================
#Created date: Apr 01, 2021
CC-20037_TC017 - Blended Agent is able to Add customer information on Workspaces while handling transferred DN call from CDN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT5.USERNAME}    ${BL_AGENT5.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a DN call and transferred this call to CDN

    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${BL_AGENT5.PHONE_NUMBER}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE}

    WorkCard.Transfer Extension Call    ${EMPTY}    ${CDN_55087}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent accepts this call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT5.PHONE_NUMBER}

    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${EMPTY}
    Wait Until Element Is Not Visible    ${LOC_WORKCARD_HEADER}     10s

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent creates a customer Record while handling transferred Call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    NavigationMenu.Open Customer Search
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent release contact
    WorkCard.Agent Ends A Contact    ${EMPTY}

#=======================================================================================================================
#Created date: Apr 01, 2021
CC-20037_TC018 - Blended Agent is able to Add customer information on Workspaces while handling transferred CDN call from DN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT5.USERNAME}    ${BL_AGENT5.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a CDN call and transferred this call to DN

    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${CDN_55087}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE_E164}

    WorkCard.Transfer Extension Call    ${CUST8.PHONE_E164}    ${BL_AGENT1.PHONE_NUMBER}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent accepts this call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT5.PHONE_NUMBER}

    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CUST8.PHONE_E164}
    Wait Until Element Is Not Visible    ${LOC_WORKCARD_HEADER}     10s

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent creates a customer Record while handling transferred Call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    NavigationMenu.Open Customer Search
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent release contact
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE_E164}

#=======================================================================================================================
#Created date: Apr 01, 2021
CC-20037_TC019 - Blended Agent is able to Add customer information on Workspaces while handling transferred CDN call from CDN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT5.USERNAME}    ${BL_AGENT5.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a CDN call and transferred this call to CDN

    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${CDN_55087}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE_E164}

    WorkCard.Transfer Extension Call    ${CUST8.PHONE_E164}    ${CDN_55087}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent accepts this call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT5.PHONE_NUMBER}

    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CUST8.PHONE_E164}
    Wait Until Element Is Not Visible    ${LOC_WORKCARD_HEADER}     10s

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent creates a customer Record while handling transferred Call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    NavigationMenu.Open Customer Search
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent release contact
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE_E164}

#=======================================================================================================================
#Created date:     /2021
# TODO limit Viceo call
Skip - CC-20037_TC020 - Blended Agent is able to Add customer information on Workspaces while handling transferred Video contact
    [Tags]    Skip
#=======================================================================================================================
#Created date:     /2021
#TODO Oanh written
Skip - CC-20037_TC021 - Blended Agent is able to Add customer information on Workspaces while handling transferred EM contact to Skillset
    [Tags]    Skip
#=======================================================================================================================
#Created date: Apr-02/2021
CC-20037_TC022 - Blended Agent is able to Add customer information on Workspaces while handling transferred WC contact to Skillset
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT5.USERNAME}    ${BL_AGENT5.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted an WC contact and transferred this contact to another skillset
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep    2
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${BL_AGENT5.SKILLSET_WC1}
    Sleep   5
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST6.NAME}
    Sleep   2
    WorkCard.Transfer To Service    ${CUST6.NAME}      ${BL_AGENT1.SKILLSET_WC1}


    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent accepts this contact.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT5.PHONE_NUMBER}

    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CUST6.NAME}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent creates a customer Record while handling transferred Call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    NavigationMenu.Open Customer Search
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent release contact
    WorkCard.Agent Ends A Contact    ${CUST6.NAME}

#=======================================================================================================================
#Created date: Apr-02/2021
CC-20037_TC023 - Blended Agent is able to Add customer information on Workspaces while handling conferenced DN call to DN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT5.USERNAME}    ${BL_AGENT5.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a DN call and conferenced DN call

    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${BL_AGENT5.PHONE_NUMBER}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE}

    WorkCard.Consult Extension Call    ${EMPTY}    ${BL_AGENT1.PHONE_NUMBER}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent accepts this call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT5.PHONE_NUMBER}

    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${EMPTY}


    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent creates a customer Record while handling transferred Call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent release contact
    WorkCard.Agent Ends A Contact    ${EMPTY}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${EMPTY}

#=======================================================================================================================
#Created date: Apr-02/2021
CC-20037_TC024 - Blended Agent is able to Add customer information on Workspaces while handling conferenced DN call to CDN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT5.USERNAME}    ${BL_AGENT5.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a DN call and conferenced CDN call

    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${BL_AGENT5.PHONE_NUMBER}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE}

    WorkCard.Consult Extension Call    ${EMPTY}    ${CDN_55087}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent accepts this call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT5.PHONE_NUMBER}

    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${EMPTY}


    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent creates a customer Record while handling transferred Call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent release contact
    WorkCard.Agent Ends A Contact    ${EMPTY}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${EMPTY}

#=======================================================================================================================
#Created date:  Apr 8/2021
CC-20037_TC025 - Blended Agent is able to Add customer information on Workspaces while handling conferenced CDN call to DN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT2.USERNAME}    ${BL_AGENT2.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a CDN call and conferenced DN call

    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${CDN_55048}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE_E164}

    WorkCard.Consult Extension Call    ${CUST8.PHONE_E164}    ${BL_AGENT1.PHONE_NUMBER}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent accepts this call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT2.PHONE_NUMBER}

    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${CUST8.PHONE_E164}


    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent creates a customer Record while handling conferenced Call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent release contact
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE_E164}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE_E164}


#=======================================================================================================================
#Created date: Apr 8/2021
CC-20037_TC026 - Blended Agent is able to Add customer information on Workspaces while handling conferenced CDN call to CDN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT2.USERNAME}    ${BL_AGENT2.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a CDN call and conferenced DN call

    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${CDN_55048}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE_E164}

    WorkCard.Consult Extension Call    ${CUST8.PHONE_E164}    ${CDN_55048}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent accepts this call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    Sleep    2
    WorkCard.Agent Accepts A Contact    ${BL_AGENT2.PHONE_NUMBER}

    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${CUST8.PHONE_E164}


    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent creates a customer Record while handling conferenced Call.
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent release contact
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE_E164}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE_E164}


#=======================================================================================================================
#Created date: /2021
# Todo Video limit
Skip - CC-20037_TC027 - Blended Agent is able to Add customer information on Workspaces while handling conferenced Video contact
    [Tags]    Skip

#=======================================================================================================================
#Created date: Apr 8/2021
CC-20037_TC028 - MM only Agent is able to Edit customer information on Workspaces while handling No contact
    [Setup]    Run Keywords    Sleep    5    AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login MM Agent into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    MM Agent creates a customer, search an Existing Customer Record
    # 2.1 Create customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 2.2 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 2.3 Verify email customer in search result
    Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Edit the customer Record while agent handling no contact.
    # 3. Edit customer info
    # 3.1 Customer address
    # 3.1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 3.1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 3.1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 3.1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1


#=======================================================================================================================
#Created date: Apr 12/2021
CC-20037_TC029 - MM only Agent is able to Edit customer information on Workspaces while handling direct EM contact
    [Setup]    Run Keywords    Sleep    5    AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login MM Agent into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    MM Agent Accept an EM contact and search an Existing Customer Record
    # 2.1 Agent accept an EM
    # 2.1.1 Customer send new email to agent
    Customer Sent An Email      ${MM_AGENT1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    # 2.1.2 Agent accepst EM
    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    Sleep   3
    # 2.2 Create customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 2.3 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 2.4 Verify email customer in search result
    Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Edit the customer Record while agent handling no contact.
    # 3. Edit customer info
    # 3.1 Customer address
    # 3.1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 3.1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 3.1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 3.1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 3.1.5 Remove customer address

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Release the contact
    WorkCard.Agent Ends A Contact    ${CUST2_EMAIL}

#=======================================================================================================================
#Huy, date: Apr 13,2021
CC-20037_TC030 - MM only Agent is able to Edit customer information on Workspaces while handling direct WC contact
    [Setup]    Run Keywords    Sleep    5    AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login MM Agent into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    MM Agent Accept an EWC contact and search an Existing Customer Record
    # 2.1 Agent accept an EWC
    # 2.1.1 Customer send new chat to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep    2
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${MM_AGENT1.SKILLSET_WC1}
    Sleep   7
    # 2.1.2 Agent accepst chat
	Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    Sleep   3
    # 2.2 Create customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 2.3 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 2.4 Verify email customer in search result
    Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Edit the customer Record while agent handling no contact.
    # 3. Edit customer info
    # 3.1 Customer address
    # 3.1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 3.1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 3.1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 3.1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 3.1.5 Remove customer address

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Release the contact
    WorkCard.Agent Ends A Contact    ${CUST6_EMAIL}


#=======================================================================================================================
#Huy, date: Apr 13,2021
CC-20037_TC031 - MM only Agent is able to Edit customer information on Workspaces while handling transferred EM contact to the same skillset
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${MM_AGENT3.USERNAME}    ${MM_AGENT3.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Login MM only Agent: MM_AGENT1 into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02     Have another Agent: MM_AGENT3 accepted an EM contact and transferred this contact to same skillset.
    # Customer send email to MM_AGENT2
    Customer Sent An Email    ${MM_AGENT3.MAIL1}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    5
    # MM_AGENT2 accept EM
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    Sleep   3
    # MM_AGENT2 transfer to same skillset
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep    3
    WorkCard.Transfer To Service    ${CUST2_EMAIL}      ${MM_AGENT3.SKILLSET_EM1}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    MM Only Agent accepts this contact and search an Existing Customer Record
    # 3.1 MM_AGENT1 Accepts transfered EM
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}
    # 3.2 Delete customer and create a new one
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 3.3 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3.4 Verify email customer in search result
    Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    MM only Agent Edits the customer Record while handling transferred contact
    # 4. Edit customer info
    # 4.1 Customer address
    # 4.1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 4.1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 4.1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 4.1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 4.1.5 Remove customer address - on go

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Release the contact
    WorkCard.Agent Ends A Contact    ${CUST2_EMAIL}

#=======================================================================================================================
#Huy, date: Apr 14,2021
CC-20037_TC032 - MM only Agent is able to Edit customer information on Workspaces while handling transferred EM contact to Skillset
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${MM_AGENT3.USERNAME}    ${MM_AGENT3.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Login MM only Agent: MM_AGENT1 into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02     Have another Agent: MM_AGENT3 accepted an EWC contact and transferred this contact to another skillset.
    # Customer send email to MM_AGENT2
    Customer Sent An Email    ${MM_AGENT3.MAIL1}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    5
    # MM_AGENT2 accept EM
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    Sleep   3
    # MM_AGENT2 transfer to different skillset
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep    3
    WorkCard.Transfer To Service    ${CUST2_EMAIL}      ${MM_AGENT3.SKILLSET_EM2}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    MM Only Agent accepts this contact and search an Existing Customer Record
    # 3.1 MM_AGENT1 Accepts transfered EM
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}
    # 3.2 Delete customer and create a new one
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 3.3 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3.4 Verify email customer in search result
    Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    MM only Agent Edits the customer Record while handling transferred contact
    # 4. Edit customer info
    # 4.1 Customer address
    # 4.1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 4.1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 4.1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 4.1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 4.1.5 Remove customer address - on go

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Release the contact
    WorkCard.Agent Ends A Contact    ${CUST2_EMAIL}


#=======================================================================================================================
#Huy, date: Apr 14,2021
CC-20037_TC033 - MM only Agent is able to Edit customer information on Workspaces while handling transferred WC contact to the same skillset
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${MM_AGENT3.USERNAME}    ${MM_AGENT3.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Login MM only Agent: MM_AGENT1 into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02     Have another Agent: MM_AGENT3 accepted an EM contact and transferred this contact to same skillset.
    # 2.1 Agent accept an EWC
    # 2.1.1 Customer send new chat to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep    2
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${MM_AGENT2.SKILLSET_WC1}
    Sleep   7
    # 2.1.2 Agent accepst chat
	Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    Sleep   3
    # MM_AGENT2 transfer to same skillset
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep    3
    WorkCard.Transfer To Service    ${CUST6_EMAIL}      ${MM_AGENT3.SKILLSET_WC1}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    MM Only Agent accepts this contact and search an Existing Customer Record
    # 3.1 MM_AGENT1 Accepts transfered EM
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    # 3.2 Delete customer and create a new one
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 3.3 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3.4 Verify email customer in search result
    Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    MM only Agent Edits the customer Record while handling transferred contact
    # 4. Edit customer info
    # 4.1 Customer address
    # 4.1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 4.1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 4.1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 4.1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 4.1.5 Remove customer address - on go

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Release the contact
    WorkCard.Agent Ends A Contact    ${CUST6_EMAIL}


#=======================================================================================================================
#Huy, date: Apr 15,2021
CC-20037_TC034 - MM only Agent is able to Edit customer information on Workspaces while handling transferred WC contact to Skillset
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${MM_AGENT3.USERNAME}    ${MM_AGENT3.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Login MM only Agent: MM_AGENT1 into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02     Have another Agent: MM_AGENT3 accepted an EM contact and transferred this contact to other skillset.
    # 2.1 Agent accept an EWC
    # 2.1.1 Customer send new chat to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep    2
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${MM_AGENT2.SKILLSET_WC1}
    Sleep   7
    # 2.1.2 Agent accepst chat
	Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    Sleep   3
    # MM_AGENT2 transfer to same skillset
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep    3
    WorkCard.Transfer To Service    ${CUST6_EMAIL}      ${MM_AGENT3.SKILLSET_WC2}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    MM Only Agent accepts this contact and search an Existing Customer Record
    # 3.1 MM_AGENT1 Accepts transfered EM
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    # 3.2 Delete customer and create a new one
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 3.3 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3.4 Verify email customer in search result
    Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    MM only Agent Edits the customer Record while handling transferred contact
    # 4. Edit customer info
    # 4.1 Customer address
    # 4.1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 4.1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 4.1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 4.1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 4.1.5 Remove customer address - on go

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Release the contact
    WorkCard.Agent Ends A Contact    ${CUST6_EMAIL}


#=======================================================================================================================
#Huy, date: Apr 15,2021
CC-20037_TC035 - Blended Agent is able to Edit customer information on Workspaces while handling No contact
    [Setup]    Run Keywords    Sleep    5    AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login BL Agent into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    BL Agent creates a customer, search an Existing Customer Record
    # 2.1 Create customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 2.2 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 2.3 Verify email customer in search result
    Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Edit the customer Record while agent handling no contact.
    # 3. Edit customer info
    # 3.1 Customer address
    # 3.1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 3.1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 3.1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 3.1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1


#=======================================================================================================================
#Huy, date: Apr 15,2021
CC-20037_TC036 - Blended Agent is able to Edit customer information on Workspaces while handling direct DN call
    [Setup]    Run Keywords    Sleep    5    AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login BL Agent into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Accept a DN call
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${BL_AGENT1.PHONE_NUMBER}
    WorkCard.Agent Accepts Any New Contact

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    BL Agent creates a customer, search an Existing Customer Record
    # 1 Create customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 2 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3 Verify email customer in search result
    CustomerSearch.Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Edit the customer Record while agent handling no contact.
    # Edit customer info
    # 1 Customer address
    # 1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1


#=======================================================================================================================
#Huy, date: Apr 16,2021
CC-20037_TC037 - Blended Agent is able to Edit customer information on Workspaces while handling direct CDN call
    [Setup]    Run Keywords    Sleep    5    AND
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login BL Agent into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Accept a CDN call
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${CDN_55086}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE_E164}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    BL Agent creates a customer, search an Existing Customer Record
    # 1 Create customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    Sleep    2
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 2 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3 Verify email customer in search result
    CustomerSearch.Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Edit the customer Record while agent handling no contact.
    # Edit customer info
    # 1 Customer address
    # 1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 2. Edit customer phone
    # 2.1 Verify customer phone number
    CustomerSearch.Verify Customer Telephone Number    ${NEW CUST1.Intl}${NEW CUST1.Number}
    # 2.2 Edit customer phone
    CustomerSearch.Edit Customer Telephone      ${MODIFY CUST1.phoneType}   10    20    ${MODIFY CUST1.Number}  ${False}    ${False}
    # 2.3 Verify new cus phone number was edited
    Log To Console    due to jira CC-23126 is open, need to use intl and area to number and not empty
    CustomerSearch.Verify Customer Telephone Number     1020${MODIFY CUST1.Number}



# TODO video call limit
Skip - CC-20037_TC038 - Blended Agent is able to Edit customer information on Workspaces while handling direct Video contact
    [Tags]    Skip

#=======================================================================================================================
#Huy, date: Apr 19,2021
CC-20037_TC039 - Blended Agent is able to Edit customer information on Workspaces while handling direct EM contact
	[Setup]    Run Keywords    Sleep    5    AND
    #   Login blended agent 1 to workspaces, start work and go ready
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a Blended Agent into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Accept an EM contact and search an Existing Customer Record
    # 1. Open Outlook, from customer sent to Server the Email without attachment
    Customer Sent An Email      ${BL_AGENT1.MAIL1}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep   5
    # 1. Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    Sleep   3
    # 2. Create customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    Sleep    2
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 3. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 4. Verify email customer in search result
    CustomerSearch.Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Edit the customer Record while agent handling the contact
    # Edit customer info
    # 1 Customer address
    # 1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 2. Edit customer phone
    # 2.1 Verify customer phone number
    CustomerSearch.Verify Customer Telephone Number    ${NEW CUST1.Intl}${NEW CUST1.Number}
    # 2.2 Edit customer phone
    CustomerSearch.Edit Customer Telephone      ${MODIFY CUST1.phoneType}   10    20    ${MODIFY CUST1.Number}  ${False}    ${False}
    # 2.3 Verify new cus phone number was edited
    Log To Console    due to jira CC-23126 is open, need to use intl and area to number and not empty
    CustomerSearch.Verify Customer Telephone Number     1020${MODIFY CUST1.Number}

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04   Release the contact
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}


#=======================================================================================================================
#Huy, date: Apr 19,2021
CC-20037_TC040 - Blended Agent is able to Edit customer information on Workspaces while handling direct WC contact
    [Setup]    Run Keywords    Sleep    5    AND
    #   Login blended agent 1 to workspaces, start work and go ready
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a Blended Agent into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Accept an EWC contact and search an Existing Customer Record
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
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    Sleep    2
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 3. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 4. Verify email customer in search result
    CustomerSearch.Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Edit the customer Record while agent handling the contact
    # Edit customer info
    # 1 Customer address
    # 1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 2. Edit customer phone
    # 2.1 Verify customer phone number
    CustomerSearch.Verify Customer Telephone Number    ${NEW CUST1.Intl}${NEW CUST1.Number}
    # 2.2 Edit customer phone
    CustomerSearch.Edit Customer Telephone      ${MODIFY CUST1.phoneType}   10    20    ${MODIFY CUST1.Number}  ${False}    ${False}
    # 2.3 Verify new cus phone number was edited
    Log To Console    due to jira CC-23126 is open, need to use intl and area to number and not empty
    CustomerSearch.Verify Customer Telephone Number     1020${MODIFY CUST1.Number}

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04   Release the contact
    WorkCard.Agent Ends A Contact     ${CUST6_EMAIL}


#=======================================================================================================================
#Huy, date: Apr 19,2021
CC-20037_TC041 - Blended Agent is able to Edit customer information on Workspaces while handling transferred DN call from DN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT2.USERNAME}    ${BL_AGENT2.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a DN call and transferred this call to the Blended Agent.
    # 1. Customer login phone
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    # 2. Customer make DN call
    AvayaIXworkplaceLib.Make Call To Number    ${BL_AGENT2.PHONE_NUMBER}
    # 3. Agent 2 accepts call
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE}
    # 4. Agent 2 consult transfer to DN
    WorkCard.Transfer Team Call     ${CUST8.PHONE}     ${BL_AGENT1.FULLNAME}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Have another Agent accepted a DN call and transferred this call to the Blended Agent.
    # 1. Agent 1 go ready and accept DN transferred call
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT2.PHONE_NUMBER}
    # 2. Agent 2 complete transfer
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CUST8.PHONE}
    Wait Until Element Is Not Visible    ${LOC_WORKCARD_HEADER}     10s

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent accepts this call and create, search customer Record while handling transferred Call.
    # 1. Detele exist customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    Sleep    2
    # 2. Create new customer
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 3. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 4. Verify email customer in search result
    CustomerSearch.Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Edit the customer Record while agent handling the contact
    # Edit customer info
    # 1 Customer address
    # 1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 2. Edit customer phone
    # 2.1 Verify customer phone number
    CustomerSearch.Verify Customer Telephone Number    ${NEW CUST1.Intl}${NEW CUST1.Number}
    # 2.2 Edit customer phone
    CustomerSearch.Edit Customer Telephone      ${MODIFY CUST1.phoneType}   10    20    ${MODIFY CUST1.Number}  ${False}    ${False}
    # 2.3 Verify new cus phone number was edited
    Log To Console    due to jira CC-23126 is open, need to use intl and area is a non-empty number
    CustomerSearch.Verify Customer Telephone Number     1020${MODIFY CUST1.Number}

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04   Release the contact
    WorkCard.Agent Ends A Contact    ${EMPTY}


#=======================================================================================================================
#Huy, date: Apr 19,2021
CC-20037_TC042 - Blended Agent is able to Edit customer information on Workspaces while handling transferred DN call from CDN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT2.USERNAME}    ${BL_AGENT2.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a DN call and transferred this call to the Blended Agent.
    # 1. Customer login phone
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    # 2. Customer make DN call
    AvayaIXworkplaceLib.Make Call To Number    ${BL_AGENT2.PHONE_NUMBER}
    # 3. Agent 2 accepts call
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE}
    # 4. Agent 2 consult transfer to DN
    WorkCard.Transfer Extension Call    ${CUST8.PHONE}     ${CDN_55087}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Have another Agent accepted a DN call and transferred this call to the Blended Agent.
    # 1. Agent 1 go ready and accept DN transferred call
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT2.PHONE_NUMBER}
    # 2. Agent 2 complete transfer
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${EMPTY}
    Wait Until Element Is Not Visible    ${LOC_WORKCARD_HEADER}     10s

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent accepts this call and create, search customer Record while handling transferred Call.
    # 1. Detele exist customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    Sleep    2
    # 2. Create new customer
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 3. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 4. Verify email customer in search result
    CustomerSearch.Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Edit the customer Record while agent handling the contact
    # Edit customer info
    # 1 Customer address
    # 1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 2. Edit customer phone
    # 2.1 Verify customer phone number
    CustomerSearch.Verify Customer Telephone Number    ${NEW CUST1.Intl}${NEW CUST1.Number}
    # 2.2 Edit customer phone
    CustomerSearch.Edit Customer Telephone      ${MODIFY CUST1.phoneType}   10    20    ${MODIFY CUST1.Number}  ${False}    ${False}
    # 2.3 Verify new cus phone number was edited
    Log To Console    due to jira CC-23126 is open, need to use intl and area is a non-empty number
    CustomerSearch.Verify Customer Telephone Number     1020${MODIFY CUST1.Number}

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04   Release the contact
    WorkCard.Agent Ends A Contact    ${EMPTY}


#=======================================================================================================================
#Huy, date: Apr 27,2021
CC-20037_TC043 - Blended Agent is able to Edit customer information on Workspaces while handling transferred CDN call from DN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT2.USERNAME}    ${BL_AGENT2.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Have another Agent accepted a CDN call and transferred DN this call to the Blended Agent
    # customer make call to cdn
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${CDN_55086}
    # sw to agent 2 agent accepts cdn
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE_E164}
    # agent2 consult transfer to agent1 phone number
    WorkCard.Transfer Extension Call    ${CUST8.PHONE_E164}    ${BL_AGENT1.PHONE_NUMBER}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent accepts this call and search an Existing Customer Record
    # Agent1 accept transferred call
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT2.PHONE_NUMBER}
    # Agent2 complete Transfer
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CUST8.PHONE_E164}
    Wait Until Element Is Not Visible    ${LOC_WORKCARD_HEADER}     10s

    # 1. Detele exist customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    Sleep    2
    # 2. Create new customer
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 3. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 4. Verify email customer in search result
    CustomerSearch.Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Edit the customer Record while agent handling the contact
    # Edit customer info
    # 1 Customer address
    # 1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 2. Edit customer phone
    # 2.1 Verify customer phone number
    CustomerSearch.Verify Customer Telephone Number    ${NEW CUST1.Intl}${NEW CUST1.Number}
    # 2.2 Edit customer phone
    CustomerSearch.Edit Customer Telephone      ${MODIFY CUST1.phoneType}   10    20    ${MODIFY CUST1.Number}  ${False}    ${False}
    # 2.3 Verify new cus phone number was edited
    Log To Console    due to jira CC-23126 is open, need to use intl and area is a non-empty number
    CustomerSearch.Verify Customer Telephone Number     1020${MODIFY CUST1.Number}

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05   Release the contact
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE_E164}


#=======================================================================================================================
#Huy, date: Apr 28, 2021
CC-20037_TC044 - Blended Agent is able to Edit customer information on Workspaces while handling transferred CDN call from CDN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT2.USERNAME}    ${BL_AGENT2.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Have another Agent accepted a CDN call and transferred DN this call to the Blended Agent
    # customer make call to cdn
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number    ${CDN_55086}
    # sw to agent 2 agent accepts cdn
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE_E164}
    # agent2 consult transfer to agent1 phone number
    WorkCard.Transfer Extension Call    ${CUST8.PHONE_E164}    ${CDN_55086}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent accepts this call and search an Existing Customer Record
    # Agent1 accept transferred call
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT2.PHONE_NUMBER}
    # Agent2 complete Transfer
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Transfer Contact     ${CUST8.PHONE_E164}
    Wait Until Element Is Not Visible    ${LOC_WORKCARD_HEADER}     10s

    # 1. Detele exist customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    Sleep    2
    # 2. Create new customer
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 3. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 4. Verify email customer in search result
    CustomerSearch.Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Edit the customer Record while agent handling the contact
    # Edit customer info
    # 1 Customer address
    # 1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 2. Edit customer phone
    # 2.1 Verify customer phone number
    CustomerSearch.Verify Customer Telephone Number    ${NEW CUST1.Intl}${NEW CUST1.Number}
    # 2.2 Edit customer phone
    CustomerSearch.Edit Customer Telephone      ${MODIFY CUST1.phoneType}   10    20    ${MODIFY CUST1.Number}  ${False}    ${False}
    # 2.3 Verify new cus phone number was edited
    Log To Console    due to jira CC-23126 is open, need to use intl and area to number and not empty
    CustomerSearch.Verify Customer Telephone Number     1020${MODIFY CUST1.Number}

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05   Release the contact
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE_E164}


# TODO video call
Skip - CC-20037_TC045 - Blended Agent is able to Edit customer information on Workspaces while handling transferred Video contact
    [Tags]    Skip

#=======================================================================================================================
#Huy, date: Apr 28, 2021
CC-20037_TC046 - Blended Agent is able to Edit customer information on Workspaces while handling transferred EM contact to Skillset
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT2.USERNAME}    ${BL_AGENT2.PASSWORD}   AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login a Blended Agent into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Have another Agent accepted an EM contact and transferred this contact to another skillset
    # Customer send email to agent1
    Customer Sent An Email      ${BL_AGENT1.MAIL1}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    5
    # Agent1 accept EM
    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    Sleep   3
    # Agent1 transfer to same skillset
    WorkCard.Transfer To Service    ${CUST2_EMAIL}      ${BL_AGENT2.SKILLSET_EM1}
    Sleep    3
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Blended Agent accepts this contact
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}
    # 3.2 Delete customer and create a new one
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success
    # 3.3 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3.4 Verify email customer in search result
    Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Edit the customer Record while agent handling the contact
    # Edit customer info
    # 1 Customer address
    # 1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 2. Edit customer phone
    # 2.1 Verify customer phone number
    CustomerSearch.Verify Customer Telephone Number    ${NEW CUST1.Intl}${NEW CUST1.Number}
    # 2.2 Edit customer phone
    CustomerSearch.Edit Customer Telephone      ${MODIFY CUST1.phoneType}   10    20    ${MODIFY CUST1.Number}  ${False}    ${False}
    # 2.3 Verify new cus phone number was edited
    Log To Console    due to jira CC-23126 is open, need to use intl and area to number and not empty
    CustomerSearch.Verify Customer Telephone Number     1020${MODIFY CUST1.Number}

    # STEP 5
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05   Release the contact
    WorkCard.Agent Ends A Contact    ${CUST2_EMAIL}


#=======================================================================================================================
#Huy, date: Apr 29, 2021
CC-20037_TC047 - Blended Agent is able to Edit customer information on Workspaces while handling transferred WC contact to Skillset
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT2.USERNAME}    ${BL_AGENT2.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Login blended agent into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02     Have another Agent: BL_AGENT2 accepted an EM contact and transferred this contact to other skillset.
    # 2.1 Agent accept an EWC
    # 2.1.1 Customer send new chat to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    Sleep    2
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${MM_AGENT2.SKILLSET_WC1}
    Sleep   7
    # 2.1.2 Agent accepst chat
	Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    Sleep   3
    # BL_AGENT2 transfer to same skillset
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep    3
    WorkCard.Transfer To Service    ${CUST6_EMAIL}      ${BL_AGENT2.SKILLSET_WC2}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    MM Only Agent accepts this contact and search an Existing Customer Record
    # 3.1 MM_AGENT1 Accepts transfered EM
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${CUST6_EMAIL}
    # 3.2 Delete customer and create a new one
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 3.3 Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 3.4 Verify email customer in search result
    Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    MM only Agent Edits the customer Record while handling transferred contact
    # 4. Edit customer info
    # 4.1 Customer address
    # 4.1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 4.1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 4.1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 4.1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 4.1.5 Remove customer address - on go

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Release the contact
    WorkCard.Agent Ends A Contact    ${CUST6_EMAIL}


#=======================================================================================================================
#Huy, date: Apr 29, 2021
CC-20037_TC048 - Blended Agent is able to Edit customer information on Workspaces while handling conferenced DN call to DN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT2.USERNAME}    ${BL_AGENT2.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a DN call and transferred this call to the Blended Agent.
    # 1. Customer login phone
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    # 2. Customer make DN call
    AvayaIXworkplaceLib.Make Call To Number    ${BL_AGENT2.PHONE_NUMBER}
    # 3. Agent 2 accepts call
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE}
    # 4. Agent 2 consult conference to DN
    WorkCard.Consult Extension Call     ${CUST8.PHONE}     ${BL_AGENT1.PHONE_NUMBER}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Have another Agent accepted a DN call and conferenced this call to the Blended Agent.
    # 1. Agent 1 go ready and accept DN consult call
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT2.PHONE_NUMBER}
    # 2. Agent 2 complete conference
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${CUST8.PHONE}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent accepts this call and create, search customer Record while handling conferenced Call.
    # 1. Detele exist customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    Sleep    2
    # 2. Create new customer
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 3. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 4. Verify email customer in search result
    CustomerSearch.Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Edit the customer Record while agent handling the contact
    # Edit customer info
    # 1 Customer address
    # 1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 2. Edit customer phone
    # 2.1 Verify customer phone number
    CustomerSearch.Verify Customer Telephone Number    ${NEW CUST1.Intl}${NEW CUST1.Number}
    # 2.2 Edit customer phone
    CustomerSearch.Edit Customer Telephone      ${MODIFY CUST1.phoneType}   10    20    ${MODIFY CUST1.Number}  ${False}    ${False}
    # 2.3 Verify new cus phone number was edited
    Log To Console    due to jira CC-23126 is open, need to use intl and area is a non-empty number
    CustomerSearch.Verify Customer Telephone Number     1020${MODIFY CUST1.Number}

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04   Release the contact
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE}


#=======================================================================================================================
#Huy, date: Apr 29, 2021
CC-20037_TC049 - Blended Agent is able to Edit customer information on Workspaces while handling conferenced to CDN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT2.USERNAME}    ${BL_AGENT2.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepted a DN call and transferred this call to the Blended Agent.
    # 1. Customer login phone
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    # 2. Customer make DN call
    AvayaIXworkplaceLib.Make Call To Number    ${CDN_55086}
    # 3. Agent 2 accepts call
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE_E164}
    # 4. Agent 2 consult conference to DN
    WorkCard.Consult Extension Call     ${CUST8.PHONE_E164}     ${CDN_55086}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Have another Agent accepted a DN call and conferenced this call to the Blended Agent.
    # 1. Agent 1 go ready and accept DN consult call
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT2.PHONE_NUMBER}
    # 2. Agent 2 complete conference
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${CUST8.PHONE_E164}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent accepts this call and create, search customer Record while handling conferenced Call.
    # 1. Detele exist customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    Sleep    2
    # 2. Create new customer
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 3. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 4. Verify email customer in search result
    CustomerSearch.Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Edit the customer Record while agent handling the contact
    # Edit customer info
    # 1 Customer address
    # 1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 2. Edit customer phone
    # 2.1 Verify customer phone number
    CustomerSearch.Verify Customer Telephone Number    ${NEW CUST1.Intl}${NEW CUST1.Number}
    # 2.2 Edit customer phone
    CustomerSearch.Edit Customer Telephone      ${MODIFY CUST1.phoneType}   10    20    ${MODIFY CUST1.Number}  ${False}    ${False}
    # 2.3 Verify new cus phone number was edited
    Log To Console    due to jira CC-23126 is open, need to use intl and area is a non-empty number
    CustomerSearch.Verify Customer Telephone Number     1020${MODIFY CUST1.Number}

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04   Release the contact
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE_E164}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE_E164}


#=======================================================================================================================
#Huy, date: May 4, 2021
CC-20037_TC050 - Blended Agent is able to Edit customer information on Workspaces while handling conferenced CDN call to DN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT2.USERNAME}    ${BL_AGENT2.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Have another Agent accepted a CDN call and conferenced this call to the Blended Agent.
    # 1. Customer login phone
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    # 2. Customer make DN call
    AvayaIXworkplaceLib.Make Call To Number    ${CDN_55086}
    # 3. Agent 2 accepts call
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE_E164}
    # 4. Agent 2 consult conference to DN
    WorkCard.Consult Extension Call     ${CUST8.PHONE_E164}     ${BL_AGENT1.PHONE_NUMBER}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Have another Agent accepted a DN call and conferenced this call to the Blended Agent.
    # 1. Agent 1 go ready and accept DN consult call
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT2.PHONE_NUMBER}
    # 2. Agent 2 complete conference
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${CUST8.PHONE_E164}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent accepts this call and create, search customer Record while handling conferenced Call.
    # 1. Detele exist customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    Sleep    2
    # 2. Create new customer
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 3. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 4. Verify email customer in search result
    CustomerSearch.Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Edit the customer Record while agent handling the contact
    # Edit customer info
    # 1 Customer address
    # 1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 2. Edit customer phone
    # 2.1 Verify customer phone number
    CustomerSearch.Verify Customer Telephone Number    ${NEW CUST1.Intl}${NEW CUST1.Number}
    # 2.2 Edit customer phone
    CustomerSearch.Edit Customer Telephone      ${MODIFY CUST1.phoneType}   10    20    ${MODIFY CUST1.Number}  ${False}    ${False}
    # 2.3 Verify new cus phone number was edited
    Log To Console    due to jira CC-23126 is open, need to use intl and area is a non-empty number
    CustomerSearch.Verify Customer Telephone Number     1020${MODIFY CUST1.Number}

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04   Release the contact
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE_E164}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE_E164}

#=======================================================================================================================
#Huy, date: May 4, 2021
CC-20037_TC051 - Blended Agent is able to Edit customer information on Workspaces while handling conferenced CDN call to CDN call
    [Setup]    Run Keywords    Sleep    5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}   AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${BL_AGENT2.USERNAME}    ${BL_AGENT2.PASSWORD}     AND
    ...     Switch Browser      ${BROWSER_AGENT_ALIAS_2}    AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1

    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}  AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit     AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login 2 Blended Agents into Workspaces

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Have another Agent accepted a CDN call and conferenced this call to the Blended Agent.
    # 1. Customer login phone
    AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    # 2. Customer make DN call
    AvayaIXworkplaceLib.Make Call To Number    ${CDN_55086}
    # 3. Agent 2 accepts call
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact    ${CUST8.PHONE_E164}
    # 4. Agent 2 consult conference to DN
    WorkCard.Consult Extension Call     ${CUST8.PHONE_E164}     ${CDN_55086}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Have another Agent accepted a DN call and conferenced this call to the Blended Agent.
    # 1. Agent 1 go ready and accept DN consult call
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact    ${BL_AGENT2.PHONE_NUMBER}
    # 2. Agent 2 complete conference
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Consult Contact     ${CUST8.PHONE_E164}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Blended Agent accepts this call and create, search customer Record while handling conferenced Call.
    # 1. Detele exist customer
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Sleep    8
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    NavigationMenu.Open Customer Search
    Sleep    2
    # 2. Create new customer
    CustomerSearch.Click Button Create New Customer
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # 3. Search customer
    NavigationMenu.Open Customer Search
    CustomerSearch.Select Customer Search    ${NEW CUST1.Lastname}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}     10
    # 4. Verify email customer in search result
    CustomerSearch.Verify Email Customer In Search Result  ${NEW CUST1.Email}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Edit the customer Record while agent handling the contact
    # Edit customer info
    # 1 Customer address
    # 1.1 Add new customer address
    CustomerSearch.Add A New Customer Address    ${NEW CUST1.Email}      address1    address2    address3    address4    address5    Vietnam     700000
    # 1.2 Verify customer address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify Customer Address Display  address1    address2    address3    address4    address5    Vietnam     700000
    # 1.3 Add the second customer address
    CustomerSearch.Add The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 1.4 Verify second cus address
    AgentToolbar.Verify Toast Message Contains      Successfully saved
    CustomerSearch.Verify The Second Customer Address    address_2_1    address_2_2    address_2_3    address_2_4    address_2_5    US     1
    # 2. Edit customer phone
    # 2.1 Verify customer phone number
    CustomerSearch.Verify Customer Telephone Number    ${NEW CUST1.Intl}${NEW CUST1.Number}
    # 2.2 Edit customer phone
    CustomerSearch.Edit Customer Telephone      ${MODIFY CUST1.phoneType}   10    20    ${MODIFY CUST1.Number}  ${False}    ${False}
    # 2.3 Verify new cus phone number was edited
    Log To Console    due to jira CC-23126 is open, need to use intl and area is a non-empty number
    CustomerSearch.Verify Customer Telephone Number     1020${MODIFY CUST1.Number}

    # STEP 4
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04   Release the contact
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE_E164}
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Ends A Contact    ${CUST8.PHONE_E164}


Skip - CC-20037_TC052 - Blended Agent is able to Edit customer information on Workspaces while handling conferenced Video contact
    [Tags]    Skip

#=======================================================================================================================
#Huy, date: May 4, 2021
CC-20037_TC053 - Verify the information of created customer record in Data management
    [Setup]    Run Keywords    Sleep    5    AND
    #   Login MM only agent 1 to workspaces, start work and go ready
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Create Customer record on Workspaces
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    DataManagement.Delete Customer By Email    ${NEW CUST8.Email}
    CustomerSearch.Enter New Customer Information    &{NEW CUST8}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    launch Data Management, Search a created customer record in step1
    DataManagement.Verify Customer Email By Email    ${NEW CUST8.Email}    ${NEW CUST8.Email}


#=======================================================================================================================
#Huy, date: May 4, 2021
CC-20037_TC054 - Delete a created customer record with phone number in Data Management
    [Setup]    Run Keywords    Sleep    5    AND
    #   Login MM only agent 1 to workspaces, start work and go ready
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Create Customer record on Workspaces
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    launch Data Management, Delete a created customer record with phone number
    DataManagement.Delete Customer By Phone    ${NEW CUST1.Intl}${NEW CUST1.Number}


#=======================================================================================================================
#Huy, date: May 12, 2021
CC-20037_TC055 - Delete a created customer record with Email address in Data Management
    [Setup]    Run Keywords    Sleep    5    AND
    #   Login MM only agent 1 to workspaces, start work and go ready
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
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Create Customer record on Workspaces
    NavigationMenu.Open Customer Search
    CustomerSearch.Click Button Create New Customer
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}
    CustomerSearch.Enter New Customer Information    &{NEW CUST1}
    AgentToolbar.Verify Toast Message Contains    success

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    launch Data Management, Delete a created customer record with email
    DataManagement.Delete Customer By Email    ${NEW CUST1.Email}