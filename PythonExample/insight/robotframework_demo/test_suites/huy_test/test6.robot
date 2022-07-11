*** Settings ***
Library    String
Library    Selenium2Library
Library    Collections

Library    ../../keywords/outlook/outlookLib.py
Library    ../../keywords/avayaIXworkplace/AvayaIXworkplaceLib.py
#Library    ../../keywords/avayaIXworkplace/AvayaIXworkplaceLib.Phone


Resource    ../../resources/TestDataLab78_185Variables.robot
Resource    ../../resources/TestDataVariables.robot
Resource    ../../resources/SystemVariables.robot
Resource    ../../resources/SystemLibraries.robot
Resource    ../../resources/Resource_Workspace_Sanity.robot

*** Variables ***
${user}     huy1
${email}     huy@h.com
${name}     huy2
${var1}     xpath://*[@id='main-app-container']//cc-footer//div[contains(@class, 'state-panel')]/span/span

${LOC_WORK_CARDS}   "xpath://card-container[contains(@interaction-title, '{}')]"
*** Keywords ***
add num
    [Arguments]    ${time}=60
    ${add}=     Evaluate     ${time}+1
    [Return]    ${add}

*** Test Cases ***
Test 1
    ${to} =	Format String	To: {} <{}>	    ${user}	    ${email}
    ${to} =	Format String	To: {name} <{email}>	name=${name}	email=${email}
    #${to} =	Format String	To: {user.name} <{user.email}>	    user=${user}
    ${xx} =	Format String	{:*^30}	centered
    ${yy} =	Format String	{0:{width}{base}}	${42}	base=X	width=10
    ${zz} =	Format String	${CURDIR}/template.txt	positional	named=value

Test 2
    ${x}=   Format String   ${LOC_WORK_CARDS}   ${user}
    Log     ${x}

TEST 3 EWC

    Open Browser    https://100.30.7.185:8445/CustomerControllerWeb/    chrome
    ${count} =	Get Element Count	id:details-button
    Log To Console      ${count}
    Run Keyword If    ${count} > 0      Run Keywords    Click Button    id:details-button   AND     Sleep    2  AND     Click Element    id:proceed-link
    ${stt}=     Run Keyword And Return Status    Wait Until Page Contains Element    id:details-button
    Run Keyword If    ${stt} == False    Log To Console    ${stt}
    Sleep    5
    Close Browser

Test 4
    @{message_elements}=    Create List    first    second    third
    ${message_total}=    Get Length    ${message_elements}
    ${max_length}=    Evaluate    ${message_total}-1
    Log To Console      message_total = ${message_total}
    ${last_message}=    Get From List   ${message_elements}     ${max_length}


Test 5
    @{data}=    outlookLib.Get First Email Inbox
    Log To Console    ${data}[0]
    Log To Console    ${data}[1]
    Log To Console    ${data}[2]
    Log To Console    ${data}[3]

Test 6
    AvayaIXworkplaceLib.Login Phone     ${CUST8.PHONE}  ${CUST8.PHONE_PASSWORD}  ${CUST8.SERVER_INFO}
    #AvayaIXworkplaceLib.Logout Phone

Test 7
    outlookLib.Customer Sent An Email    ${MM_AGENT2.MAIL1}     ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}   abc.txt    ${CUST1_EMAIL}

Test 8
    ${a}=   add num     ${10}
    Log To Console    Tang them 1 la ${a}


Test 9
    ${number of icon}=  Set Variable    3
    FOR    ${index}    IN RANGE    ${number of icon}
        ${loc}=     Set Variable    ${var1}\[${index}\]
        Log    ${loc}
    END

Test 10
#    test
    Import Library    keywords/avayaIXworkplace/AvayaIXworkplaceLib.py
    Import Library    keywords/avayaIXworkplace/AvayaIXworkplaceLib.Phone
    Log To Console    ${\n}${CURDIR}
    test
    test phone

Test 11
    ${id}=   Set Variable    huy
    ${service}=     Set Variable    id:ow_navigate_next_Transfer_${id}
    log to console    ${id}, ${service}
Test 11 5
    ${timeout}=     Set Variable    10s
    ${result} =     Convert Time      ${timeout}
    FOR    ${index}    IN RANGE    ${result}
        Log To Console    ${index}
    END
Test 12
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    #...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Close AvayaIX    AND
#    ...     OneXCommunicator.Close OneX      AND
    ...     AvayaIXworkplaceLib.End All Calls      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1: Customer makes CDN call to Agent 1
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Customer makes CDN call to Agent 1
	AvayaIXworkplaceLib.Login Phone      ${CUST8.PHONE}     ${CUST8.PHONE_PASSWORD}    ${CUST8.SERVER_INFO}
    AvayaIXworkplaceLib.Make Call To Number     ${CDN_55086}
    Sleep   3

    # STEP 2: Agent 1 accepts CDN call
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent 1 accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     ${CUST8.PHONE_E164}
    Sleep   10