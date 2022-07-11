*** Settings ***
Resource    ../../resources/Resource_Workspaces_Email_Templates.robot
#Library     Selenium2Library


*** Test Cases ***

#Created date:     23/06/2020
# TEST CASE 01: Workspaces_TC01 - Email Templates - As an agent can search an Email template by 1 character
Workspaces_TC01 - Email Templates - As an agent can search an Email template by 1 character
    [Documentation]  Workspaces_TC01 - Email Templates - As an agent can search an Email template by 1 character
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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

    # STEP 1: Agent creates new Email, search an Email template by 1 character and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email, search an Email template by 1 character and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${EMPTY}     ${EMPTY}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Choose Email Template    ${EMPTY}    ${EMAIL_TEMPLATE4}   7   # chatacter search
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email template from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email template from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${EMAIL_TEMPLATE4}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     23/06/2020
# TEST CASE 02: Workspaces_TC02 - Email Templates - As an agent can search an Email template by a special character
Workspaces_TC02 - Email Templates - As an agent can search an Email template by a special character
    [Documentation]  Workspaces_TC02 - Email Templates - As an agent can search an Email template by a special character
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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

    # STEP 1: Agent creates new Email, search an Email template by special character and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email, search an Email template by special character and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${EMPTY}     ${EMPTY}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Choose Email Template    ${EMPTY}    ${EMAIL_TEMPLATE1}   Ctrl   # chatacter search
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email template from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email template from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${EMAIL_TEMPLATE1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     24/06/2020
# TEST CASE 03: Workspaces_TC03 - Email Templates - As an agent can search an Email template by full name
Workspaces_TC03 - Email Templates - As an agent can search an Email template by full name
    [Documentation]  Workspaces_TC03 - As an agent can search an Email template by full name
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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

    # STEP 1: Agent creates new Email, search an Email template by full name and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email, search an Email template by full name and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${EMPTY}     ${EMPTY}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Choose Email Template    ${EMPTY}    ${EMAIL_TEMPLATE2}   ${EMAIL_TEMPLATE2}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email template from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email template from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${EMAIL_TEMPLATE2}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     13/06/2020
# TEST CASE 04: Workspaces_TC04 - Email Templates - Make sure the Search result is null when the agent searches template without a template on WS
Workspaces_TC04 - Email Templates - Make sure the Search result is null when the agent searches template without a template on WS
    [Documentation]  Workspaces_TC04 - Email Templates - Make sure the Search result is null when the agent searches template without a template on WS
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Sleep   3   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     Sleep   2   AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Agent creates new Email, search an Email template by 1 character and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email, search an Email template by 1 character and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   3

    # STEP 2: Agent searches template without a template on WS
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent searches template without a template on WS
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_IPT_SEARCH_TEMPLATE_NEW_EMAIL}    timeout=20s
    Input Text    ${LOC_WIDGETEMAIL_IPT_SEARCH_TEMPLATE_NEW_EMAIL}    !@#$%^&*((()
    Sleep   2

    # STEP 3: Verify the Search result is null
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify the Search result is null
    Wait Until Element Is Visible   ${LOC_WIDGETEMAIL_FOUND_MATCHES}    30
    ${content_found} =   Get Text   ${LOC_WIDGETEMAIL_FOUND_MATCHES}
    ${check_content_found} =    Run Keyword And Return Status   Should be equal    ${content_found}     Found matches: 0
    Run Keyword If    '${check_content_found}' == 'True'    Log to console    Cannot find Email Template
    Run Keyword If    '${check_content_found}' == 'False'    Fail    Search result is not null
    Sleep   1

    # STEP 4: Close created Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Close created Email
    WorkCard.Agent End Outbound Contact
    Sleep   3

#=======================================================================================================================

#Created date:     24/06/2020
# TEST CASE 05: Workspaces_TC05 - As MM only Agent can send email ad-hoc to customer by insert email template
Workspaces_TC05 - Email Templates - As MM only Agent can send email ad-hoc to customer by insert email template
    [Documentation]  Workspaces_TC05 - As MM only Agent can send email ad-hoc to customer by insert email template
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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

    # STEP 1: Agent creates new Email, search an Email template by full name and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email, search an Email template by full name and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${EMPTY}     ${EMPTY}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Choose Email Template    ${EMPTY}    ${EMAIL_TEMPLATE2}   ${EMAIL_TEMPLATE2}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email template from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email template from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${EMAIL_TEMPLATE2}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     24/06/2020
