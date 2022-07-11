*** Settings ***


Resource   ../../../resources/SystemLibraries.robot
Resource   ../../../resources/SystemVariables.robot
Resource   ../interaction_area/WorkCard.robot
Resource   ../interaction_log/InteractionLog.robot
Resource   ../navigation_menu/NavigationMenu.robot


Variables  CustomerDetailsLocator.py



*** Keywords ***

# ================================================== CUSTOMER DETAILS ==================================================
# 17/03/2020
Verify Customer Details
    [Arguments]    ${cust_email}
    # get workcard ID
    ${workcard_id} =    WorkCard.Get WorkCard ID    ${cust_email}
#    Log To Console      Workcard ID = ${workcard_id}
    Sleep   1
    # get Email
    ${loc_line_email}=    String.Replace String    ${LOC_CUSTOMER_DETAIL_LINE_EMAIL}     ${WORKCARD_ID_VAR}    ${workcard_id}
#    Log To Console  ${loc_line_email}
    Wait Until Element Is Visible    ${loc_line_email}    timeout=30
    ${loc_email} =    Get Text    ${loc_line_email}
    Should Be Equal    ${loc_email}    ${cust_email}
    Sleep   1
    # click More Information
    ${loc_btn_more}=    String.Replace String    ${LOC_CUSTOMER_DETAIL_BTN_MORE_INFO}     ${WORKCARD_ID_VAR}    ${workcard_id}
#    Log To Console  ${loc_btn_more}
    Wait Until Element Is Visible    ${loc_btn_more}    timeout=30
    Click Element   ${loc_btn_more}
    Sleep   1
    Wait Until Element Is Visible    ${loc_line_email}    timeout=30
    ${loc_email} =    Get Text    ${loc_line_email}
    Should Be Equal    ${loc_email}    ${cust_email}
    Sleep   1

# 17/03/2020
Verify Have No Customer Details
    [Arguments]    ${cust_email}
    # get workcard ID
    ${workcard_id} =    WorkCard.Get WorkCard ID    ${cust_email}
    Log To Console      Workcard ID = ${workcard_id}
    Sleep   1
    # get Email
    ${loc_line_email}=    String.Replace String    ${LOC_CUSTOMER_DETAIL_LINE_EMAIL}     ${WORKCARD_ID_VAR}    ${workcard_id}
    Log To Console  ${loc_line_email}
    Wait Until Page Does Not Contain    ${loc_line_email}   timeout=10
    Log To Console      Have No Customer Details For This Contact
    Sleep   1

# ================================================ INTERACTION DETAILS =================================================
Verify Interaction Details
    [Arguments]    ${contact_type}  ${agent_id}  ${station_id}    ${contact_info}  ${skillset}     ${uri}  ${phone}
    # verify contact type

#    Wait Until Element Is Visible    ${LOC_CUSTOMER_DETAIL_WIDGET_HEADER}    timeout=30
#    Click Element   ${LOC_CUSTOMER_DETAIL_WIDGET_HEADER}
#    Sleep   1
    Wait Until Element Is Visible    ${LOC_CUSTOMER_DETAIL_WIDGET_CONTENT}    timeout=30
    Click Element   ${LOC_CUSTOMER_DETAIL_WIDGET_CONTENT}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_CUSTOMER_DETAIL_CHANEL_TYPE}    timeout=30
    ${channel_type} =   Get Text    ${LOC_CUSTOMER_DETAIL_CHANEL_TYPE}
    Should Be Equal      ${channel_type}    ${contact_type}
    # verify service
    Wait Until Element Is Visible    ${LOC_CUSTOMER_DETAIL_SERVICE}    timeout=30
    ${service} =   Get Text    ${LOC_CUSTOMER_DETAIL_SERVICE}
    Should Be Equal      ${service}    ${skillset}
    # verify oriiginal address
    Wait Until Element Is Visible    ${LOC_CUSTOMER_DETAIL_ORIGINAL_ADDRESS}    timeout=30
    ${original_address} =   Get Text    ${LOC_CUSTOMER_DETAIL_ORIGINAL_ADDRESS}
    Should Be Equal      ${original_address}    ${uri}
    # verify Destination address (voice)
    Wait Until Element Is Visible    ${LOC_CUSTOMER_DETAIL_DESTINATION}    timeout=30
    ${destination_address} =   Get Text    ${LOC_CUSTOMER_DETAIL_DESTINATION}
    Should Be Equal      ${destination_address}    ${phone}
    # verify contact ID
    ${workcard_id} =    WorkCard.Get WorkCard ID    ${contact_info}
    ${contact_id} =     Get Text    ${LOC_CUSTOMER_DETAIL_CONTACT_ID}
    Run Keyword If    '${channel_type}' == 'Voice'      Should Be True    '${workcard_id}' == '${station_id}V${contact_id}'
        ...     ELSE    Should Be True    '${workcard_id}' == '${agent_id}M${contact_id}'

