*** Settings ***
Resource   ../../../resources/SystemResources.robot
Variables  PhonebookLocator.py
Library     String
*** Variables ***
@{filter2_list}     0   1    2    Display Name    Last Name    First Name    Phone   Call Out   Mobile   9   IP Phone   10    Other Phone   11    Email    Department    Street   City    State    PostalCode

*** Keywords ***

#   9/12/2020
Search Phonebook
    [Arguments]    ${filter1}=${EMPTY}    ${filter2}=${EMPTY}    ${filter3}=${EMPTY}
    Wait Until Element Is Visible    ${PHONEBOOK_BTN_SEARCH}   timeout=5
    Click element   ${PHONEBOOK_BTN_SEARCH}
    # filter1    All, Custom Contacts, Favorite, Speed Dial
    Wait Until Element Is Visible    ${PHONEBOOK_FILTER1}   timeout=5
    Click Element   ${PHONEBOOK_FILTER1}
    Run keyword unless    ${filter3}=='${EMPTY}'    Select From List By Label   ${PHONEBOOK_FILTER1_SELECT}    ${filter1}
    Sleep   0.5
    Click Element   ${PHONEBOOK_FILTER1}
    Sleep   0.5

    # filter2    Display Name, Last Name, First Name, Phone, Mobile, IP Phone, Other Phone, Email, Department, Treet, City, State, PostalCode
    Wait Until Element Is Visible    ${PHONEBOOK_FILTER2}   timeout=5
    Click Element   ${PHONEBOOK_FILTER2}
    Run keyword unless    ${filter3}=='${EMPTY}'    Select From List By Label   ${PHONEBOOK_FILTER2_SELECT}    ${filter2}
    Sleep   0.5
    Click Element   ${PHONEBOOK_FILTER2}
    Sleep   0.5

    # filter3   input text
    Wait Until Element Is Visible    ${PHONEBOOK_FILTER3}   timeout=5
    Run keyword unless    ${filter3}=='${EMPTY}'    Click Element   ${PHONEBOOK_FILTER3}
    ${filter3_remove} =    Remove String    ${filter3}    "
    Input text   ${PHONEBOOK_FILTER3}   ${filter3_remove}
    Sleep   1
    Wait Until Element Is Visible    ${PHONEBOOK_BTN_SEARCH}   timeout=5
    Click element   ${PHONEBOOK_BTN_SEARCH}
    Sleep   1

#   18/12/2020
Create New Contact Phonebook
	Wait Until Element Is Visible    ${PHONEBOOK_BTN_NEW_CONTACT}   timeout=5
	Click element	${PHONEBOOK_BTN_NEW_CONTACT}
	Wait Until Element Is Visible    ${PHONEBOOK_ENTER_FIELD_LABEL}   timeout=5
	Sleep	1

#   18/12/2020
Delete Contact Phonebook
	Wait Until Element Is Visible    ${PHONEBOOK_BTN_DELETE_CONTACT}   timeout=5
	Click element	${PHONEBOOK_BTN_DELETE_CONTACT}
	@{phonebook_row} =    Get WebElements     ${PHONEBOOK_TABLE_ROW}
    ${phonebook_row_total} =    Get Length    ${phonebook_row}
    Should Be Equal    '${phonebook_row_total}'    '0'
	Sleep	1

#   18/12/2020
Call Out By Phonebook
    Wait Until Element Is Visible    ${PHONEBOOK_BTN_CALL_OUT}   timeout=5
	Click element	${PHONEBOOK_BTN_CALL_OUT}
	Wait Until Element Is Visible    ${PHONEBOOK_BTN_END_CALL}   timeout=10
	Sleep	1

Save Contact Phonebook
	Wait Until Element Is Visible    ${PHONEBOOK_BTN_SAVE_NEW_CONTACT}   timeout=5
	Click element	${PHONEBOOK_BTN_SAVE_NEW_CONTACT}
	Wait Until Element Is Visible    ${PHONEBOOK_BTN_NEW_CONTACT}   timeout=5
	Sleep	1