# TEST CASE 06: Workspaces_TC06 - As blended Agent can send email ad-hoc to customer by insert email template
Workspaces_TC06 - Email Templates - As blended Agent can send email ad-hoc to customer by insert email template
    [Documentation]  Workspaces_TC06 - As blended Agent can send email ad-hoc to customer by insert email template
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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

    # STEP 1: Agent creates new Email, search an Email template by full name and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email, search an Email template by full name and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${EMPTY}     ${EMPTY}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Choose Email Template    ${EMPTY}    ${EMAIL_TEMPLATE2}   ${EMAIL_TEMPLATE2}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email template from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email template from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${EMAIL_TEMPLATE2}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     26/06/2020
# TEST CASE 07: Workspaces_TC07 - Email Templates - Agent can send email ad-hoc and relied html email to customer by inserting the same email template
Workspaces_TC07 - Email Templates - Agent can send email ad-hoc and relied html email to customer by inserting the same email template
    [Documentation]  Workspaces_TC07 - Email Templates - Agent can send email ad-hoc and relied html email to customer by inserting the same email template
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
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
    Outlook.Send Email Without Attachment  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   1

    # STEP 2: Agent creates new Email, search an Email template
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent creates new Email, search an Email template
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST2_EMAIL}     ${EMPTY}     ${EMPTY}   ${AGENT2_SKILLSET_EM2}
    WidgetEmail.Choose Email Template    ${EMPTY}    ${EMAIL_TEMPLATE4}   7   # chatacter search
    ${workcard_id} =    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id

    # STEP 3: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts and inserts Email template to reply Email
    Sleep   15
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}   7   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

    # STEP 5: Agent send out Email which created
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent send out Email which created
    ${loc_workcard1} =    String.Replace String    ${LOC_WORKCARD_CHOOSE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    15s    Page Should Contain Element    ${loc_workcard1}
    Click Element    ${loc_workcard1}
    WidgetEmail.Complete Send Email     send       ${EMPTY}


    # STEP 6: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify customer received email from Agent
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${EMAIL_TEMPLATE4}    ${CUST2_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     26/06/2020
# TEST CASE 08: Workspaces_TC08 - Email Templates - Agent can send email ad-hoc and relied html email to customer by inserting the different email template
Workspaces_TC08 - Email Templates - Agent can send email ad-hoc and relied html email to customer by inserting the different email template
    [Documentation]  Workspaces_TC08 - Email Templates - Agent can send email ad-hoc and relied html email to customer by inserting the different email template
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
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
    Outlook.Send Email Without Attachment  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   1

    # STEP 2: Agent creates new Email, search an Email template
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent creates new Email, search an Email template
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST2_EMAIL}     ${EMPTY}     ${EMPTY}   ${AGENT2_SKILLSET_EM2}
    WidgetEmail.Choose Email Template    ${EMPTY}    ${EMAIL_TEMPLATE4}   7   # chatacter search
    ${workcard_id} =    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id

    # STEP 3: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts and inserts Email template to reply Email
    Sleep   15
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

    # STEP 5: Agent send out Email which created
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent send out Email which created
    ${loc_workcard1} =    String.Replace String    ${LOC_WORKCARD_CHOOSE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Keyword Succeeds    ${CONTACT_ROUTING_TIMEOUT}    15s    Page Should Contain Element    ${loc_workcard1}
    Click Element    ${loc_workcard1}
    WidgetEmail.Complete Send Email     send       ${EMPTY}


    # STEP 6: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify customer received email from Agent
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${EMAIL_TEMPLATE4}    ${CUST2_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     29/06/2020
# TEST CASE 09: Workspaces_TC09 - Agent can send Ad-hoc by email template while is working on another contact
Workspaces_TC09 - Email Templates - Agent can send Ad-hoc by email template while is working on another contact
    [Documentation]  Workspaces_TC09 - Agent can send Ad-hoc by email template while is working on another contact
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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
    ...     Close All Browsers

    # STEP 00: Customer open Outlook and delete all old email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Customer open Outlook and delete all old email
    Outlook.Open Outlook
    Sleep   3
    Outlook.Delete Old Email
    Sleep   1

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Agent and customer are chatting together
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent and customer are chatting together
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST2_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT3_FIRSTNAME}     Hello Customer, I'm Agent
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1

    # STEP 3: Agent creates new Email, inserts an Email template and sends to Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent creates new Email, inserts an Email template and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${EMPTY}     ${EMPTY}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Choose Email Template    ${EMPTY}    ${EMAIL_TEMPLATE2}   ${EMAIL_TEMPLATE2}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}
    Sleep   2

    # STEP 5: Verify customer received email template from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify customer received email template from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${EMAIL_TEMPLATE2}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     20/07/2020
# TEST CASE 10: Workspaces_TC10 - Email Templates - Make sure Customer History show ad-hoc email encluded email template correctly
Workspaces_TC10 - Email Templates - Make sure Customer History show ad-hoc email encluded email template correctly
    [Documentation]  Workspaces_TC10 - Email Templates - Make sure Customer History show ad-hoc email encluded email template correctly
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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

    # STEP 1: Agent creates new Email, search an Email template by 1 character and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email, search an Email template by 1 character and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${EMPTY}     ${EMPTY}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Choose Email Template    ${EMPTY}    ${EMAIL_TEMPLATE1}   ${EMAIL_TEMPLATE1}
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify Email Template can be search in Customer Search
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Email Template can be search in Customer Search
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   To   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer History Search     EM     ${AGENT3_MAIL}    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}

    # STEP 3: Verify customer received email template from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email template from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${EMAIL_TEMPLATE4}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     29/06/2020
# TEST CASE 11: Workspaces_TC11 - Email Templates - As MM only Agent can reply a html email by insert Email Template
Workspaces_TC11 - Email Templates - As MM only Agent can reply a html email by insert Email Template
    [Documentation]  Workspaces_TC11 - Email Templates - As MM only Agent can reply a html email by insert Email Template
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
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
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Without Attachment  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts and inserts Email template to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 3: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     30/06/2020
# TEST CASE 12: Workspaces_TC12 - Email Templates - As Blended Agent can reply a html email by insert Email Template
Workspaces_TC12 - Email Templates - As Blended Agent can reply a html email by insert Email Template
    [Documentation]  Workspaces_TC11 - Email Templates - As blended Agent can reply a html email by insert Email Template
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
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
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Without Attachment  ${AGENT4_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts and inserts Email template to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 3: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT4_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     30/06/2020
# TEST CASE 13: Workspaces_TC13 - Email Templates - Agent can reply a tranferred html email by insert Email Template
Workspaces_TC13 - Email Templates - Agent can reply a tranferred html email by insert Email Template
    [Documentation]  Workspaces_TC13 - Email Templates - Agent can reply a tranferred html email by insert Email Template
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Open Outlook, from customer sent to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Sleep   1
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   20

    # STEP 2: Agent 1 accepts Email
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   1
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 3: Agent 1 chooses the skillset then transfer Email to service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 chooses the skillset then transfer Email to service
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT2_SKILLSET_EM2}
    Sleep   1

    # STEP 4: Agent 2 accepts transferred Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 go ready and accepts transferred Email
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
#    WorkCard.Verify Skillset Of Contact   ${CUST1_EMAIL}    ${AGENT2_SKILLSET_EM2}
    Sleep   1

    # STEP 5: Agent 2 inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 inserts Email template to reply Email
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 6: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     24/07/2020
# TEST CASE 14: Workspaces_TC14 - Email Templates - Blended Agent can reply all html email by insert Email Template
Workspaces_TC14 - Email Templates - Blended Agent can reply all html email by insert Email Template
    [Documentation]  Workspaces_TC14 - Email Templates - Blended Agent can reply all html email by insert Email Template
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
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
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Without Attachment  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts and inserts Email template to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies All Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 3: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     16/07/2020
# TEST CASE 15: Workspaces_TC08 - Email Templates - Agent can reply a html email containing special character, hyperlink by insert Email Template
Workspaces_TC15 - Email Templates - Agent can reply a html email containing special character, hyperlink by insert Email Template
    [Documentation]  Workspaces_TC15 - Email Templates - Agent can reply a html email containing special character, hyperlink by insert Email Template
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   3   AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   3   AND
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
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}      !@#$%^&* https://google.com  #${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   15

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   5
    WidgetEmail.Verify Received Email   ${CUST1_EMAIL}   ${AGENT1_MAIL}      ${SUBJECT_MAIL1}    !@#$%^&* https://google.com   #${MESSAGE_EMAIL1}
