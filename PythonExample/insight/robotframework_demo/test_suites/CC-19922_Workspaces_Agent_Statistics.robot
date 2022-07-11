*** Settings ***
Resource    ../resources/Resources_CC_19902_Workspaces_Agent_Statictics.robot

*** Test Cases ***


#Created date:     /01/2021
CC-19922- 013 - WS_Voice agent_ Verify that skillset is sorted Ascending by Alphabetical
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Skillsets are sorted Ascending by Alphabetical: down
    NavigationMenu.Open Web Statistic
    Sort Statistic    down
    Sleep   3
    ${skillset1} =     Get Text     //li[1]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset1}    ${AGENT3_SKILLSET_VOICE1}
    Sleep   1
    ${skillset2} =     Get Text     //li[2]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset2}    ${AGENT3_SKILLSET_VOICE2}
    Sleep   1

#=======================================================================================================================

#Created date:     /01/2021
CC-19922- 014 - WS_Email agent_ Verify that skillset is sorted Ascending by Alphabetical
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Skillsets are sorted Ascending by Alphabetical: down
    NavigationMenu.Open Web Statistic
    Sort Statistic    down
    Sleep   3
    ${skillset1} =     Get Text     //li[1]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset1}    ${AGENT3_SKILLSET_EM}
    Sleep   1
    ${skillset2} =     Get Text     //li[2]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset2}    ${AGENT3_SKILLSET_EM2}
    Sleep   1
    ${skillset3} =     Get Text     //li[3]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset3}    ${AGENT3_SKILLSET_VOICE1}
    Sleep   1
    ${skillset4} =     Get Text     //li[4]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset4}    ${AGENT3_SKILLSET_VOICE2}
    Sleep   1
    ${skillset5} =     Get Text     //li[5]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset5}    ${AGENT3_SKILLSET_WC}
    Sleep   1
    ${skillset6} =     Get Text     //li[6]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset6}    ${AGENT3_SKILLSET_WC2}
    Sleep   1

#=======================================================================================================================

#Created date:     /01/2021
CC-19922- 015 - WS_Chat agent_ Verify that skillset is sorted Ascending by Alphabetical
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Skillsets are sorted Ascending by Alphabetical: down
    NavigationMenu.Open Web Statistic
    Sort Statistic    down
    Sleep   3
    ${skillset1} =     Get Text     //li[1]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset1}    ${AGENT3_SKILLSET_EM}
    Sleep   1
    ${skillset2} =     Get Text     //li[2]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset2}    ${AGENT3_SKILLSET_EM2}
    Sleep   1
    ${skillset3} =     Get Text     //li[3]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset3}    ${AGENT3_SKILLSET_VOICE1}
    Sleep   1
    ${skillset4} =     Get Text     //li[4]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset4}    ${AGENT3_SKILLSET_VOICE2}
    Sleep   1
    ${skillset5} =     Get Text     //li[5]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset5}    ${AGENT3_SKILLSET_WC}
    Sleep   1
    ${skillset6} =     Get Text     //li[6]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset6}    ${AGENT3_SKILLSET_WC2}
    Sleep   1


#=======================================================================================================================
#Created date:     /01/2021
CC-19922- 016 - WS_Blened agent_ Verify that skillset is sorted Ascending by Alphabetical
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Skillsets are sorted Ascending by Alphabetical: down
    NavigationMenu.Open Web Statistic
    Sort Statistic    down
    Sleep   3
    ${skillset1} =     Get Text     //li[1]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset1}    ${AGENT3_SKILLSET_EM}
    Sleep   1
    ${skillset2} =     Get Text     //li[2]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset2}    ${AGENT3_SKILLSET_EM2}
    Sleep   1
    ${skillset3} =     Get Text     //li[3]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset3}    ${AGENT3_SKILLSET_VOICE1}
    Sleep   1
    ${skillset4} =     Get Text     //li[4]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset4}    ${AGENT3_SKILLSET_VOICE2}
    Sleep   1
    ${skillset5} =     Get Text     //li[5]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset5}    ${AGENT3_SKILLSET_WC}
    Sleep   1
    ${skillset6} =     Get Text     //li[6]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset6}    ${AGENT3_SKILLSET_WC2}
    Sleep   1

#=======================================================================================================================
#Created date:     /01/2021
CC-19922- 017 - WS_Voice agent_ Verify that skillset is sorted descending by Alphabetical
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Skillsets are sorted Ascending by Alphabetical: up
    NavigationMenu.Open Web Statistic
    Sort Statistic    up
    Sleep   3
    ${skillset1} =     Get Text     //li[1]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset1}    ${AGENT3_SKILLSET_VOICE2}
    Sleep   1
    ${skillset2} =     Get Text     //li[2]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset2}    ${AGENT3_SKILLSET_VOICE1}
    Sleep   1

