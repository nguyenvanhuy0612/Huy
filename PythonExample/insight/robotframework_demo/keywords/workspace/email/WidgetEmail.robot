##### WorkCard.robot #####

*** Settings ***
Library    WidgetEmailFunction.py

Resource   ../../../resources/SystemLibraries.robot
Resource   ../../../resources/SystemResources.robot
Resource   ../interaction_area/WorkCard.robot

Variables    WidgetEmailLocator.py

*** Keywords ***

####################################################################################

Agent Replies Email
    # Click Reply Email button
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_REPLY_EMAIL}    timeout=60s
    Click Element    ${LOC_WIDGETEMAIL_BTN_REPLY_EMAIL}
    Sleep   1

Agent Replies All Email
    # Click Reply All Email button
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_REPLY_ALL_EMAIL}    timeout=30s
    Click Element    ${LOC_WIDGETEMAIL_BTN_REPLY_ALL_EMAIL}
    Sleep   1

###   Send out Email ###
Agent Sends Email
   [Arguments]    ${cust_email}    ${subject_email}     ${content_email}    ${skillset}=${EMPTY}
    Run Keyword If   '${skillset}'=='${EMPTY}'   Reply Email    ${cust_email}     ${content_email}
    Run Keyword Unless    '${skillset}'=='${EMPTY}'     Send Out Email    ${cust_email}    ${subject_email}     ${content_email}    ${skillset}
    Sleep   1

#   19/5/2020
Complete Send Email
    [Arguments]    ${button}    ${contact_info}=${EMPTY}
    ${btn_complete} =   Convert To Upper Case   ${button}
#    Run Keyword Unless    '${contact_info}'=='${EMPTY}'   Agent Clicks On A Work Card     ${contact_info}
    Run Keyword If   '${contact_info}'=='${EMPTY}'   Click Element   ${LOC_WIDGETEMAIL_WORKCARD}
    ${workcard_id} =    Run Keyword If    '${contact_info}'=='${EMPTY}'     Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${send_btn} =   String.Replace String    ${LOC_WIDGETEMAIL_BTN_SEND_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${cancel_btn} =     String.Replace String    ${LOC_WIDGETEMAIL_BTN_CANCEL_SEND_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
#    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_SEND_EMAIL}    timeout=10s
    Run Keyword if   '${btn_complete}'=='SEND'    Click Element    ${send_btn}
    Run Keyword if   '${btn_complete}'=='CANCEL'    Click Element    ${cancel_btn}
#    Run Keyword if   '${btn_complete}'=='CANCEL'    Click Element   ${LOC_WIDGETEMAIL_BTN_END_INTERACTION}
    Sleep   1

Send Out Email
    [Arguments]    ${cust_email}    ${subject_email}     ${content_email}    ${skillset}
    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}
    Sleep   1
    ${workcard_id} =    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ${loc_field_to} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_TO}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Choose Email Skillset   ${skillset}
    # input Field To
    Wait Until Element Is Visible    ${loc_field_to}    timeout=30s
    Click Element   ${loc_field_to}
    Input Text    ${loc_field_to}    ${cust_email}
    Sleep   1
    # input subject Email
    ${loc_subject_email} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_SUBJECT_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_subject_email}    timeout=30s
    Input Text    ${loc_subject_email}    ${subject_email}
    Sleep   1
    # input content Email
    ${loc_content_email} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL1}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_content_email}    timeout=30s
    Input Text    ${loc_content_email}    ${content_email}
    Sleep   1

Choose Email Skillset
    [Arguments]    ${skillset}
    Wait Until Element Is Visible   ${LOC_WIDGETEMAIL_BTN_CHOOSE_SKILLSET}   timeout=60s
    Click Element   ${LOC_WIDGETEMAIL_BTN_CHOOSE_SKILLSET}
    Sleep   1
    @{list_skillset} =    Get WebElements   ${LOC_WIDGETEMAIL_BTN_CHOOSE_SKILLSET_LIST}
    @{loc_list_skillset} =  Get WebElements   ${LOC_WIDGETEMAIL_BTN_CHOOSE_SKILLSET_LIST_ELEMENT}
    ${length_list_skillset} =    Get Length   ${list_skillset}
    FOR    ${i}    IN RANGE    0   ${length_list_skillset}
        ${get_text_skillset} =   Get Text    ${list_skillset}[${i}]
        Run Keyword If   '${get_text_skillset}'=='${skillset}'    Click Element     ${loc_list_skillset}[${i}]
        Run Keyword If   '${get_text_skillset}'=='${skillset}'     Exit For Loop
    END
    Sleep   1

