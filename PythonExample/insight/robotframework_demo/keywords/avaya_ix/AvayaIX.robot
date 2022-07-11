*** Settings ***
Documentation   Suite description
Variables       AvayaIXLocator.py
Resource    ../../resources/SystemVariables.robot

Library    BuiltIn
Library    Selenium2Library
Library     subprocess  # library for open the application
Library     os
Library     AvayaIXLocator.py
*** Keywords ***
# Author: Oanh Ho
# Created date: 23/02/2020
Open AvayaIX
    [Documentation]    Open AvayaIX
    [Arguments]

#    subprocess.call  ${AVAYA_IX_WORKPLACE}
    os.startfile    ${AVAYA_IX_WORKPLACE}
    Sleep   30
    AvayaIXLocator.check_Other_AvayaIX
    Sleep   1
#    check_tip
#    check_login

Setting Telephony
    [Arguments]     ${phone_number}      ${phone_password}     ${sm_server}     ${port}     ${domain}
    AvayaIXLocator.click_setting
    AvayaIXLocator.setting_ix     ${phone_number}      ${phone_password}     ${sm_server}     ${port}     ${domain}
    Sleep   1
    AvayaIXLocator.click_login
    Sleep   3

AvayaIX Call Out
    [Arguments]     ${call_phone}
    AvayaIXLocator.call_out        ${call_phone}
    Sleep   1

AvayaIX Accept Call
    AvayaIXLocator.call_accept
    Sleep   1

AvayaIX Hold Call
    AvayaIXLocator.hold_call
    Sleep   1

AvayaIX Unhold Call
    AvayaIXLocator.unhold_call
    Sleep   1

AvayaIX Release Call
    AvayaIXLocator.end_call
    Sleep   1

AvayaIX Log Out
    AvayaIXLocator.click_logout
    Sleep   2

Close AvayaIX
    AvayaIXLocator.close_AvayaIX
    Sleep   1


#Send Email With Attachment
#    [Documentation]  Open
#    [Arguments]     ${mail_box}     ${subject}      ${message_mail}     ${attach_file}
#    click_new_button
#    Sleep   3
#    create_new_email    ${mail_box}     ${subject}  ${message_mail}
#    Sleep   3
#    attach_file     ${attach_file}
#    Sleep   3
#    click_send_button