#=======================================================================================================================

#Created date:     /01/2021
CC-19922- 018 - WS_Email agent_ Verify that skillset is sorted descending by Alphabetical
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Skillsets are sorted Ascending by Alphabetical: up
    NavigationMenu.Open Web Statistic
    Sort Statistic    up
    Sleep   3
    ${skillset1} =     Get Text     //li[1]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset1}    ${AGENT3_SKILLSET_WC2}
    Sleep   1
    ${skillset2} =     Get Text     //li[2]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset2}    ${AGENT3_SKILLSET_WC}
    Sleep   1
    ${skillset3} =     Get Text     //li[3]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset3}    ${AGENT3_SKILLSET_VOICE2}
    Sleep   1
    ${skillset4} =     Get Text     //li[4]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset4}    ${AGENT3_SKILLSET_VOICE1}
    Sleep   1
    ${skillset5} =     Get Text     //li[5]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset5}    ${AGENT3_SKILLSET_EM2}
    Sleep   1
    ${skillset6} =     Get Text     //li[6]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset6}    ${AGENT3_SKILLSET_EM}
    Sleep   1

#=======================================================================================================================

#Created date:     /01/2021
CC-19922- 019 - WS_Chat agent_ Verify that skillset is sorted descending by Alphabetical
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Skillsets are sorted Ascending by Alphabetical: up
    NavigationMenu.Open Web Statistic
    Sort Statistic    up
    Sleep   3
    ${skillset1} =     Get Text     //li[1]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset1}    ${AGENT3_SKILLSET_WC2}
    Sleep   1
    ${skillset2} =     Get Text     //li[2]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset2}    ${AGENT3_SKILLSET_WC}
    Sleep   1
    ${skillset3} =     Get Text     //li[3]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset3}    ${AGENT3_SKILLSET_VOICE2}
    Sleep   1
    ${skillset4} =     Get Text     //li[4]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset4}    ${AGENT3_SKILLSET_VOICE1}
    Sleep   1
    ${skillset5} =     Get Text     //li[5]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset5}    ${AGENT3_SKILLSET_EM2}
    Sleep   1
    ${skillset6} =     Get Text     //li[6]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset6}    ${AGENT3_SKILLSET_EM}
    Sleep   1

#=======================================================================================================================

#Created date:     /01/2021
CC-19922- 020 - WS_Blended agent_ Verify that skillset is sorted descending by Alphabetical
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Skillsets are sorted Ascending by Alphabetical: up
    NavigationMenu.Open Web Statistic
    Sort Statistic    up
    Sleep   3
    ${skillset1} =     Get Text     //li[1]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset1}    ${AGENT3_SKILLSET_WC2}
    Sleep   1
    ${skillset2} =     Get Text     //li[2]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset2}    ${AGENT3_SKILLSET_WC}
    Sleep   1
    ${skillset3} =     Get Text     //li[3]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset3}    ${AGENT3_SKILLSET_VOICE2}
    Sleep   1
    ${skillset4} =     Get Text     //li[4]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset4}    ${AGENT3_SKILLSET_VOICE1}
    Sleep   1
    ${skillset5} =     Get Text     //li[5]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset5}    ${AGENT3_SKILLSET_EM2}
    Sleep   1
    ${skillset6} =     Get Text     //li[6]//span[contains(@class,'skillsetname')]
    Should Be Equal     ${skillset6}    ${AGENT3_SKILLSET_EM}
    Sleep   1

#=======================================================================================================================

#Created date:     29/12/2020
CC-19922- 021 - WS_Verify that Agent Available filed update correclty for Email skillset
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the Chart updates correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Sleep   10
    Verify Chart Statistic    agentsChart    C:/Users/Administrator/Documents/DataStatictis/agent available_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

#=======================================================================================================================

#Created date:     29/12/2020
CC-19922- 022 - WS_Verify that Agent Not Ready filed update correclty for Email skillset
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the Chart updates correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Sleep   10
    Verify Chart Statistic    agentsChart    C:/Users/Administrator/Documents/DataStatictis/agent notready_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

#=======================================================================================================================

#Created date:     30/12/2020
19922- 023 - WS_Verify that both Agent Available and Not Ready field update correclty for Email skillset
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the Chart updates correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Sleep   10
    Verify Chart Statistic    agentsChart    C:/Users/Administrator/Documents/DataStatictis/agent available_1 notready_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