#    WidgetEmail.Verify Received Email   ${CUST1_EMAIL}   ${AGENT2_MAIL}      ${SUBJECT_MAIL1}    https://google.com    #${MESSAGE_EMAIL1}
    Sleep   2

    # STEP 3: Agent inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent inserts Email template to reply Email
    WidgetEmail.Agent Replies Email
    Sleep   2
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Sleep   60
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     30/06/2020
# TEST CASE 16: Workspaces_TC16 - Email Templates - Agent can reply a html email by insert Email Template including image
Workspaces_TC16 - Email Templates - Agent can reply a html email by insert Email Template including image
    [Documentation]  Workspaces_TC16 - Email Templates - Agent can reply a html email by insert Email Template including image
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts and inserts Email template to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 3: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     16/07/2020
# TEST CASE 17: Workspaces_TC17 - Email Templates - Agent can preview email template first before insert into email body
Workspaces_TC17 - Email Templates - Agent can preview email template first before insert into email body
    [Documentation]  Workspaces_TC17 - Email Templates - Agent can preview email template first before insert into email body
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   3   AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   3   AND
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
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   15

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   5
    WidgetEmail.Verify Received Email   ${CUST1_EMAIL}   ${AGENT1_MAIL}      ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}
#    WidgetEmail.Verify Received Email   ${CUST1_EMAIL}   ${AGENT2_MAIL}      ${SUBJECT_MAIL1}    https://google.com    #${MESSAGE_EMAIL1}
    Sleep   2

    # STEP 3: Agent inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent inserts Email template to reply Email
    WidgetEmail.Agent Replies Email
    Sleep   2
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Preview Email Template   ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}
    Sleep   1
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Sleep   60
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     01/07/2020
# TEST CASE 18: Workspaces_TC18 - Email Templates - Agent can insert email temlpate into email body without review
Workspaces_TC18 - Email Templates - Agent can insert email temlpate into email body without review
    [Documentation]  Workspaces_TC18 - Email Templates - Agent can insert email temlpate into email body without review
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts and inserts Email template to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 3: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     02/07/2020
# TEST CASE 19: Workspaces_TC19 - Email Templates - Agent can reply a html email by insert Email Template and attachment
Workspaces_TC19 - Email Templates - Agent can reply a html email by insert Email Template and attachment
    [Documentation]  Workspaces_TC19 - Email Templates - Agent can reply a html email by insert Email Template and attachment
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts and inserts Email template to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}   # chatacter search
    Sleep   1
    WidgetEmail.Insert Attachment    ${CUST1_EMAIL}     ${ATTACH_LINK_1}
    Sleep   5
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 3: Verify customer received email from Agent with attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email from Agent with attachment
    Sleep   60
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     02/07/2020
# TEST CASE 20: Workspaces_TC20 - Email Templates - Agent can reply a html email by insert Email Template and image
Workspaces_TC20 - Email Templates - Agent can reply a html email by insert Email Template and image
    [Documentation]  Workspaces_TC20 - Email Templates - Agent can reply a html email by insert Email Template and image
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
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
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Without Attachment  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts and inserts Email template to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}   # chatacter search
    Sleep   1
    WidgetEmail.Insert Inline Image     ${INLINE_IMAGE_SPECIAL_NAME_LINK}     ${CUST1_EMAIL}
    Sleep   5
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 3: Verify customer received email from Agent with inline image
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email from Agent with inline image
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     02/07/2020
# TEST CASE 21: Workspaces_TC21 - Email Templates - Make sure agent can re-insert email template many times without error
Workspaces_TC21 - Email Templates - Make sure agent can re-insert email template many times without error
    [Documentation]  Workspaces_TC21 - Email Templates - Make sure agent can re-insert email template many times without error
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
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
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Without Attachment  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts and inserts Email template to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email
#    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}   # chatacter search
    Sleep   1

    # STEP 3: Remove the template from the body then re-insert it again. Repeat this step many times
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Remove the template from the body then re-insert it again. Repeat this step many times
    ${workcard_id} =    Get WorkCard ID    ${CUST1_EMAIL}
    ${loc_input_content}=    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_input_content}    timeout=5s
    Input Text    ${loc_input_content}    ${EMPTY}
    Sleep   1
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}
    Sleep   1
    Input Text    ${loc_input_content}    ${EMPTY}
    Sleep   1
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}
    Sleep   1
    Input Text    ${loc_input_content}    ${EMPTY}
    Sleep   1
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}
    Sleep   1
    Input Text    ${loc_input_content}    ${EMPTY}
    Sleep   1
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}
    Sleep   1
    Input Text    ${loc_input_content}    ${EMPTY}
    Sleep   1
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}
    Sleep   1
    Input Text    ${loc_input_content}    ${EMPTY}
    Sleep   1
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}
    Sleep   1
    Input Text    ${loc_input_content}    ${EMPTY}
    Sleep   1
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}
    Sleep   1
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 4: Verify customer received email from Agent with inline image
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent with inline image
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     03/07/2020
# TEST CASE 22: Workspaces_TC22 - Email Templates - Make sure the agent can insert multiple email templates into email body
Workspaces_TC22 - Email Templates - Make sure the agent can insert multiple email templates into email body
    [Documentation]  Workspaces_TC22 - Email Templates - Make sure the agent can insert multiple email templates into email body
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
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
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Without Attachment  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent accepts and inserts 2 Email templates to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts and inserts 2 Email templates to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email
#    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}   # chatacter search
    Sleep   1
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE2}    ${EMAIL_TEMPLATE2}   # chatacter search
    Sleep   1
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 4: Verify customer received email from Agent with inline image
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent with inline image
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     21/07/2020
# TEST CASE 23: Workspaces_TC23 - Email Templates - Make sure agent can insert into email body by Email template html, html including hyperlink
Workspaces_TC23 - Email Templates - Make sure agent can insert into email body by Email template html, html including hyperlink
    [Documentation]  Workspaces_TC23 - Email Templates - Make sure agent can insert into email body by Email template html, html including hyperlink
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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

    # STEP 1: Agent creates new Email, search an Email template by 1 character and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email, search an Email template by 1 character and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${EMPTY}     ${EMPTY}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Choose Email Template    ${EMPTY}    ${EMAIL_TEMPLATE5}   ${EMAIL_TEMPLATE5}
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 3: Verify customer received email template from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email template from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${EMAIL_TEMPLATE5}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     21/07/2020
# TEST CASE 24: Workspaces_TC24 - Email Templates - Make sure agent can insert into email body by Email template txt with long name, special character in file name
Workspaces_TC24 - Email Templates - Make sure agent can insert into email body by Email template txt with long name, special character in file name
    [Documentation]  Workspaces_TC24 - Email Templates - Make sure agent can insert into email body by Email template txt with long name, special character in file name
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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

    # STEP 1: Agent creates new Email, search an Email template by 1 character and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email, search an Email template by 1 character and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${EMPTY}     ${EMPTY}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Choose Email Template    ${EMPTY}    ${EMAIL_TEMPLATE6}   ${EMAIL_TEMPLATE6}
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 3: Verify customer received email template from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email template from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${EMAIL_TEMPLATE6}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     03/07/2020
# TEST CASE 25: Workspaces_TC25 - Email Templates - Make sure Agent can reply a html email by insert ET without click on Reply,Reply all
Workspaces_TC25 - Email Templates - Make sure Agent can reply a html email by insert ET without click on Reply,Reply all
    [Documentation]  Workspaces_TC25 - Email Templates - Make sure Agent can reply a html email by insert ET without click on Reply,Reply all
    [Setup]     Run Keywords
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

    # STEP 1: Open Outlook, from customer sent to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   50

    # STEP 2: Agent accepts Email, do not click Reply/Reply all, inserts Email templates to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email, do not click Reply/Reply all, inserts Email templates to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   10
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}   # chatacter search
    Sleep   1
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 4: Verify customer received email from Agent with inline image
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent with inline image
    Sleep   60
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     22/07/2020
# TEST CASE 26: Workspaces_TC26 - Email Templates - Make sure agent can insert email templates into email bodies while working on some emails
Workspaces_TC26 - Email Templates - Make sure agent can insert email templates into email bodies while working on some emails
    [Documentation]  Workspaces_TC26 - Email Templates - Make sure agent can insert email templates into email bodies while working on some emails
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
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
    Sleep   5
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Without Attachment  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   3
    Outlook.Send Email Without Attachment  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Choose Account   2   #${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent replies Email 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent replies Email 1
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   5
    WidgetEmail.Agent Replies Email

    # STEP 3: Agent replies Email 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent replies Email
    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    Sleep   5
    WidgetEmail.Agent Replies Email

    # STEP 4: Agent inserts Email template to reply Email 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent inserts Email template to reply Email 2
    WidgetEmail.Agent Sends Email    ${CUST2_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST2_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST2_EMAIL}

    # STEP 5: Verify customer 2 received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify customer 2 received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST2_EMAIL}   ${EMPTY}
    Sleep   1
    Outlook.Delete Old Email
    Sleep   1

    # STEP 6: Agent inserts Email template to reply Email 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent inserts Email template to reply Email 1
    WorkCard.Agent Unhold A Contact     ${CUST1_EMAIL}
    Sleep   3
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 7: Verify customer 1 received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify customer 1 received email from Agent
    Sleep   70
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     09/07/2020
# TEST CASE 27: Workspaces_TC27 - Make sure Agent can reply a html email by ET while agent is working on another contact
Workspaces_TC27 - Email Templates - Make sure Agent can reply a html email by ET while agent is working on another contact
    [Documentation]  Workspaces_TC27 - Make sure Agent can reply a html email by ET while agent is working on another contact
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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
    ...     Close All Browsers

    # STEP 00: Customer open Outlook and delete all old email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Customer open Outlook and delete all old email
    Outlook.Open Outlook
    Sleep   3
    Outlook.Delete Old Email
    Sleep   1
    Outlook.Send Email Without Attachment  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}
    Sleep   1
    Outlook.Send Email

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Agent and customer are chatting together
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent and customer are chatting together
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST2_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1

    # STEP 3: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts and inserts Email template to reply Email
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}   # chatacter search
    Sleep   1
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   2

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Unhold A Contact     ${CUST2_EMAIL}
    Sleep   1
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}
    Sleep   2

    # STEP 5: Verify customer received email template from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify customer received email template from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     21/07/2020
