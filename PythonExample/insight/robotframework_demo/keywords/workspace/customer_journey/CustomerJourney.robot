*** Settings ***
Resource   ../../../resources/SystemResources.robot
Resource    ../navigation_menu/NavigationMenu.robot
Resource    ../../base_module/Utils.robot
Variables  CustomerJourneyLocator.py
Library    Selenium2Library
Library     DateTime
Library    ../../base_module/BaseKeyword.py

*** Keywords ***
# 10/11/2020

# 10/11/2020
Show Previous Touchpoint
    [Arguments]    ${contact_info}     ${contact_type}   ${content_status}

    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_journey_touchpoint}=    String.Replace String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5

    ${get_contact_type} =    set variable if    '${contact_type}'=='WC'    'CH'    '${contact_type}'=='EM'    'EM'   '${contact_type}'=='Voice'    'VO'
    ${loc_touchpoint}=    String.Format String    ${loc_journey_touchpoint}    ${get_contact_type}
    Sleep   0.5
#    ${loc_touchpoint}=    String.Format String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT}    ${get_contact_type}
    @{touchpoint_elements}=    Get WebElements     ${loc_touchpoint}
    ${touchpoint_total}=    Get Length    ${touchpoint_elements}
    ${previous_touchpoint} =    evaluate    ${touchpoint_total}-2
    ${current_touchpoint} =    evaluate    ${touchpoint_total}-1
    Mouse Up    @{touchpoint_elements}[${current_touchpoint}]
    Selenium2Library.Scroll Element Into View    @{touchpoint_elements}[${previous_touchpoint}]
#    Wait Until Element Is Visible    @{touchpoint_elements}[${previous_touchpoint}]    timeout=5
    Click element   @{touchpoint_elements}[${previous_touchpoint}]
    Sleep   0.5
    # verify interaction
    #   tooltip timeline
#    Selenium2Library.Scroll Element Into View   ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_BTN}
    ${loc_timeline} =      String.Replace String    ${LOC_CUSTOMER_JOURNEY_TOOLTIP_TIMELINE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${get_text_timeline} =     Get text    ${loc_timeline}
    Should contain     ${get_text_timeline}    ${content_status}
    Sleep   0.5

# 11/11/2020
Show Current Touchpoint
    [Arguments]    ${contact_info}   ${contact_type}   ${content_status}

    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    log to console   id=${workcard_id}
    ${loc_journey_touchpoint}=    String.Replace String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5

    ${get_contact_type} =    set variable if    '${contact_type}'=='WC'    'CH'    '${contact_type}'=='EM'    'EM'   '${contact_type}'=='Voice'    'VO'
    ${loc_touchpoint}=    String.Format String    ${loc_journey_touchpoint}    ${get_contact_type}
    Sleep   0.5
#    ${loc_touchpoint}=    String.Format String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT}    ${get_contact_type}
    @{touchpoint_elements}=    Get WebElements     ${loc_touchpoint}
    ${touchpoint_total} =    Get Length    ${touchpoint_elements}
#    log to console  =================${touchpoint_total}
    ${current_touchpoint} =    evaluate    ${touchpoint_total}-1
    Wait Until Element Is Visible    @{touchpoint_elements}[${current_touchpoint}]    timeout=5
    Click element   @{touchpoint_elements}[${current_touchpoint}]
    Sleep   1
    # verify interaction
    #   tooltip timeline
#    ${get_text_status} =     Get text    ${LOC_CUSTOMER_JOURNEY_TOOLTIP_STATUS}
#    Should contain     ${get_text_status}    Text Chat from Customer
    ${loc_transcript_btn} =      String.Replace String    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5
    Run keyword unless    ${get_contact_type}=='VO'     Selenium2Library.Scroll Element Into View   ${loc_transcript_btn}
    ${loc_timeline} =      String.Replace String    ${LOC_CUSTOMER_JOURNEY_TOOLTIP_TIMELINE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${get_text_timeline} =     Get text    ${loc_timeline}
    Should contain     ${get_text_timeline}    ${content_status}
    Sleep   0.5

# 10/11/2020
Verify Touchpoint Transcript
    [Arguments]     ${content}
    Selenium2Library.Scroll Element Into View    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_BTN}
    Click Element   ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_BTN}
    Sleep   1
    ${get_content} =    Get text    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_CONTENT}
    Log to console    ${get_content}
    Should contain     ${get_content}   ${content}
    Sleep   0.5
    Wait Until Element Is Visible    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_CLOSE_BTN}    timeout=5
    Click element   ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_CLOSE_BTN}
    Sleep   0.5