# =================================================== INTRINSICS =======================================================
# 18/03/2020
Verify Intrinsics
    [Arguments]    ${contact_info}      ${cdn_uri}      ${cdn}      ${station_id}    ${cust_dn}   ${skillset}
    Open Customer Details
    Sleep   1
    Selenium2Library.Scroll Element Into View    ${LOC_CUSTOMER_DETAIL_CONTACT_ID}
    Wait Until Element Is Visible    ${LOC_CUSTOMER_DETAIL_CONTACT_ID}    timeout=30
    Set Focus To Element    ${LOC_CUSTOMER_DETAIL_CONTACT_ID}
#    ${get_contact_id} =   Get Text    ${LOC_CUSTOMER_DETAIL_CONTACT_ID}
    ${workcard_id} =    WorkCard.Get WorkCard ID    ${contact_info}
    ${len_workcard} =   Get Length     ${workcard_id}
    ${convert_count} =      Convert To Integer     ${len_workcard}
    ${x} =     Evaluate    ${convert_count}-8
    ${get_contact_id} =    Get Substring    ${workcard_id}      ${x}     ${len_workcard}
    ${loc_intrinsic_name} =    String.Replace String    ${LOC_CUSTOMER_DETAIL_INTRINSIC_NAME}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${loc_intrinsic_value} =    String.Replace String    ${LOC_CUSTOMER_DETAIL_INTRINSIC_VALUE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    @{list_intrinsic_name}=    Get WebElements     ${loc_intrinsic_name}
    @{list_intrinsic_value}=    Get WebElements     ${loc_intrinsic_value}
    ${length_list_intrinsic_name}=    Get Length    ${list_intrinsic_name}
    FOR      ${i}    IN RANGE    -1   ${length_list_intrinsic_name}
        Selenium2Library.Scroll Element Into View    @{list_intrinsic_name}[${i}]
        ${name_of_intrinsic} =     Get Text    @{list_intrinsic_name}[${i}]
        ${value_of_intrinsic} =     Get Text    @{list_intrinsic_value}[${i}]
        Run Keyword If    '${name_of_intrinsic}' == 'Channel Type:'    Run Keywords    Should Be Equal   ${value_of_intrinsic}    Voice     AND    Log to console    Channel Type: Voice
        Run Keyword If    '${name_of_intrinsic}' == 'ProviderContactID:'    Run Keywords    Should Be Equal   ${value_of_intrinsic}    ${get_contact_id}    AND    Log to console    ProviderContactID: ${value_of_intrinsic}
        Run Keyword If    '${name_of_intrinsic}' == 'ContactType:'    Run Keywords   Should Be Equal   ${value_of_intrinsic}    10000   AND    Log to console    ContactType: 10000
        Run Keyword If    '${name_of_intrinsic}' == 'SIP_REQUEST_URI:'    Run Keywords    Should Be Equal   ${value_of_intrinsic}    ${cdn_uri}   AND   Log to console    SIP_REQUEST_URI: ${cdn_uri}
        Run Keyword If    '${name_of_intrinsic}' == 'SIP_TO_ADDRESS:'    Run Keywords    Should Be Equal   ${value_of_intrinsic}    ${cdn_uri}   AND    Log to console    SIP_TO_ADDRESS: ${cdn_uri}
        Run Keyword If    '${name_of_intrinsic}' == 'SIP_DIALED_DN:'    Run Keywords    Should Be Equal   ${value_of_intrinsic}    ${cdn}   AND    Log to console    SIP_DIALED_DN: ${cdn}
        Run Keyword If    '${name_of_intrinsic}' == 'AD_CDN:'    Run Keywords   Should Be Equal   ${value_of_intrinsic}    ${cdn}   AND    Log to console    AD_CDN: ${cdn}
        Run Keyword If    '${name_of_intrinsic}' == 'SIP_FROM_ADDRESS:'    Run Keywords   Should Be Equal   sip:${value_of_intrinsic}    ${contact_info}   AND    Log to console    SIP_FROM_ADDRESS: ${contact_info}
        Run Keyword If    '${name_of_intrinsic}' == 'AD_CLID:'    Run Keywords    Should Be Equal   ${value_of_intrinsic}    ${cust_dn}   AND   Log to console    AD_CLID: ${cust_dn}
        Run Keyword If    '${name_of_intrinsic}' == 'CALLED_NUMBER:'    Run Keywords    Should Be Equal   ${value_of_intrinsic}    ${cust_dn}   AND    Log to console    CALLED_NUMBER: ${station_id}
    END




#Create Email Signature
#    [Arguments]    ${email_signature}
#    # open Email signature
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE}    timeout=30
#    Click Element    ${LOC_WORKSPACE_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE}
#    # Clear old email signature
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}    timeout=30
#    Input Text  ${LOC_WORKSPACE_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}    ${email_signature}
#    Sleep   2
#    # Save email signature
#    Wait Until Element Is Visible    ${LOC_WORKSPACE_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BTN_SAVE}    timeout=30
#    Click Element    ${LOC_WORKSPACE_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BTN_SAVE}
#    Sleep   1


