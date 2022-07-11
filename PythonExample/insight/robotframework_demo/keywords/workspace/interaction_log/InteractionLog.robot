*** Settings ***
Variables    InteractionLogLocator.py
Resource    ../../../resources/SystemResources.robot
Library     Selenium2Library
Resource    ../agent_toolbar/AgentToolbar.robot
Resource    ../interaction_area/WorkCard.robot

*** Keywords ***
#Author: Oanh Ho
#Created Date: 10/03/2020

Interaction Log Call
    [Documentation]    Login Agent to Workspaces
    [Arguments]     ${uri_phone}
    # click Interaction Log button
    Wait Until Page Contains Element    ${LOC_INTERACTIONLOG_BTN_INTERACTIONLOG}    ${TIMEOUT_MEDIUM}
    Click Element  ${LOC_INTERACTIONLOG_BTN_INTERACTIONLOG}
    Sleep  1
     Wait Until Page Contains Element    ${LOC_INTERACTIONLOG_LINE_CALL}    ${TIMEOUT_MEDIUM}
    Click Element  ${LOC_INTERACTIONLOG_LINE_CALL}
    Sleep  1
    # Choose customer's call
    ${interaction_call} =    String.Replace String    ${LOC_INTERACTIONLOG_BTN_CALL}    ${PHONE_URI}    ${uri_phone}
    Wait Until Element Is Visible    ${interaction_call}    10s
    Click Element   ${interaction_call}
    Sleep   1


