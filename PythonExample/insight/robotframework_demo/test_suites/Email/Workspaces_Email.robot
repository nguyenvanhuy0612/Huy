*** Settings ***
Resource    ../../resources/Resource_Workspaces_Email.robot
#Library     Selenium2Library

*** Test Cases ***


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#******************                                   EMAIL ADDRESS                                    *****************
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#=======================================================================================================================

#Created date:     19/05/2020
Workspaces_TC01 - Email address - Email is sent to customer successfully if reply an email have one valid address and invalid address
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   5

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent Reply email have one valid address and invalid addressthen sends out Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent Replyan email have one valid address and invalid address then sends out Email without attachment
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}; aaa@aaa.com     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
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

#=======================================================================================================================

#Created date:    08/06/2020
Workspaces_TC03 - Email Address - Agent send out an email to an address with Invalid Special Characters
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

    # STEP 1: Agent creates new Email and sends to an address with Invalid Special Characters
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email and sends to an address with Invalid Special Characters
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   %#@$$%^^^     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}

    # STEP 2: Verify Send Button is disable and Agent cannot send out email with error message
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Send Button is disable and Agent cannot send out email with error message
    # Verify Send Button is disable
    Wait Until Element Is Visible    //button[@puppeteer-id='email-send--button']    timeout=10s
    ${get_state_of_btn} =   Get Element Attribute   //button[@puppeteer-id='email-send--button']     aria-label
    log to console    *******************  ${get_state_of_btn}
    ${check_state_btn} =   Run Keyword And Return Status   Should Be Equal    ${get_state_of_btn}     Send button unavailable until all mandatory fields your Administrator has set as enforced are completed. See User Guide for more details on these fields.
    Run Keyword If    '${check_state_btn}' == 'True'    Log to console    Send button is disable
    Run Keyword If    '${check_state_btn}' == 'False'    Fail    Send button must be disable
    Sleep   1

    # STEP 3: Verify error message
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify error message
    Wait Until Element Is Visible    //span[@id='ow_Email_Incorrect_Address_1']    timeout=10s
    ${get_message} =   Get Text   //span[@id='ow_Email_Incorrect_Address_1']
    ${check_text_message} =   Run Keyword And Return Status   Should Be Equal    ${get_message}     Addresses must adhere to standard email format, containing '@' and domain name
    Run Keyword If    '${check_text_message}' == 'True'    Log to console    Error message displays correctly
    Run Keyword If    '${check_text_message}' == 'False'    Fail    Error message does not display correctly
    Sleep   1

    # STEP 4: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email Contact
    WorkCard.Agent End Outbound Contact
    Sleep   1

#=======================================================================================================================

#Created date:     /05/2020
Workspaces_TC04 - Email Address - Agent send out an email to an email address with All Capital Characters
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

    # STEP 1: Agent creates new Email and sends to Customer has email address with All Capital Characters
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email and sends to Customer has email address with All Capital Characters
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST3_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_EMAIL1}    ${CUST3_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     09/06/2020
Workspaces_TC05 - Email Address - Agent send out an email to a Long Valid email address
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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

    # STEP 1: Agent creates new Email and sends to Customer has email address with All Capital Characters
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email and sends to Customer has email address with All Capital Characters
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST4_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT1_SKILLSET_EM1}
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_EMAIL1}    ${CUST4_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     09/06/2020
Workspaces_TC06 - Email Address - Agent send out an Short Valid email to an address
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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

    # STEP 1: Agent creates new Email and sends to Customer has email address with All Capital Characters
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email and sends to Customer has email address with All Capital Characters
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST5_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT1_SKILLSET_EM1}
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_EMAIL1}    ${CUST5_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     21/05/2020
Workspaces_TC07 - Email Address - Agent reply an email to Valid Email Addresses at To and no address at CC
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent clicks Reply Email button, change the email in the To field then sends out Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent clicks Reply Email button, change the email in the To field then sends out Email without attachment
    WidgetEmail.Agent Replies Email
    # delete To field
    ${workcard_id} =    Get WorkCard ID    ${CUST1_EMAIL}
    ${loc_field_to} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_TO}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_field_to}    timeout=10s
    Click Element   ${loc_field_to}
    Press Keys    ${loc_field_to}    BACKSPACE
    Input Text   ${loc_field_to}    ${CUST2_EMAIL}
    Sleep   1
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 5: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_MAIL1}    ${CUST2_EMAIL}    ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     28/05/2020
Workspaces_TC08 - Email Address - Reply all button enable if agent accepts an email have one address
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   2
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent clicks Reply Email button then sends out Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent clicks Reply Email button then sends out Email without attachment
    WidgetEmail.Agent Replies All Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL};oanhho_cust2@automation.tma.com     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
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

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#******************                                 EMAIL ATTACHMENT                                   *****************
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


#=======================================================================================================================

#Created date:     19/06/2020
Workspaces_TC01 - Email Attachment - Agent can process an email having attachment naming with Special Character Then agent transfer or reply the email successfully
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

    # STEP 1: Open Outlook, from customer sent to Server the Email with Long Name Attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email with Special Name Attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}     ${VALID_SPECIAL_NAME_LINK}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent accepts Email and verify Special Name Attachment displays correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email and verify Special Name Attachment displays correctly
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   2
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   ${VALID_SPECIAL_NAME}
    Sleep   1

    # STEP 3: Agent chooses the skillset then transfer Email to service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent chooses the skillset then transfer Email to service
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT1_SKILLSET_EM1}
    Sleep   1

    # STEP 4: Agent 2 go ready and accepts transferred Email and verify Special Name Attachment displays correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 go ready and accepts transferred Email and verify Special Name Attachment displays correctly
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   ${VALID_SPECIAL_NAME}
    Sleep   1

    # STEP 5: Agent 2 Reply email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 Reply an email
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}    ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 6: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     19/06/2020
Workspaces_TC02 - Email Attachment - Agent can initiate an email with attachment naming Special Character and sends it out to customer successfully
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

    # STEP 1: Agent creates new Email and attach Special Name Attachment then sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email and attach Special Name Attachment then sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Insert Attachment    ${EMPTY}     ${VALID_SPECIAL_NAME_LINK}
    Sleep   5
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email from Agent with Special Name Attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email from Agent with Special Name Attachment
    Sleep   60
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_EMAIL1}    ${CUST1_EMAIL}   ${VALID_SPECIAL_NAME}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     19/06/2020
Workspaces_TC03 - Email Attachment - Agent can initiate an email with attachment in a Special File Type and sends it out to customer successfully
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
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}
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