#=======================================================================================================================

#Created date:     30/12/2020
CC-19922- 024 - WS_Email agent_Verify that pie chart will display when it is selected on Agents view
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Change the Chart to Pie type
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Sleep   1
    Select Chart Type Statistic     pie

    # STEP 02:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify the Chart updates correctly
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   10
    Verify Chart Statistic    agentsChart    C:/Users/Administrator/Documents/DataStatictis/agent available_1 notready_1_pie.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

#=======================================================================================================================

#Created date:     31/12/2020
CC-19922- 025 - WS_Email agent_Verify that bar chart will display when it is selected on Agents view
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Change the Chart to Bar type
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Sleep   1
    Select Chart Type Statistic     pie
    Sleep   3
    Select Chart Type Statistic     bar

    # STEP 02:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify the Chart updates correctly
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   10
    Verify Chart Statistic    agentsChart    C:/Users/Administrator/Documents/DataStatictis/agent available_1 notready_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

#=======================================================================================================================

#Created date:     31/12/2020
CC-19922- 026 - WS_Verify that Offered filed update correclty for Email skillset
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 1: Open Outlook, from customer sent to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 02:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify the Offered Chart updates correctly when contact is ringing
    Wait Until Element Is Visible    //div[@class='cards-container__inner']    timeout=40
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 3: Agent accepts Email
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts Email
    Sleep   5
    WorkCard.Agent Accepts A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   1

    # STEP 04:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 05: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends Email Contact
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     04/01/2021
CC-19922- 027 - WS_Verify that Waiting filed update correclty for Email skillset
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 1: Open Outlook, from customer sent to Server the Email without attachment
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 02:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify the Offered Chart updates correctly when contact is ringing
    Wait Until Element Is Visible    //div[@class='cards-container__inner']    timeout=50
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 03:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_1 waiting_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 4:
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent accepts Email
    AgentToolbar.Agent Go Ready
    Wait Until Element Is Visible    //div[@class='cards-container__inner']    timeout=60
    WorkCard.Agent Accepts A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   5

    # STEP 05: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends Email Contact
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     04/01/2021
CC-19922- 028 - WS_Verify that both Agent Offered and Waiting field update correclty for Email skillset
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, customer 1 sends Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL2}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2:
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email from Customer 1
    WorkCard.Agent Accepts A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   1

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Open Outlook, customer 2 sends Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL2}     ${SUBJECT_MAIL2}        ${MESSAGE_EMAIL2}
    Outlook.Choose Account     ${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 04:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM2}
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2 waiting_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 5:
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent accepts Email from Customer 2
    AgentToolbar.Agent Go Ready
    Wait Until Element Is Visible    //div[@class='cards-container__inner']    timeout=60
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}
    Sleep   5

    # STEP 06:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM2}
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 07: Agent ends 2 Email Contacts
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent ends 2 Email Contacts
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}
    WorkCard.Agent Unhold A Contact   ${CUST1_NAME}     #${CUST1_EMAIL}
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     11/01/2021
CC-19922- 029 - WS_Email agent_Verify that pie chart will display when it is selected on Contacts view
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, customer 1 sends Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2:
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email from Customer 1
    WorkCard.Agent Accepts A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   1

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Open Outlook, customer 2 sends Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL2}        ${MESSAGE_EMAIL2}
    Outlook.Choose Account     ${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 04:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Change the Chart to Pie type
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Sleep   1
    Select Chart Type Statistic     pie

    # STEP 05:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Sleep   20
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   10
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2 waiting_1_pie.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 6:
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent accepts Email from Customer 2
    AgentToolbar.Agent Go Ready
    Wait Until Element Is Visible    //div[@class='cards-container__inner']    timeout=60
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}
    Sleep   5

    # STEP 07:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   10
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2_pie.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 08: Agent ends 2 Email Contacts
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends 2 Email Contacts
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}
    WorkCard.Agent Unhold A Contact   ${CUST1_NAME}     #${CUST1_EMAIL}
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     11/01/2021
CC-19922- 030 - WS_Email agent_Verify that bar chart will display when it is selected on Contacts view
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, customer 1 sends Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL2}     ${SUBJECT_MAIL1}     ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 02:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Change the Chart to Pie type
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Sleep   1
    Select Chart Type Statistic     pie

    # STEP 3:
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts Email from Customer 1
    WorkCard.Agent Accepts A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   1

    # STEP 04:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Change the Chart to Bar type
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Sleep   1
    Select Chart Type Statistic     bar

    # STEP 05:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Open Outlook, customer 2 sends Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL2}     ${SUBJECT_MAIL2}        ${MESSAGE_EMAIL2}
    Outlook.Choose Account     ${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 06:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM2}
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2 waiting_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 07:
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent accepts Email from Customer 2
    AgentToolbar.Agent Go Ready
    Wait Until Element Is Visible    //div[@class='cards-container__inner']    timeout=60
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}
    Sleep   5

    # STEP 08:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM2}
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 09: Agent ends 2 Email Contacts
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent ends 2 Email Contacts
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}
    WorkCard.Agent Unhold A Contact   ${CUST1_NAME}     #${CUST1_EMAIL}
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     13/01/2021
CC-19922- 032 - WS_Verify that an agent is notified quickly if accepting an Email after the Threshold
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, customer 1 sends Email 1 without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     1     ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   10
    Outlook.Close Outlook

     # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Open Outlook, customer 1 sends Email 2 without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     2     ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   10
    Outlook.Close Outlook

     # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Open Outlook, customer 1 sends Email 3 without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     3     ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   10
    Outlook.Close Outlook

     # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Open Outlook, customer 1 sends Email 4 without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}    4     ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   10
    Outlook.Close Outlook

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent accepts Email from Customer 1
    WorkCard.Agent Accepts A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   1
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 06:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Warning sign displays correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_WARNING_SIGN}   timeout=10

    # STEP 07:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify Service level display correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Verify Service Level    0%

    # STEP 08: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends Email Contact
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   3

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent accepts and ends the contacts
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   3
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   3

    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   3
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   3

    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   3
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   3

