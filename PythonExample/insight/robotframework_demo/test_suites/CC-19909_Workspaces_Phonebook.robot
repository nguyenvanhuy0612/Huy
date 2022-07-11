*** Settings ***
Resource    ../resources/Resources_CC_19909_Workspaces_Phonebook.robot

*** Test Cases ***
# Created by:       htmoanh
# Created date:     08/12/2020

#=======================================================================================================================
#=======================================================================================================================

#Created date:     8/12/2020
CC19909 01 Widget display - Verify Voice Only Agent
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data
    Wait Until Element Is Visible    ${PHONEBOOK_BTN_SEARCH}   timeout=5
    Click element   ${PHONEBOOK_BTN_SEARCH}
    @{phonebook_row} =    Get WebElements     ${PHONEBOOK_TABLE_ROW}
    ${phonebook_row_total} =    Get Length    ${phonebook_row}
    Should Not Be Equal    '${phonebook_row_total}'    '0'

#=======================================================================================================================

#Created date:     9/12/2020
CC19909 02 Widget display - Verify MM Agent
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data
    Wait Until Element Is Visible    ${PHONEBOOK_BTN_SEARCH}   timeout=5
    Click element   ${PHONEBOOK_BTN_SEARCH}
    @{phonebook_row} =    Get WebElements     ${PHONEBOOK_TABLE_ROW}
    ${phonebook_row_total} =    Get Length    ${phonebook_row}
    Should Not Be Equal    '${phonebook_row_total}'    '0'

#=======================================================================================================================

#Created date:     9/12/2020
CC19909 03 Widget display - Verify Blended Agent
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data
    Wait Until Element Is Visible    ${PHONEBOOK_BTN_SEARCH}   timeout=5
    Click element   ${PHONEBOOK_BTN_SEARCH}
    @{phonebook_row} =    Get WebElements     ${PHONEBOOK_TABLE_ROW}
    ${phonebook_row_total} =    Get Length    ${phonebook_row}
    Should Not Be Equal    '${phonebook_row_total}'    '0'

#=======================================================================================================================