Edit Contact Phonebook
	Wait Until Element Is Visible    ${PHONEBOOK_BTN_EDIT_CONTACT}   timeout=5
	Click element	${PHONEBOOK_BTN_EDIT_CONTACT}
	Wait Until Element Is Visible    ${PHONEBOOK_ENTER_FIELD_LABEL}   timeout=5
	Sleep	1

Edit Field Contact Phonebook
    [Arguments]    ${field_name}    ${content}=${EMPTY}
	${loc_field_edit} =    Format String    ${PHONEBOOK_INPUT_FIELD_CONTACT}    ${field_name}
	Sleep   0.5
	Wait Until Element Is Visible    ${loc_field_edit}   timeout=5
	${edit_content} =    Remove String    ${content}    "
	Input text	 ${loc_field_edit}	 ${edit_content}
	Sleep	0.5

Select Tagging Phonebook
    [Arguments]    ${tag_name}    ${status}
    ${loc_status} =      Set Variable If      '${status}'=='check'     true     '${status}'=='uncheck'     false
    ${loc_tag_name} =    String.Format String    ${PHONEBOOK_CHECK_TAGGING_CONTACT}    ${tag_name}
	Sleep   0.5
	Wait Until Element Is Visible    ${loc_tag_name}   timeout=5
	${get_status} =   Get Element Attribute    ${loc_tag_name}    aria-checked
	${get_status2} =    Convert To String    ${get_status}
	Run Keyword Unless   '${get_status2}'=='${loc_status}'    Click Element    ${loc_tag_name}
#	Run Keyword If   Should Not Be Equal As Strings    '${get_status}'    '${loc_status}'    Click Element    ${loc_tag_name}
	Sleep   0.5

Sort Phonebook
    [Arguments]    ${filter}
    ${loc_sort} =    String.Format String    ${PHONEBOOK_SORT_COLUMN}    ${filter}
    Wait Until Element Is Visible    ${loc_sort}   timeout=5
    Click Element    ${loc_sort}
    Sleep   0.5

Filter Page Phonebook
    [Arguments]    ${row_number}
    Wait Until Element Is Visible    ${PHONEBOOK_ROW_PER_PAGE}   timeout=5
    Click Element    ${PHONEBOOK_ROW_PER_PAGE}
    Sleep   0.5
    ${loc_row} =    String.Format String    ${PHONEBOOK_SELECT_ROW_PER_PAGE}    ${row_number}
    Wait Until Element Is Visible    ${loc_row}   timeout=5
    Click Element    ${loc_row}
    Sleep   0.5

#   9/12/2020
Verify Phonebook Data
    [Arguments]    ${filter2}=${EMPTY}    ${content}=${EMPTY}
    ${index_filter2} =   get index from list    ${filter2_list}    ${filter2}
    Sleep   0.5
    ${loc_index_conent} =    String.Format String    ${PHONEBOOK_TABLE_ROW_CONENT}    ${index_filter2}
    Sleep   0.5
    Wait Until Element Is Visible    ${loc_index_conent}   timeout=5
    ${get_content} =    Get text    ${loc_index_conent}
    ${filter3_remove} =    Remove String    ${content}    "
    Should Be Equal    '${get_content}'    '${filter3_remove}'
    Sleep   0.5

Verify Tagging Phonebook
    [Arguments]    ${tag_name}    ${status}
    ${loc_status} =      Set Variable If      '${status}'=='check'     filled      '${status}'=='uncheck'       outline
    ${loc_tag_name} =    String.Format String    ${PHONEBOOK_BTN_TAGGING_CONTACT}    ${tag_name}     ${loc_status}
	Sleep   0.5
	Wait Until Element Is Visible    ${loc_tag_name}   timeout=7
	Sleep   0.5