#=======================================================================================================================

#Created date:     13/01/2021
CC-19922- 033 - WS_Verify that Max Waiting Time updates correclty for Email
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, customer 1 sends Email 1 without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     1     ${MESSAGE_EMAIL1}
    Outlook.Send Email
    Sleep   10
    Outlook.Close Outlook

     # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Open Outlook, customer 1 sends Email 2 without attachment
    Outlook.Open Outlook
    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     2     ${MESSAGE_EMAIL1}
    Outlook.Choose Account     ${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   10
    Outlook.Close Outlook

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Get Max wait time
    Sleep   20
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_MAX_WALT_TIME}   timeout=5
    ${get_max_wait_time1} =     Get Text    ${LOC_WEBSTATISTIC_MAX_WALT_TIME}
    ${wait_time1} =     Convert To Number    ${get_max_wait_time1}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent accepts Email from Customer 1
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   3
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 06:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Max wait time value is decreased
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_MAX_WALT_TIME}   timeout=5
    ${get_max_wait_time2} =     Get Text    ${LOC_WEBSTATISTIC_MAX_WALT_TIME}
    Evaluate    0<${get_max_wait_time2}<${wait_time1}
    Sleep   1

    # STEP 07: Agent ends Email Contact
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent ends Email Contact
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent accepts Email from Customer 2
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}
    Sleep   3

    # STEP 09:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Verify Max wait time value is 0
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_EM}
    Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_MAX_WALT_TIME}   timeout=5
    ${get_max_wait_time2} =     Get Text    ${LOC_WEBSTATISTIC_MAX_WALT_TIME}
    Should Be Equal   '${get_max_wait_time2}'   '0'
    Sleep   1

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent ends Email Contact 2
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}
    Sleep   3

#=======================================================================================================================

#Created date:     13/01/2021
CC-19922- 034 - WS_Verify that Agent Available field update correclty for Chat skillset
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the Chart updates correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC}
    Sleep   5
    Verify Chart Statistic    agentsChart    C:/Users/Administrator/Documents/DataStatictis/agent available_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

#=======================================================================================================================

#Created date:     14/01/2021
CC-19922- 035 - WS_Verify that Agent Not Ready field update correclty for Chat skillset
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the Chart updates correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC}
    Sleep   5
    Verify Chart Statistic    agentsChart    C:/Users/Administrator/Documents/DataStatictis/agent notready_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

#=======================================================================================================================

#Created date:     14/01/2021
CC-19922- 036 - WS_Verify that both Agent Available and Not Ready field update correclty for Chat skillset
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the Chart updates correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC}
    Sleep   5
    Verify Chart Statistic    agentsChart    C:/Users/Administrator/Documents/DataStatictis/agent available_1 notready_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

#=======================================================================================================================

