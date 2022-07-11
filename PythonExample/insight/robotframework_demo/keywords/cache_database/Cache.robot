*** Settings ***
Resource    ../../resources/SystemLibraries.robot
Resource    ../../resources/SystemVariables.robot

*** Variables ***
${cache url}    http://localhost:57772/csp/sys/UtilHome.csp

*** Keywords ***
Launch browser and login to cache
    Open Browser    ${BROWSER_CHROME}   ${cache url}