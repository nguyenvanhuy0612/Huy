*** Settings ***
Documentation   Suite description
Variables      AvayaCommunicatorLocator.py
Resource    ../../resources/SystemVariables.robot

Library    BuiltIn
Library    Selenium2Library
Library     subprocess  # library for open the application
Library     AvayaCommunicatorLocator.py

*** Keywords ***
# Author: Oanh Ho
# Created date: 17/02/2020
Open Avaya Communicator     # for ACCS
    [Documentation]    Open Avaya Communicator
    [Arguments]     ${phone_number}      ${phone_password}     ${serverIP}      ${domain}

    subprocess.run  ${AVAYA_COMMUNICATOR}
    Sleep   2
    Setting Telephony

Setting Telephony
    [Documentation]  Setting Telephony
    [Arguments]     ${phone_number}      ${phone_password}     ${serverIP}      ${domain}
     AvayaCommunicatorLocator.click_setting
     AvayaCommunicatorLocator.settings_server   ${serverIP}     ${domain}
     AvayaCommunicatorLocator.login_extension   ${phone_number}      ${phone_password}

Avaya CommunicatorLocator Makes Call Out
    [Documentation]  Open
    [Arguments]     ${phone_call_out}
    AvayaCommunicatorLocator.make_call_out_by_phoneset     ${phone_call_out}

Hold Call By PhoneSet
    [Documentation]  Open
    [Arguments]
    AvayaCommunicatorLocator.hold_call_by_phoneset

Unhold Call By PhoneSet
    [Documentation]  Open
    [Arguments]
    AvayaCommunicatorLocator.unhold_call_by_phoneset

Release Call By PhoneSet
    [Documentation]  Open
    [Arguments]
    AvayaCommunicatorLocator.release_call_by_phoneset
