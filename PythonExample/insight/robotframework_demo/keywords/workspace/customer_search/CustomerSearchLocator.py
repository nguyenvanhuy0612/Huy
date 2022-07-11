# todo===================== Customer Search page =======================================================================
CUSTOMER_SEARCH_BTN_FIELD_SEARCH = "xpath://button[@aria-label='Add search by {}']"  # Surname, Name, Email, Phone
CUSTOMER_SEARCH_BTN_FIELD_SEARCH_SURNAME = "xpath://button[@aria-label='Add search by Surname']"
CUSTOMER_SEARCH_BTN_FIELD_SEARCH_NAME = "xpath://button[@aria-label='Add search by Name']"
CUSTOMER_SEARCH_BTN_FIELD_SEARCH_EMAIL = "xpath://button[@aria-label='Add search by Email']"
CUSTOMER_SEARCH_BTN_FIELD_SEARCH_PHONE = "xpath://button[@aria-label='Add search by Phone']"
CUSTOMER_SEARCH_BTN_SEARCH = "xpath://button[@aria-label='Search']"

# todo===================== Customer Search page - Results =============================================================
CUSTOMER_SEARCH_RESULT_SEARCH_CONTACT = "xpath://md-list-item[1]//div[@class='md-list-item-text layout-align-center-start layout-column']"
CUSTOMER_SEARCH_BTN_SHOW_HISTORY = "xpath://md-list-item[1]//button[@aria-label='Show history']"
# Huy added, 18-05-2021
CUSTOMER_SEARCH_BTN_CLICK_TO_CALL = "xpath://md-list-item[1]//button[@aria-label='Click to call {}']"
CUSTOMER_SEARCH_BTN_CLICK_TO_EMAIL = "xpath://md-list-item[1]//button[@aria-label='Click to email']"
CUSTOMER_SEARCH_BTN_CREATE_SCHEDULE_CALLBACK = "xpath://md-list-item[1]//button[@aria-label='Create Schedule Callback']"
# todo Huy add Apr 8/2021
# _CUSTOMER_CONTEXT_TAB = "xpath://div[@class='context-tab layout-row flex']"
# _CUSTOMER_SEARCH_FIELDS = _CUSTOMER_CONTEXT_TAB + "//div[@class='search-fields-buttons layout-align-center-center layout-row']"
# CUSTOMER_SEARCH_BTN_FIELD_SEARCH_SURNAME = _CUSTOMER_SEARCH_FIELDS + "//button[@aria-label='Add search by Surname']"

CUSTOMER_SEARCH_EXPAND_CUSTOMER = "xpath://div[@ng-click='expandCustomer(customer)']"
CUSTOMER_SEARCH_BTN = "xpath://div[@ng-click='expandCustomer(customer)']/following-sibling::div/span/button[contains(@aria-label, '{}')]"
CUSTOMER_SEARCH_CUSTOMER_VALUE_NAME = "xpath://div[@ng-click='expandCustomer(customer)']/div/h4"
CUSTOMER_SEARCH_CUSTOMER_VALUE_EMAIL = "xpath://div[@ng-click='expandCustomer(customer)']/div/p"

# todo===================== Customer detail page =======================================================================
# todo Customer info page =>
CUSTOMER_BTN_BACK = "xpath://span[contains(text(), 'Back')]"
CUSTOMER_ITEM_TEXT = "xpath://div[@class='md-list-item-text layout-align-center-start layout-column']"


# Customer tab item
CUSTOMER_TAB_ITEM_ADDRESS = "xpath://md-tab-item[contains(text(),'Address')]"
CUSTOMER_TAB_ITEM_TELEPHONE = "xpath://md-tab-item[contains(text(),'Telephone')]"
CUSTOMER_TAB_ITEM_EMAIL = "xpath://md-tab-item[contains(text(),'Email')]"
CUSTOMER_TAB_ITEM_URI = "xpath://md-tab-item[contains(text(),'URI')]"

# todo===================== Customer detail page - Customer address field ==============================================
CUSTOMER_ADDRESS_BTN_ADD_ADDRESS = "xpath://button[@aria-label='Add address']"
CUSTOMER_ADDRESS_BTN_EDIT_ADDRESS = "xpath://button[@aria-label='Edit addresses']"
CUSTOMER_ADDRESS_BTN_SAVE = "xpath://button[@aria-label='Save']"
CUSTOMER_ADDRESS_BTN_CANCEL = "xpath://button[@aria-label='Cancel']"