#Created date:     28/05/2020
Workspaces_TC04 - Email attachment - Email Attachments with the same file name can be replied using Workspaces
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
    Outlook.Send Email With Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}      ${ATTACH_LINK_1}
    Outlook.Attach File     ${ATTACH_SAME_LINK_1}
    Outlook.Send Email
    Sleep   2
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1

    # STEP 2: Verify Agent received 2 attachment having the same name
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Agent received 2 attachment having the same name
    ${workcard_id} =    Get WorkCard ID    ${CUST1_EMAIL}
    ${loc_show_attachment} =    String.Replace String    ${LOC_WIDGETEMAIL_SHOW_ATTACHMENT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    @{list_attachment}=    Get WebElements     ${loc_show_attachment}
    ${name_of_attachment1} =     Get Text    @{list_attachment}[0]
    ${name_of_attachment2} =     Get Text    @{list_attachment}[1]
    Should Contain    ${name_of_attachment1}    ${ATTACHMENT_NAME1}
    Should Contain    ${name_of_attachment2}    ${ATTACHMENT_SAME_NAME1}
    Sleep   3

     # STEP 3: Agent clicks Reply Email button then sends out Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent clicks Reply Email button then sends out Email without attachment
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     26/05/2020
Workspaces_TC05 - Email Attachment - Agent can receive and reply an email with Long Name Attachment
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
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

    # STEP 1: Open Outlook, from customer sent to Server the Email with Long Name Attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email with Long Name Attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}     ${ATTACH_LINK_2}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent accepts Email and verify Long Name Attachment displays correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email and verify Long Name Attachment displays correctly
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    WorkCard.Verify Skillset Of Contact   ${CUST1_EMAIL}    ${AGENT5_SKILLSET_EM1}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   ${ATTACHMENT_LONG_NAME2}
    Sleep   1

    # STEP 3: Agent clicks Reply Email button then sends out Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent clicks Reply Email button then sends out Email without attachment
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     22/05/2020
Workspaces_TC06 - Email Attachment - Agent can receive and transfer an email Long Name Attachment
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1    AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
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

    # STEP 1: Open Outlook, from customer sent to Server the Email with Long Name Attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email with Long Name Attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}     ${ATTACH_LINK_2}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email and verify Long Name Attachment displays correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email and verify Long Name Attachment displays correctly
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    WorkCard.Verify Skillset Of Contact   ${CUST1_EMAIL}    ${AGENT5_SKILLSET_EM5}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   ${ATTACHMENT_LONG_NAME2}
    Sleep   1
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   1

    # STEP 3: Agent chooses the skillset then transfer Email to service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent chooses the skillset then transfer Email to service
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT5_SKILLSET_EM5}
    Sleep   1

    # STEP 4: Agent 2 go ready and accepts transferred Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 go ready and accepts transferred Email
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    WorkCard.Verify Skillset Of Contact   ${CUST1_EMAIL}    ${AGENT5_SKILLSET_EM5}
    Sleep   1

    # STEP 5: Verify can download attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05   Verify can download attachment
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   ${ATTACHMENT_LONG_NAME2}
    Sleep   1
    WidgetEmail.Verify Download Attachment   ${CUST1_EMAIL}   ${ATTACHMENT_LONG_NAME2}
    Sleep   1

    # STEP 6: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends Email Contact
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     12/06/2020
Workspaces_TC07 - Email Attachment_CC-18806 - Agent can attach 2 same files
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

    # STEP 1: Agent creates new Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email
    Sleep   3
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}

    # STEP 2: Agent inserts 2 same attachment files
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent inserts 2 same attachment files
    WidgetEmail.Insert Attachment    ${EMPTY}      ${ATTACH_LINK_1}
    Sleep   5
    WidgetEmail.Insert Attachment    ${EMPTY}      ${ATTACH_LINK_1}
    Sleep   2

    # STEP 3: Verify Have no this Attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Have no this Attachment
    WidgetEmail.Verify Email Attachment     ${EMPTY}      ${ATTACHMENT_NAME1}

    # STEP 4: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email Contact
    WorkCard.Agent End Outbound Contact
    Sleep   1

#=======================================================================================================================

#Created date:     11/06/2020
Workspaces_TC08 - CC-19068 - Can not upload Attachment files which have size larger than 25MB
    [Documentation]  Workspaces_CC-19068 - Can not upload Attachment files which have size larger than 25MB
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

    # STEP 1: Agent creates new Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email
    Sleep   3
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}

    # STEP 2: Agent inserts attachment files which have size larger than 25MB
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent inserts attachment files which have size larger than 25MB
    WidgetEmail.Insert Attachment    ${EMPTY}      ${ATTACH_LARGER_25MB_LINK}
    Sleep   2

    # STEP 3: Verify Failed to upload attachments
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Failed to upload attachments
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_ERROR_MESSAGE_UPLOAD}    timeout=10s
    ${get_content_error} =    Get Text   ${LOC_WIDGETEMAIL_ERROR_MESSAGE_UPLOAD}
    ${check_error} =    Run Keyword And Return Status   Should Be Equal    ${get_content_error}    Failed to upload attachments
    Run Keyword if   '${check_error}'=='True'    Log To Console   Error message displays correctly: Failed to upload attachments
    ...     ELSE    Fail    Have no error message: Failed to upload attachments

    # STEP 3: Verify Have no this Attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Have no this Attachment
    WidgetEmail.Verify Email Attachment     ${EMPTY}      ${EMPTY}

    # STEP 4: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email Contact
    WorkCard.Agent End Outbound Contact
    Sleep   1

#=======================================================================================================================

#Created date:     15/06/2020
Workspaces_TC09 - Email Attachment_CC-20303 - Make sure email attachment can be downloaded successfully
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
    WorkCard.Verify Skillset Of Contact   ${CUST1_EMAIL}    ${AGENT1_SKILLSET_EM1}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   1

    # STEP 3: Verify can download the attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify can download the attachment
    WidgetEmail.Verify Download Attachment   ${CUST1_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   1

    # STEP 4: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email Contact
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#******************                               EMAIL AUTO SUGGEST                                   *****************
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#=======================================================================================================================

#Created date:     22/05/2020
Workspaces_TC01 - Auto Suggest - Search auto suggest on workspace work fine
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
    Outlook.Send Email Without Attachment  ${AGENT4_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent search auto-suggest then reply email by suggestion
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent search auto-suggest then reply email by suggestion
#    WidgetEmail.Agent Replies Email
    WidgetEmail.Reply By Suggestion     ${CUST1_EMAIL}   ${SUGGEST_EMAIL_1}
    WidgetEmail.Verify Suggesstion     ${CUST1_EMAIL}   ${SUGGEST_EMAIL_CONTENT_1}
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT4_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}    ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     25/05/2020
Workspaces_TC02- Auto Suggest- CC- 18261 Can search suggested content with one character
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
    Outlook.Send Email Without Attachment  ${AGENT4_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent search auto-suggest with one character then reply email by suggestion
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent search auto-suggest with one character then reply email by suggestion
#    WidgetEmail.Agent Replies Email
    WidgetEmail.Reply By Suggestion     ${CUST1_EMAIL}   z  #${SUGGEST_EMAIL_1}
    WidgetEmail.Verify Suggesstion     ${CUST1_EMAIL}   ${SUGGEST_EMAIL_CONTENT_3}
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT4_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#******************                              EMAIL INSERT IMAGE                                    *****************
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#Created date:     20/05/2020
Workspaces_TC01 - Insert Image - Agent can initiate email Inlining Image with Special File Type
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
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

    # STEP 1: Agent creates new Email, insert email image with Special File Type
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email, insert email image with Special File Type
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Insert Inline Image     ${INLINE_IMAGE_SPECIAL_FILE_TYPE_LINK}     ${EMPTY}
    Sleep   1

    # STEP 2: Verify inline image with Special File Type dispalys correctly and Agent sends Email to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify inline image with Special File Type dispalys correctly and Agent sends Email to Customer
    WidgetEmail.Verify Inline Image     ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 3: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_EMAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     20/05/2020
Workspaces_TC02 - Insert Image - Agent can process email Inlining Image with Special File Type
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

    # STEP 1: Open Outlook, from customer sent to Server the Email Inlining Image with Valid Special Characters Name
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email Inlining Image with Valid Special Characters Name
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Insert Image    ${INLINE_IMAGE_SPECIAL_FILE_TYPE_LINK}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1

    # STEP 3: Verify Email have inline image and attached Image
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email have inline image and attached Image
    WidgetEmail.Verify Inline Image     ${CUST1_EMAIL}
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   image001.jpg
    Sleep   3

    # STEP 4: Agent ends Email contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     19/05/2020
Workspaces_TC03 - Insert Image - Agent cannot initiate email Inlining Image with File Type no Extention
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

    # STEP 1: Agent creates new Email, insert email image with File Type no Extention and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email, insert email image with File Type no Extention and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Insert Inline Image     ${INLINE_IMAGE_NO_EXTENTION_LINK}     ${EMPTY}
    Sleep   1
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_EMAIL1}   ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     20/05/2020
Workspaces_TC04 - Insert Image - Agent can process an email Inlining Image with Valid Special Characters Name
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

    # STEP 1: Open Outlook, from customer sent to Server the Email Inlining Image with Valid Special Characters Name
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email Inlining Image with Valid Special Characters Name
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Insert Image    ${INLINE_IMAGE_SPECIAL_NAME_LINK}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1

    # STEP 3: Verify Email have inline image and attached Image
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email have inline image and attached Image
    WidgetEmail.Verify Inline Image     ${CUST1_EMAIL}
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   image001.jpg
    Sleep   3

    # STEP 4: Agent ends Email contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     21/05/2020
Workspaces_TC05 - Insert Image - Agent can initiate an email Inlining Image with Special Character Name
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

    # STEP 1: Agent creates new Email, insert Inlining Image with Special Character Name
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email, insert Inlining Image with Special Character Name
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Insert Inline Image     ${INLINE_IMAGE_SPECIAL_NAME_LINK}     ${EMPTY}
    Sleep   1

    # STEP 2: Verify inline image withSpecial Character Name dispalys correctly and Agent sends Email to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify inline image with Special Character Name dispalys correctly and Agent sends Email to Customer
    WidgetEmail.Verify Inline Image     ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 3: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify customer received email from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_EMAIL1}   ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     21/05/2020