Reply Email
    [Arguments]    ${cust_email}     ${content_email}
    ${contact_info} =   Fetch From Left    ${cust_email}   ;
    ${check_email} =    Run Keyword And Return Status   Should Contain    ${cust_email}  ;
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    # input To field if having more emails
    ${loc_input_to}=    String.Replace String    ${LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_TO}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_input_to}    timeout=30s
    Run Keyword If    '${check_email}'=="True"   Click Element   ${loc_input_to}
    Run Keyword If    '${check_email}'=="True"   Input Text    ${loc_input_to}    ${cust_email}
    Sleep   2
    #   INPUT CONTENT EMAIL
    ${loc_input_content} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${loc_input_content_plain} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_PLAIN}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${check_plain_text} =    Run Keyword And Return Status    Element Should Be Visible    ${loc_input_content}
    Run Keyword if   '${check_plain_text}'=='True'   Press Keys    ${loc_input_content}    ${content_email}
    ...     ELSE    Press Keys    ${loc_input_content_plain}    ${content_email}
#    Wait Until Element Is Visible    ${loc_input_content}    timeout=20s
#    Press Keys    ${loc_input_content}    ${content_email}
    Sleep   1


# 22/5/2020
Reply By Suggestion
    [Arguments]    ${contact_info}    ${suggest_name}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_search_suggest} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_SEARCH_SUGGEST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_search_suggest}    timeout=20s
    Input Text   ${loc_search_suggest}   ${suggest_name}
    ${loc_choose_suggest} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CHOOSE_SUGGEST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible      ${loc_choose_suggest}    timeout=20s
    Click Element   ${loc_choose_suggest}
    Sleep   1

# 21/5/2020
Input CC Email
    [Arguments]    ${cust_email}    ${contact_info}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_field_cc} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_CC}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_field_cc}    timeout=20s
    Click Element   ${loc_field_cc}
    Input Text    ${loc_field_cc}    ${cust_email}
    Sleep   1

###   Send out Email With attachment ###
Insert Attachment
    [Arguments]    ${contact_info}=${EMPTY}    ${file_attach}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_insert_btn} =   String.Replace String    ${LOC_WIDGETEMAIL_BTN_ATTACH_FILE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    # Click Attach file button
    Wait Until Element Is Visible    ${loc_insert_btn}    timeout=20s
    Click Element    ${loc_insert_btn}
    Sleep   2
    # Click Select file attach button
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_SELECT_FILE_ATTACH}    timeout=20s
    Click Element    ${LOC_WIDGETEMAIL_BTN_SELECT_FILE_ATTACH}
    Sleep   1
    WidgetEmailFunction.attach_file      ${file_attach}
    Sleep   3
    # upload all attach file
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_UPLOAD_ALL_ATTACH}    timeout=20s
    Click Element    ${LOC_WIDGETEMAIL_BTN_UPLOAD_ALL_ATTACH}
    Sleep   1

####   Send out Email With attachment ###
#Agent Sends Email With Attachment
#   [Arguments]    ${cust_email}    ${subject_email}     ${contents_email}   ${file_attach}
#    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_TO}    timeout=10s
#    Input Text    ${LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_TO}    ${cust_email}
#    Sleep   1
#    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_IPT_SUBJECT_EMAIL}    timeout=10s
#    Input Text    ${LOC_WIDGETEMAIL_IPT_SUBJECT_EMAIL}    ${subject_email}
#    Sleep   1
#    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL}    timeout=10s
#    Input Text    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL}    ${contents_email}
#    Sleep   1
#    # Click Attach file button
#    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_ATTACH_FILE}    timeout=10s
#    Click Element    ${LOC_WIDGETEMAIL_BTN_ATTACH_FILE}
#    Sleep   2
#    # Click Select file attach button
#    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_SELECT_FILE_ATTACH}    timeout=10s
#    Click Element    ${LOC_WIDGETEMAIL_BTN_SELECT_FILE_ATTACH}
#    Sleep   1
#    WidgetEmailFunction.attach_file      ${file_attach}
#
#    # upload all attach file
#    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_UPLOAD_ALL_ATTACH}    timeout=10s
#    Click Element    ${LOC_WIDGETEMAIL_BTN_UPLOAD_ALL_ATTACH}
#    Sleep   2
#
#    # Click Send Email button
#    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_SEND_EMAIL}    timeout=30s
#    Click Element    ${LOC_WIDGETEMAIL_BTN_SEND_EMAIL}
#    Sleep   2

