*** Settings ***
Resource    ../../../resources/SystemResources.robot
Variables    ScreenpopLocator.py
Library    String

*** Keywords ***

# 16/03/2020
Verify Screenpop Name Displays
    [Documentation]    Verify Screenpop name display on taskbar in Screenpop page
    [Arguments]    ${screenpop_name}
    # Get all tab screenpop
    ${screenpop_all_name}=    Set Variable    ${EMPTY}
    @{screenpop_spans}=    Get WebElements    ${LOC_SCREENPOP_LIST_SPAN_SCREENPOP}
    FOR    ${screenpop_span}     IN    @{screenpop_spans}
        ${screenpop_txt}=    Get Text    ${screenpop_span}
        ${screenpop_all_name}=    Catenate    ${screenpop_all_name}    ${screenpop_txt}
    END
    Log To Console    screenpop = ${screenpop_all_name}
    ${screenpop_name}=     String.Convert To Upper case    ${screenpop_name}
    Should Contain    ${screenpop_all_name}    ${screenpop_name}

# Author: hnguyenphuc
# Created date: 22 Aug 2018
# Variable:
#         ${screenpop_name}: screenpop name
Verify Screenpop Name Not Displayed On Screenpop Tab
    [Documentation]    Verify Screenpop name display on taskbar in Screenpop page
    [Arguments]    ${screenpop_name}
    # Get all tab screenpop
    ${screenpop_all_name}=    Set Variable    ${EMPTY}
    @{screenpop_spans}=    Get WebElements    ${LOC_SCREENPOP_LIST_SPAN_SCREENPOP}
    :FOR    ${screenpop_span}     IN    @{screenpop_spans}
    \    ${screenpop_txt}=    Get Text    ${screenpop_span}
    \    ${screenpop_all_name}=    Catenate    ${screenpop_all_name}    ${screenpop_txt}
    ${screenpop_name}=     String.Convert To Upper case    ${screenpop_name}
    Should Not Contain    ${screenpop_all_name}    ${screenpop_name}

# Author: hnguyenphuc
# Created date: 22 Aug 2018
# Variable:
#         ${screenpop_name}: screenpop name
#         ${screenpop_url}: url of screen pop
Click Screenpop On Screenpop Tab
    [Documentation]    Open screenpop by clicking screenpop on screenpop tab
    [Arguments]    ${screenpop_name}
    ${screenpop_name}=    String.Convert To Upper case    ${screenpop_name}
    @{screenpop_spans}=    Get WebElements    ${LOC_SCREENPOP_LIST_SPAN_SCREENPOP}
    :FOR    ${screenpop_span}     IN    @{screenpop_spans}
    \    ${screenpop_txt}=    Get Text    ${screenpop_span}
    \    Run Keyword If    '${screenpop_txt}'=='${screenpop_txt}'    Run Keywords    Click Element    ${screenpop_span}    AND    Exit For Loop
    Sleep    2

# Author: hnguyenphuc
# Created date: 22 Aug 2018
# Variable:
#         ${screenpop_url}: url of screen pop
Verify Screenpop Displayed On External Browser
    [Documentation]    Verify screenpop displayed on external browser with correct url
     [Arguments]    ${screenpop_url}
    # Switch browser to screenpop
    ${handle}=	Select Window	NEW
    # Get URL to compare
    ${location}=    Get Location
    should be equal    ${location}    ${screenpop_url}
    # Come back to main window
    Select Window    #