#Created date:     9/12/2020
CC19909 04 Widget display - Verify Voice Sup-Agent
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${SUP_USERNAME}    ${SUP_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data
    Wait Until Element Is Visible    ${PHONEBOOK_BTN_SEARCH}   timeout=5
    Click element   ${PHONEBOOK_BTN_SEARCH}
    @{phonebook_row} =    Get WebElements     ${PHONEBOOK_TABLE_ROW}
    ${phonebook_row_total} =    Get Length    ${phonebook_row}
    Should Not Be Equal    '${phonebook_row_total}'    '0'

#=======================================================================================================================

#Created date:     10/12/2020
CC19909 05 Widget display - Verify Blended Sup-Agent
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data
    Wait Until Element Is Visible    ${PHONEBOOK_BTN_SEARCH}   timeout=5
    Click element   ${PHONEBOOK_BTN_SEARCH}
    @{phonebook_row} =    Get WebElements     ${PHONEBOOK_TABLE_ROW}
    ${phonebook_row_total} =    Get Length    ${phonebook_row}
    Should Not Be Equal    '${phonebook_row_total}'    '0'

#=======================================================================================================================
#=======================================================================================================================

#Created date:     10/12/2020
CC19909 06 Search contacts - Ensure Narrow Search returns correct result with Filter option is All - Display Name
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is All - Display Name
    Search Phonebook    All     Display Name    "${CUST1_NAME}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     10/12/2020
CC19909 07 Search contacts - Ensure Narrow Search returns correct result with Filter option is All - Surname
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is All - Surname
    Search Phonebook    All     Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     11/12/2020
CC19909 08 Search contacts - Ensure Narrow Search returns correct result with Filter option is All - First Name
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is All - First Name
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     11/12/2020
CC19909 09 Search contacts - Ensure Narrow Search returns correct result with Filter option is All - Phone
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is All - Phone
    Search Phonebook    All    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     11/12/2020
CC19909 10 Search contacts - Ensure Narrow Search returns correct result with Filter option is All - Mobile
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is All - Mobile
    Search Phonebook    All    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     14/12/2020
CC19909 11 Search contacts - Ensure Narrow Search returns correct result with Filter option is All - IP Phone
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is All - IP Phone
    Search Phonebook    All    IP Phone    "${CUST1_PHONE}"
    VVerify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     14/12/2020
CC19909 12 Search contacts - Ensure Narrow Search returns correct result with Filter option is All - Other Phone
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is All - Other Phone
    Search Phonebook    All    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     15/12/2020
CC19909 13 Search contacts - Ensure Narrow Search returns correct result with Filter option is All - Email
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is All - Email
    Search Phonebook    All    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     15/12/2020
CC19909 14 Search contacts - Ensure Narrow Search returns correct result with Filter option is All - Department
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is All - Department
    Search Phonebook    All    Department    "a1"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     16/12/2020
CC19909 15 Search contacts - Ensure Narrow Search returns correct result with Filter option is All - Street
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is All - Street
    Search Phonebook    All    Street    "a1"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     16/12/2020
CC19909 16 Search contacts - Ensure Narrow Search returns correct result with Filter option is All - City
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is All - City
    Search Phonebook    All    City    "a1"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     16/12/2020
CC19909 17 Search contacts - Ensure Narrow Search returns correct result with Filter option is All - State
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is All - State
    Search Phonebook    All    State    "a1"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     17/12/2020
CC19909 18 Search contacts - Ensure Narrow Search returns correct result with Filter option is All - PostalCode
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is All - PostalCode
    Search Phonebook    All    PostalCode    "123"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     17/12/2020
CC19909 19 As an Agent, I want to search contacts on phonebook by using Favorite
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is Favorite - Display Name
    Search Phonebook    Favorite    Display Name    "${CUST1_NAME}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Phonebook display data with Filter option is Favorite - Surname
    Search Phonebook    Favorite     Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Phonebook display data with Filter option is Favorite - First Name
    Search Phonebook    Favorite    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     18/12/2020
CC19909 20 As an Agent, I want to search contacts on phonebook by using Speed Dial
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is Speed Dial - First Name
    Search Phonebook    Speed Dial    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Phonebook display data with Filter option is Speed Dial - Phone
    Search Phonebook    Speed Dial    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Phonebook display data with Filter option is Speed Dial - Email
    Search Phonebook    Speed Dial    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     18/12/2020
CC19909 21 As an Agent, I want to search contacts on phonebook by using Customer contact
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Create new Customer contact
    NavigationMenu.Open Phonebook
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data with Filter option is Custom Contacts - Department
    Search Phonebook    Custom Contacts    Department    "a1"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Phonebook display data with Filter option is Custom Contacts - State
    Search Phonebook    Custom Contacts    State    "a1"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Phonebook display data with Filter option is Custom Contacts - PostalCode
    Search Phonebook    Custom Contacts    PostalCode    "123"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 00:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================
#
#Created date:     /12/2020
CC19909 22 Create custom contact - Verify Agent Adding a custom contact
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 0:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Delete old Customer contact
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Create new Customer contact
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Save Contact Phonebook

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Phonebook display data of new Customer
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Delete Customer contact in the Phonebook
    Delete Contact Phonebook
#
#=======================================================================================================================

#Created date:     /12/2020
CC19909 23 Create custom contact - Verify Agent Editing a custom contact
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Create new Customer contact
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Save Contact Phonebook

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Edit Customer contact
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Edit Contact Phonebook
    Edit Field Contact Phonebook    Phone    "12345678"
    Edit Field Contact Phonebook    Street    "bbbbb"
    Save Contact Phonebook

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Phonebook display data of Customer after edited
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "12345678"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "bbbbb"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Delete Customer contact in the Phonebook
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     /12/2020
CC19909 24 Create custom contact - Verify Agent Deleting a custom contact
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Create new Customer contact
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Save Contact Phonebook

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify the Customer contact is deleted in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    @{phonebook_row} =    Get WebElements     ${PHONEBOOK_TABLE_ROW}
    ${phonebook_row_total} =    Get Length    ${phonebook_row}
    Should Be Equal    '${phonebook_row_total}'    '0'

#=======================================================================================================================

#Created date:     /12/2020
CC19909 25 Use case - As an Agent, I want to make a DN call via phonebook
    [Setup]     Run Keywords
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Create new Customer contact
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Save Contact Phonebook

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent makes DN call out by Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Call Out By Phonebook

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Customer accepts call from Agent
    OneXCommunicator.OneX Accept Call
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 Ends DN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST1_URI}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Delete Customer contact in the Phonebook
    NavigationMenu.Open Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     /12/2020