# TEST CASE 28: Workspaces_TC28 - Email Templates - Make sure the replied email plain text including email template is shown on Customer History correctly
Workspaces_TC28 - Email Templates - Make sure the replied email plain text including email template is shown on Customer History correctly
    [Documentation]  Workspaces_TC28 - Email Templates - Make sure the replied email plain text including email template is shown on Customer History correctly
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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

    # STEP 1: Open Outlook, from customer sent to Server the Email plain text
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email plain text
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Plain Text  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts and inserts Email template to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   5
#    WidgetEmail.Agent Replies Email
#    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 3: Verify Email Template can be search in Customer Search
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Email   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM     ${CUST1_EMAIL}    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${EMAIL_TEMPLATE1}


    # STEP 3: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email from Agent
    Sleep   10
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     07/07/2020
# TEST CASE 29: Workspaces_TC29 - Email Templates - As MM only Agent can reply to a plain email by insert Email Template
Workspaces_TC29 - Email Templates - As MM only Agent can reply to a plain email by insert Email Template
    [Documentation]  Workspaces_TC29 - Email Templates - As MM only Agent can reply to a plain email by insert Email Template
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2   AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   5   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Open Outlook, from customer sent to Server the Email Plain Text
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email Plain Text
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Plain Text  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts and inserts Email template to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 3: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     07/07/2020
# TEST CASE 30: Workspaces_TC30 - Email Templates - As Blended Agent can reply to a plain email by insert Email Template
Workspaces_TC30 - Email Templates - As Blended Agent can reply to a plain email by insert Email Template
    [Documentation]  Workspaces_TC30 - Email Templates - As Blended Agent can reply to a plain email by insert Email Template
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2   AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   5   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Open Outlook, from customer sent to Server the Email Plain Text
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email Plain Text
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Plain Text  ${AGENT4_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts and inserts Email template to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 3: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT4_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     08/07/2020
# TEST CASE 31: Workspaces_TC31 - Email Templates - Agent can reply a transferred plain email by insert Email Template
Workspaces_TC31 - Email Templates - Agent can reply a transferred plain email by insert Email Template
    [Documentation]  Workspaces_TC31 - Email Templates - Agent can reply a transferred plain email by insert Email Template
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Open Outlook, from customer sent to Server the Email Plain text
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email Plain text
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Sleep   1
    Outlook.Send Email Plain Text  ${AGENT4_MAIL}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}

    Outlook.Send Email
    Sleep   20

    # STEP 2: Agent 1 accepts Email
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   1
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 3: Agent 1 chooses the skillset then transfer Email to service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 chooses the skillset then transfer Email to service
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT2_SKILLSET_EM2}
    Sleep   1

    # STEP 4: Agent 2 accepts transferred Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 go ready and accepts transferred Email
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
#    WorkCard.Verify Skillset Of Contact   ${CUST1_EMAIL}    ${AGENT2_SKILLSET_EM2}
    Sleep   1

    # STEP 5: Agent 2 inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 inserts Email template to reply Email
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 6: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================
#=======================================================================================================================

