*** Settings ***
Variables  CustomerSearchLocator.py
Resource    ../../../resources/SystemLibraries.robot
Resource    ../agent_toolbar/AgentToolbar.robot

*** Keywords ***
# todo================================== Customer search widget page ===================================================
# Oanh   /02/2021
Select Customer Search
    [Arguments]    ${surname}=${EMPTY}    ${name}=${EMPTY}    ${email}=${EMPTY}    ${phone}=${EMPTY}
#    ${get_element_lastname} =     Get Element Attribute    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_SURNAME}    class
#    ${get_element_name} =      Get Element Attribute    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_NAME}    class
#    ${get_element_email} =     Get Element Attribute    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_EMAIL}    class
#    ${get_element_phone} =     Get Element Attribute    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_PHONE}    class
#    Sleep   0.5
#    ${check_field_lastname} =    Run Keyword And Return Status   Should Contain    ${get_element_lastname}    enabled
#    ${check_field_name} =     Run Keyword And Return Status   Should Contain    ${get_element_name}    enabled
#    ${check_field_email} =    Run Keyword And Return Status   Should Contain    ${get_element_email}    enabled
#    ${check_field_phone} =    Run Keyword And Return Status   Should Contain    ${get_element_phone}    enabled
#    Log To Console    ${check_field_lastname}***${check_field_name}***${check_field_email}***${check_field_phone}
#    Run Keyword Unless     '${surname}'=='${EMPTY}' and '${check_field_lastname}'=='True'   Click Element    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_SURNAME}
#    Run Keyword Unless     '${name}'=='${EMPTY}' and '${check_field_name}'=='True'   Click Element    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_NAME}
#    Run Keyword Unless     '${email}'=='${EMPTY}' and '${check_field_email}'=='True'   Click Element    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_EMAIL}
#    Run Keyword Unless     '${phone}'=='${EMPTY}' and '${check_field_phone}'=='True'   Click Element    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_PHONE}
    Scroll Element Into View    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_NAME}
    Click Element    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_NAME}
    Click Element    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_EMAIL}
    Click Element    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_PHONE}
    Sleep   0.5
    Run Keyword Unless     '${surname}'=='${EMPTY}'    Input Text   ${CUSTOMER_SEARCH_INPUT_CONTENT_SURNAME}    ${surname}
    Run Keyword Unless     '${name}'=='${EMPTY}'    Input Text   ${CUSTOMER_SEARCH_INPUT_CONTENT_FIRSTNAME}    ${name}
    Run Keyword Unless     '${email}'=='${EMPTY}'    Input Text   ${CUSTOMER_SEARCH_INPUT_CONTENT_EMAIL}    ${email}
    Run Keyword Unless     '${phone}'=='${EMPTY}'    Input Text   ${CUSTOMER_SEARCH_INPUT_CONTENT_PHONE}    ${phone}
    Sleep   1
    Click Element    ${CUSTOMER_SEARCH_BTN_SEARCH}
	Sleep   1

# Oanh  /02/2021
Verify Customer Search
    [Arguments]    ${surname}=${EMPTY}    ${name}=${EMPTY}    ${email}=${EMPTY}
    Wait Until Element Is Visible    ${CUSTOMER_SEARCH_RESULT_SEARCH_CONTACT}    timeout=20s
    ${get_content_contact} =    Get Text    ${CUSTOMER_SEARCH_RESULT_SEARCH_CONTACT}
    Should Contain    ${get_content_contact}   ${surname}
    Should Contain    ${get_content_contact}   ${name}
    Should Contain    ${get_content_contact}   ${email}

# Huy 18/03/2021
Click Button Create New Customer
    [Documentation]    Click `Create New Customer` button
    Wait Until Element Is Visible    ${CUSTOMER_SEARCH_BTN_CREATE_NEW_CUSTOMER}     15s
    Sleep    0.5
    Double Click Element    ${CUSTOMER_SEARCH_BTN_CREATE_NEW_CUSTOMER}
    Sleep    2