CC19909 26 Use case - As an Agent, I want to make a CDN call via phonebook
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Create new Customer contact
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    CDN_1
    Edit Field Contact Phonebook    Last Name    "CDN_1"
    Edit Field Contact Phonebook    First Name    "CDN_1"
    Edit Field Contact Phonebook    Phone    "${CDN1}"
    Save Contact Phonebook

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent 1 makes CDN call out by Phonebook
    Search Phonebook    All    First Name    "CDN_1"
    Call Out By Phonebook

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent 2 accepts CDN call from Agent 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_2}
    WorkCard.Agent Accepts A Contact     ${AGENT4_VOICE_URI}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent 2 Ends CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${AGENT4_VOICE_URI}
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Delete Customer contact in the Phonebook
    NavigationMenu.Open Phonebook
    Search Phonebook    All    First Name    "CDN_1"
    Delete Contact Phonebook

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#Created date:     /12/2020
CC19909 29 Tagging a contact - To Favorite icon
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Create new Customer contact - Check Favorite tag
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Favorite     check
    Save Contact Phonebook

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Favorite Tag is checked
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Verify Tagging Phonebook     Favourite     check

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Edit Customer contact - Uncheck Favorite tag
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Edit Contact Phonebook
    Select Tagging Phonebook        Favorite     uncheck
    Save Contact Phonebook

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Phonebook display data of Customer after edited - Uncheck Favorite tag
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"
    Verify Tagging Phonebook     Favourite     uncheck

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     /12/2020
CC19909 30 Tagging a contact - To Speed Dials icon
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
#    [Teardown]    Run Keywords
#    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
#    ...     WorkCard.Agent End Any Inbound Contact      AND
#    ...     AgentToolbar.Agent Finish Work      AND
#    ...     AgentToolbar.Agent Exit      AND
#    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Create new Customer contact - Check Speed Dial tag
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Mobile    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    IP Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Other Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Edit Field Contact Phonebook    Department    "a1"
    Edit Field Contact Phonebook    Street    "a1"
    Edit Field Contact Phonebook    City    "a1"
    Edit Field Contact Phonebook    State    "a1"
    Edit Field Contact Phonebook    PostalCode    "123"
    Select Tagging Phonebook        Speed Dial     check
    Save Contact Phonebook

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Speed Dial Tag is checked
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Verify Tagging Phonebook     Speed Dial     check

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Edit Customer contact - Uncheck Speed Dial tag
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Edit Contact Phonebook
    Select Tagging Phonebook        Speed Dial     uncheck
    Save Contact Phonebook

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Phonebook display data of Customer after edited - Uncheck Speed Dial tag
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Mobile    "${CUST1_PHONE}"
    Verify Phonebook Data    IP Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Other Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"
    Verify Phonebook Data    Department    "a1"
    Verify Phonebook Data    Street    "a1"
    Verify Phonebook Data    City    "a1"
    Verify Phonebook Data    State    "a1"
    Verify Phonebook Data    PostalCode    "123"
    Verify Tagging Phonebook     Speed Dial     uncheck

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     /12/2020
CC19909 31 Sorting - Verify Agent can Sorting phonebook grid columns
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Create new Customer 1 contact
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST1_NAME} ${CUST1_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST1_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST1_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST1_EMAIL}"
    Save Contact Phonebook

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Create new Customer 2 contact
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST2_NAME} ${CUST2_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST2_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST2_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST2_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST2_EMAIL}"
    Save Contact Phonebook

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Create new Customer 3 contact
    Create New Contact Phonebook
    Edit Field Contact Phonebook    Display Name    ${CUST3_NAME} ${CUST3_PHONE}
    Edit Field Contact Phonebook    Last Name    "${CUST3_NAME}"
    Edit Field Contact Phonebook    First Name    "${CUST3_NAME}"
    Edit Field Contact Phonebook    Phone    "${CUST3_PHONE}"
    Edit Field Contact Phonebook    Email    "${CUST3_EMAIL}"
    Save Contact Phonebook

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Phonebook display data of Customer after sort
    Search Phonebook    All    First Name    "cust_name_"
    Sort Phonebook      Display Name
    Verify Phonebook Data    Display Name    "${CUST3_NAME} ${CUST3_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST3_NAME}"
    Verify Phonebook Data    First Name    "${CUST3_NAME}"
    Verify Phonebook Data    Phone    "${CUST3_PHONE}"
    Verify Phonebook Data    Email    "${CUST3_EMAIL}"
    Sleep   2

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Phonebook display data of Customer after sort again
    Sort Phonebook      Display Name
    Verify Phonebook Data    Display Name    "${CUST1_NAME} ${CUST1_PHONE}"
    Verify Phonebook Data    Last Name    "${CUST1_NAME}"
    Verify Phonebook Data    First Name    "${CUST1_NAME}"
    Verify Phonebook Data    Phone    "${CUST1_PHONE}"
    Verify Phonebook Data    Email    "${CUST1_EMAIL}"

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Delete Customer contact in the Phonebook
    Search Phonebook    All    First Name    "${CUST1_NAME}"
    Delete Contact Phonebook
    Sleep   2
    Search Phonebook    All    First Name    "${CUST2_NAME}"
    Delete Contact Phonebook
    Sleep   2
    Search Phonebook    All    First Name    "${CUST3_NAME}"
    Delete Contact Phonebook

