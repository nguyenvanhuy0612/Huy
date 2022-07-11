*** Settings ***
Resource    ../keywords/workspace/login/Login.robot

*** Test Cases ***
Khoa try to login agents to WS
    Login Agent    chrome   chrome_1    khoa@aoc.com       1_Abc_123