# todo============================== New Customer Page =================================================================
# Huy 19/03/2021
Enter New Customer Information
    [Documentation]    Fill out customer form with customer-dictionary
    [Arguments]    &{customer}
    # ${phoneType} accept only data: [Unknown, Home, Business, Fax, Mobile, Other]
    # Format locator for Phone type match with xpath location
    ${loc_phone_type} =    String.Format String    ${CUSTOMER_SEARCH_SELECT_VALUE_PHONE_TYPE}    ${customer.phoneType}
    # Wait Title visible
    Wait Until Element Is Visible   ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_TITLE}     timeout=30s
    Scroll Element Into View    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_TITLE}
    Input Text    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_TITLE}       ${customer.Title}           #input title
    Scroll Element Into View    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_LASTNAME}
    Input Text    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_LASTNAME}       ${customer.Lastname}     #input Lastname
    Scroll Element Into View    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_FIRSTNAME}
    Input Text    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_FIRSTNAME}       ${customer.Firstname}   #input firstname
    Run Keyword If    ${customer.isRestricted}      Click Element    ${CUSTOMER_SEARCH_CHECKBOX_NEW_CUSTOMER_IS_RESTRICTED}    # Run if isRestricted string is: True
    Scroll Element Into View    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_EMAIL}
    Input Text    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_EMAIL}       ${customer.Email}
    Run Keyword If    ${customer.isEmailDefault}      Click Element    ${CUSTOMER_SEARCH_CHECKBOX_NEW_CUSTOMER_IS_EMAIL_DEFAULT}
    Scroll Element Into View    ${CUSTOMER_SEARCH_SELECT_BTN_PHONE_TYPE}
    Click Element    ${CUSTOMER_SEARCH_SELECT_BTN_PHONE_TYPE}   action_chain=True
    Wait Until Element Is Visible    ${loc_phone_type}      timeout=10s
    Scroll Element Into View    ${loc_phone_type}
    Click Element    ${loc_phone_type}

    Scroll Element Into View    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_INTERCODE}
    Input Text    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_INTERCODE}   ${customer.Intl}
    Scroll Element Into View    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_AREACODE}
    Input Text    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_AREACODE}   ${customer.Area}
    Scroll Element Into View    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_NUMBER}
    Input Text    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_NUMBER}   ${customer.Number}
    Run Keyword If    ${customer.isPhoneDefault}      Click Element    ${CUSTOMER_SEARCH_CHECKBOX_NEW_CUSTOMER_IS_PHONE_DEFAULT}
    Run Keyword If    ${customer.isPhoneBarred}      Click Element    ${CUSTOMER_SEARCH_CHECKBOX_NEW_CUSTOMER_IS_PHONE_BARRED}

    Scroll Element Into View    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_SIPURI}
    Input Text    ${CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_SIPURI}   ${customer.URI}
    Run Keyword If    ${customer.isURIDefault}      Click Element    ${CUSTOMER_SEARCH_CHECKBOX_NEW_CUSTOMER_IS_SIPURI_DEFAULT}

    # Click to Create button
    Wait Until Element Is Enabled    ${CUSTOMER_SEARCH_BTN_CREATE}      timeout=5s
    Scroll Element Into View    ${CUSTOMER_SEARCH_BTN_CREATE}
    Click Element    ${CUSTOMER_SEARCH_BTN_CREATE}


# todo================================== Customer Search Result page ===================================================
# Huy Apr 9/2021
Click An Existing Customer
    [Documentation]    Need comment
    Wait Until Element Contains    ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}       timeout=5s
    Click Element    ${CUSTOMER_SEARCH_EXPAND_CUSTOMER}
    Wait Until Element Contains    ${CUSTOMER_ITEM_TEXT}    timeout=5s
    Sleep    1

# Huy, Apr 13, 2021
Click On The First Customer In The Search Results
    [Documentation]    In search results, click to first customer in results
    Wait Until Element Is Visible    ${CUSTOMER_ITEM_TEXT}    timeout=5s
    Click Element    ${CUSTOMER_ITEM_TEXT}
    Wait Until Element Is Visible    ${CUSTOMER_ITEM_TEXT}    timeout=5s
    Sleep    1

# Huy, Apr 13, 2021
Click On A Customer With Email
    [Documentation]    With list customer in search results, click on a customer with email
    [Arguments]    ${CUSTOMER EMAIL}
    Wait Until Element Is Visible    ${CUSTOMER_ITEM_TEXT}    timeout=5s
    ${email match}=     Set Variable    ${CUSTOMER_ITEM_TEXT}/p[text()='{}']
    ${loc email}=   String.Format String    ${email match}  ${CUSTOMER EMAIL}
    Scroll Element Into View    ${loc email}
    Sleep    1
    Execute Javascript    document.querySelector("div.toast__container.toast--left.toast--bottom.toast--animate-slide").style.display = "none";
    Sleep    1
    Click Element    ${loc email}/parent::div
    Sleep    1
    Execute Javascript    document.querySelector("div.toast__container.toast--left.toast--bottom.toast--animate-slide").style.display = null;
    Sleep    1