#Created date:     08/07/2020
# TEST CASE 33: Workspaces_TC33 - Email Templates - Agent can reply a plain email containing attachment by insert Email Template
Workspaces_TC33 - Email Templates - Agent can reply a plain email containing attachment by insert Email Template
    [Documentation]  Workspaces_TC33 - Email Templates - Agent can reply a plain email containing attachment by insert Email Template
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Open Outlook, from customer sent to Server the Email Plain text with attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email Plain text with attachment
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Sleep   1
    Outlook.Send Email Plain Text  ${AGENT4_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Attach File     ${ATTACH_LINK_2}
    Outlook.Send Email
    Sleep   20

    # STEP 2: Agent 1 accepts Email and verify attachment is displayed
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts Email and verify attachment is displayed
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   ${ATTACHMENT_LONG_NAME2}
    Sleep   1
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   1
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 3: Agent 1 chooses the skillset then transfer Email to service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 chooses the skillset then transfer Email to service
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT2_SKILLSET_EM2}
    Sleep   1

    # STEP 4: Agent 2 accepts transferred Email and verify attachment is displayed
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 go ready and accepts transferred Email and verify attachment is displayed
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   ${ATTACHMENT_LONG_NAME2}
    Sleep   1

    # STEP 5: Agent 2 inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 inserts Email template to reply Email
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 6: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1
#=======================================================================================================================

