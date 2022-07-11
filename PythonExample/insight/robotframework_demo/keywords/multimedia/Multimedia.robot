*** Settings ***
Library    multimediaLib.py
Resource    ../../resources/SystemLibraries.robot

*** Test Cases ***
Test 1
    Open CCMM Administration

*** Keywords ***
#=======================================================================================================================
#Huy, date: May 12, 2021
Open CCMM Administration
    [Documentation]     Open IE and open CCMM admin
    [Arguments]
    Open Ccmm Admin