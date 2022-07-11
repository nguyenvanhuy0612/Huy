*** Settings ***
Resource    ../resources/Resources_CC_19969_Workspaces_Client_support_for_Closing_Contacts.robot



*** Test Cases ***
#=======================================================================================================================
#Created date:     /2021
CC-19969-TC001-Verify that agent cannot close contacts if Close multiple contacts option is set to None in CCMM
#=======================================================================================================================
#Created date:     /2021
CC-19969-TC002-Verify that MM only agent can close 1 new email contacts if Close multiple contacts option is set to Agent in CCMM
    [Setup]    Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   False    False   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   False   False   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login Agent to Workspaces. Open Multimedia Contact Search widget
    outlookLib.Customer Sent An Email    ${MM_AGENT1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    10
    Open Multimedia Contact Search

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Search for Email contacts with New status
    MultimediaContactSearch.Search By    Status     New
    Click Add More Search Parameter
    MultimediaContactSearch.Search By    Channel     Email
    Click Search Button

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Select one contact and click Close Contacts button
    Select Contact In Line    line=1
    Click Close Selected Contacts

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything
    Select Close Reason Code With Agent Note In Prompt     Completed      Agent note 1

#=======================================================================================================================
#Created date:     /2021
CC-19969-TC003-Verify that MM only agent can close some new email contacts if Close multiple contacts option is set to Agent in CCMM
    [Setup]    Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   False    False   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   False   False   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login Agent to Workspaces. Open Multimedia Contact Search widget
    outlookLib.Customer Sent An Email    ${MM_AGENT1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    3
    outlookLib.Customer Sent An Email    ${MM_AGENT1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    3
    Open Multimedia Contact Search

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Search for Email contacts with New status
    MultimediaContactSearch.Search By    Status     New
    Click Add More Search Parameter
    MultimediaContactSearch.Search By    Channel     Email
    Click Search Button

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Select one contact and click Close Contacts button
    Select Contact In Line    line=1
    Click Close Selected Contacts

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything
    Select Close Reason Code With Agent Note In Prompt     Completed      Agent note 1
    Sleep    1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything
    Select Contact In Line    line=1
    Click Close Selected Contacts
    Select Close Reason Code With Agent Note In Prompt     agent_note=Agent note 2


#=======================================================================================================================
#Created date:     /2021
CC-19969-TC004-Verify that Blended agent can close 1 waiting email contacts if Close multiple contacts option is set to Agent in CCMM
    [Setup]    Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Set Selenium Speed    0.5
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login Agent to Workspaces. Open Multimedia Contact Search widget
    outlookLib.Customer Sent An Email    ${BL_AGENT1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    10
    Open Multimedia Contact Search

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Search for Email contacts with New status
    MultimediaContactSearch.Search By    Status     New
    Click Add More Search Parameter
    MultimediaContactSearch.Search By    Channel     Email
    Click Search Button

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Select one contact and click Close Contacts button
    Select Contact In Line    line=1
    Click Close Selected Contacts

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything
    Select Close Reason Code With Agent Note In Prompt     Completed      Agent note 1
    Sleep    1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything
    Select Contact In Line    line=1
    Click Close Selected Contacts
    Select Close Reason Code With Agent Note In Prompt     agent_note=Agent note 2


#=======================================================================================================================
#Created date:     /2021
CC-19969-TC005-Verify that Blended agent can close some waiting email contacts if Close multiple contacts option is set to Agent in CCMM
    [Setup]    Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login Agent to Workspaces. Open Multimedia Contact Search widget
    outlookLib.Customer Sent An Email    ${BL_AGENT1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    10
    outlookLib.Customer Sent An Email    ${BL_AGENT1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    10
    Open Multimedia Contact Search

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Search for Email contacts with New status
    MultimediaContactSearch.Search By    Status     New
    Click Add More Search Parameter
    MultimediaContactSearch.Search By    Channel     Email
    Click Search Button

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Select one contact and click Close Contacts button
    Select Contact In Line    line=1
    Click Close Selected Contacts

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything
    Select Close Reason Code With Agent Note In Prompt     CRC_Completed      Agent note 1
    Sleep    1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything
    Select Contact In Line    line=1
    Click Close Selected Contacts
    Select Close Reason Code With Agent Note In Prompt     agent_note=Agent note 2


#=======================================================================================================================
#Created date:     /2021
CC-19969-TC006-Verify that Blended agent can close some new and waiting email contacts if Close multiple contacts option is set to Agent in CCMM
    [Setup]    Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login Agent to Workspaces. Open Multimedia Contact Search widget
    outlookLib.Customer Sent An Email    ${BL_AGENT1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    10
    outlookLib.Customer Sent An Email    ${BL_AGENT1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    10
    Open Multimedia Contact Search

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Search for Email contacts with New status
    MultimediaContactSearch.Search By    Status     New
    Click Search Button

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Select one contact and click Close Contacts button
    Select Contact In Line    line=1
    Click Close Selected Contacts

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything
    Select Close Reason Code With Agent Note In Prompt     CRC_Completed      Agent note 1
    Sleep    1

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything
    MultimediaContactSearch.Search By    Status     Waiting
    Click Search Button
    Select Contact In Line    line=1
    Click Close Selected Contacts
    Select Close Reason Code With Agent Note In Prompt     agent_note=Agent note 2


#=======================================================================================================================
#Created date:     /2021
CC-19969-TC007-Verify that agent (without Supervisor role) cannot close contacts if Close multiple contacts option is set to Supervisor in CCMM
    [Setup]    Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_AGENT1.USERNAME}    ${BL_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login Agent (without Supervisor role) to Workspaces. Open Multimedia Contact Search widget
    outlookLib.Customer Sent An Email    ${BL_AGENT1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    10
    Open Multimedia Contact Search
    Search By    Status     New
    Click Search Button
    Page Should Not Contain Element    ${LOC_CHECKBOX_VERIFY}   10s


#=======================================================================================================================
#Created date:     /2021
CC-19969-TC008-Verify that MM only Supervisor agent can close 1 New email contacts if Close multiple contacts option is set to Supervisor in CCMM
    [Setup]    Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_SUP1.USERNAME}    ${MM_SUP1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers
    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login MM only Supervisor Agent to Workspaces. Open Multimedia Contact Search widget
    outlookLib.Customer Sent An Email    ${MM_SUP1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    outlookLib.Customer Sent An Email    ${MM_SUP1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    10

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Search for Email contacts with 1 New status
    Open Multimedia Contact Search
    Search By    Channel     Email
    Click Add More Search Parameter
    Search By    Status     New
    Click Search Button

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Select one contact and click Close Contacts button
    Select Contact In Line    line=1

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything 'as is' and click Close button
    Click Close Selected Contacts
    Select Close Reason Code With Agent Note In Prompt     reason_code=Completed     agent_note=Note 1


#=======================================================================================================================
#Created date:     /2021
CC-19969-TC009-Verify that MM only Supervisor agent can close some New email contacts if Close multiple contacts option is set to Supervisor in CCMM
    [Setup]    Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_SUP1.USERNAME}    ${MM_SUP1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers
    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login MM only Supervisor Agent to Workspaces. Open Multimedia Contact Search widget
    outlookLib.Customer Sent An Email    ${MM_SUP1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    outlookLib.Customer Sent An Email    ${MM_SUP1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    10

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Search for Email contacts with 1 New status
    Open Multimedia Contact Search
    Search By    Channel     Email
    Click Add More Search Parameter
    Search By    Status     New
    Click Search Button

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Select one contact and click Close Contacts button
    Select Contact In Line    line=1

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything 'as is' and click Close button
    Click Close Selected Contacts
    Select Close Reason Code With Agent Note In Prompt     reason_code=Completed     agent_note=Note 1
    Sleep    1.5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything 'as is' and click Close button
    Click Close Selected Contacts
    Select Close Reason Code With Agent Note In Prompt     reason_code=Completed     agent_note=Note 2

#=======================================================================================================================
#Created date:     /2021
CC-19969-TC010-Verify that blended Supervisor agent can close 1 Waiting email contacts if Close multiple contacts option is set to Supervisor in CCMM
    [Setup]    Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_SUP1.USERNAME}    ${BL_SUP1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers
    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login MM only Supervisor Agent to Workspaces. Open Multimedia Contact Search widget
    outlookLib.Customer Sent An Email    ${BL_SUP1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    10

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Search for Email contacts with 1 New status
    Open Multimedia Contact Search
    Search By    Channel     Email
    Click Add More Search Parameter
    Search By    Status     Waiting
    Click Search Button

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Select one contact and click Close Contacts button
    Select Contact In Line    line=1

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything 'as is' and click Close button
    Click Close Selected Contacts
    Select Close Reason Code With Agent Note In Prompt     reason_code=Completed     agent_note=Note 1


#=======================================================================================================================
#Created date:     /2021
CC-19969-TC011-Verify that blended Supervisor agent can close some waiting email contacts if Close multiple contacts option is set to Supervisor in CCMM
    [Setup]    Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_SUP1.USERNAME}    ${BL_SUP1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers
    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login MM only Supervisor Agent to Workspaces. Open Multimedia Contact Search widget
    outlookLib.Customer Sent An Email    ${BL_SUP1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    outlookLib.Customer Sent An Email    ${BL_SUP1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    10

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Search for Email contacts with 1 New status
    Open Multimedia Contact Search
    Search By    Channel     Email
    Click Add More Search Parameter
    Search By    Status     Waiting
    Click Search Button

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Select one contact and click Close Contacts button
    Select Contact In Line    line=1

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything 'as is' and click Close button
    Click Close Selected Contacts
    Select Close Reason Code With Agent Note In Prompt     reason_code=Completed     agent_note=Note 1
    Sleep    1.5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything 'as is' and click Close button
    Click Close Selected Contacts
    Select Close Reason Code With Agent Note In Prompt     reason_code=Completed     agent_note=Note 2

#=======================================================================================================================
#Created date:     /2021
CC-19969-TC012-Verify that Blended Supervisor can close some new and waiting email contacts if Close multiple contacts option is set to Supervisor in CCMM
    [Setup]    Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${BL_SUP1.USERNAME}    ${BL_SUP1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Login MM only Supervisor Agent to Workspaces. Open Multimedia Contact Search widget
    outlookLib.Customer Sent An Email    ${BL_SUP1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    outlookLib.Customer Sent An Email    ${BL_SUP1.MAIL}     ${SUBJECT_MAIL1}      ${MESSAGE_EMAIL1}    ${EMPTY}    ${CUST2_EMAIL}
    Sleep    10

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Search for Email contacts with 1 New status
    Open Multimedia Contact Search
    Search By    Channel     Email
    Click Add More Search Parameter
    Search By    Status     Waiting
    Click Search Button

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Select one contact and click Close Contacts button
    Select Contact In Line    line=1

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything 'as is' and click Close button
    Click Close Selected Contacts
    Select Close Reason Code With Agent Note In Prompt     reason_code=Completed     agent_note=Note 1
    Sleep    1.5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Select appropriate Closed Reason (if exist) and write Agent Note. Or just leave everything 'as is' and click Close button
    Click Close Selected Contacts
    Select Close Reason Code With Agent Note In Prompt     reason_code=Completed     agent_note=Note 2

#=======================================================================================================================
#Created date:     /2021
CC-19969-TC013-CC-23349_Make sure the closed reason code (disposition code) and agent note on content of closed contact when view history
    [Setup]    Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${MM_AGENT1.USERNAME}    ${MM_AGENT1.PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   False    False   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   False   False   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers
    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01     Agent login to the Workspaces
    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02     Customer send some emails to Agent
    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Agent Go to Multimedia contact search -> Search new contacts -> Close contact Then input agent note, closed reason code
    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04     Go to Multimedia contact search -> Search closed contacts -> Look at content of closed contact







#=======================================================================================================================
#Created date:     /2021
CC-19969-TC014-Verify that agent can close some new and waiting MM contacts if Close multiple contacts option is set to Agent in CCMM and Web browser crash, agent relogins WS in 60s
#=======================================================================================================================
#Created date:     /2021
CC-19969-TC015-Verify that agent can close some new and waiting MM contacts if Close multiple contacts option is set to Agent in CCMM and AACC failover