#Created date:     15/01/2021
CC-19922- 037 - WS_Chat agent_Verify that pie chart will display when it is selected on Agents view
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Change the Chart to Pie type
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC}
    Sleep   1
    Select Chart Type Statistic     pie

    # STEP 02:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify the Chart updates correctly
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   3
    Verify Chart Statistic    agentsChart    C:/Users/Administrator/Documents/DataStatictis/agent available_1 notready_1_pie.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

#=======================================================================================================================

#Created date:     15/01/2021
CC-19922- 038 - WS_Chat agent_Verify that bar chart will display when it is selected on Agents view
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Change the Chart to Bar type
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC}
    Sleep   1
    Select Chart Type Statistic     pie
    Sleep   3
    Select Chart Type Statistic     bar

    # STEP 02:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify the Chart updates correctly
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   3
    Verify Chart Statistic    agentsChart    C:/Users/Administrator/Documents/DataStatictis/agent available_1 notready_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

#=======================================================================================================================

#Created date:     25/01/2021
CC-19922- 039 - WS_Verify that Offered filed update correclty for Chat skillset
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}    #${CUST1_EMAIL}
    Sleep   3

    # STEP 03:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 04:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends WC Contact
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     25/01/2021
CC-19922- 040 - WS_Verify that Waiting filed update correclty for Chat skillset
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC2}
    Sleep   7

    # STEP 02:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify the Offered Chart updates correctly after contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC2}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_1 waiting_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}    #${CUST1_EMAIL}
    Sleep   3

    # STEP 04:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC2}
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 05:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent ends WC Contact 2
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   3

#=======================================================================================================================

#Created date:     25/01/2021
CC-19922- 041 - WS_Verify that both Agent Offered and Waiting field update correclty for Chat skillset
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}    #${CUST1_EMAIL}
    Sleep   3
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer 2 launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_2}    ${BROWSER_CUST_ALIAS_2}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 04:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify the Offered Chart updates correctly after contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2 waiting_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Switch to agent's browser and Agent accepts WC 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST2_NAME}    #${CUST1_EMAIL}
    Sleep   3

    # STEP 06:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC}
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 07:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent ends WC Contact 2
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST1_EMAIL}
    Sleep   3

    # STEP 08:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends WC Contact 1
    WorkCard.Agent Unhold A Contact   ${CUST1_NAME}     #${CUST1_EMAIL}
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     26/01/2021
CC-19922- 042 - WS_Chat agent_Verify that pie chart will display when it is selected on Contacts view
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC2}
    Sleep   7

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}    #${CUST1_EMAIL}
    Sleep   3
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer 2 launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_2}    ${BROWSER_CUST_ALIAS_2}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC2}
    Sleep   7

    # STEP 04:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Change the Chart to Pie type
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC2}
    Sleep   1
    Select Chart Type Statistic     pie

    # STEP 05:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify the Offered Chart updates correctly after contact
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC2}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2 waiting_1_pie.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent's browser and Agent accepts WC 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST2_NAME}    #${CUST1_EMAIL}
    Sleep   3

    # STEP 07:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC2}
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2_pie.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 08:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends WC Contact 2
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST1_EMAIL}
    Sleep   3

    # STEP 09:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent ends WC Contact 1
    WorkCard.Agent Unhold A Contact   ${CUST1_NAME}     #${CUST1_EMAIL}
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     26/01/2021
CC-19922- 043 - WS_Chat agent_Verify that bar chart will display when it is selected on Contacts view
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC 1
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}    #${CUST1_EMAIL}
    Sleep   3
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer 2 launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_2}    ${BROWSER_CUST_ALIAS_2}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 04:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Change the Chart to Pie type
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC}
    Sleep   1
    Select Chart Type Statistic     pie

    # STEP 05:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Change the Chart to Bar type
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC}
    Sleep   1
    Select Chart Type Statistic     bar

    # STEP 06:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify the Offered Chart updates correctly after contact
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2 waiting_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Switch to agent's browser and Agent accepts WC 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST2_NAME}    #${CUST1_EMAIL}
    Sleep   3

    # STEP 08:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 08:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends WC Contact 2
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST1_EMAIL}
    Sleep   3

    # STEP 09:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent ends WC Contact 1
    WorkCard.Agent Unhold A Contact   ${CUST1_NAME}     #${CUST1_EMAIL}
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}

#=======================================================================================================================

#=======================================================================================================================