#=======================================================================================================================

#Created date:     /12/2020
CC19909 32 Filtering contacts - Verify Agent can filter contacts
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Phonebook
    NavigationMenu.Open Phonebook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify Phonebook display data when filtering row page
    Wait Until Element Is Visible    ${PHONEBOOK_BTN_SEARCH}   timeout=5
    Click element   ${PHONEBOOK_BTN_SEARCH}
    Sleep   1

    Filter Page Phonebook   5
    @{phonebook_row} =    Get WebElements     ${PHONEBOOK_TABLE_ROW}
    ${phonebook_row_total} =    Get Length    ${phonebook_row}
    Should Be Equal    '${phonebook_row_total}'    '5'

    Filter Page Phonebook   10
    @{phonebook_row} =    Get WebElements     ${PHONEBOOK_TABLE_ROW}
    ${phonebook_row_total} =    Get Length    ${phonebook_row}
    Should Be Equal    '${phonebook_row_total}'    '10'

    Filter Page Phonebook   20
    @{phonebook_row} =    Get WebElements     ${PHONEBOOK_TABLE_ROW}
    ${phonebook_row_total} =    Get Length    ${phonebook_row}
    Should Be Equal    '${phonebook_row_total}'    '20'

    Filter Page Phonebook   50
    @{phonebook_row} =    Get WebElements     ${PHONEBOOK_TABLE_ROW}
    ${phonebook_row_total} =    Get Length    ${phonebook_row}
    Should Be Equal    '${phonebook_row_total}'    '50'