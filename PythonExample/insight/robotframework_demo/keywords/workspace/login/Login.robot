*** Settings ***
Variables    LoginLocator.py
#Resource    ../../../resources/SystemResources.robot
Resource    ../agent_toolbar/AgentToolbar.robot
Resource    ../interaction_area/WorkCard.robot
Resource    ../../../resources/SystemLibraries.robot

*** Keywords ***
#Keyword: Login And Activate Agent
#Author: Oanh Ho
#Created Date: 20/02/2020

Login Agent
    [Documentation]    Login Agent to Workspaces
    [Arguments]     ${browser_type}  ${browser_alias}  ${agent_username}  ${agent_password}
    ###########################
    ${options}=    Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    Call Method    ${options}    add_argument    --incognito
    #Call Method    ${options}    add_argument    --disable-gpu
    #${EXCLUDES}    Create list     enable-logging
    #Call Method    ${options}    add_experimental_option    excludeSwitches  ${EXCLUDES}
    Create WebDriver    Chrome    alias=${browser_alias}      chrome_options=${options}
    Go To    ${WORKSPACE_URL}
    ###########################
#    Open Browser    ${WORKSPACE_URL}    ${browser_type}      ${browser_alias}
    Maximize Browser Window
    Set Selenium Speed    0.5s
    Sleep    2
    # Waiting login page
    Wait Until Page Contains Element    ${LOC_WORKSPACE_LOGIN_BTN_SIGNIN}    ${TIMEOUT_MEDIUM}
    # Verify login page
    ${str_sign_in} =    Get Text    ${LOC_WORKSPACE_LOGIN_AGENT}
    Should Be Equal    ${str_sign_in}    Login Agent
    # Input username of agent
    Input Text       ${LOC_WORKSPACE_LOGIN_IPT_USERNAME}    ${agent_username}
    # Input password of agent
    Input Password   ${LOC_WORKSPACE_LOGIN_IPT_PASSWORD}    ${agent_password}
    Sleep   1
    # Click Sign in button
    Click Element    ${LOC_WORKSPACE_LOGIN_BTN_SIGNIN}
    Sleep   2

Activate Agent
    [Documentation]    Activate Agent
    [Arguments]    ${max active time}=60
    # Waiting activate page
    Wait Until Element Is Visible    ${LOC_WORKSPACE_LOGIN_BTN_ACTIVATE}    ${TIMEOUT_MEDIUM}

#    ${str_activate}=   Get Text    ${LOC_WORKSPACE_LOGIN_BTN_ACTIVATE}
#    Should Be Equal    ${strActivate}    Activate
    Sleep    2
    # Click activate button    
    Click Element    ${LOC_WORKSPACE_LOGIN_BTN_ACTIVATE}    action_chain=True
    Sleep   2
    # Wait
    Wait Until Element Is Not Visible    ${LOC_WORKSPACE_LOGIN_LABEL_AGENT_VERIFY}      ${max active time}
    # Wait and verify home page
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}    ${TIMEOUT_MEDIUM}
#    Run Keyword And Ignore Error    WorkCard.Release All Active Working Contacts
    #Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    #Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_READY}
    # Agent Go Ready
    #AgentToolbar.Agent Go Ready
    #Sleep    ${TIMEOUT_EXTRA_SHORT}
    #Run Keyword And Ignore Error    WorkCard.Release All Active Working Contacts

Verify Ativate Page Should Display Full Name Of Agent
    [Documentation]    Verify Ativate page should display full name of Agent
    [Arguments]     ${agent_username}
    Wait Until Page Contains Element    ${LOC_WORKSPACE_LOGIN_LABEL_AGENT}    ${TIMEOUT_MEDIUM}
    ${str_lable_agent}=   Get Text    ${LOC_WORKSPACE_LOGIN_LABEL_AGENT}
    Should Be Equal    ${str_lable_agent}    ${agent_username}


#======================================================================================================================
#   19/03/2020
Verify Error Login
    Wait Until Page Contains Element    ${LOC_WORKSPACE_ERROR_HEADER}    ${TIMEOUT_MEDIUM}
    ${get_error_header}=   Get Text    ${LOC_WORKSPACE_ERROR_HEADER}
    Should Be Equal    ${get_error_header}     Error happened!

    Wait Until Page Contains Element    ${LOC_WORKSPACE_ERROR_BODY}    ${TIMEOUT_MEDIUM}
    ${get_error_body}=   Get Text    ${LOC_WORKSPACE_ERROR_BODY}
    Should Be Equal    ${get_error_body}     Failed to authenticate user at domain. Please check your username and password.

Verify Agent Login Success
    Wait Until Element Is Not Visible    ${LOC_WORKSPACE_LOGIN_AVATAR}    60
    Sleep    1