#Created date:     25/01/2021
CC-19922- 045 - WS_Verify that an agent is notified quickly if accepting an Chat after the Threshold
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT4_USERNAME}    ${AGENT4_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC2}
    Sleep   7

    # STEP 02:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify the Offered Chart updates correctly after contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC2}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_1 waiting_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Switch to agent's browser and Agent accepts WC 2
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   30
    AgentToolbar.Agent Go Ready
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}    #${CUST1_EMAIL}
    Sleep   3

    # STEP 04:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify Warning sign displays correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC2}
    Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_WARNING_SIGN}   timeout=10

    # STEP 05:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Service level display correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC2}
    Verify Service Level    0%

    # STEP 06:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Check Alert option and Verify Alert dialog displays correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC2}
    Check Alert Statistic    true
    Verify Alert Statistic      ${AGENT3_SKILLSET_WC2}

    # STEP 07:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC2}
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 08:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends WC Contact 2
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   3

#=======================================================================================================================

#Created date:     /01/2021
CC-19922- 046 - WS_Verify that Max Waiting Time updates correclty for Chat
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

     # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer 1 launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Customer 2 launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_2}    ${BROWSER_CUST_ALIAS_2}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Get Max wait time
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   20
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC}
    Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_MAX_WALT_TIME}   timeout=5
    ${get_max_wait_time1} =     Get Text    ${LOC_WEBSTATISTIC_MAX_WALT_TIME}
    ${wait_time1} =     Convert To Number    ${get_max_wait_time1}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent accepts WC from Customer 1
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   3
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 06:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Max wait time value is decreased
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC}
    Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_MAX_WALT_TIME}   timeout=5
    ${get_max_wait_time2} =     Get Text    ${LOC_WEBSTATISTIC_MAX_WALT_TIME}
    Evaluate    0<${get_max_wait_time2}<${wait_time1}
    Sleep   1

    # STEP 07:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent ends WC Contact 1
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}
    Sleep   3

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent accepts WC from Customer 2
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}
    Sleep   3

    # STEP 09:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Verify Max wait time value is 0
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_WC}
    Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_MAX_WALT_TIME}   timeout=5
    ${get_max_wait_time2} =     Get Text    ${LOC_WEBSTATISTIC_MAX_WALT_TIME}
    Should Be Equal   '${get_max_wait_time2}'   '0'
    Sleep   1

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent ends WC Contact 2
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}
    Sleep   3

#=======================================================================================================================

#Created date:     25/01/2021
CC-19922- 047 - WS_Verify that Agent Available filed update correclty for Voice skillset
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the Chart updates correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE1}
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    agentsChart    C:/Users/Administrator/Documents/DataStatictis/agent available_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

#=======================================================================================================================

#Created date:     25/01/2021
CC-19922- 048 - WS_Verify that Agent Not Ready filed update correclty for Voice skillset
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the Chart updates correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE1}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    agentsChart    C:/Users/Administrator/Documents/DataStatictis/agent notready_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

#=======================================================================================================================

#Created date:     26/01/2021
CC-19922- 049 - WS_Verify that both Agent Available and Not Ready field update correclty for Voice skillset
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the Chart updates correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE1}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    agentsChart    C:/Users/Administrator/Documents/DataStatictis/agent available_1 notready_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

#=======================================================================================================================

#Created date:     26/01/2021
CC-19922- 050 - WS_Voice agent_Verify that pie chart will display when it is selected on Agents view
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Change the Chart to Pie type
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE1}
    Sleep   1
    Select Chart Type Statistic     pie

    # STEP 02:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify the Chart updates correctly
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   3
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    agentsChart    C:/Users/Administrator/Documents/DataStatictis/agent available_1 notready_1_pie.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

#=======================================================================================================================

#Created date:     27/01/2021
CC-19922- 051 - WS_Voice agent_Verify that bar chart will display when it is selected on Agents view
    [Setup]     Run Keywords
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1   AND
    ...     Login.Login Agent    ${BROWSER_AGENT_2}    ${BROWSER_AGENT_ALIAS_2}    ${AGENT2_USERNAME}    ${AGENT2_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_2}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     Close All Browsers

    # STEP 01:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Change the Chart to Bar type
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE1}
    Sleep   1
    Select Chart Type Statistic     pie
    Sleep   3
    Select Chart Type Statistic     bar

    # STEP 02:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify the Chart updates correctly
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   3
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    agentsChart    C:/Users/Administrator/Documents/DataStatictis/agent available_1 notready_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

#=======================================================================================================================