#   10/6/2020
Edit Format Email
    [Arguments]    ${contact_info}=${EMPTY}    ${edit_type}=${EMPTY}    ${content}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${choose_type_edit} =   Run Keyword if   '${edit_type}'=='Bold'    String.Replace String    ${LOC_WIDGETEMAIL_BOLD}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${edit_type}'=='Italic'    String.Replace String    ${LOC_WIDGETEMAIL_ITALIC}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${edit_type}'=='Underline'    String.Replace String    ${LOC_WIDGETEMAIL_UNDERLINE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${edit_type}'=='Insert Numbered List'    String.Replace String    ${LOC_WIDGETEMAIL_NUMBER_LIST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${edit_type}'=='Insert List'    String.Replace String    ${LOC_WIDGETEMAIL_INSERT_LIST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${edit_type}'=='Align Left'    String.Replace String    ${LOC_WIDGETEMAIL_ALIGN_LEFT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${edit_type}'=='Align Center'    String.Replace String    ${LOC_WIDGETEMAIL_ALIGN_CENTER}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${edit_type}'=='Align Right'    String.Replace String    ${LOC_WIDGETEMAIL_ALIGN_RIGHT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5
    Wait Until Element Is Visible   ${choose_type_edit}  timeout=30
    Click Element   ${choose_type_edit}
    ${loc_content} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible   ${loc_content}  timeout=30
    Run keyword if   '${content}'=='${EMPTY}'    Input Text   ${loc_content}    ${EMPTY}
    ...     ELSE    Press Keys   ${loc_content}    ${content}
    Sleep   1


# 22/5/2020
Insert Link
    [Arguments]    ${link}    ${contact_info}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_btn_link} =    String.Replace String    ${LOC_WIDGETEMAIL_INSERT_LINK}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_btn_link}    timeout=20s
    Click element   ${loc_btn_link}
    Sleep   0.5
    ${loc_text_link} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_EDIT_TEXT_LINK}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_text_link}    timeout=20s
    Input text   ${loc_text_link}   ${link}
    Sleep   0.5
    ${loc_insert_link} =    String.Replace String    ${LOC_WIDGETEMAIL_BTN_INSERT_LINK}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_insert_link}    timeout=20s
    Click element   ${loc_insert_link}
    Sleep   1

Insert Email Signature
    Sleep   1
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_INSERT_EMAIL_SIGNATURE}    timeout=20s
    Click Element    ${LOC_WIDGETEMAIL_BTN_INSERT_EMAIL_SIGNATURE}
    Sleep   1
    #Verify Email Signature Displays In Email Contents
    Sleep   1

Click Any Editor Button
    [Arguments]    ${button}    ${contact_info}=${EMPTY}
    Run Keyword If   '${contact_info}'=='${EMPTY}'   Run keywords   Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_WORKCARD}    timeout=30s    AND   Click Element   ${LOC_WIDGETEMAIL_WORKCARD}
    ...     ELSE    Agent Clicks On A Work Card     ${contact_info}
    ${workcard_id} =    Run Keyword If    '${contact_info}'=='${EMPTY}'     Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_btn} =   String.Replace String    ${button}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Click Element   ${loc_btn}
    Sleep   1

Check Image Extention
    [Arguments]    ${file_name}
    ${extention} =   Fetch From Right    ${file_name}   .
    ${extent} =     Convert To Upper Case   ${extention}
    ${check} =   convert to string   False
    ${check} =  Run Keyword if   '${extent}'=='PNG'   convert to string     True
    ...     ELSE IF   '${extent}'=='JPG'   convert to string   True
    ...     ELSE IF   '${extent}'=='GIF'   convert to string   True
    ...     ELSE IF   '${extent}'=='JPEG'   convert to string   True
    ...     ELSE    convert to string   False
    [Return]    ${check}

Delete Old Selected Inline Image
    ${old_image} =    Run Keyword And Return Status    Element Should Be Visible    ${LOC_WIDGETEMAIL_CHOOSE_SELECTED_IMAGE}
    Run Keyword if   '${old_image}'=='True'   Click Element   ${LOC_WIDGETEMAIL_CHOOSE_SELECTED_IMAGE}
    Run Keyword if   '${old_image}'=='True'   Run Keywords    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_DELETE_INLINE_IMAGE}    timeout=20s    AND     Click Element   ${LOC_WIDGETEMAIL_BTN_DELETE_INLINE_IMAGE}
    Sleep   0.5

