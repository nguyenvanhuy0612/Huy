*** Settings ***
Documentation    For test and plan design
Resource    ../../../resources/Resource_Workspace_Sanity.robot

*** Test Cases ***
Login Plan
    # Open chrome and Login agent
    Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}
    # verify activate page present
    # wait > Active Button
    # Click > active
    # check LOC_WORKSPACE_LOGIN_LABEL_AGENT_VERIFY not visible 60s
    Login.Activate Agent
    # verify ws page [skip to next check]
    # get agent state
#    Wait Until Agent Status Changes To    Connected     ${30}
    AgentToolbar.Agent Start Work
##    Wait Until Agent Status Changes To    Not Ready     ${30}
    AgentToolbar.Agent Go Ready
##    Wait Until Agent Status Changes To    Ready     ${30}
    #Sleep   10
#
#
#    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent End Any Inbound Contact
    AgentToolbar.Agent Finish Work
    AgentToolbar.Agent Exit
    Close All Browsers