Workspaces_TC06 - Insert Image - Agent can process an email Inlining Image with Different Extention
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

    # STEP 1: Open Outlook, from customer sent to Server the Email Inlining gif Image
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email Inlining gif Image
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Insert Image    ${INLINE_IMAGE_GIF_LINK_4}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   1

    # STEP 3: Verify Email have inline gif image and attached Image
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email have inline gif image and attached Image
    WidgetEmail.Verify Inline Image     ${CUST1_EMAIL}
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   image001.gif
    Sleep   3

    # STEP 4: Agent ends Email contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#******************                                EMAIL SIGNATURE                                     *****************
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#Created date:     /05/2020
Workspaces_TC01 - Email - Screenpop - Screenpop can be displayed correctly
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Close Outlook
    Sleep   25

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Open Settings, verify Screenpop Name Displays after Agent accepted contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Open Settings, verify Screenpop Name Displays after Agent accepted contact
    NavigationMenu.Open Screenpop
    Sleep   2
    Screenpop.Verify Screenpop Name Displays     ${SCREENPOP_NAME2}
    Sleep   3
    NavigationMenu.Open Email
    Sleep   1

    # STEP 4: Agent ends Email contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email contact
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#******************                                      EMAIL                                         *****************
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#Created date:     06/05/2020
# TEST CASE 01: Workspaces_TC-01 - Blended Agent can process an email without attachment
Workspaces_TC-01 - Blended Agent can process an email without attachment
    [Documentation]  Blended Agent can process an email without attachment
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
    Outlook.Send Email Without Attachment  ${AGENT4_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent ends Email contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     11/05/2020
# TEST CASE 02: Workspaces_TC02 - Email - Blended Agent can process an email with an attachment
Workspaces_TC02 - Email - Blended Agent can process an email with an attachment
    [Documentation]  Workspaces_TC02 - Email - Blended Agent can process an email with an attachment
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
    Outlook.Send Email With Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}      ${ATTACH_LINK_1}
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

    # STEP 3: Agent ends Email contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     08/05/2020
# TEST CASE 03: Workspaces_TC03 - Email - Blended Agent can reply an Email without attachment
Workspaces_TC03 - Email - Blended Agent can reply an Email without attachment
    [Documentation]  Workspaces_TC03 - Email - Blended Agent can reply an Email without attachment
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
    Outlook.Send Email Without Attachment  ${AGENT4_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent clicks Reply Email button then sends out Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent clicks Reply Email button then sends out Email without attachment
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT4_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     18/06/2020
# TEST CASE 04: Workspaces_TC04 - Email - Blended Agent can reply an Email with attachment
Workspaces_TC04 - Email - Blended Agent can reply an Email with attachment
    [Documentation]  Workspaces_TC04 - Email - Blended Agent can reply an Email with attachment
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
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent clicks Reply Email button then sends out Email with attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent clicks Reply Email button then sends out Email with attachment
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Insert Attachment    ${CUST1_EMAIL}     ${ATTACH_LINK_1}
    Sleep   5
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}    ${ATTACHMENT_NAME1}
    Sleep   1
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     11/05/2020
# TEST CASE 05: Workspaces_TC05 - Email - Agent can Reply All email without attachment
Workspaces_TC05 - Email - Agent can Reply All email without attachment
    [Documentation]  Workspaces_TC05 - Email - Agent can Reply All email without attachment
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent clicks Reply Email button then sends out Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent clicks Reply Email button then sends out Email without attachment
    WidgetEmail.Agent Replies All Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}     ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 5: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     18/06/2020
# TEST CASE 06: Workspaces_TC06 - Email - Agent can Reply All email with attachment
Workspaces_TC06 - Email - Agent can Reply All email with attachment
    [Documentation]  Workspaces_TC06 - Email - Agent can Reply All email with attachment
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
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent clicks Reply All Email button then sends out Email with attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent clicks Reply Email All button then sends out Email with attachment
    WidgetEmail.Agent Replies All Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Insert Attachment    ${CUST1_EMAIL}     ${ATTACH_LINK_1}
    Sleep   5
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}    ${ATTACHMENT_NAME1}
    Sleep   1
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     13/05/2020
Workspaces_TC07 - Email - Agent can Transfer Email to another skillset with attachment
    [Documentation]  Workspaces_TC07 - Email - Agent can Transfer Email to another skillset with attachment
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
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

    # STEP 1: Open Outlook, from customer sent to Server the Email with attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email with attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}     ${ATTACH_LINK_1}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email and verify the attachment displays correctly
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email and verify the attachment displays correctly
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    WorkCard.Verify Skillset Of Contact   ${CUST1_EMAIL}    ${AGENT5_SKILLSET_EM5}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   1
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   1

    # STEP 3: Agent chooses the skillset then transfer Email to service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent chooses the skillset then transfer Email to service
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT2_SKILLSET_EM2}
    Sleep   1

    # STEP 4: Agent 2 go ready and accepts transferred Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 go ready and accepts transferred Email
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    WorkCard.Verify Skillset Of Contact   ${CUST1_EMAIL}    ${AGENT2_SKILLSET_EM2}
    Sleep   1

    # STEP 5: Verify can download attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05   Verify can download attachment
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   1
    WidgetEmail.Verify Download Attachment   ${CUST1_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   1

    # STEP 6: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends Email Contact
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     13/05/2020
Workspaces_TC8 - Email - Agent can Transfer Email to another skillset without attachment
    [Documentation]  Workspaces_TC8 - Email - Agent can Transfer Email to another skillset without attachment
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
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
    Outlook.Send Email Without Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    WorkCard.Verify Skillset Of Contact   ${CUST1_EMAIL}    ${AGENT5_SKILLSET_EM5}
    Sleep   1
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   1

    # STEP 3: Agent chooses the skillset then transfer Email to service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent chooses the skillset then transfer Email to service
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT2_SKILLSET_EM2}
    Sleep   1

    # STEP 4: Agent 2 go ready and accepts transferred Email
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 go ready and accepts transferred Email
    AgentToolbar.Agent Go Ready
    Sleep   1
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    WorkCard.Verify Skillset Of Contact   ${CUST1_EMAIL}    ${AGENT2_SKILLSET_EM2}
    Sleep   1

    # STEP 4: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email Contact
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     13/05/2020
Workspaces_TC09 - Email - Agent can Transfer Email to same skillset with attachment
    [Documentation]  Workspaces_TC09 - Email - Agent can Transfer Email to same skillset with attachment
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
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
    Outlook.Send Email With Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}     ${ATTACH_LINK_1}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    WorkCard.Verify Skillset Of Contact   ${CUST1_EMAIL}    ${AGENT5_SKILLSET_EM5}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   1
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   1

    # STEP 3: Agent chooses the skillset then transfer Email to service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent chooses the skillset then transfer Email to service
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT5_SKILLSET_EM5}
    Sleep   1

    # STEP 4: Agent 2 go ready and accepts transferred Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 go ready and accepts transferred Email
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    AgentToolbar.Agent Go Ready
    Sleep   1
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    WorkCard.Verify Skillset Of Contact   ${CUST1_EMAIL}    ${AGENT5_SKILLSET_EM5}
    Sleep   1

    # STEP 5: Verify can download attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05   Verify can download attachment
    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   1
    WidgetEmail.Verify Download Attachment   ${CUST1_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   1

    # STEP 6: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends Email Contact
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     14/05/2020
Workspaces_TC10 - Email - Agent can Transfer Email to same skillset without attachment
    [Documentation]  Workspaces_TC10 - Email - Agent can Transfer Email to same skillset without attachment
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
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
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    WorkCard.Verify Skillset Of Contact   ${CUST1_EMAIL}    ${AGENT5_SKILLSET_EM5}
    Sleep   1
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    Sleep   1

    # STEP 3: Agent chooses the skillset then transfer Email to service
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent chooses the skillset then transfer Email to service
    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT5_SKILLSET_EM5}
    Sleep   1

    # STEP 4: Agent 2 go ready and accepts transferred Email
    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 go ready and accepts transferred Email
    AgentToolbar.Agent Go Ready
    Sleep   1
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    WorkCard.Verify Skillset Of Contact   ${CUST1_EMAIL}    ${AGENT5_SKILLSET_EM5}
    Sleep   1

    # STEP 4: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email Contact
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##Created date:     14/03/2020
#Workspaces_TC11 - Email - Agent work fine when accepts, then release an EM and DN call
#    [Documentation]  Workspaces_TC11 - Email - Agent work fine when accepts, then release an EM and DN call
#    [Setup]     Run Keywords
#    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
#    #   Setting Customer phone
#    ...     OneXCommunicator.Open OneX      AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
#    #   Login blended agent to workspaces
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1
#    [Teardown]    Run Keywords
#    ...    AvayaIX.AvayaIX Log Out     AND
#    ...    AvayaIX.Close AvayaIX    AND
#    ...    OneXCommunicator.Close OneX      AND
#    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
#    ...    WorkCard.Agent End Any Inbound Contact      AND
#    ...    AgentToolbar.Agent Finish Work   AND
#    ...    AgentToolbar.Agent Exit      AND
#    ...    Close All Browsers
#
#    # STEP 1: Open Outlook, from customer sent to Server the Email without attachment
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
#    Outlook.Open Outlook
#    Outlook.Send Email Without Attachment  ${MAIL_BOX1}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}
#    Outlook.Send Email
#    Sleep   20
#    Outlook.Close Outlook
#
#    # STEP 2: Customer makes DN call to Agent
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer makes DN call to Agent
#    OneXCommunicator.OneX Call Out       ${AGENT2_PHONE_NUMBER}     #${CDN1}
#    Sleep   3
#
#    # STEP 3: Switch to agent's browser and Agent accepts DN call
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts DN call
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    WorkCard.Agent Accepts A Contact     ${CUST1_URI}
#    Sleep   7
#
#    # STEP 4: Agent accepts Email
#    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent accepts Email
#    Sleep   5
#    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
#    WorkCard.Verify Skillset Of Contact   ${CUST1_EMAIL}    ${AGENT5_SKILLSET_EM1}
#    Sleep   1
#
#    # STEP 5: Agent end DN call
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent end DN call
#    WorkCard.Agent Ends A Contact     ${CUST1_URI}
#    Sleep   2
#
#    # STEP 4: Agent ends Email Contact
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email Contact
#    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
#    Sleep   1