#   19/5/2020
Insert Inline Image
    [Arguments]    ${file_name}    ${contact_info}=${EMPTY}
    # click insert image button
    Click Any Editor Button     ${LOC_WIDGETEMAIL_INSERT_IMAGE}     ${contact_info}
    # delete old inserted image
    Delete Old Selected Inline Image
    # click upload new image button
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_UPLOAD_IMAGE}    timeout=20s
    Click Element   ${LOC_WIDGETEMAIL_BTN_UPLOAD_IMAGE}
    Sleep   1
    # choose file and insert
    WidgetEmailFunction.attach_file      ${file_name}
    Sleep   1
    # CHECK image have or have not extention
    ${check_image_extention} =    Run Keyword And Return Status   Should Contain    ${file_name}  .
    ${get_warning_mess} =   Run Keyword if   '${check_image_extention}'=='False'    Get Text    ${LOC_WIDGETEMAIL_WARNING_MESS_UPLOAD_IMAGE}
    Run Keyword if   '${check_image_extention}'=='False'    Should be equal     ${get_warning_mess}    This file type is not supported.
    Run Keyword if   '${check_image_extention}'=='False'    Log to console    You inserted the image having no extention. This file type is not supported.
    Run Keyword if   '${check_image_extention}'=='False'    Click Element   ${LOC_WIDGETEMAIL_BTN_EXIT_UPLOAD_IMAGE_WINDOW}
    # check correct image extention
    ${correct_extention} =   Check Image Extention    ${file_name}
    Run Keyword if   '${correct_extention}'=='True'    Click Element   ${LOC_WIDGETEMAIL_BTN_INSERT_INLINE_IMAGE}
    ...     ELSE IF  '${correct_extention}'=='False'    Run Keywords    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_EXIT_UPLOAD_IMAGE_WINDOW}    timeout=30s   AND   Click Element   ${LOC_WIDGETEMAIL_BTN_EXIT_UPLOAD_IMAGE_WINDOW}  AND   Log to console    This file type is not supported.
    Sleep   1

#   25/5/2020
Undo Email
    [Arguments]    ${content_email}   ${contact_info}=${EMPTY}
    Click Any Editor Button     ${LOC_WIDGETEMAIL_ALIGN_UNDO}     ${contact_info}
    Run Keyword If   '${contact_info}'=='${EMPTY}'   Run keywords   Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_WORKCARD}    timeout=30s    AND   Click Element   ${LOC_WIDGETEMAIL_WORKCARD}
    ...     ELSE    Agent Clicks On A Work Card     ${contact_info}
    ${workcard_id} =    Run Keyword If    '${contact_info}'=='${EMPTY}'     Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_content_email} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${content_new} =   Get Text   ${loc_content_email}
    Should not contain   ${content_new}    ${content_email}
    Sleep   1

#   25/5/2020
Redo Email
    [Arguments]    ${content_email}    ${contact_info}=${EMPTY}
    Click Any Editor Button     ${LOC_WIDGETEMAIL_ALIGN_REDO}     ${contact_info}
    Run Keyword If   '${contact_info}'=='${EMPTY}'   Run keywords   Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_WORKCARD}    timeout=30s    AND   Click Element   ${LOC_WIDGETEMAIL_WORKCARD}
    ...     ELSE    Agent Clicks On A Work Card     ${contact_info}
    ${workcard_id} =    Run Keyword If    '${contact_info}'=='${EMPTY}'     Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_content_email} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ${content_new} =   Get Text   ${loc_content_email}
    Should contain   ${content_new}    ${content_email}
    Sleep   1