#Created date:     27/01/2021
CC-19922- 052 - WS_Verify that Calls Offered updates correclty for CDN call
    [Setup]     Run Keywords
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     OneXCommunicator.Close OneX      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   1

    # STEP 02:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify the Offered Chart updates correctly when contact is ringing
    Wait Until Element Is Visible    //div[@class='cards-container__inner']    timeout=40
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT1_SKILLSET_VOICE1}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Accepts A Contact     +${CUST1_PHONE}    #${CUST1_URI_CDN}
    Sleep   3

    # STEP 04:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT1_SKILLSET_VOICE1}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     +${CUST1_PHONE}    #${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     28/01/2021
CC-19922- 053 - WS_Verify that Calls Waiting updates correclty for CDN call
    [Setup]     Run Keywords
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     OneXCommunicator.Close OneX      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent
    OneXCommunicator.OneX Call Out     ${CDN2}
    Sleep   1

    # STEP 02:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify the Offered Chart updates correctly when contact is ringing
    Wait Until Element Is Visible    //div[@class='cards-container__inner']    timeout=50
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 03:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT1_SKILLSET_VOICE2}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_1 waiting_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 4:
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent accepts CDN call
    AgentToolbar.Agent Go Ready
    Wait Until Element Is Visible    //div[@class='cards-container__inner']    timeout=60
    WorkCard.Agent Accepts A Contact     +${CUST1_PHONE}    #${CUST1_URI_CDN}
    Sleep   3

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Agent Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     +${CUST1_PHONE}   #${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#Created date:     /01/2021
CC-19922- 054 - WS_Verify that both Agent Offered and Waiting field update correclty for CDN calls
    [Setup]     Run Keywords
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     OneXCommunicator.Close OneX      AND
    ...     AvayaIX.AvayaIX Log Out     AND
    ...     AvayaIX.Close AvayaIX    AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer 1 makes CDN call to Agent
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts CDN call from Customer 1
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Wait Until Element Is Visible    //div[@class='cards-container__inner']    timeout=60
    WorkCard.Agent Accepts A Contact     +${CUST1_PHONE}    #${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer 2 makes CDN call to Agent
    AvayaIX.AvayaIX Call Out    ${CDN1}
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 04:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE1}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2 waiting_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 05:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent ends CDN 1
    WorkCard.Agent Ends A Contact     +${CUST1_PHONE}    #${CUST1_URI_CDN}

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent accepts CDN call from Customer 2
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     +${CUST2_PHONE}    #${CUST2_URI_CDN}
    Sleep   3

    # STEP 07:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE1}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 08:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends 2 CDN calls
    WorkCard.Agent Ends A Contact     +${CUST2_PHONE}    #${CUST2_URI_CDN}

#=======================================================================================================================

#Created date:     29/01/2021
CC-19922- 055 - WS_Voice agent_Verify that pie chart will display when it is selected on Contacts view
    [Setup]     Run Keywords
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     OneXCommunicator.Close OneX      AND
    ...     AvayaIX.AvayaIX Log Out     AND
    ...     AvayaIX.Close AvayaIX    AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer 1 makes CDN call to Agent
    OneXCommunicator.OneX Call Out     ${CDN2}
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts CDN call from Customer 1
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Wait Until Element Is Visible    //div[@class='cards-container__inner']    timeout=60
    WorkCard.Agent Accepts A Contact     +${CUST1_PHONE}   #${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer 2 makes CDN call to Agent
    AvayaIX.AvayaIX Call Out    ${CDN2}
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 04:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Change the Chart to Pie type
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE2}
    Sleep   1
    Select Chart Type Statistic     pie

    # STEP 05:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE2}
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2 waiting_1_pie.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 06:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Agent ends CDN 1
    WorkCard.Agent Ends A Contact     +${CUST1_PHONE}    #${CUST1_URI_CDN}
    Sleep   2

    # STEP 7:
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent accepts CDN call from Customer 2
    AgentToolbar.Agent Go Ready
    Wait Until Element Is Visible    //div[@class='cards-container__inner']    timeout=60
    WorkCard.Agent Accepts A Contact     +${CUST2_PHONE}   #${CUST2_URI_CDN}
    Sleep   3

    # STEP 08:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE2}
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2_pie.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 09:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Agent ends CDN 2
    WorkCard.Agent Ends A Contact     +${CUST2_PHONE}    #${CUST2_URI_CDN}

#=======================================================================================================================

#Created date:     29/01/2021
CC-19922- 056 - WS_Voice agent_Verify that bar chart will display when it is selected on Contacts view
    [Setup]     Run Keywords
    ...     AvayaIX.Open AvayaIX    AND
