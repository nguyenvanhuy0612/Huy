# WORKCARD_ID_VAR = "${WORKCARD_ID}"
PHONEBOOK_FILTER1 = "xpath://table[@class='table-search']//tr[@class='border_bottom']//td[1]"
PHONEBOOK_FILTER2 = "xpath://table[@class='table-search']//tr[@class='border_bottom']//td[2]"
PHONEBOOK_FILTER3 = "xpath://table[@class='table-search']//tr[@class='border_bottom']//td[3]//input"
PHONEBOOK_FILTER1_SELECT = "xpath://table[@class='table-search']//tr[@class='border_bottom']//td[1]//select"
# PHONEBOOK_FILTER1_SELECT = "xpath://table[@class='table-search']//tr[@class='border_bottom']//td[1]//select//*[contains(text(),'{}')]"
                            # All, Custom Contacts, Favorite, Speed Dial
PHONEBOOK_FILTER2_SELECT = "xpath://table[@class='table-search']//tr[@class='border_bottom']//td[2]//select"
# PHONEBOOK_FILTER2_SELECT = "xpath://table[@class='table-search']//tr[@class='border_bottom']//td[2]//select//*[contains(text(),'{}')]"
                            # Display Name, Last Name, First Name, Phone, Mobile, IP Phone, Other Phone, Email, Department, Treet, City, State, PostalCode
PHONEBOOK_SORT_COLUMN = "xpath://th[contains(text(),'{}')]"
PHONEBOOK_BTN_SEARCH = "xpath://div[@class='mp-buttons-bar']//button[@aria-label='Add search criteria']"
PHONEBOOK_BTN_NEW_CONTACT = "xpath://div[@class='mp-buttons-bar']//button[@aria-label='New contact']"
PHONEBOOK_BTN_SETUP_COLUMNS = "xpath://div[@class='mp-buttons-bar']//button[@aria-label='Setup phonebook columns']"
PHONEBOOK_BTN_SAVE_NEW_CONTACT = "xpath://button[@type='submit']//span[contains(text(),'Save')]"

PHONEBOOK_TABLE_ROW = "xpath://tbody//tr"
PHONEBOOK_BTN_EDIT_CONTACT = "xpath://button[@aria-label='Edit Contact']"
PHONEBOOK_BTN_DELETE_CONTACT = "xpath://button[@aria-label='Delete Contact']"
PHONEBOOK_BTN_TAGGING_CONTACT = "xpath://button[@aria-label='{}']//md-icon[contains(@class,'{}')]"    # Favourite or Speed Dial
# PHONEBOOK_BTN_TAGGING_CONTACT = "xpath://button[@aria-label='{}']"    # Favourite or Speed Dial
# PHONEBOOK_BTN_FAVOURITE = "xpath://button[@aria-label='Favourite']"
# PHONEBOOK_BTN_SPEED_DIAL = "xpath://button[@aria-label='Speed Dial']"
PHONEBOOK_BTN_CALL_OUT = "xpath://td[7]//button[@aria-label='Click to call']"
PHONEBOOK_BTN_END_CALL = "xpath://button[contains(@id, 'ow_Card_End_btn')]"

PHONEBOOK_TABLE_ROW_CONENT = "xpath://tbody//tr//td[{}]"
PHONEBOOK_ROW_PER_PAGE = "xpath://md-select[contains(@aria-label,'Records per page')]//md-select-value"
PHONEBOOK_SELECT_ROW_PER_PAGE = "xpath://div[contains(@class,'md-active')]//md-option[@value='{}']"

PHONEBOOK_CHECK_TAGGING_CONTACT = "xpath://md-checkbox[@aria-label='{}']"    # Favorite or Speed Dial
PHONEBOOK_INPUT_FIELD_CONTACT = "xpath://label[contains(text(),'{}')]/following-sibling::input"
PHONEBOOK_ENTER_FIELD_LABEL = "xpath://h4[contains(text(),'Enter fields')]"