#=======================================================================================================================

#Created date:     /05/2020
Workspaces_TC12 - Email - Agent Initiate an email without attachment
    [Documentation]  Workspaces_TC12 - Email - Agent Initiate an email without attachment
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

    # STEP 1: Agent creates new Email and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_EMAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     18/06/2020
Workspaces_TC13 - Email - Agent Initiate an email with attachment
    [Documentation]  Workspaces_TC13 - Email - Agent Initiate an email with attachment
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

    # STEP 1: Agent creates new Email and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Insert Attachment    ${EMPTY}     ${ATTACH_LINK_1}
    Sleep   5
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email from Agent with Attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email from Agent with Attachment
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_EMAIL1}    ${CUST1_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     29/05/2020
Workspaces_TC14 - Email - MM only Agent can process an email without attachment
    [Documentation]  Workspaces_TC14 - Email - MM only Agent can process an email without attachment
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL2}        ${MESSAGE_EMAIL2}
    Outlook.Choose Account     ${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    Sleep   3

    # STEP 3: Agent ends Email contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact    ${CUST2_EMAIL}

#=======================================================================================================================

#Created date:     18/05/2020
Workspaces_TC15 - Email - As an Agent, I want to process 2 Emails contact at same time
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

    # STEP 1: Open Outlook, from customer 1 send to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer 1 send to Server the Email without attachment
    Outlook.Open Outlook
    Slepe   1
    Outlook.Delete Old Email
    Sleep   1
    Outlook.Send Email Without Attachment  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Sleep   1
    Outlook.Send Email
#    Outlook.Close Outlook

    # STEP 2: Open Outlook, from customer 2 send to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Open Outlook, from customer 2 send to Server the Email without attachment
#    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT2_MAIL}     ${SUBJECT_MAIL2}        ${MESSAGE_EMAIL2}
    Outlook.Choose Account     ${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 3: Agent accepts Email from customer 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email from customer 1
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 4: Agent accepts Email from customer 2
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent accepts Email from customer 2
    Sleep   3
    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    Sleep   3

    # STEP 5: Agent ends Email 2 contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends Email 2 contact
    WorkCard.Agent Ends A Contact    ${CUST2_EMAIL}

    # STEP 6: Agent unhold and ends Email 1 contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent unhold and ends Email 1 contact
    WorkCard.Agent Unhold A Contact     ${CUST1_EMAIL}
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     02/06/2020
Workspaces_TC16 - Email - As an Agent, I want recipient email addresses auto populated when reply or reply all email contact
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
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Close Outlook
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent clicks Reply Email button
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent clicks Reply Email button
    WidgetEmail.Agent Replies Email

    # STEP 4: Verify info of Email customer is correct after click reply button
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify info of Email customer is correct after click reply button
    Verify Replied Email    ${CUST1_EMAIL}   ${AGENT1_MAIL}      ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}
#    [Arguments]    ${contact_info}    ${agent_email}    ${subject}    ${content}

    # STEP 5: Agent cancel send email then clicks Reply All Email button
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent cancel send email then clicks Reply All Email button
    WidgetEmail.Complete Send Email     cancel       ${CUST1_EMAIL}
    Sleep   1
    WidgetEmail.Agent Replies Email

    # STEP 6: Verify info of Email customer is correct after click reply all button
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify info of Email customer is correct after click reply all button
    Verify Replied Email    ${CUST1_EMAIL}   ${AGENT1_MAIL}      ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}
#    [Arguments]    ${contact_info}    ${agent_email}    ${subject}    ${content}

    # STEP 7: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent ends Email Contact
    WorkCard.Agent End Outbound Contact
    Sleep   1

#=======================================================================================================================

#Created date:     01/06/2020
Workspaces_TC17 - Email - MM only Agent can reply an Email without attachment
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
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent clicks Reply Email button then sends out Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent clicks Reply Email button then sends out Email without attachment
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     01/06/2020
Workspaces_TC18 - Email - MM only Agent can reply all Email without attachment
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
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent clicks Reply all Email button then sends out Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent clicks Reply all Email button then sends out Email without attachment
    WidgetEmail.Agent Replies All Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     02/06/2020
Workspaces_TC19 - Email - Make sure correct information of From, To address on received and reply email
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
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Verify info of Email customer is correct
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify info of Email customer is correct
    WidgetEmail.Verify Received Email   ${CUST1_EMAIL}   ${AGENT1_MAIL}      ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}
#    [Arguments]    ${contact_info}    ${agent_email}    ${subject}    ${content}

    # STEP 4: Agent clicks Reply Email button
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent clicks Reply Email button
    WidgetEmail.Agent Replies Email

    # STEP 5: Verify info of Email customer is correct after click reply button
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify info of Email customer is correct after click reply button
    Verify Replied Email    ${CUST1_EMAIL}   ${AGENT1_MAIL}      ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}
