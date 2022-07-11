##### WorkCard.robot #####

*** Settings ***
Resource   ../../../resources/SystemResources.robot
Variables    WidgetMyAgentLocator.py

Library     String
Library    Selenium2Library

*** Keywords ***

####################################################################################
Observe Contact
    [Arguments]    ${agent_name}    ${contact_info}
    Wait Until Element Is Visible    ${LOC_MYAGENT_SEARCH_AGENT}    timeout=10
    Input text    ${LOC_MYAGENT_SEARCH_AGENT}   ${agent_name}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_MYAGENT_DISPLAY_AGENT}    timeout=10
    ${check_work_item_observe} =     Run Keyword And Return Status    Wait Until Element Is Visible    ${LOC_WORK_ITEM_OBSERVE}    timeout=20
    Run Keyword If    '${check_work_item_observe}'=='False'    Click Element   ${LOC_MYAGENT_DISPLAY_AGENT}
    ${loc_button_observe} =    String.Replace String    ${LOC_MYAGENT_BTN_OBSERVE}    ${CONTACT_INFO_VAR}    ${contact_info}
    Wait Until Element Is Visible    ${loc_button_observe}    timeout=20
    Click Element    ${loc_button_observe}
    Sleep   1
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Element    ${LOC_BTN_END_OBSERVE}
    Sleep   1

# 14/09/2020
Change Agent Status
    [Arguments]    ${agent_name}    ${to_status}
    Wait Until Element Is Visible    ${LOC_MYAGENT_SEARCH_AGENT}    timeout=10
    Input text    ${LOC_MYAGENT_SEARCH_AGENT}   ${agent_name}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_MYAGENT_DISPLAY_AGENT}    timeout=10
    Click Element    ${LOC_MYAGENT_DISPLAY_AGENT}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_MYAGENT_BTN_STATUS_AGENT}    timeout=10
    Click Element    ${LOC_MYAGENT_BTN_STATUS_AGENT}
    Sleep   1
    ${loc_change_status} =    String.Replace String    ${LOC_MYAGENT_SELECT_STATUS_AGENT}    ${STATUS_AGENT}    ${to_status}
    Wait Until Element Is Visible    ${loc_change_status}    timeout=20
    Click Element    ${loc_change_status}
    Sleep   1

#  16/09/2020
Verify Agent Status
    [Arguments]    ${agent_name}    ${status}
    Wait Until Element Is Visible    ${LOC_MYAGENT_SEARCH_AGENT}    timeout=10
    Input text    ${LOC_MYAGENT_SEARCH_AGENT}   ${agent_name}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_MYAGENT_DISPLAY_AGENT}    timeout=10
    Click Element    ${LOC_MYAGENT_DISPLAY_AGENT}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_MYAGENT_BTN_STATUS_AGENT}    timeout=10
    Click Element    ${LOC_MYAGENT_BTN_STATUS_AGENT}
    Sleep   1
    ${loc_status} =    String.Replace String    ${LOC_MYAGENT_SELECT_STATUS_AGENT}    ${STATUS_AGENT}    ${status}
    ${start_work_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${loc_status}    timeout=45s
    Run Keyword If    '${start_work_status}'=='True'    Log To console   Status of Agent is ${status}
    ...   ELSE   Fail   Agent does not change status
    Sleep    1


########################################################################################################################
############################################   KEYWORDS ######################################################
########################################################################################################################