#    ...     AvayaIX.AvayaIX Log Out     AND
#    ...     AvayaIX.Setting Telephony   ${CUST2_PHONE}   ${CUST2_PHONE_PASSWORD}    ${SERVER_SM}    ${PORT}    ${DOMAIN}     AND
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
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
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     OneXCommunicator.Close OneX      AND
    ...     AvayaIX.AvayaIX Log Out     AND
    ...     AvayaIX.Close AvayaIX    AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer 1 makes CDN call to Agent
    OneXCommunicator.OneX Call Out     ${CDN1}
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts CDN call from Customer 1
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Wait Until Element Is Visible    //div[@class='cards-container__inner']    timeout=60
    WorkCard.Agent Accepts A Contact     +${CUST1_PHONE}   #${CUST1_URI_CDN}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Customer 2 makes CDN call to Agent
    AvayaIX.AvayaIX Call Out    ${CDN1}
    AgentToolbar.Agent Go Not Ready     ${RRD_CODE1}

    # STEP 04:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Change the Chart to Pie type
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE1}
    Sleep   1
    Select Chart Type Statistic     pie

    # STEP 05:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Change the Chart to Bar type
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE1}
    Sleep   1
    Select Chart Type Statistic     bar

    # STEP 06:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE1}
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2 waiting_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 07:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Agent ends CDN 1
    WorkCard.Agent Ends A Contact     +${CUST1_PHONE}    #${CUST1_URI_CDN}
    Sleep   2

    # STEP 8:
    Switch Browser    ${BROWSER_AGENT_ALIAS_1}
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent accepts CDN call from Customer 2
    AgentToolbar.Agent Go Ready
    Wait Until Element Is Visible    //div[@class='cards-container__inner']    timeout=60
    WorkCard.Agent Accepts A Contact     +${CUST2_PHONE}   #${CUST2_URI_CDN}
    Sleep   3

    # STEP 09:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 09    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE1}
    Sleep   10
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_2.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 10:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 10    Agent ends CDN 2
    WorkCard.Agent Ends A Contact     +${CUST2_PHONE}    #${CUST2_URI_CDN}

#=======================================================================================================================


#=======================================================================================================================

#Created date:     /01/2021
CC-19922- 058 - WS_ Verify that an agent is notified quickly if accepting a CDN after threshold
    [Setup]     Run Keywords
    ...     OneXCommunicator.Open OneX      AND
    ...     OneXCommunicatorLocator.click_login    AND
#    ...     OneXCommunicator.Setting Telephony     ${CUST1_PHONE}   ${CUST1_PHONE_PASSWORD}      ${SERVER_H323}     AND
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...     Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...     WorkCard.Agent End Any Inbound Contact      AND
    ...     AgentToolbar.Agent Finish Work      AND
    ...     AgentToolbar.Agent Exit      AND
    ...     Remove File     C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png    AND
    ...     OneXCommunicator.Close OneX      AND
    ...     Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer makes CDN call to Agent
    OneXCommunicator.OneX Call Out     ${CDN2}
    Sleep   50

    # STEP 02:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify the Offered Chart updates correctly after contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE2}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_1 waiting_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent goes ready and accepts CDN call
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    AgentToolbar.Agent Go Ready
    WorkCard.Agent Accepts A Contact     +${CUST1_PHONE}    #${CUST1_URI_CDN}
    Sleep   3

    # STEP 04:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify the Offered Chart updates correctly after contact is accepted
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT1_SKILLSET_VOICE2}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Click Element   ${LOC_WEBSTATISTIC_BTN_REFRESH}
    Sleep   5
    Verify Chart Statistic    contactsChart    C:/Users/Administrator/Documents/DataStatictis/contact offered_1.png    C:/Users/Administrator/Documents/VerifyStatictis/VerifyChart.png

    # STEP 05:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify Warning sign displays correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE2}
    Wait Until Element Is Visible    ${LOC_WEBSTATISTIC_WARNING_SIGN}   timeout=10

    # STEP 06:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Verify Service level display correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE2}
    Verify Service Level    0%

    # STEP 07:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07    Check Alert option and Verify Alert dialog displays correctly
    NavigationMenu.Open Web Statistic
    Select Skillset Statistic    ${AGENT3_SKILLSET_VOICE2}
    Check Alert Statistic    true
    Verify Alert Statistic      ${AGENT3_SKILLSET_VOICE2}

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent Ends CDN call from Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     +${CUST1_PHONE}    #${CUST1_URI_CDN}
    Sleep   2

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================