# Customer address 1 content data =>
CUSTOMER_ADDRESS_INPUT_LINE1 = "xpath://input[@name='line1']"
CUSTOMER_ADDRESS_INPUT_LINE2 = "xpath://input[@name='line2']"
CUSTOMER_ADDRESS_INPUT_LINE3 = "xpath://input[@name='line3']"
CUSTOMER_ADDRESS_INPUT_LINE4 = "xpath://input[@name='line4']"
CUSTOMER_ADDRESS_INPUT_LINE5 = "xpath://input[@name='line5']"
CUSTOMER_ADDRESS_BTN_DEFAULT = "xpath://md-radio-button[@aria-label='Default']"
CUSTOMER_ADDRESS_INPUT_COUNTRY = "xpath://input[@ng-model='address.country']"
CUSTOMER_ADDRESS_INPUT_ZIPCODE = "xpath://input[@ng-model='address.zipCode']"
CUSTOMER_ADDRESS_BTN_REMOVE_ADDRESS = "xpath://button[@ng-click='removeAddress(address)']"
CUSTOMER_ADDRESS_BTN_ADD_NEW_ADDRESS = "xpath://button[contains(text(), 'Add address')]"
CUSTOMER_ADDRESS_VALUE_DISPLAY = "xpath://tr[@ng-repeat='address in customer.customerAddresses track by $index']/td[2]/span"

# Customer address 2 content data =>
CUSTOMER_ADDRESS_2_INPUT_LINE1 = "xpath://md-content[2]//input[@name='line1']"
CUSTOMER_ADDRESS_2_INPUT_LINE2 = "xpath://md-content[2]//input[@name='line2']"
CUSTOMER_ADDRESS_2_INPUT_LINE3 = "xpath://md-content[2]//input[@name='line3']"
CUSTOMER_ADDRESS_2_INPUT_LINE4 = "xpath://md-content[2]//input[@name='line4']"
CUSTOMER_ADDRESS_2_INPUT_LINE5 = "xpath://md-content[2]//input[@name='line5']"
CUSTOMER_ADDRESS_2_BTN_DEFAULT = "xpath://md-content[2]//md-radio-button[@aria-label='Default']"
CUSTOMER_ADDRESS_2_INPUT_COUNTRY = "xpath://md-content[2]//input[@ng-model='address.country']"
CUSTOMER_ADDRESS_2_INPUT_ZIPCODE = "xpath://md-content[2]//input[@ng-model='address.zipCode']"
CUSTOMER_ADDRESS_2_BTN_REMOVE_ADDRESS = "xpath://md-content[2]//button[@ng-click='removeAddress(address)']"
CUSTOMER_ADDRESS_2_VALUE_DISPLAY = "xpath://tr[@ng-repeat='address in customer.customerAddresses track by $index'][2]/td[2]/span"

# todo=================== Customer detail page - Customer Telephone field ==============================================

CUSTOMER_TELEPHONE_CURRENT_PHONE_NUMBER1 = "xpath://tr[@ng-repeat='phone in customer.customerPhones track by $index']/td[2]//span"

CUSTOMER_TELEPHONE_BTN_EDIT_PHONE = "xpath://button[@aria-label='Edit phones']"
CUSTOMER_TELEPHONE_BTN_SAVE = "xpath://button[@aria-label='Save']"
CUSTOMER_TELEPHONE_BTN_CANCEL = "xpath://button[@aria-label='Cancel']"

