*** Settings ***
Resource   ../../../resources/SystemResources.robot
Variables  WidgetSettingsLocator.py
Library    Selenium2Library


*** Keywords ***

# ====================================== ABOUT ===============================================================
# 03/03/2020
Verify Version And Build
    [Arguments]    ${version}   ${build}
    # Verify Version
    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_ABOUT_VERSION}    timeout=10
    ${loc_version} =     Get Text   ${LOC_WIDGETSETTINGS_SETTINGS_ABOUT_VERSION}
    Should Be Equal     ${loc_version}      ${version}
    Sleep   1
    # Verify Build
    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_ABOUT_BUILD}    timeout=10
    ${loc_build} =    Get Text   ${LOC_WIDGETSETTINGS_SETTINGS_ABOUT_BUILD}
    Should Be Equal     ${loc_build}      ${build}
    Sleep   1

# ====================================== EMAIL SIGNATURE ===============================================================

#   3/6/2020
Save email signature
    [Documentation]     Click Save email signature button
    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BTN_SAVE}    timeout=30
    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BTN_SAVE}
    Sleep   1

#   08/05/2020
Open Email Signature Tab
    [Documentation]     Open Email signature tab
    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE}    timeout=30
    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE}
    Sleep   1

# 03/03/2020
Create Email Signature
    [Arguments]    ${email_signature}
    # Clear old email signature
    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}    timeout=30
    Run keyword if  '${email_signature}'=='${EMPTY}'    Input Text   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}   ${EMPTY}
    ...     ELSE    Press Keys  ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}    ${email_signature}
    Sleep   2

#   07/05/2020
Auto Insert Email Signature
    [Arguments]    ${state}
#    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE}    timeout=30
#    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE}
    Wait Until Element Is Visible   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_CHECK_AUTO_INSERT}  timeout=10
    ${check_state} =    Get Element Attribute   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_CHECK_AUTO_INSERT}  aria-checked
    Run Keyword Unless   '${check_state}'=='${state}'   Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_CHECK_AUTO_INSERT}
    Sleep   0.5

#Change Status To True
#    [Arguments]    ${state}
#    Click Element

#   08/05/2020
Bold Email Signature
    [Arguments]    ${state}
#    ${get_state} =   Convert to string   false
#    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE}    timeout=30
#    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE}
    Wait Until Element Is Visible   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BOLD}  timeout=30
    ${check_state} =    Get Element Attribute   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BOLD}  class
#    Run Keyword If  '${check_state}'=='toolbar-actions__item aoc-bold bold toolbar-actions__item--highlight'   ${get_state}  true
#    Run Keyword If  '${check_state}'=='toolbar-actions__item aoc-bold bold'    ${get_state}  false
    ${get_state} =   Run Keyword If     '${check_state}'=='toolbar-actions__item aoc-bold bold toolbar-actions__item--highlight'    Set Variable    true
    ${get_state} =   Run Keyword If     '${check_state}'=='toolbar-actions__item aoc-bold bold'    Set Variable    false
    Sleep   1
#    Run Keyword Unless   '${get_state}'=='${state}'   Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BOLD}
    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}    timeout=30
    Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}
#    Press Keys  ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}    CTRL    A
    Run Keyword Unless   '${get_state}'=='${state}'   Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BOLD}
    Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}
    Input Text  ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR}    123123
    Sleep   1

Choose Editor Signature
    [Arguments]    ${btn}
    @{get_all_edit_btn} =    Get WebElements    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_ANY_EDIT_BTN}
    ${btn_total}=    Get Length    ${get_all_edit_btn}
    Sleep   0.5
    FOR     ${i}    IN RANGE    -1   ${btn_total}
    \   ${name_btn} =    Get Element Attribute    ${get_all_edit_btn}[${i}]     aria-label
    \   Run Keyword If  '${name_btn}'=='${btn}'   Run keywords   Click Element   ${get_all_edit_btn}[${i}]   AND   Exit For Loop
    Sleep   1

Choose Font Size Signature
    [Arguments]    ${font_size}
    Wait Until Element Is Visible   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE}  20s
    Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE}
    Sleep   1
    Run Keyword If  '${font_size}'=='8' or '${font_size}'=='Small'   Run Keywords    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE_8}    AND   Sleep   1
    ...     ELSE IF  '${font_size}'=='12' or '${font_size}'=='Normal'   Run Keywords    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE_12}    AND   Sleep   1
    ...     ELSE IF  '${font_size}'=='14' or '${font_size}'=='Large'    Run Keywords    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE_14}    AND   Sleep   1
    ...     ELSE IF  '${font_size}'=='16' or '${font_size}'=='Huge'   Run Keywords    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE_16}    AND   Sleep   1
    Sleep   1

#   2/6/2020
Insert Link Signature
    [Arguments]    ${link}
    Choose Editor Signature   Insert Link
    Wait Until Element Is Visible   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_EDIT_LINK}  20s
    Input Text   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_EDIT_LINK}   ${link}
    Sleep   1
    Wait Until Element Is Visible   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_SUBMIT_LINK}  20s
    Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_SUBMIT_LINK}
    Sleep   1

#   15/5/2020
Undo Email Signature
    [Arguments]    ${email_signature}
    Wait Until Element Is Visible   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_UNDO}  10s
    Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_UNDO}
    Sleep   1
    # verify undo
    ${length_sign} =  get length   ${email_signature}
    # take the last word of ${email_signature}
    ${last_word} =   Fetch From Right    ${email_signature}   ${SPACE}
    ${leng_last_word} =   get length    ${last_word}
    # cut the last word of ${email_signature
    ${index_last_word} =   evaluate   ${length_sign}-${leng_last_word}-1
    ${new_sign} =   Get Substring   ${email_signature}   0    ${index_last_word}
    # get new signature from web
    ${content_signature} =   Get Text   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_CONTENT}
    Should be equal   ${content_signature}    ${new_sign}
    Sleep   1

#   15/5/2020
Redo Email Signature
    [Arguments]    ${email_signature}
    Wait Until Element Is Visible   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_REDO}  10s
    Click Element   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_REDO}
    Sleep   1
    ${content_signature} =   Get Text   ${LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_CONTENT}
    Should be equal   ${content_signature}    ${email_signature}
    Sleep   1

#================================================== LANGUAGE ===========================================================
#   27/07/2020
Select Language
    [Arguments]    ${language}
    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE}    timeout=30
    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE}
    Sleep   1
    Wait Until Element Is Visible    ${LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE_SELECT}    timeout=30
    Click Element    ${LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE_SELECT}
    Sleep   1
    @{list_language} =    Get WebElements   ${LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE_SELECT_LIST_NAME}
    @{loc_list_language} =  Get WebElements   ${LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE_SELECT_LIST}
    ${length_list_language} =    Get Length   ${list_language}
    :FOR    ${i}    IN RANGE    0   ${length_list_language}
    \   ${get_text_language} =   Get Text    ${list_language}[${i}]
    \   Run Keyword If   '${get_text_language}'=='${language}'    Click Element     ${loc_list_language}[${i}]
    \   Run Keyword If   '${get_text_language}'=='${language}'     Exit For Loop
    Sleep   1