# Huy, May 18, 2021
Click To Call Out Button
    [Documentation]    In search result, find a click to call button and click to call button
    [Arguments]    ${CUSTOMER PHONE}
    ${loc click to call}=   String.Format String    ${CUSTOMER_SEARCH_BTN_CLICK_TO_CALL}    ${CUSTOMER PHONE}
    Wait Until Page Contains Element    ${loc click to call}    10
    Element Should Be Enabled   ${loc click to call}
    Click Button    ${loc click to call}

# Huy, May 27, 2021



# Huy, Apr 13, 2021
Verify Email Customer In Search Result
    [Documentation]    In search result, find a customer with email in list customer
    [Arguments]    ${CUSTOMER EMAIL}
    Wait Until Element Is Visible    ${CUSTOMER_ITEM_TEXT}    timeout=5s
    ${email match}=     Set Variable    ${CUSTOMER_ITEM_TEXT}/p[text()='{}']
    ${loc email}=   String.Format String    ${email match}  ${CUSTOMER EMAIL}
    Page Should Contain Element    ${loc email}     timeout=10s
    Scroll Element Into View    ${loc email}
    Sleep    1

# Huy, Apr 13, 2021
Verify Customer Phone In Search Result
    [Documentation]    In search result, find a customer with email in list customer
    [Arguments]    ${CUSTOMER PHONE}
    Wait Until Element Is Visible    ${CUSTOMER_ITEM_TEXT}    timeout=5s
    Sleep    1

# Huy, May 18, 2021
Verify Call Out Button GrayOut for Multimedia Agent
    [Documentation]    In search result, find a click to call button and make sure button is grayout
    [Arguments]    ${CUSTOMER PHONE}
    ${loc click to call}=   String.Format String    ${CUSTOMER_SEARCH_BTN_CLICK_TO_CALL}    ${CUSTOMER PHONE}
    Wait Until Page Contains Element    ${loc click to call}    10
    Element Should Be Disabled      ${loc click to call}



# todo===================== Customer detail page  ======================================================================
# Huy Apr 13/2021
Go Back To Search Result
    [Documentation]    In customer details, go back to customer search result page
    Page Should Contain Element    ${CUSTOMER_ITEM_TEXT}    5s
    Click Element    ${CUSTOMER_BTN_BACK}
    Sleep    1
    Wait Until Element Is Visible    ${CUSTOMER_ITEM_TEXT}    5s


# todo===================== Customer detail page - Customer address field ==============================================
# Huy Apr 12/2021
Add A New Customer Address
    [Documentation]    Identify customer by email and Add a new Customer Address with lines 1-5, Country, zip code
    [Arguments]     ${customer email}    ${line1}     ${line2}    ${line3}    ${line4}    ${line5}    ${country}  ${zip}
    # Identify customer by `customer email`
    Click On A Customer With Email  ${customer email}
    # Click `Address` tab
    Wait Until Element Is Visible    ${CUSTOMER_TAB_ITEM_ADDRESS}    timeout=5s
    Click Element    ${CUSTOMER_TAB_ITEM_ADDRESS}
    Sleep    1
    Wait Until Element Is Visible    ${CUSTOMER_ADDRESS_BTN_ADD_ADDRESS}    5s
    # Click `Add address` button
    Click Element    ${CUSTOMER_ADDRESS_BTN_ADD_ADDRESS}
    # wait `line1` address visible
    Wait Until Element Is Visible    ${CUSTOMER_ADDRESS_INPUT_LINE1}    5s
    # Enter `line1` data
    Run Keyword Unless    '${line1}'=='${EMPTY}'    Input Text    ${CUSTOMER_ADDRESS_INPUT_LINE1}   ${line1}
    # Enter `line2` data
    Run Keyword Unless    '${line1}'=='${EMPTY}'    Input Text    ${CUSTOMER_ADDRESS_INPUT_LINE2}   ${line2}
    # Enter `line3` data
    Run Keyword Unless    '${line1}'=='${EMPTY}'    Input Text    ${CUSTOMER_ADDRESS_INPUT_LINE3}   ${line3}
    # Enter `line4` data
    Run Keyword Unless    '${line1}'=='${EMPTY}'    Input Text    ${CUSTOMER_ADDRESS_INPUT_LINE4}   ${line4}
    # Enter `line5` data
    Run Keyword Unless    '${line1}'=='${EMPTY}'    Input Text    ${CUSTOMER_ADDRESS_INPUT_LINE5}   ${line5}
    # Enter `country` data
    Run Keyword Unless    '${country}'=='${EMPTY}'    Input Text    ${CUSTOMER_ADDRESS_INPUT_COUNTRY}   ${country}
    # Enter `zip` data
    Run Keyword Unless    '${zip}'=='${EMPTY}'    Input Text    ${CUSTOMER_ADDRESS_INPUT_ZIPCODE}   ${zip}
    # Click `Save` button
    Wait Until Element Is Enabled    ${CUSTOMER_ADDRESS_BTN_SAVE}   5s
    Click Element    ${CUSTOMER_ADDRESS_BTN_SAVE}