#Created date:     08/07/2020
# TEST CASE 34: Workspaces_TC34 - Email Templates - Agent can reply a plain email by insert Email Template and attachment
Workspaces_TC34 - Email Templates - Agent can reply a plain email by insert Email Template and attachment
    [Documentation]  Workspaces_TC34 - Email Templates - Agent can reply a plain email by insert Email Template and attachment
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   2    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Open Outlook, from customer sent to Server the Email Plain text
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email Plain text
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Sleep   1
    Outlook.Send Email Plain Text  ${AGENT4_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   20

    # STEP 2: Agent 1 accepts Email and verify attachment is displayed
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts Email and verify attachment is displayed
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   1
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1

    # STEP 3: Agent 1 chooses the skillset then transfer Email to service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 chooses the skillset then transfer Email to service
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT2_SKILLSET_EM2}
    Sleep   1

    # STEP 4: Agent 2 accepts transferred Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 go ready and accepts transferred Email
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1

    # STEP 5: Agent 2 inserts Email template and attachs file to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 inserts Email template and attachs file to reply Email
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    Sleep   1
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    Sleep   2
    WidgetEmail.Insert Attachment    ${CUST1_EMAIL}     ${ATTACH_LINK_1}
    Sleep   5
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 6: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     08/07/2020
# TEST CASE 35: Workspaces_TC35 - Email Templates - Plain text_Make sure the agent can insert multiple email templates into email body
Workspaces_TC35 - Email Templates - Plain text_Make sure the agent can insert multiple email templates into email body
    [Documentation]  Workspaces_TC35 - Email Templates - Plain text_Make sure the agent can insert multiple email templates into email body
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2   AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   5   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Open Outlook, from customer sent to Server the Email Plain Text
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email Plain Text
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Plain Text  ${AGENT4_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts and inserts Email template to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    Sleep   1
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE2}    ${EMAIL_TEMPLATE2}   # chatacter search
    Sleep   1
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 3: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT4_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     10/07/2020
# TEST CASE 36: Workspaces_TC36 - Email Templates - Make sure Agent can reply to a plain email by inserting a html Email Template
Workspaces_TC36 - Email Templates - Make sure Agent can reply to a plain email by inserting a html Email Template
    [Documentation]  Workspaces_TC36 - Email Templates - Make sure Agent can reply to a plain email by inserting a html Email Template
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   2   AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   5   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Open Outlook, from customer sent to Server the Email Plain Text
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email Plain Text
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Plain Text  ${AGENT4_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts and inserts Email template to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    Sleep   1
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 3: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT4_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     23/07/2020
# TEST CASE 37: Workspaces_TC37 - Email Templates - Make sure agent can insert email templates into email bodies while working on some plain emails
Workspaces_TC37 - Email Templates - Make sure agent can insert email templates into email bodies while working on some plain emails
    [Documentation]  Workspaces_TC37 - Email Templates - Make sure agent can insert email templates into email bodies while working on some plain emails
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
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
    Sleep   5
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Plain Text  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   3
    Outlook.Send Email Plain Text  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Choose Account   2   #${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent replies Email 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent replies Email 1
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   5
    WidgetEmail.Agent Replies Email

    # STEP 3: Agent replies Email 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent replies Email
    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    Sleep   5
    WidgetEmail.Agent Replies Email

    # STEP 4: Agent inserts Email template to reply Email 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent inserts Email template to reply Email 2
    WidgetEmail.Agent Sends Email    ${CUST2_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST2_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST2_EMAIL}

    # STEP 5: Verify customer 2 received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify customer 2 received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST2_EMAIL}   ${EMPTY}
    Sleep   1
    Outlook.Delete Old Email
    Sleep   1

    # STEP 6: Agent inserts Email template to reply Email 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent inserts Email template to reply Email 1
    WorkCard.Agent Unhold A Contact     ${CUST1_EMAIL}
    Sleep   3
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 7: Verify customer 1 received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify customer 1 received email from Agent
    Sleep   70
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     10/07/2020
# TEST CASE 38: Workspaces_TC38 - Make sure Agent can reply a plain email by ET while agent is working on another contact
Workspaces_TC38 - Email Templates - Make sure Agent can reply a plain email by ET while agent is working on another contact
    [Documentation]  Workspaces_TC38 - Make sure Agent can reply a plain email by ET while agent is working on another contact
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Sleep   5    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     Sleep   3   AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   5   AND
    ...     AgentToolbar.Agent Go Ready     AND
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
    Outlook.Send Email Plain Text  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Sleep   1
    Outlook.Send Email

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 2: Agent and customer are chatting together
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent and customer are chatting together
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST2_EMAIL}
    Sleep   5
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST2_EMAIL}   Hello Customer, I'm Agent
    Sleep   3
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
#    WebChat.Verify Message On Customer Chat     ${AGENT2_FIRSTNAME}     Hello Customer, I'm Agent
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   3

    # STEP 3: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts and inserts Email template to reply Email
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   5
    WidgetEmail.Agent Replies Email
    Sleep   2
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    Sleep   3
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}   # chatacter search
    Sleep   1
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   5

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Unhold A Contact     ${CUST2_EMAIL}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}
    Sleep   2

    # STEP 5: Verify customer received email template from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify customer received email template from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     17/07/2020