#   22/06/2020
Choose Email Template
    [Arguments]    ${contact_info}=${EMPTY}     ${template_name}=${EMPTY}   ${character_search}=${EMPTY}
     ${workcard_id} =    Run Keyword If    '${contact_info}'=='${EMPTY}'     Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    # input character to search
    ${loc_ipt_template} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_SEARCH_TEMPLATE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_ipt_template}    timeout=20s
    Input Text    ${loc_ipt_template}    ${character_search}
    # select Email template GROUP
    ${loc_template_name_group} =   String.Replace String    ${LOC_WIDGETEMAIL_SELECT_EMAIL_TEMPLATE_GROUP}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5
    ${loc_template_name_group1} =   String.Replace String    ${loc_template_name_group}    ${EMAIL_TEMPLATE_NAME}    ${template_name}
    Sleep   1
    ${check_line_template_group} =    Run Keyword And Return Status   Page Should Contain Element    ${loc_template_name_group1}
    Run keyword if   '${check_line_template_group}'=='True'   Click Element   ${loc_template_name_group1}
    Sleep   0.5
    # select Email template MIME
    ${loc_template_name_mime} =   String.Replace String    ${LOC_WIDGETEMAIL_SELECT_EMAIL_TEMPLATE_MIME}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5
    ${loc_template_name_mime1} =   String.Replace String    ${loc_template_name_mime}    ${EMAIL_TEMPLATE_NAME}    ${template_name}
    Sleep   1
    ${check_line_template_mime} =    Run Keyword And Return Status   Page Should Contain Element    ${loc_template_name_mime1}
    Sleep   0.5
    # click insert button
    ${loc_btn_insert_temp} =   Run keyword if   '${check_line_template_mime}'=='True'   String.Replace String    ${LOC_WIDGETEMAIL_BTN_INSERTT_TEMPLATE}    ${LINE_EMAIL_TEMPLATE}   ${loc_template_name_mime1}
    Sleep   1
    ${check_btn_insert} =    Run Keyword And Return Status   Page Should Contain Element    ${loc_btn_insert_temp}
    Run keyword if   '${check_btn_insert}'=='True'   Click element    ${loc_btn_insert_temp}
    Sleep   2

#   01/07/2020
Preview Email Template
    [Arguments]    ${contact_info}=${EMPTY}     ${template_name}=${EMPTY}
     ${workcard_id} =    Run Keyword If    '${contact_info}'=='${EMPTY}'     Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    # input character to search
    ${loc_ipt_template} =   String.Replace String    ${LOC_WIDGETEMAIL_IPT_SEARCH_TEMPLATE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_ipt_template}    timeout=20s
    Input Text    ${loc_ipt_template}    ${template_name}
    # select Email template GROUP
    ${loc_template_name_group} =   String.Replace String    ${LOC_WIDGETEMAIL_SELECT_EMAIL_TEMPLATE_GROUP}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5
    ${loc_template_name_group1} =   String.Replace String    ${loc_template_name_group}    ${EMAIL_TEMPLATE_NAME}    ${template_name}
    Sleep   1
    ${check_line_template_group} =    Run Keyword And Return Status   Page Should Contain Element    ${loc_template_name_group1}
    Run keyword if   '${check_line_template_group}'=='True'   Click Element   ${loc_template_name_group1}
    Sleep   0.5
    # select Email template MIME
    ${loc_template_name_mime} =   String.Replace String    ${LOC_WIDGETEMAIL_SELECT_EMAIL_TEMPLATE_MIME}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   0.5
    ${loc_template_name_mime1} =   String.Replace String    ${loc_template_name_mime}    ${EMAIL_TEMPLATE_NAME}    ${template_name}
    Sleep   1
    ${check_line_template_mime} =    Run Keyword And Return Status   Page Should Contain Element    ${loc_template_name_mime1}
    Sleep   0.5

    # click preview button
    ${loc_btn_preview_temp} =   Run keyword if   '${check_line_template_mime}'=='True'   String.Replace String    ${LOC_WIDGETEMAIL_BTN_PREVIEW_TEMPLATE}    ${LINE_EMAIL_TEMPLATE}   ${loc_template_name_mime1}
    Sleep   1
    ${check_btn_preview} =    Run Keyword And Return Status   Page Should Contain Element    ${loc_btn_preview_temp}
    Run keyword if   '${check_btn_preview}'=='True'   Click element    ${loc_btn_preview_temp}
    Sleep   2
    # verify preview email template name
    Wait Until Element Is Visible   ${LOC_WIDGETEMAIL_TEMPLATE_NAME}    10
    ${temp_name} =   Get Text   ${LOC_WIDGETEMAIL_TEMPLATE_NAME}
    ${check_temp_name} =    Run Keyword And Return Status   Should Contain    ${temp_name}  ${template_name}
    Run Keyword if   '${check_temp_name}'=='True'   Log to console   Email Template Name: ${temp_name}
    ...     ELSE    Fail    Email Template Name does not correct
    # verify preview email template subject
    Wait Until Element Is Visible   ${LOC_WIDGETEMAIL_TEMPLATE_SUBJECT}    10
    ${temp_subject} =   Get Text   ${LOC_WIDGETEMAIL_TEMPLATE_SUBJECT}
    ${check_temp_subject} =    Run Keyword And Return Status   Should Contain    ${temp_subject}  ${template_name}
    Run Keyword if   '${check_temp_subject}'=='True'   Log to console   Email Template Subject: ${temp_name}
    ...     ELSE    Fail    Email Template Subject does not correct
    # verify content Email Template
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_TEMPLATE_CONTENT}    timeout=10s
    @{content_element}=    Get WebElements     ${LOC_WIDGETEMAIL_TEMPLATE_CONTENT}
    ${content_total}=    Get Length    ${content_element}
    FOR     ${i}    IN RANGE    -1   ${content_total}
        ${content_line} =  Get Text    ${content_element}[${i}]
        Run Keyword If  '${content_line}'=='${template_name}'   Run keywords   Log to console   Content Email display correctly   AND   Exit For Loop
    END
    Sleep   1
    Wait Until Element Is Visible    ${LOC_WIDGETEMAIL_BTN_CANCEL_PREVIEW_TEMPLATE}    timeout=10s
    Click Element   ${LOC_WIDGETEMAIL_BTN_CANCEL_PREVIEW_TEMPLATE}
    Sleep   1

