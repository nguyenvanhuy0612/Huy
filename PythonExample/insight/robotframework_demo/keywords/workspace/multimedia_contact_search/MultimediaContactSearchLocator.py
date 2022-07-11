# Variable for Multimedia Contact Search KeyWord

LOC_MULTIMEDIA_CONTACT_SEARCH = "xpath://div[@ng-if='!isVoiceOnly']"

# ====================================    Search by field    ===========================================================
LOC_BTN_SEARCH_BY = "xpath://div[contains(@class,'context-tab layout-row flex')]//div[@ng-repeat][last()]//md-select[@placeholder='Search by']"
F_LOC_ITEM_SEARCH_BY = "xpath://div[contains(@class,'md-select-menu-container md-active md-clickable')]//md-option/*[contains(text(),'{}')]"

# ====================================    Search Parameter field    ====================================================
LOC_BTN_SEARCH_PARAMETER = "xpath://div[contains(@class,'context-tab layout-row flex')]//div[@ng-repeat][last()]/div[@ng-switch='searchField']//md-select"
F_LOC_ITEM_SEARCH_PARAMETER = "xpath://div[contains(@class,'md-select-menu-container md-active md-clickable')]//md-option/div[starts-with(text(), '{}')]"
# Input Search With Parameter
F_LOC_INPUT_SEARCH_PARAMETER = "xpath://div[@ng-switch='searchField']//md-input-container/input[@placeholder='{}']"
# Select Search With Two Parameter
F_LOC_INPUT_SEARCH_DATE = "xpath://div[@ng-repeat][last()]//input[@placeholder='{}']"

# ====================================    Search Results field    ======================================================
LOC_TABLE_VERIFY = "xpath://div[@class='mcs-scrollable-area ps']/table"
# check box
LOC_CHECKBOX_VERIFY = "xpath://div[contains(@class, 'mcs-scrollable-area ps')]//td[@class='checkbox']"
# Select Contact In Line
F_LOC_LINE_NUMBER = "xpath://div[contains(@class, 'mcs-scrollable-area ps')]/table/tbody/tr[@ng-repeat-start][{}]"
# Close Selected Contacts
LOC_BTN_CLOSE_CONTACTS = "xpath://button[@aria-label='Close selected contacts']"


# ====================================    Close Contacts Prompt field    ===============================================
# Select Close Reason Code With Agent Note In Prompt
LOC_BTN_CLOSE_REASON_CODE = "xpath://md-select[@ng-model='closeContactReason']"
F_REASON_CODE = "xpath://div[text()='{}']/parent::md-option"
LOC_AGENT_NOTE = "xpath://textarea[@ng-model='closeContactNotes']"
LOC_BTN_CLOSE = "xpath://span[text()='Close']"


# ====================================    Add / remove parameter field    ==============================================
LOC_BTN_ADD_MORE_PARAMETER = "xpath://div[contains(@class,'context-tab layout-row flex')]//button[@aria-label='Add more search parameters']"
LOC_BTN_REMOTE_PARAMETER = "xpath://div[contains(@class,'context-tab layout-row flex')]//div[@ng-repeat][last()]//button[@aria-label='Remove search parameter']"

# ====================================    Search button field    =======================================================
LOC_BTN_SEARCH = "xpath://button[@type='submit'][@aria-label='Search']"