# Huy, Apr 12, 2021
Add The Second Customer Address
    [Documentation]    Identify customer by email and Add Second Customer Address with lines 1-5, Country, zip code
    [Arguments]     ${line1}     ${line2}    ${line3}    ${line4}    ${line5}    ${country}  ${zip}
    # Click `Address` tab
    Wait Until Element Is Visible    ${CUSTOMER_TAB_ITEM_ADDRESS}    timeout=5s
    Click Element    ${CUSTOMER_TAB_ITEM_ADDRESS}
    Sleep    1
    Wait Until Element Is Visible    ${CUSTOMER_ADDRESS_BTN_EDIT_ADDRESS}    5s
    # Click `Edit address` button
    Click Element    ${CUSTOMER_ADDRESS_BTN_EDIT_ADDRESS}
    # Wait `Add Address` button visible
    Page Should Contain Element    ${CUSTOMER_ADDRESS_BTN_ADD_NEW_ADDRESS}    5s
    Scroll Element Into View    ${CUSTOMER_ADDRESS_BTN_ADD_NEW_ADDRESS}
    # Click `Add address` button in form
    Click Element    ${CUSTOMER_ADDRESS_BTN_ADD_NEW_ADDRESS}
    Sleep    1
    Scroll Element Into View    ${CUSTOMER_ADDRESS_BTN_ADD_NEW_ADDRESS}
    Sleep    1
    # Enter `line1` data for new more address
    Run Keyword Unless    '${line1}'=='${EMPTY}'    Input Text    ${CUSTOMER_ADDRESS_2_INPUT_LINE1}   ${line1}
    # Enter `line2` data
    Run Keyword Unless    '${line1}'=='${EMPTY}'    Input Text    ${CUSTOMER_ADDRESS_2_INPUT_LINE2}   ${line2}
    # Enter `line3` data
    Run Keyword Unless    '${line1}'=='${EMPTY}'    Input Text    ${CUSTOMER_ADDRESS_2_INPUT_LINE3}   ${line3}
    # Enter `line4` data
    Run Keyword Unless    '${line1}'=='${EMPTY}'    Input Text    ${CUSTOMER_ADDRESS_2_INPUT_LINE4}   ${line4}
    # Enter `line5` data
    Run Keyword Unless    '${line1}'=='${EMPTY}'    Input Text    ${CUSTOMER_ADDRESS_2_INPUT_LINE5}   ${line5}
    # Enter `country` data
    Run Keyword Unless    '${country}'=='${EMPTY}'    Input Text    ${CUSTOMER_ADDRESS_2_INPUT_COUNTRY}   ${country}
    # Enter `zip` data
    Run Keyword Unless    '${zip}'=='${EMPTY}'    Input Text    ${CUSTOMER_ADDRESS_2_INPUT_ZIPCODE}   ${zip}
    # Click `Save` button
    Scroll Element Into View    ${CUSTOMER_ADDRESS_BTN_SAVE}
    Sleep    1
    Wait Until Element Is Enabled    ${CUSTOMER_ADDRESS_BTN_SAVE}   5s
    Click Element    ${CUSTOMER_ADDRESS_BTN_SAVE}

# Huy, Apr 12, 2021
Verify Customer Address Display
    [Documentation]    Verify line 1-5, Country, zip
    [Arguments]    ${line1}     ${line2}    ${line3}    ${line4}    ${line5}    ${country}  ${zip}
    Page Should Contain Element    ${CUSTOMER_ADDRESS_VALUE_DISPLAY}      5s
    ${address display values}=  Get Text    ${CUSTOMER_ADDRESS_VALUE_DISPLAY}
    Should Contain	   ${address display values}     ${line1}
    Should Contain	   ${address display values}     ${line2}
    Should Contain	   ${address display values}     ${line3}
    Should Contain	   ${address display values}     ${line4}
    Should Contain	   ${address display values}     ${line5}
    Should Contain	   ${address display values}     ${country}
    Should Contain	   ${address display values}     ${zip}