#   3/6/2020
Verify Format Email
    [Arguments]    ${contact_info}=${EMPTY}     ${button}=${EMPTY}   ${content}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${choose_type_edit} =   Run Keyword if   '${button}'=='Bold'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_BOLD}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${button}'=='Italic'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_ITALIC}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${button}'=='Underline'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_UNDERLINE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${button}'=='Insert Numbered List'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_NUMBER_LIST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${button}'=='Insert List'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_INSERT_LIST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${button}'=='Align Left'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_ALIGN_LEFT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${button}'=='Align Center'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_ALIGN_CENTER}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${button}'=='Align Right'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_ALIGN_RIGHT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    @{get_content_edit} =    Get WebElements    ${choose_type_edit}
    ${content_total}=    Get Length    ${get_content_edit}
    log to console   content_total= ${content_total}
#    Should Be True   ${content_total}
    Run keyword if   ${content_total}<1    Fail    Content Email is not edited
    Sleep   0.5
#    ${count_content} =  Convert to String   None
    FOR     ${i}    IN RANGE    0   ${content_total}
        ${text} =    Get Text    ${get_content_edit}[${i}]
        log to console   i= ${i}
        log to console   text= ${text}
#        ${count_content} =   Run Keyword if    '${text}'=='${content}'   Evaluate   ${count_content}+1    ELSE    Evaluate   ${count_content}
        ${count_content} =   Run Keyword if    '${text}'=='${content}'   Convert to String   xxx
        log to console   count_content= ${count_content}
        Run Keyword if    '${text}'=='${content}'   Exit For Loop
    END
    Run Keyword unless  '${count_content}'=='xxx'    Fail    Edit Email incorrect
    Sleep   1

#   3/6/2020
Verify Font Size Email
    [Arguments]    ${contact_info}=${EMPTY}     ${font_size}=${EMPTY}   ${content}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${choose_type_edit} =   Run Keyword if   '${font_size}'=='8' or '${font_size}'=='Small'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_8}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${font_size}'=='12' or '${font_size}'=='Normal'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_12}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${font_size}'=='14' or '${font_size}'=='Large'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_14}    ${WORKCARD_ID_VAR}    ${workcard_id}
    ...     ELSE IF     '${font_size}'=='16' or '${font_size}'=='Huge'    String.Replace String    ${LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_16}    ${WORKCARD_ID_VAR}    ${workcard_id}
    @{get_content_edit} =    Get WebElements    ${choose_type_edit}
    ${content_total}=    Get Length    ${get_content_edit}
    Sleep   0.5
    FOR     ${i}    IN RANGE    0   ${content_total}
        ${text} =    Get Text    ${get_content_edit}[${i}]
        ${check_text} =   Run Keyword And Return Status    Should be equal    ${text}   ${content}
        Run Keyword If  '${check_text}'=='False' and '${i}'=='${content_total}'     Fail    Font size Email incorrect
    END
    Sleep   1

# 22/5/2020
Verify Insert Link
    [Arguments]    ${link}   ${contact_info}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_content_link} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_LINK}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_content_link}    timeout=20s
    ${text_link} =    Get Text   ${loc_content_link}
    ${check_link} =   Run Keyword And Return Status    Should contain    ${text_link}   ${link}
    Run Keyword If    '${check_link}' == 'True'    Log to console    Inserted Link displays correctly
    Run Keyword If    '${check_link}' == 'False'    Fail    Inserted Link does not display correctly
    Sleep   1

