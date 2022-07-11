*** Settings ***
Resource   ../../../resources/SystemResources.robot
Variables  WebStatisticLocator.py
Library     String
*** Variables ***
*** Keywords ***

#   29/12/2020
Select Skillset Statistic
    [Arguments]    ${skillset}
    ${loc_select_skillset} =    String.Format String    ${LOC_WEBSTATISTIC_SELECT_SKILLSET}    ${skillset}
    Sleep   0.5
    Wait Until Element Is Visible    ${loc_select_skillset}   timeout=5
    Click Element    ${loc_select_skillset}
    Sleep   0.5

#   30/12/2020
Select Chart Type Statistic
    [Arguments]    ${chart_type}
    ${class_chart_type} =    String.Format String    ${CLASS_BTN_CHART}    ${chart_type}
	Sleep   0.5
	Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_BTN_CHART}   timeout=5
	${get_class_chart_type} =   Get Element Attribute    ${LOC_WEBSTATISTIC_BTN_CHART}    class
	Run Keyword Unless   '${class_chart_type}'=='${get_class_chart_type}'    Click Element    ${LOC_WEBSTATISTIC_BTN_CHART}
	Sleep   0.5

#   11/1/2021
Check Alert Statistic
    [Arguments]    ${status}    #true or false
	Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_BTN_CHART}   timeout=5
	${get_alert_status} =   Get Element Attribute    ${LOC_WEBSTATISTIC_ALERT}    aria-checked
	Run Keyword Unless   '${status}'=='${get_alert_status}'    Click Element    ${LOC_WEBSTATISTIC_ALERT}
	Sleep   0.5

#   29/1/2021
Sort Statistic
    [Arguments]    ${status}    #up or down
	Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_BTN_SORT}   timeout=5
	${get_sort_status} =   Get Element Attribute    ${LOC_WEBSTATISTIC_BTN_SORT}    class
	${check_status} =    Run Keyword And Return Status      Should Contain     ${get_sort_status}    ${status}
	Run Keyword Unless   '${check_status}'=='True'     Click Element    ${LOC_WEBSTATISTIC_BTN_SORT}
	Sleep   0.5

#   29/12/2020
Verify Chart Statistic
   [Arguments]      ${chart_name}   ${Reference_Image_Path}    ${Test_Image_Path}
    WebStatisticLocator.DownloadChart   ${chart_name}     ${Test_Image_Path}
    Sleep   1
    ${check_compare_images} =    WebStatisticLocator.compare_images    ${Reference_Image_Path}    ${Test_Image_Path}
    Log To Console      ${check_compare_images}
    Run Keyword if   '${check_compare_images}'=='False'    Fail    Chart displays wrong data

#   11/1/2021
Verify Service Level
    [Arguments]      ${percentage}
    Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_SERVICE_LEVEL}   timeout=5
    ${get_percent} =     Get Text    ${LOC_WEBSTATISTIC_SERVICE_LEVEL}
    Should Be Equal     ${percentage}    ${get_percent}
    Sleep   0.5

#   25/01/2021
Verify Alert Statistic
    [Arguments]    ${skillset}
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    ${loc_alert_dialog} =    String.Format String    ${LOC_WEBSTATISTIC_ALERT_DIALOG}    ${skillset}
    Wait Until Element Is Visible    ${loc_alert_dialog}   timeout=5
    Sleep   0.5