#    [Arguments]    ${contact_info}    ${agent_email}    ${subject}    ${content}

    # STEP 6: Agent sends out Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent sends out Email without attachment
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 7: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT1_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     04/06/2020
Workspaces_TC20 - Email - The email contact is returned to agent after agent rejects the email contactl by changing to Not Ready state
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
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Verify Email contact is presenting in Workspace then Agent reject it
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Email contact is presenting in Workspace then Agent reject it
    Verify Working Contact   ${CUST1_EMAIL}
    WorkCard.Agent Rejects A Contact    ${CUST1_EMAIL}
    AgentToolbar.Verify Not Ready   ${EMPTY}
    Sleep   2

    # STEP 3: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts Email
    AgentToolbar.Agent Go Ready
    Sleep   15
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 4: Agent ends Email contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email contact
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}


#=======================================================================================================================

#Created date:     09/06/2020
Workspaces_TC21 - Email - Agent can select an work code (Activity code) while processing Email contact
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL2}        ${MESSAGE_EMAIL2}
    Outlook.Choose Account     ${CUST1_EMAIL}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent set Activity code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Agent set Activity code
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Set Activity Code    ${CUST1_EMAIL}      ${ACTIVITY_CODE1}

    # STEP 4: Verify Activity code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Verify Activity code
    WorkCard.Verify Activity Code    ${CUST1_EMAIL}      ${ACTIVITY_CODE1}

    # STEP 5: Agent ends Email contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends Email contact
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     10/06/2020
Workspaces_TC22 - Email - Agent can select an disposition code (closed reason code) while processing Email contact
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
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Open Outlook, from customer sent to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL2}        ${MESSAGE_EMAIL2}
    Outlook.Choose Account     ${CUST1_EMAIL}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent set Disposition code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Agent set Disposition code
    WorkCard.Set Disposition Code    ${CUST1_EMAIL}     ${DISPOSITION_CODE1}

    # STEP 4: Verify Disposition code
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Verify Disposition code
    WorkCard.Verify Disposition Code    ${CUST1_EMAIL}      ${DISPOSITION_CODE1}

    # STEP 5: Agent ends Email contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends Email contact
    WorkCard.Agent Ends A Contact    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     22/05/2020
Workspaces_TC23 - Email - Agent can insert URL on email body when handling email contacts
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
    Outlook.Send Email Without Attachment  ${AGENT4_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent insert URL on email body and verify it display correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent insert URL on email body and verify it display correctly
    WidgetEmail.Agent Replies Email
    WidgetEmail.Insert Link     ${HELP_URL}     ${CUST1_EMAIL}
    WidgetEmail.Verify Insert Link     ${HELP_URL}      ${CUST1_EMAIL}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT4_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}    ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     25/05/2020
Workspaces_TC24 - Email - Agent can Undo, Redo when handling Email contacts.
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   15

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 3: Agent Reply Email, try to undo, redo email before send email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent clicks Reply Email, try to undo, redo email before send email
    WidgetEmail.Agent Replies Email
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}    ${EMPTY}
    WidgetEmail.Undo Email     ${CONTENT_EMAIL1}      ${CUST1_EMAIL}
    WidgetEmail.Redo Email     ${CONTENT_EMAIL1}      ${CUST1_EMAIL}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 5: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================


#=======================================================================================================================

#Created date:     25/05/2020
Workspaces_TC26 - Email - CC-18393 - Verify that cannot transfer created email
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

    # STEP 1: Agent creates new Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email
    AgentToolbar.Agent Create Email
    Sleep   1

    # STEP 2: Verify that Transfer button doesn't display when Agent initiate email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify that Transfer button doesn't display when Agent initiate email
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}
    ${check_transfer_btn} =     Run Keyword And Return Status    Page Should Not Contain Element     //button[@aria-label='Transfer']
    Run Keyword If    '${check_transfer_btn}' == 'True'    Log to console    Transfer Button doesn't display when Agent initiate Email
    ...     ELSE    Fail    Transfer Button displays when Agent initiate Email. This is Wrong!!
    Sleep   2

    # STEP 3: Agent end outbound contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent end outbound contact
    WorkCard.Agent End Outbound Contact
    Sleep   1

#=======================================================================================================================

#Created date:     27/04/2020
Workspaces_TC27 - Email - CC-18549 - Make sure interaction detail displays correct info when create new email
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers   AND
    ...     Sleep  2

    # STEP 1: Agent creates new Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email
    AgentToolbar.Agent Create Email
    Sleep   1

    # STEP 2: Verify Interaction Details
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02     Verify Interaction Details
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Interaction Details    ${EMPTY}   Email    ${EMPTY}
#    [Arguments]    ${contact_info}   ${channel}     ${service}

    # STEP 3: Agent end outbound contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent end outbound contact
    WorkCard.Agent End Outbound Contact
    Sleep   1


#=======================================================================================================================

#Created date:     26/05/2020
Workspaces_TC28 - Email - CC-18647 - Cannot send email reply if the body contains only the automatically inserted signature
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent create the Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent create the Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMAIL_SIGNATURE2}
    WidgetSettings.Save email signature

    # STEP 2: Enable auto insert Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Enable auto insert Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Auto Insert Email Signature   true
    WidgetSettings.Save email signature

    # STEP 3: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 4: Agent clicks Reply Email button then sends out Email with the body contains only the automatically inserted signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent clicks Reply Email button then sends out Email with the body contains only the automatically inserted signature
    WidgetEmail.Agent Replies Email
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 5: Disable auto insert Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Disable auto insert Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Auto Insert Email Signature   false
    WidgetSettings.Save email signature

    # STEP 6: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

    # STEP 7: Delete Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Delete Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMPTY}
    WidgetSettings.Save email signature


#=======================================================================================================================

#Created date:     27/05/2020
Workspaces_TC29 - Email - CC-18649 - Can send emails whose contents contain curly brackets {} on email details
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

    # STEP 1: Agent creates new Email whose contents contain curly brackets {} on email details and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email whose contents contain curly brackets {} on email details and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}{}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_EMAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     26/05/2020
Workspaces_TC30 - Email_CC-18650 Cannot create a new email before starting work
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Agent login to Workspaces and activate
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent login to Workspaces and activate
    Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}
    Login.Activate Agent
    Sleep   2

    # STEP 2: Verify cannot create a new email before starting work
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify cannot create a new email before starting work
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_CREATE_EMAIL}    timeout=10s
    ${check_btn_create_email} =     Get Element Attribute    ${LOC_AGENT_TOOLBAR_BTN_CREATE_EMAIL}   aria-label
    Run Keyword If    '${check_btn_create_email}' == 'No Email Capability'    Log to console    Cannot create a new email before starting work
    ...     ELSE   Fail    Can create a new email before starting work. This is wrong!!
    Sleep   2

    # STEP 3: Verify can create a new email after starting work
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify can create a new email after starting work
    AgentToolbar.Agent Start Work
    Sleep   5
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_CREATE_EMAIL}    timeout=10s
    ${check_btn_create_email} =     Get Element Attribute    ${LOC_AGENT_TOOLBAR_BTN_CREATE_EMAIL}   aria-label
    Run Keyword If    '${check_btn_create_email}' == 'Create Email'    Log to console   Can create a new email after starting work
    ...     ELSE   Fail    Cannot create a new email after starting work. This is wrong!!
    Sleep   1

#=======================================================================================================================

#Created date:     12/05/2020
Workspaces_TC31 - CC-18720 - Email - Verify the email tab still displays on agent after agent send out an accepted email
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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

    # STEP 1: Agent creates new Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email
    AgentToolbar.Agent Create Email
    Sleep   1

    # STEP 2: Open Outlook, from customer sent to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 3: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3

    # STEP 4: Agent clicks Reply Email button, then sends out Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent clicks Reply Email button, then sends out Email without attachment
    WidgetEmail.Agent Replies Email
    Sleep   1
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}     ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 5: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify customer received email from Agent
    Sleep   40
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   1

    # STEP 5: Agent continues send out Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent continues send out Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Complete Send Email     send       ${EMPTY}
    Sleep   1

    # STEP 6: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_EMAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

