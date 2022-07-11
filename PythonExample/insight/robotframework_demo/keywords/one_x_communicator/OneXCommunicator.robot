*** Settings ***
Documentation   Suite description
Variables       OneXCommunicatorLocator.py
Resource    ../../resources/SystemResources.robot

Library    BuiltIn
Library     os
Library    Selenium2Library
Library     subprocess  # library for open the application
Library     OneXCommunicatorLocator.py
*** Keywords ***
# Author: Oanh Ho
# Created date: 17/02/2020

Open OneX
    [Documentation]    Open One X Communicator

#    subprocess.run  ${ONE_X_COMMUNICATOR}
    os.startfile    ${ONE_X_COMMUNICATOR}
    Sleep   10
    OneXCommunicatorLocator.Check Error
    Sleep   2

Setting Telephony
    [Arguments]     ${phone_number}      ${phone_password}     ${server_h323}
    OneXCommunicatorLocator.click_setting
    OneXCommunicatorLocator.setting_onex    ${phone_number}     ${phone_password}   ${server_h323}
    Sleep   1
    OneXCommunicatorLocator.click_login
    Sleep   3

OneX Call Out
    [Arguments]     ${call_phone}
    OneXCommunicatorLocator.call_out        ${call_phone}
    Sleep   1

OneX Accept Call
    OneXCommunicatorLocator.call_accept
    Sleep   1

OneX Hold Call
    OneXCommunicatorLocator.hold_call
    Sleep   1

OneX Unhold Call
    OneXCommunicatorLocator.unhold_call
    Sleep   1

OneX Release Call
    OneXCommunicatorLocator.end_call
    Sleep   1

Close OneX
#    OneXCommunicatorLocator.click_setting
    OneXCommunicatorLocator.click_logout
    Sleep   0.5
    OneXCommunicatorLocator.click_exit
#    OneXCommunicatorLocator.close_onex
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