# 20/5/2020
Verify Inline Image
    [Arguments]    ${contact_info}=${EMPTY}
    ${workcard_id} =    Run Keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_display_inline} =   String.Replace String    ${LOC_WIDGETEMAIL_DISPLAY_INLINE_IMAGE}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Sleep   1
    ${check_image} =   Run Keyword And Return Status    Page Should Contain Element    ${loc_display_inline}
    Run Keyword If    '${check_image}' == 'True'    Log to console    Inline image displays correctly
    Run Keyword If    '${check_image}' == 'False'    Fail    Missed Inline image
    Sleep   1

# 25/5/2020
Verify Received Email
    [Arguments]    ${contact_info}    ${agent_email}    ${subject}    ${content}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    # verify Subject
    ${loc_subject} =    String.Replace String    ${LOC_WIDGETEMAIL_RECEIVE_SUBJECT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_subject}    timeout=30s
    ${get_subject} =    Get Element Attribute    ${loc_subject}    aria-label
    Run Keyword If     '${contact_info}'=='${ADMIN_EMAIL}'      Should contain     ${get_subject}   Undeliverable
    ${check_subject} =   Run Keyword And Return Status    Should Contain    ${get_subject}   ${subject}
    Run Keyword If    '${check_subject}' == 'True'    Log to console    Subject Email displays correctly
    Run Keyword If    '${check_subject}' == 'False'    Fail    Subject Email does not display correctly
    # verify From Email
    ${loc_from} =    String.Replace String    ${LOC_WIDGETEMAIL_RECEIVE_FROM}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_from}    timeout=20s
    ${get_from} =    Get Text    ${loc_from}
    ${check_from} =   Run Keyword And Return Status    Should Be Equal    ${get_from}   ${contact_info}
    Run Keyword If    '${check_from}' == 'True'    Log to console    From Email displays correctly
    Run Keyword If    '${check_from}' == 'False'    Fail    From Email does not display correctly
    # verify To Email
    ${loc_to} =    String.Replace String    ${LOC_WIDGETEMAIL_RECEIVE_TO}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_to}    timeout=30s
    ${get_to} =    Get Text    ${loc_to}
    ${check_to} =   Run Keyword And Return Status    Should contain    ${get_to}   ${agent_email}
    Run Keyword If    '${check_to}' == 'True'    Log to console    To Email displays correctly
    Run Keyword If    '${check_to}' == 'False'    Fail    To Email does not display correctly
    # verify content Email
    ${loc_content} =    String.Replace String    ${LOC_WIDGETEMAIL_RECEIVE_CONTENT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_content}    timeout=40s
    @{content_element}=    Get WebElements     ${loc_content}
    ${content_total}=    Get Length    ${content_element}
    FOR     ${i}    IN RANGE    -1   ${content_total}
        ${content_line} =  Get Text    ${content_element}[${i}]
        Run Keyword If  '${content_line}'=='${content}'   Run keywords   Log to console   Content Email display correctly   AND   Exit For Loop
    END
    Sleep   1

#   2/6/2020
Verify Replied Email
    [Arguments]    ${contact_info}    ${agent_email}    ${subject}    ${content}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    # verify To Email
    ${loc_to} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_TO_REPLY}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_to}    timeout=40s
    ${get_to} =    Get Text    ${loc_to}
    ${check_to} =   Run Keyword And Return Status    Should contain    ${get_to}   ${contact_info}
    Run Keyword If    '${check_to}' == 'True'    Log to console    To Email displays correctly
    Run Keyword If    '${check_to}' == 'False'    Fail    To Email does not display correctly
    # verify Subject
    ${loc_subject} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_SUBJECT_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_subject}    timeout=20s
    ${get_subject} =    Get Element Attribute    ${loc_subject}    aria-label
    ${check_subject} =   Run Keyword And Return Status    Should be equal    ${get_subject}   RE: ${subject}
    Run Keyword If    '${check_subject}' == 'True'    Log to console    Subject Email displays correctly
    Run Keyword If    '${check_subject}' == 'False'    Fail    Subject Email does not display correctly
    # verify content Email
    ${loc_content} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_LINE_REPLY}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_content}    timeout=20s
    @{content_element}=    Get WebElements     ${loc_content}
    ${content_total}=    Get Length    ${content_element}
    #####
#    ${content_line} =  Get Text    @{content_element}[2]
#    Log to console     ---------------${content_line}
#    Run Keyword If  '${content_line}'=='${content}'   Run keywords   Log to console   Content Email display correctly
#    ...     ELSE    Fail    Content Email display incorrectly
    FOR     ${i}    IN RANGE    -1   ${content_total}
        ${content_line} =  Get Text    ${content_element}[${i}]
        Log to console     ---------------${content_line}
        Run Keyword If  '${content_line}'=='${content}'   Run keywords   Log to console   Content Email display correctly   AND   Exit For Loop
    END
    Sleep   1