#Created date:     12/05/2020
Workspaces_TC32 - CC-18720 - Email - Verify the email tab still displays on agent after agent release the WC contact
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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

    # STEP 0: Open Outlook and delete old email
    Outlook.Open Outlook
    Sleep   1
    Outlook.Delete Old Email
    Sleep   1

    # STEP 1: Agent creates new Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email
    AgentToolbar.Agent Create Email
    Sleep   1

    # STEP 2: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT2_SKILLSET_WC1}
    Sleep   7

    # STEP 3: Agent accepts WC, then Agent and Customer chat together
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts WC, then Agent and Customer chat together
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_EMAIL}
    Sleep   1
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   2
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT3_FIRSTNAME}     Hello Customer, I'm Agent

    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 4: Agent ends webchat session
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}
    Sleep   2

    # STEP 5: Agent continues send out Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent continues send out Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Complete Send Email     send       ${EMPTY}
    Sleep   1

    # STEP 6: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_EMAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

#=======================================================================================================================

##Created date:     14/05/2020
#Workspaces_TC33 - CC-18720 - Email - Verify the email tab still displays on agent after agent accepts CDN call
#    [Setup]     Run Keywords
#    #   Setting Agent phone
#    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${AGENT2_PHONE_NUMBER}   ${PHONE2_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
#    #   Setting Customer phone
#    ...     OneXCommunicator.Open OneX      AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
#    #   Login blended agent to workspaces
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1
#    [Teardown]    Run Keywords
#    ...    AvayaIX.AvayaIX Log Out     AND
#    ...    AvayaIX.Close AvayaIX    AND
#    ...    OneXCommunicator.Close OneX      AND
#    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
#    ...    WorkCard.Agent End Any Inbound Contact      AND
#    ...    AgentToolbar.Agent Finish Work   AND
#    ...    AgentToolbar.Agent Exit      AND
#    ...    Close All Browsers
#
#    # STEP 0: Open Outlook and delete old recieved email
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Open Outlook and delete old recieved email
#    Outlook.Open Outlook
#    Sleep   3
#    Outlook.Delete Old Email
#
#    # STEP 1: Agent creates new Email
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email
#    AgentToolbar.Agent Create Email
#    Sleep   1
#
#    # STEP 2: Customer makes CDN call to Agent 1
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02     Customer makes CDN call to Agent 1
#    OneXCommunicator.OneX Call Out      ${CDN1}
#    Sleep   3
#
#    # STEP 3: Agent 1 accepts CDN call
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 accepts CDN call
#    WorkCard.Agent Accepts A Contact     ${CUST1_URI_CDN}
#    Sleep   3
#
#    # STEP 4: Agent 1 ends call
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 1 ends call
#    WorkCard.Agent Ends A Contact     ${CUST1_URI_CDN}
#    Sleep   1
#
#    # STEP 5: Agent continues send out Email
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent continues send out Email
#    Sleep   1
#    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM1}
#    WidgetEmail.Complete Send Email     send       ${EMPTY}
#    Sleep   1
#
#    # STEP 6: Verify customer received email from Agent
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify customer received email from Agent
#    Sleep   40
#    Outlook.Verify Received Email    ${MAIL_BOX1}    ${SUBJECT_EMAIL1}   ${CUST1_EMAIL}   ${EMPTY}
#    Sleep   2
#    Outlook.Close Outlook
#    Sleep   1

#=======================================================================================================================

#Created date:     15/06/2020
Workspaces_TC34_Email_CC-18973_Can release work card of outgoing email if choose create email once again
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   3
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Agent creates new Email and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}

    # STEP 2: Agent end outbound contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent end outbound contact
    WorkCard.Agent End Outbound Contact
    Sleep   1

    # STEP 3: Verify Have No Presenting Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Have No Presenting Contact
    WorkCard.Verify Have No Presenting Contact

#=======================================================================================================================

#Created date:     16/06/2020
Workspaces_TC35 - Email - CC-19109 Participants field is not displayed on Interaction Details of an email contact
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   3
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Agent creates new Email and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   5
    ${workcard_id} =    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    WorkCard.Open More Option   ${EMPTY}
    WorkCard.Checks Interaction Details    ${workcard_id}

    # STEP 2: Verify Email contact has no Participant list
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Email contact has no Participant list
    ${loc_participant_btn} =   String.Replace String    ${LOC_WORKCARD_BTN_PARTICIPANT_LIST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${check_participant_btn} =   Run Keyword And Return Status   Page Should Not Contain    ${loc_participant_btn}
    # close More button
    ${loc_ori_add} =    String.Replace String    ${LOC_WORKCARD_INTERACTION_ORIGINAL_ADDRESS}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Click Element   ${loc_ori_add}
    Run keyword if   '${check_participant_btn}'=='True'    Log to console   Email contact has no Participant list
    ...     ELSE    Fail    Email contact has Participant list. That wrong!

    # STEP 3: Agent end outbound contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent end outbound contact
    WorkCard.Agent End Outbound Contact
    Sleep   1

#=======================================================================================================================

#Created date:     12/06/2020
Workspaces_TC36 - CC-19784_Send out email successfully after finished and started work again during drafting email
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

    # STEP 1: Agent creates new Email and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}

    # STEP 2: Agent finish work then start work again
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent finish work then start work again
    AgentToolbar.Agent Finish Work
    Sleep   5
    AgentToolbar.Agent Start Work

    # STEP 3: Agent continue send out Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent continue send out Email
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 4: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify customer received email from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_EMAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

#=======================================================================================================================

#Created date:     01/06/2020
Workspaces_TC37 - Email - MM only Agent can process an email with attachment
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
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
    Outlook.Send Email With Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}      ${ATTACH_LINK_1}
    Outlook.Choose Account     ${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2: Agent accepts Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST2_EMAIL}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST2_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   3

    # STEP 3: Agent ends Email contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST2_EMAIL}

#=======================================================================================================================

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#=======================================================================================================================
#***************                                                                                         ***************
#******************                                EMAIL SIGNATURE                                     *****************
#***************                                                                                         ***************
#=======================================================================================================================
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#Created date:     07/05/2020
# TEST CASE 01: Workspaces_EmailSignature_TC01 - Agent can define, update, or save an EM signature
Workspaces_EmailSignature_TC01 - Agent can define, update, or save an EM signature
    [Documentation]  Workspaces_EmailSignature_TC01 - Agent can define, update, or save an EM signature
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Agent create the Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent create the Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMAIL_SIGNATURE2}
    WidgetSettings.Save email signature

    # STEP 2: Verify Email Signature is inserted to Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Email Signature is inserted to Email
    AgentToolbar.Agent Create Email
    Sleep   2
    WidgetEmail.Insert Email Signature
    Sleep   2
    WidgetEmail.Verify Email Signature  ${EMAIL_SIGNATURE2}
    WorkCard.Agent End Outbound Contact

    # STEP 3: Agent change the Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent change the Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMAIL_SIGNATURE}
    WidgetSettings.Save email signature

    # STEP 4: Verify Email Signature is inserted to Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Email Signature is inserted to Email
    AgentToolbar.Agent Create Email
    Sleep   2
    WidgetEmail.Insert Email Signature
    Sleep   2
    WidgetEmail.Verify Email Signature  ${EMAIL_SIGNATURE}
    WorkCard.Agent End Outbound Contact
    Sleep   1

    # STEP 5: Delete Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Delete Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMPTY}
    WidgetSettings.Save email signature
    Sleep   1

#=======================================================================================================================

