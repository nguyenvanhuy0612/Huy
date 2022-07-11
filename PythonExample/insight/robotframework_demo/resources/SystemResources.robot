*** Settings ***
Documentation    System resource
#Resource    SystemResources_2_oanh.robot
#Resource    Resources_WS_Email.robot
#Resource    Resources_WS_Webchat.robot
#Resource    Resources_WS_Sanity.robot
#Resource    Resources_WS_Voice.robot
#Resource    Resources_WS_CustomerJourney.robot
#Resource    DRAFT.robot

Library     Selenium2Library     implicit_wait=30s    run_on_failure=Capture Page Screenshot
Library     String
Library     BuiltIn
Library     Calculator
Library     String
Library     Collections
Library     DateTime
Library     OperatingSystem
Library     subprocess
Library     os


Resource    SystemVariables.robot
Resource    TestDataVariables.robot
#Resource    Resources_WS_Email.robot
#Resource    Resources_WS_Voice.robot
#Resource    Resources_WS_Webchat.robot