# TEST CASE 39: Workspaces_TC39 - Email Templates - Make sure the replied email including email template is shown on Customer History correctly
Workspaces_TC39 - Email Templates - Make sure the replied email including email template is shown on Customer History correctly
    [Documentation]  Workspaces_TC39 - Email Templates - Make sure the replied email including email template is shown on Customer History correctly
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent accepts and inserts Email template to reply Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts and inserts Email template to reply Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   5
#    WidgetEmail.Agent Replies Email
#    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 3: Verify Email Template can be search in Customer Search
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Email   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST1_EMAIL}    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${EMAIL_TEMPLATE1}


    # STEP 3: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email from Agent
    Sleep   10
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     13/07/2020
# TEST CASE 40: Workspaces_TC40 - Email Templates - Make sure agent can insert email template when working on multiple types of emails
Workspaces_TC40 - Email Templates - Make sure agent can insert email template when working on multiple types of emails
    [Documentation]  Workspaces_TC40 - Email Templates - Make sure agent can insert email template when working on multiple types of emails
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
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
    Sleep   5
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Send Email Plain Text  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   3
    Outlook.Send Email Without Attachment  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Choose Account   2   #${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   30

    # STEP 2: Agent replies Email 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent replies Email 1
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   5
    WidgetEmail.Agent Replies Email

    # STEP 3: Agent replies Email 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent replies Email
    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    Sleep   5
    WidgetEmail.Agent Replies Email

    # STEP 4: Agent inserts Email template to reply Email 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent inserts Email template to reply Email 2
    WidgetEmail.Agent Sends Email    ${CUST2_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST2_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST2_EMAIL}

    # STEP 5: Verify customer 2 received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify customer 2 received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST2_EMAIL}   ${EMPTY}
    Sleep   1
    Outlook.Delete Old Email
    Sleep   1

    # STEP 6: Agent inserts Email template to reply Email 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent inserts Email template to reply Email 1
    WorkCard.Agent Unhold A Contact     ${CUST1_EMAIL}
    Sleep   5
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE1}    ${EMAIL_TEMPLATE1}   # chatacter search
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}

    # STEP 7: Verify customer 1 received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify customer 1 received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1