# 18/11/2020
Verify Attachment In Transcript
    [Arguments]     ${attach_name}
    Selenium2Library.Scroll Element Into View    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_BTN}
    Click Element   ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_BTN}
    Sleep   1
    Selenium2Library.Scroll Element Into View    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_ATTACHMENT}
    ${get_attachment} =     Get text    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_ATTACHMENT}
    Log to console  Attachment: ${get_attachment}
    Should contain     ${get_attachment}   ${attach_name}
    Sleep   0.5
    Wait Until Element Is Visible    ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_CLOSE_BTN}    timeout=5
    Click element   ${LOC_CUSTOMER_JOURNEY_TRANSCRIPT_CLOSE_BTN}
    Sleep   0.5

# 11/11/2020
Verify Touchpoint Tooltip
    [Arguments]    ${contact_info}   ${contact_type}    ${content}=${EMPTY}

    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_journey_touchpoint}=    String.Replace String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5

    NavigationMenu.Open Customer Details
    ${loc_customerID}=    String.Replace String    ${LOC_CUSTOMER_JOURNEY_GET_CUSTOMER_ID}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5
    Selenium2Library.Scroll Element Into View    ${loc_customerID}
    ${get_customer_id} =     Get text    ${loc_customerID}
    Sleep   0.5
    NavigationMenu.Open Customer Journey
    ${get_contact_type} =    set variable if    '${contact_type}'=='WC'    'CH'    '${contact_type}'=='EM'    'EM'   '${contact_type}'=='Voice'    'VO'
#    ${loc_touchpoint}=    String.Format String    ${LOC_CUSTOMER_JOURNEY_TOUCHPOINT}    ${get_contact_type}
    ${loc_touchpoint}=    String.Format String    ${loc_journey_touchpoint}    ${get_contact_type}
    Sleep   0.5
    @{touchpoint_elements}=    Get WebElements     ${loc_touchpoint}
    ${touchpoint_total} =    Get Length    ${touchpoint_elements}
    ${current_touchpoint} =    evaluate    ${touchpoint_total}-1
    # move Mouse to this Tooltip
    Wait Until Element Is Visible    @{touchpoint_elements}[${current_touchpoint}]    timeout=5
    Mouse Up   @{touchpoint_elements}[${current_touchpoint}]
    Sleep   0.5
    # verify Customer ID
    ${get_tooltip_touchpoint} =     Get text     ${LOC_CUSTOMER_JOURNEY_TOOLTIP_TOUCHPOINT}
    Run keyword unless    ${get_contact_type}=='VO'    Should contain     ${get_tooltip_touchpoint}   ${get_customer_id}
    Run keyword unless    ${get_contact_type}=='${EMPTY}'    Should contain     ${get_tooltip_touchpoint}   ${content}
#    Should contain     ${get_tooltip_touchpoint}   ${get_customer_id}
    Sleep   0.5

# 3/12/2020
Select Time Range Touchpoint
    [Arguments]    ${time_range}
    Wait Until Element Is Visible    ${LOC_CUSTOMER_JOURNEY_TIME_RANGE_SELECTION}   timeout=5
    Click Element   ${LOC_CUSTOMER_JOURNEY_TIME_RANGE_SELECTION}
    ${loc_time_range} =    String.Format String    ${LOC_CUSTOMER_JOURNEY_TIME_RANGE_OPTION}    ${time_range}
    Wait Until Element Is Visible    ${loc_time_range}   timeout=5
    Click Element   ${loc_time_range}