# Huy, Apr 12, 2021
Verify The Second Customer Address
    [Documentation]    Verify line 1-5, Country, zip
    [Arguments]    ${line1}     ${line2}    ${line3}    ${line4}    ${line5}    ${country}  ${zip}
    Page Should Contain Element    ${CUSTOMER_ADDRESS_2_VALUE_DISPLAY}      5s
    ${address display values}=  Get Text    ${CUSTOMER_ADDRESS_2_VALUE_DISPLAY}
    Should Contain	   ${address display values}     ${line1}
    Should Contain	   ${address display values}     ${line2}
    Should Contain	   ${address display values}     ${line3}
    Should Contain	   ${address display values}     ${line4}
    Should Contain	   ${address display values}     ${line5}
    Should Contain	   ${address display values}     ${country}
    Should Contain	   ${address display values}     ${zip}


# todo=================== Customer detail page - Customer Telephone field ==============================================
# Huy Apr 12/2021
Verify Customer Telephone Button Display
    [Documentation]     Verfiy button telephone display
    # The `Telephone` button will display
    Page Should Contain Element    ${CUSTOMER_TAB_ITEM_TELEPHONE}   10s
    Wait Until Element Is Visible    ${CUSTOMER_TAB_ITEM_TELEPHONE}     5s
    Sleep    1

# Huy Apr 16/2021
Verify Customer Telephone Number
    [Documentation]     In the phone tab, verify the phone number is match with expected phone number
    [Arguments]    ${expected phone number}
    # Click to telephone button
    Wait Until Element Is Visible    ${CUSTOMER_TAB_ITEM_TELEPHONE}     5s
    Click Element   ${CUSTOMER_TAB_ITEM_TELEPHONE}
    Sleep    1
    # The `Phone number` text is display
    Page Should Contain Element    ${CUSTOMER_TELEPHONE_CURRENT_PHONE_NUMBER1}      10s
    ${current phone number at line 1}=  Get Text    ${CUSTOMER_TELEPHONE_CURRENT_PHONE_NUMBER1}
    Should Be Equal     ${current phone number at line 1}       ${expected phone number}
    Sleep    1

# Huy, Apr 16, 2021
Edit Customer Telephone
    [Documentation]    Edit existing customer telephone
    [Arguments]     ${new phone type}   ${new phone intl}   ${new phone area}   ${new phone number}     ${isDefault}    ${isBarred}
    Click Element   ${CUSTOMER_TELEPHONE_BTN_EDIT_PHONE}
    # ${new phone type} accept only data: [Unknown, Home, Business, Fax, Mobile, Other]
    # Format locator for Phone type match with xpath location
    ${loc_phone_type} =    String.Format String    ${CUSTOMER_TELEPHONE_EDIT_VALUE_PHONE_TYPE}   ${new phone type}
    # Wait `Add Phone` button visible and scroll to Add phone button view
    Wait Until Element Is Visible    ${CUSTOMER_TELEPHONE_EDIT_BTN_ADD_PHONE}   15s
    Scroll Element Into View    ${CUSTOMER_TELEPHONE_EDIT_BTN_ADD_PHONE}
    # Click to `Phone Type` button
    Click Element   ${CUSTOMER_TELEPHONE_EDIT_BTN_PHONE_TYPE}   action_chain=True
    Scroll Element Into View    ${loc_phone_type}
    Sleep    0.5
    Click Element    ${loc_phone_type}
    # Enter Intl
    Sleep    0.5
    Input Text    ${CUSTOMER_TELEPHONE_EDIT_VALUE_PHONE_INTL}   ${new phone intl}
    # Enter Area Code
    Sleep    0.5
    Input Text    ${CUSTOMER_TELEPHONE_EDIT_VALUE_PHONE_AREA}   ${new phone area}
    # Enter Phone number
    Sleep    0.5
    Input Text    ${CUSTOMER_TELEPHONE_EDIT_VALUE_PHONE_NUMBER}     ${new phone number}
    # Run Keyword If    isDefault==${True}
    Sleep    0.5
    Run Keyword If    ${isDefault}      Click Element    ${CUSTOMER_TELEPHONE_EDIT_BTN_DEFAULT}
    # Run Keyword If    isBarred==${True}
    Sleep    0.5
    Run Keyword If    ${isBarred}      Click Element    ${CUSTOMER_TELEPHONE_EDIT_BTN_BARRED}
    # Click save button
    Sleep    1
    Scroll Element Into View    ${CUSTOMER_TELEPHONE_BTN_SAVE}
    Click Element    ${CUSTOMER_TELEPHONE_BTN_SAVE}
    Sleep    1


# Huy, Apr 16, 2021