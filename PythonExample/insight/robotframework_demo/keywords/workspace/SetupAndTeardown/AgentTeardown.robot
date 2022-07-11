*** Settings ***
Resource    ../../../resources/SystemLibraries.robot
Resource    ../../../resources/SystemVariables.robot
Resource    ../login/Login.robot



*** Keywords ***

#=======================================================================================================================
# Huy, May 17, 2021
Release All Contacts And Exit Agent
    [Arguments]     ${BROWSER_AGENT_ALIAS}
    Switch Browser    ${BROWSER_AGENT_ALIAS}
    WorkCard.Agent End Any Inbound Contact
    AgentToolbar.Agent Finish Work
    AgentToolbar.Agent Exit
    Close All Browsers