#Created date:     07/05/2020
# TEST CASE 02: Workspaces_EmailSignature_TC02 - Agent can manual insert email signature sucessfully
Workspaces_EmailSignature_TC02 - Agent can manual insert email signature sucessfully
    [Documentation]  Workspaces_EmailSignature_TC02 - Agent can manual insert email signature sucessfully
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
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
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent create the Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent create the Email Signature
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
    WidgetEmail.Agent Sends Email    ${CUST1_EMAIL}     ${SUBJECT_MAIL1}     ${CONTENT_EMAIL1}     ${EMPTY}
    WidgetEmail.Complete Send Email     send       ${CUST1_EMAIL}
    Sleep   1

    # STEP 5: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

    # STEP 6: Delete Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Delete Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMPTY}
    WidgetSettings.Save email signature
    Sleep   1

#=======================================================================================================================

#Created date:     07/05/2020
# TEST CASE 03: WWorkspaces_EmailSignature_TC03 - Agent can auto-insert email signature sucessfully
Workspaces_EmailSignature_TC03 - Agent can auto-insert email signature sucessfully
    [Documentation]  Workspaces_EmailSignature_TC03 - Agent can auto-insert email signature sucessfully
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Agent create the Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent create the Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMAIL_SIGNATURE2}
    WidgetSettings.Save email signature

    # STEP 2: Enable auto insert Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Enable auto insert Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Auto Insert Email Signature   true
    WidgetSettings.Save email signature

    # STEP 3: Verify Email Signature is auto inserted to Email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Signature is auto inserted to Email
    AgentToolbar.Agent Create Email
    Sleep   2
    WidgetEmail.Verify Email Signature  ${EMAIL_SIGNATURE2}
    WorkCard.Agent End Outbound Contact

    # STEP 4: Disable auto insert Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Disable auto insert Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Auto Insert Email Signature   false
    WidgetSettings.Save email signature

    # STEP 5: Delete Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Delete Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMPTY}
    WidgetSettings.Save email signature
    Sleep   1

#=======================================================================================================================

#Created date:     03/06/2020
# TEST CASE 04 : Workspaces_EmailSignature_TC04 - Agent can insert URL on signature (both HTTP and HTTPS protocal)
Workspaces_EmailSignature_TC04 - Agent can insert URL on signature (both HTTP and HTTPS protocal)
    [Documentation]  Workspaces_EmailSignature_TC04 - Agent can insert URL on signature (both HTTP and HTTPS protocal)
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Close Outlook
    Sleep   10

    # STEP 2: Agent create the Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent create the Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Insert Link Signature    ${PUSH_URL1}
    WidgetSettings.Create Email Signature   RETURN      # send ENTER
    WidgetSettings.Insert Link Signature    ${PUSH_URL2}
    WidgetSettings.Create Email Signature   RETURN
    WidgetSettings.Create Email Signature   ${EMAIL_SIGNATURE}
    WidgetSettings.Save email signature

    # STEP 3: Agent accepts Email and reply email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts Email and reply email
    AgentToolbar.Agent Go Ready
    Sleep   2
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3
    WidgetEmail.Agent Replies Email
#
    # STEP 4: Agent insert Email signature and Verify Email signature displays in content email correctly
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent insert Email signature and Verify Email signature displays in content email correctly
    WidgetEmail.Insert Email Signature
    WidgetEmail.Verify Replied Email    ${CUST1_EMAIL}   ${AGENT1_MAIL}      ${SUBJECT_MAIL1}    ${PUSH_URL1}
    WidgetEmail.Verify Replied Email    ${CUST1_EMAIL}   ${AGENT1_MAIL}      ${SUBJECT_MAIL1}    ${PUSH_URL2}
    WidgetEmail.Verify Replied Email    ${CUST1_EMAIL}   ${AGENT1_MAIL}      ${SUBJECT_MAIL1}    ${EMAIL_SIGNATURE}
#    [Arguments]    ${contact_info}    ${agent_email}    ${subject}    ${content}

    # STEP 5: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends Email Contact
    WorkCard.Agent End Outbound Contact
    Sleep   1

    # STEP 6: Delete Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Delete Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMPTY}
    WidgetSettings.Save email signature

#=======================================================================================================================

#Created date:     03/06/2020
# TEST CASE 05: Workspaces_EmailSignature_TC05 - Agent can change Font size of texts on signature
Workspaces_EmailSignature_TC05 - Agent can change Font size of texts on signature
    [Documentation]  Workspaces_EmailSignature_TC05 - Agent can change Font size of texts on signature
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
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
    Outlook.Send Email Without Attachment  ${AGENT2_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Close Outlook
    Sleep   10

    # STEP 2: Agent create the Email Signature and can Change Font size of texts on signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent create the Email Signature and can Change Font size of texts on signature
    NavigationMenu.Open Settings
    Sleep   1
    WidgetSettings.Open Email Signature Tab
    Sleep   1
    WidgetSettings.Choose Font Size Signature    8
    WidgetSettings.Create Email Signature     Change Font size Small of texts on signature
    WidgetSettings.Create Email Signature     RETURN
    WidgetSettings.Choose Font Size Signature    12
    WidgetSettings.Create Email Signature     Change Font size Normal of texts on signature
    WidgetSettings.Create Email Signature     RETURN
    WidgetSettings.Choose Font Size Signature    14
    WidgetSettings.Create Email Signature     Change Font size Large of texts on signature
    WidgetSettings.Create Email Signature     RETURN
    WidgetSettings.Choose Font Size Signature    16
    WidgetSettings.Create Email Signature     Change Font size Huge of texts on signature
    WidgetSettings.Create Email Signature     RETURN
    Sleep   1
    WidgetSettings.Save email signature

    # STEP 3: Agent accepts Email and reply email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts Email and reply email
    AgentToolbar.Agent Go Ready
    Sleep   2
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3
    WidgetEmail.Agent Replies Email
    Sleep   1
    WidgetEmail.Insert Email Signature

    # STEP 4: Verify Agent can insert it into the reply email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Agent can insert it into the reply email
    WidgetEmail.Verify Font Size Email   ${CUST1_EMAIL}   8   Change Font size Small of texts on signature
    WidgetEmail.Verify Font Size Email   ${CUST1_EMAIL}   12   Change Font size Normal of texts on signature
    WidgetEmail.Verify Font Size Email   ${CUST1_EMAIL}   14   Change Font size Large of texts on signature
    WidgetEmail.Verify Font Size Email   ${CUST1_EMAIL}   16   Change Font size Huge of texts on signature

    # STEP 5: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends Email Contact
    WorkCard.Agent End Outbound Contact
    Sleep   1

    # STEP 6: Delete Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Delete Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMPTY}
    WidgetSettings.Save email signature

#=======================================================================================================================

#Created date:     18/05/2020
# TEST CASE 06: Workspaces_EmailSignature_TC06 - Agent can Undo, Redo on signature
Workspaces_EmailSignature_TC06 - Agent can Undo, Redo on signature
    [Documentation]  Workspaces_EmailSignature_TC06 - Agent can  Undo, Redo on signature
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Agent create the Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent create the Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMAIL_SIGNATURE2}
    WidgetSettings.Save email signature

    # STEP 2: Agent try to undo, redo after created Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent try to undo, redo after created Email Signature
    WidgetSettings.Undo Email Signature   ${EMAIL_SIGNATURE2}
    WidgetSettings.Redo Email Signature   ${EMAIL_SIGNATURE2}
    WidgetSettings.Save email signature

    # STEP 3: Delete Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Delete Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMPTY}
    WidgetSettings.Save email signature

#=======================================================================================================================