#    Outlook.Verify Content Email    ${CONTENT_EMAIL1}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================
#=======================================================================================================================

#Created date:     06/07/2020
# TEST CASE 42: Workspaces_TC42 - Combine Email template and suggested responses
Workspaces_TC42 - Email Templates - Combine Email template and suggested responses
    [Documentation]  Workspaces_TC42 - Combine Email template and suggested responses
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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
    ...     Close All Browsers

    # STEP 00: Customer open Outlook and delete all old email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Customer open Outlook and delete all old email
    Outlook.Open Outlook
    Sleep   3
    Outlook.Delete Old Email
    Sleep   1
    Outlook.Send Email Without Attachment  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}
    Sleep   1
    Outlook.Send Email

    # STEP 3: Agent accepts and reply by suggestion
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts and reply by suggestion
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1
#    WidgetEmail.Agent Replies Email
    WidgetEmail.Reply By Suggestion     ${CUST1_EMAIL}   ${SUGGEST_EMAIL_1}
    WidgetEmail.Verify Suggesstion     ${CUST1_EMAIL}   ${SUGGEST_EMAIL_CONTENT_1}

    # STEP 4: Agent inserts Email template
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent inserts Email template
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${EMPTY}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Choose Email Template    ${CUST1_EMAIL}    ${EMAIL_TEMPLATE4}    ${EMAIL_TEMPLATE4}   # chatacter search
    Sleep   1
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   2

    # STEP 5: Verify customer received email template from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify customer received email template from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT2_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================
#=======================================================================================================================
#=======================================================================================================================