# Edit phone form
CUSTOMER_TELEPHONE_EDIT_BTN_PHONE_TYPE = "xpath://form[@name='editPhoneForm']//md-select[@ng-model='phone.type']"
CUSTOMER_TELEPHONE_EDIT_VALUE_PHONE_INTL = "xpath://form[@name='editPhoneForm']//input[@ng-model='phone.internationalCode']"
CUSTOMER_TELEPHONE_EDIT_VALUE_PHONE_AREA = "xpath://form[@name='editPhoneForm']//input[@ng-model='phone.areaCode']"
CUSTOMER_TELEPHONE_EDIT_VALUE_PHONE_NUMBER = "xpath://form[@name='editPhoneForm']//input[@ng-model='phone.number']"
CUSTOMER_TELEPHONE_EDIT_BTN_DEFAULT = "xpath://form[@name='editPhoneForm']//md-radio-button[@aria-label='Default']"
CUSTOMER_TELEPHONE_EDIT_BTN_BARRED = "xpath://form[@name='editPhoneForm']//md-checkbox[@aria-label='Barred']"
CUSTOMER_TELEPHONE_EDIT_BTN_REMOVE = "xpath://form[@name='editPhoneForm']//button[@ng-click='removePhone(phone)']"
CUSTOMER_TELEPHONE_EDIT_BTN_ADD_PHONE = "xpath://form[@name='editPhoneForm']//button[text()='Add phone']"

# Click to `CUSTOMER_TELEPHONE_EDIT_BTN_PHONE_TYPE` and select data =>
# phone type for string format: Unknown, Home, Business, Fax, Mobile, Other
CUSTOMER_TELEPHONE_EDIT_VALUE_PHONE_TYPE = "xpath://md-option[contains(@value,'{}')]"













# ======================================================================================================================


# CUSTOMER_SEARCH_BTN_SHOW_HISTORY = "xpath://button[@aria-label='Show history']"
# CUSTOMER_SEARCH_BTN_CALL_CUSTOMER = "xpath://button[contains(@aria-label,'Click to call')]"
# CUSTOMER_SEARCH_BTN_CALL_CUSTOMER = "xpath://button[contains(@aria-label,'Click to call {}')]"
CUSTOMER_SEARCH_BTN_CALL_CUSTOMER = "xpath://md-list-item[1]//button[contains(@aria-label,'Click to call {}')]"
CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER = "xpath://md-list-item[1]//button[@aria-label='Click to email']"
CUSTOMER_SEARCH_BTN_EDIT_NAME = "xpath://button[@aria-label='Edit name']"
CUSTOMER_SEARCH_BTN_ADD_DATA = "xpath://button[@aria-label='Add{}']"  # address, phone, URI

# CUSTOMER_SEARCH_INPUT_CONTENT_SEARCH = "xpath://input[contains(@ng-model,'{}')]"    # lastName, firstName, emailAddress, phoneNumber
# CUSTOMER_SEARCH_INPUT_CONTENT_SURNAME = "xpath://input[contains(@ng-model,'lastName')]"
# CUSTOMER_SEARCH_INPUT_CONTENT_FIRSTNAME = "xpath://input[contains(@ng-model,'firstName')]"
# CUSTOMER_SEARCH_INPUT_CONTENT_EMAIL = "xpath://input[contains(@ng-model,'emailAddress')]"
# CUSTOMER_SEARCH_INPUT_CONTENT_PHONE = "xpath://input[contains(@ng-model,'phoneNumber')]"
# CUSTOMER_SEARCH_BTN_CREATE_NEW_CUSTOMER = "xpath://button//span[contains(text(),'Create new customer')]"
# NEW CUSTOMER BUTTON

# todo=================== Customer Search page =========================================================================
# CUSTOMER DATA
_ACTIVATED_CUSTOMER_WIDGET = "xpath://div[@class='context-tab layout-row flex']"

# OANH DATA, LOCATION FOR SEARCH CUSTOMER
CUSTOMER_SEARCH_INPUT_CONTENT_SEARCH = _ACTIVATED_CUSTOMER_WIDGET + "//input[contains(@ng-model,'{}')]"    # lastName, firstName, emailAddress, phoneNumber
CUSTOMER_SEARCH_INPUT_CONTENT_SURNAME = _ACTIVATED_CUSTOMER_WIDGET + "//input[contains(@ng-model,'lastName')]"
CUSTOMER_SEARCH_INPUT_CONTENT_FIRSTNAME = _ACTIVATED_CUSTOMER_WIDGET + "//input[contains(@ng-model,'firstName')]"
CUSTOMER_SEARCH_INPUT_CONTENT_EMAIL = _ACTIVATED_CUSTOMER_WIDGET + "//input[contains(@ng-model,'emailAddress')]"
CUSTOMER_SEARCH_INPUT_CONTENT_PHONE = _ACTIVATED_CUSTOMER_WIDGET + "//input[contains(@ng-model,'phoneNumber')]"

