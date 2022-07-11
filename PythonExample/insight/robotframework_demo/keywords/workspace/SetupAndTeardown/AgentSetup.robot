*** Settings ***
Resource    ../../../resources/SystemLibraries.robot
Resource    ../../../resources/SystemVariables.robot
Resource    ../login/Login.robot



*** Keywords ***

#=======================================================================================================================
# Huy, May 17, 2021
Login Agent On Workspaces And Go Ready
    [Arguments]     ${BROWSER_AGENT}    ${BROWSER_AGENT_ALIAS}    ${AGENT_USERNAME}    ${AGENT_PASSWORD}
    Login.Login Agent    ${BROWSER_AGENT}    ${BROWSER_AGENT_ALIAS}    ${AGENT_USERNAME}    ${AGENT_PASSWORD}
    Login.Activate Agent
    Login.Verify Agent Login Success
    AgentToolbar.Agent Start Work
    AgentToolbar.Agent Go Ready
    Sleep    2