# 22/5/2020
Verify Suggesstion
    [Arguments]    ${contact_info}    ${suggest_content}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_content_suggest} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_SUGGEST}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_content_suggest}    timeout=20s
    ${text_suggest} =    Get Text   ${loc_content_suggest}
    ${check_suggest} =   Run Keyword And Return Status    Should contain    ${text_suggest}   ${suggest_content}
    Run Keyword If    '${check_suggest}' == 'True'    Log to console    Suggestion displays correctly
    ...     ELSE   Fail    Suggestion does not display correctly
    Sleep   1

Verify Email Signature
    [Documentation]     Verify Email Signature Displays In Email Contents
    [Arguments]    ${signature}
    ${workcard_id} =    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ${loc_content_email} =    String.Replace String    ${LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL}    ${WORKCARD_ID_VAR}    ${workcard_id}
    Wait Until Element Is Visible    ${loc_content_email}    timeout=20s
    ${text_signature} =  Get Text  ${loc_content_email}
    Should Contain      ${text_signature}   ${signature}
    Sleep   1

#   11/05/2020
Verify Email Attachment
    [Arguments]    ${contact_info}=${EMPTY}   ${attach_name}=${EMPTY}
    Run keyword if   '${contact_info}'=='${EMPTY}'   Run keywords    Click Element   ${LOC_WIDGETEMAIL_WORKCARD}    AND     Sleep   1
    ${workcard_id} =    Run keyword if   '${contact_info}'=='${EMPTY}'    Get Element Attribute   ${LOC_WIDGETEMAIL_WORKCARD}     interaction-id
    ...     ELSE    Get WorkCard ID    ${contact_info}
    ${loc_show_attachment} =    String.Replace String    ${LOC_WIDGETEMAIL_SHOW_ATTACHMENT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    @{list_attachment}=    Get WebElements     ${loc_show_attachment}
    ${length_list_attachment}=    Get Length    ${list_attachment}
    Run Keyword If    '${length_list_attachment}' == '0' and '${attach_name}'=='${EMPTY}'   Log to console   Have no this Attachment
    ${state} =     Set Variable   0
    FOR      ${i}    IN RANGE    0   ${length_list_attachment}
        ${name_of_attachment} =     Get Text    @{list_attachment}[${i}]
        ${state}=    Run Keyword And Return Status    Should Contain    ${name_of_attachment}    ${attach_name}
    END
    Run Keyword If    '${state}' == 'True'    Log to console   Agent recieved Email is attached file ${attach_name}
    Run Keyword If    '${state}' == 'True' and '${attach_name}'=='${EMPTY}'   Fail    Can upload Attachment files which have size larger than 25MB
    Run Keyword If    '${state}' == 'False'    Fail    Missed Attachment
    Sleep   1

Verify Download Attachment
    [Arguments]    ${contact_info}   ${attach_name}
    ${workcard_id} =    Get WorkCard ID    ${contact_info}
    ${loc_show_attachment} =    String.Replace String    ${LOC_WIDGETEMAIL_SHOW_ATTACHMENT}    ${WORKCARD_ID_VAR}    ${workcard_id}
    @{list_attachment}=    Get WebElements     ${loc_show_attachment}
    ${length_list_attachment}=    Get Length    ${list_attachment}
    ${status} =     Set Variable   0
    # download attachment
    FOR      ${i}    IN RANGE    -1   ${length_list_attachment}
        ${name_of_attachment} =     Get Text    @{list_attachment}[${i}]
        Run Keyword If  '${name_of_attachment}'=='${attach_name}'   Click Element   @{list_attachment}[${i}]
        Run Keyword If  '${name_of_attachment}'=='${attach_name}'   Exit For Loop
    END
    Sleep   5
    # open folder contain downloaded attachment
    # if finding attachment, delete it
    ${a}=   WidgetEmailFunction.verify_download_attachment   ${attach_name}
    Run Keyword If   '${a}'=='true'   WidgetEmailFunction.delete_download_attachment    ${attach_name}
    Run Keyword If   '${a}' == 'false'    WidgetEmailFunction.close_file_explorer_window
    Run Keyword If   '${a}' == 'false'    Fail    Missed download Attachment
    Sleep   1




########################################################################################################################
######################################################   KEYWORDS ######################################################
########################################################################################################################

Close Mail Application
    close_mail_app
    Sleep   2