# todo=================== Add a new customer page ======================================================================
# HUY, LOCATION FOR NEW CUSTOMER
CUSTOMER_SEARCH_BTN_CREATE_NEW_CUSTOMER = _ACTIVATED_CUSTOMER_WIDGET + "//button[@ng-click='changeView()']"

CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_TITLE = _ACTIVATED_CUSTOMER_WIDGET + "//input[@name='title']"
CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_LASTNAME = _ACTIVATED_CUSTOMER_WIDGET + "//input[@name='lastName']"
CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_FIRSTNAME = _ACTIVATED_CUSTOMER_WIDGET + "//input[@name='firstName']"

CUSTOMER_SEARCH_CHECKBOX_NEW_CUSTOMER_IS_RESTRICTED = _ACTIVATED_CUSTOMER_WIDGET + "//md-checkbox[@aria-label='Restricted']"


_EMAIL_FIELD = _ACTIVATED_CUSTOMER_WIDGET + "//div[@ng-repeat='email in userInput.emailAddress track by $index']"
CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_EMAIL = _EMAIL_FIELD + "//input[@name='email']"
CUSTOMER_SEARCH_CHECKBOX_NEW_CUSTOMER_IS_EMAIL_DEFAULT = _EMAIL_FIELD + "//md-checkbox"
CUSTOMER_SEARCH_BTN_EMAIL_ADD_MORE = _EMAIL_FIELD + "//button"

_PHONE_FIELD = _ACTIVATED_CUSTOMER_WIDGET + "//div[@ng-repeat='phone in userInput.phoneNumber track by $index']"
CUSTOMER_SEARCH_SELECT_BTN_PHONE_TYPE = _PHONE_FIELD + "//md-select-value"
_PHONE_TYPE = "xpath://*[@class='md-select-menu-container md-active md-clickable']"
CUSTOMER_SEARCH_SELECT_VALUE_PHONE_TYPE = _PHONE_TYPE + "//md-option[@value='{}']" # type in {} replace with data [Unknown, Home, Business, Fax, Mobile, Other]

CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_INTERCODE = _PHONE_FIELD + "//input[@name='interCode']"
CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_AREACODE = _PHONE_FIELD + "//input[@name='areaCode']"
CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_NUMBER = _PHONE_FIELD + "//input[@name='number']"
CUSTOMER_SEARCH_BTN_PHONE_ADD_MORE = _PHONE_FIELD + "//button"
CUSTOMER_SEARCH_CHECKBOX_NEW_CUSTOMER_IS_PHONE_DEFAULT = _PHONE_FIELD + "//md-checkbox[@title='Default']"
CUSTOMER_SEARCH_CHECKBOX_NEW_CUSTOMER_IS_PHONE_BARRED = _PHONE_FIELD + "//md-checkbox[@title='Barred']"

_SIPURI_FIELD = _ACTIVATED_CUSTOMER_WIDGET + "//div[@ng-repeat='sipUri in userInput.sipUri track by $index']"
CUSTOMER_SEARCH_INPUT_NEW_CUSTOMER_SIPURI = _SIPURI_FIELD + "//input[@name='sipuri']"
CUSTOMER_SEARCH_CHECKBOX_NEW_CUSTOMER_IS_SIPURI_DEFAULT = _SIPURI_FIELD + "//md-checkbox[@title='Default']"
CUSTOMER_SEARCH_BTN_SIPURI_ADD_MORE = _SIPURI_FIELD + "//button"

# Back and create button
CUSTOMER_SEARCH_BTN_BACK = _ACTIVATED_CUSTOMER_WIDGET + "//button/span[text()='Back']/parent::button"
CUSTOMER_SEARCH_BTN_CREATE = _ACTIVATED_CUSTOMER_WIDGET + "//button/span[text()='Create']/parent::button"

# Toast Message
TOAST_MESSAGE = "xpath://span[@class='toast__heading--text']"   #"xpath://div[contains(@class,'toast__container')]/ul/li//span[contains(@class, 'text')]"

