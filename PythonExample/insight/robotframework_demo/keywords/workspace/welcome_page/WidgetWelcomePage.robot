*** Settings ***
Resource   ../../../resources/SystemResources.robot
Variables  WidgetWelcomePageLocator.py
Library    Selenium2Library


*** Keywords ***

# ====================================== EMAIL SIGNATURE ===============================================================
Search Agent Team
    [Arguments]    ${name_agent}    ${id_agent}

    Wait Until Element Is Visible    ${LOC_WIDGETWELCOME_IPT_SEARCH_TEAM}    timeout=30
    Input Text    ${LOC_WIDGETWELCOME_IPT_SEARCH_TEAM}      ${name_agent}

    # Verify Search Agent Successfully
    ${seach_result}=    String.Replace String    ${LOC_WIDGETWELCOME_MEMBER_SEARCH}    xxx    ${id_agent}
    Wait Until Element Is Visible    ${seach_result}    timeout=5
    Sleep   2