#Created date:     04/06/2020
# TEST CASE 07: Workspaces_EmailSignature_TC07 - Agent can use Bulltets, Numbers on signature and can insert it into the reply email
Workspaces_EmailSignature_TC07 - Agent can use Bulltets, Numbers on signature and can insert it into the reply email
    [Documentation]  Workspaces_EmailSignature_TC07 - Agent can use Bulltets, Numbers on signature and can insert it into the reply email
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Close Outlook
    Sleep   10

    # STEP 2: Agent create the Email Signature and use Bulltets, Numbers on signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent create the Email Signature and use Bulltets, Numbers on signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature     Test Insert Numbered List 1
    WidgetSettings.Choose Editor Signature    Insert Numbered List
    WidgetSettings.Create Email Signature     RETURN
    Sleep   0.5
    WidgetSettings.Create Email Signature     Test Insert Numbered List 2
    WidgetSettings.Choose Editor Signature    Insert Numbered List
    WidgetSettings.Create Email Signature     RETURN
    Sleep   0.5
    WidgetSettings.Create Email Signature     Test Insert List 1
    WidgetSettings.Choose Editor Signature    Insert List
    WidgetSettings.Create Email Signature     RETURN
    Sleep   1
    WidgetSettings.Create Email Signature     Test Insert List 2
    WidgetSettings.Choose Editor Signature    Insert List
    Sleep   5
    WidgetSettings.Save email signature

    # STEP 3: Agent accepts Email and reply email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts Email and reply email
    AgentToolbar.Agent Go Ready
    Sleep   2
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3
    WidgetEmail.Agent Replies Email

    # STEP 4: Verify Agent can insert it into the reply email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Agent can insert it into the reply email
    WidgetEmail.Insert Email Signature
    WidgetEmail.Verify Format Email   ${CUST1_EMAIL}   Insert Numbered List   Test Insert Numbered List 1
    WidgetEmail.Verify Format Email   ${CUST1_EMAIL}   Insert Numbered List   Test Insert Numbered List 2
    WidgetEmail.Verify Format Email   ${CUST1_EMAIL}   Insert List   Test Insert List 1
    WidgetEmail.Verify Format Email   ${CUST1_EMAIL}   Insert List   Test Insert List 2

    # STEP 5: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends Email Contact
    WorkCard.Agent End Outbound Contact
    Sleep   1

    # STEP 6: Delete Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Delete Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMPTY}
    WidgetSettings.Save email signature

#=======================================================================================================================

#Created date:     03/06/2020
# TEST CASE : Workspaces_EmailSignature_TC08 - Agent can change Bold, Italic, Underline of text on signature and can insert it into the reply email
Workspaces_EmailSignature_TC08 - Agent can change Bold, Italic, Underline of text on signature and can insert it into the reply email
    [Documentation]  Workspaces_EmailSignature_TC08 - Agent can change Bold, Italic, Underline of text on signature and can insert it into the reply email
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
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
    Outlook.Send Email Without Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Outlook.Close Outlook
    Sleep   10

    # STEP 2: Agent create the Email Signature and can change Bold, Italic, Underline of text on signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent create the Email Signature and can change Bold, Italic, Underline of text on signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Choose Editor Signature    Bold
    WidgetSettings.Create Email Signature     Change Bold of text on signature
    WidgetSettings.Create Email Signature     RETURN
    WidgetSettings.Choose Editor Signature    Bold      # uncheck Bold
    WidgetSettings.Choose Editor Signature    Italic
    WidgetSettings.Create Email Signature     Change Italic of text on signature
    WidgetSettings.Create Email Signature     RETURN
    WidgetSettings.Choose Editor Signature    Italic    # uncheck Italic
    WidgetSettings.Choose Editor Signature    Underline
    WidgetSettings.Create Email Signature     Change Underline of text on signature
    WidgetSettings.Save email signature

    # STEP 3: Agent accepts Email and reply email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts Email and reply email
    AgentToolbar.Agent Go Ready
    Sleep   2
    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
    Sleep   3
    WidgetEmail.Agent Replies Email

    # STEP 4: Verify Agent can insert it into the reply email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Agent can insert it into the reply email
    WidgetEmail.Insert Email Signature
    WidgetEmail.Verify Format Email   ${CUST1_EMAIL}   Bold   Change Bold of text on signature
    WidgetEmail.Verify Format Email   ${CUST1_EMAIL}   Bold   Change Italic of text on signature
    WidgetEmail.Verify Format Email   ${CUST1_EMAIL}   Bold   Change Underline of text on signature

    # STEP 5: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends Email Contact
    WorkCard.Agent End Outbound Contact
    Sleep   1

    # STEP 6: Delete Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Delete Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMPTY}
    WidgetSettings.Save email signature

#=======================================================================================================================

#Created date:     08/05/2020
# TEST CASE 09: Workspaces_EmailSignature_TC09 - Agent can send out email signature that contains some special characters such as slash, dollar, dot, percent
Workspaces_EmailSignature_TC09 - Agent can send out email signature that contains some special characters such as slash, dollar, dot, percent
    [Documentation]  Workspaces_EmailSignature_TC09 - Agent can send out email signature that contains some special characters such as slash, dollar, dot, percent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
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
    Outlook.Send Email Without Attachment  ${AGENT3_EMAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   1
    Outlook.Delete Old Email
    Sleep   20

    # STEP 2: Agent create the Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent create the Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMAIL_SIGNATURE3_SPECIAL_CHARACTERS}
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

    # STEP 5: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify customer received email from Agent
    Sleep   60
    Outlook.Verify Received Email    ${AGENT3_MAIL}    ${SUBJECT_MAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook
    Sleep   1

    # STEP 6: Delete Email Signature
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Delete Email Signature
    NavigationMenu.Open Settings
    WidgetSettings.Open Email Signature Tab
    WidgetSettings.Create Email Signature   ${EMPTY}
    WidgetSettings.Save email signature


#=======================================================================================================================









#Created date:     18/06/2020
## TEST CASE : Workspaces_TC107 - Email - CC-19472 Agent is still in Ready state after transfer an email twice with a long name attachment to the same skillset
#Workspaces_TC107 - Email - CC-19472 Agent is still in Ready state after transfer an email twice with a long name attachment to the same skillset
#    [Documentation]  Workspaces_TC107 - Email - CC-19472 Agent is still in Ready state after transfer an email twice with a long name attachment to the same skillset
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
#    # STEP 1: Open Outlook, from customer sent to Server the Email with Long Name Attachment
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email with Long Name Attachment
#    Outlook.Open Outlook
#    Outlook.Send Email With Attachment  ${AGENT1_MAIL}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}     ${ATTACH_LINK_2}
#    Outlook.Send Email
#    Sleep   1
#    Outlook.Delete Old Email
#    Sleep   20
#    Outlook.Close Outlook
#
#    # STEP 2: Agent accepts Email and verify Long Name Attachment displays correctly
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email and verify Long Name Attachment displays correctly
#    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
#    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
#    Sleep   2
#    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
#    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   ${ATTACHMENT_LONG_NAME2}
#    Sleep   1
#
#    # STEP 3: Agent chooses the skillset then transfer Email to service
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent chooses the skillset then transfer Email to service
#    WorkCard.Transfer To Service      ${CUST1_EMAIL}      ${AGENT1_SKILLSET_EM1}
#    Sleep   1
#
#    # STEP 4: Agent 2 go ready and accepts transferred Email
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 go ready and accepts transferred Email
#    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
#    AgentToolbar.Agent Go Ready
#    Sleep   1
#    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
#    WidgetEmail.Verify Email Attachment     ${CUST1_EMAIL}   ${ATTACHMENT_LONG_NAME2}
#    Sleep   1
#
#    # STEP 5: Agent 2 chooses the skillset then transfer Email to service
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 chooses the skillset then transfer Email to service
#    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
#    AgentToolbar.Agent Go Ready
#    Switch Browser    ${BROWSER_AGENT_ALIAS_2}
#    WorkCard.Transfer To Service     ${CUST1_EMAIL}    ${AGENT1_SKILLSET_EM1}
#    Sleep   1
#
#    # STEP 6: Verify status of Agent 2 still Ready
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify status of Agent 2 still Ready
#    AgentToolbar.Verify Ready
#    Sleep   2
#    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
#    Sleep   1
#
#    # STEP 7: Agent 1 accepts Email and ends Email Contact
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent 1 accepts Email and ends Email Contact
#    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
#    Sleep   10
#    WorkCard.Agent Accepts A Contact     ${CUST1_EMAIL}
#    Sleep   2
#    WorkCard.Agent Ends A Contact     ${CUST1_EMAIL}

#=======================================================================================================================


