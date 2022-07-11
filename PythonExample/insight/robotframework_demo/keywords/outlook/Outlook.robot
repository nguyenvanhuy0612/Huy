*** Settings ***
Documentation   Suite description
Variables       OutlookLocator.py
Resource    ../../resources/SystemResources.robot

Library    BuiltIn
Library    Selenium2Library
Library     subprocess  # library for open the application
Library     OutlookLocator.py

*** Keywords ***
# Author: Oanh Ho
# Created date: 17/02/2020
Open Outlook
#    subprocess.run  ${OUTLOOK_APP}
    OutlookLocator.safe open outlook    ${OUTLOOK_APP}
    Sleep   2

Close Outlook
    Sleep   1
    OutlookLocator.Close Outlook
    Sleep   0.5

Send Email Without Attachment
    [Arguments]     ${mail_box}     ${subject}      ${message_mail}
    OutlookLocator.click_new_button
    Sleep   2
    OutlookLocator.create_new_email    ${mail_box}     ${subject}  ${message_mail}
    Sleep   3

Send Email With Attachment
    [Arguments]     ${mail_box}     ${subject}      ${message_mail}     ${attach_file}
    OutlookLocator.click_new_button
    Sleep   1
    OutlookLocator.create_new_email    ${mail_box}     ${subject}  ${message_mail}
    Sleep   1
    OutlookLocator.attach_file     ${attach_file}
    Sleep   1

# 07/07/2020
Send Email Plain Text
    [Arguments]     ${mail_box}     ${subject}      ${message_mail}
    OutlookLocator.click_new_button
    Sleep   2
    OutlookLocator.create_new_email_plain    ${mail_box}     ${subject}  ${message_mail}
    Sleep   3

# 28/5/2020
Attach File
    [Arguments]     ${attach_file}
    OutlookLocator.attach_file     ${attach_file}
    Sleep   1

Choose Account
    [Arguments]     ${mail_from}
    OutlookLocator.choose_account   ${mail_from}
    Sleep   1

#   20/5/2020
Insert Image
    [Arguments]     ${link_image}
    OutlookLocator.insert_inline_image   ${link_image}

Send Email
    OutlookLocator.click_send_button
    Sleep   1

#   06/04/2020
Delete Old Email
    OutlookLocator.delete_old_email
    Sleep   1

#   06/04/2020
Verify Received Email
    [Arguments]     ${mail_box}     ${subject}    ${cust_email}     ${attachment}=${EMPTY}
    OutlookLocator.click_receive_button
    # verify subject email
    ${loc_subject} =    OutlookLocator.verify_subject_receive
    Should Contain    ${loc_subject}    ${subject}
    Log To Console   Subject: ${loc_subject}
    # verify agent email
    ${loc_agent_email} =    OutlookLocator.verify_email_receive
    Should Contain    ${loc_agent_email}    ${mail_box}
    Log To Console      Customer Received Email from Agent
    Log To Console   Mailbox: ${loc_agent_email}
    # verify email of customer
    ${loc_cust_email} =    OutlookLocator.verify_email_to
    Should Contain    ${loc_cust_email}    ${cust_email}
    Log To Console   To: ${loc_cust_email}
    Sleep   1
    # verify attachment
    Run keyword unless  '${attachment}'=='${EMPTY}'    Run keywords   OutlookLocator.verify_attachment    ${attachment}   AND    Log To Console   Attachment: ${attachment}
    Sleep   1

Verify Content Email
    [Arguments]     ${content}
    OutlookLocator.verify_content_email
#    Log to console  Content Email: OutlookLocator.verify_content_email
#    Should Contain   OutlookLocator.verify_content_email    ${content}
#    Sleep   1
    AgentToolbar.Agent Create Email
    Sleep   3
    Wait Until Element Is Visible    ${CONTENT_EMAIL_WEB}    timeout=30s
    Press keys    ${CONTENT_EMAIL_WEB}    CTRL+v

    Wait Until Element Is Visible    ${CONTENT_ELEMENT_EMAIL_WEB}    timeout=10s
    @{content_element}=    Get WebElements     ${CONTENT_ELEMENT_EMAIL_WEB}
    ${content_total}=    Get Length    ${content_element}
    log to console  iii=${content_total}
    FOR     ${i}    IN RANGE    0   ${content_total}
    \   ${content_line} =  Get Text    ${content_element}[${i}]
    \   log to console   ${i}------${content_line}
    \   Run Keyword If  '${content_line}'=='${content}'   Run keywords   Log to console   Content Email display correctly   AND    Exit For Loop
    \   ELSE    Click Element   ${content_element}[${i}]
    Sleep   1
    WorkCard.Agent End Outbound Contact
    Sleep   1

#   06/04/2020
Verify Receive Attachment
    [Arguments]     ${attachment}
    OutlookLocator.click_receive_button
    # verify subject email
    ${loc_attach} =    OutlookLocator.verify_attachment_receive(attachment)
    Should Contain    ${loc_attach}    ${attachment}
    Log To Console      Customer Received Attachment
    Sleep   1

#Check Attachment
#    [Arguments]     ${value} #  yes or no
#    Run Keyword If  '${value}'=='yes'   Log to console    This Email had atachment file
#    ...     ELSE    Fail    Cannot find the Attachment in this Email