# NAVIGATION_MENU


LOC_WORKSPACE_NAVIGATION_MENU_WELCOME_PAGE_BUTTON = "xpath://div[@class='sidebar__container-top']//button[@id='ow_open_Welcome_Page']"
LOC_WORKSPACE_NAVIGATION_MENU_CHAT_BUTTON = "id:ow_open_Chat"
LOC_WORKSPACE_NAVIGATION_MENU_EMAIL_BUTTON = "id:ow_open_Email"
LOC_WORKSPACE_NAVIGATION_MENU_SMS_BUTTON = "id:ow_open_SMS"
# LOC_WORKSPACE_NAVIGATION_MENU_MY_AGENT_BUTTON = "id:ow_open_My_Agent"
LOC_WORKSPACE_NAVIGATION_MENU_MY_AGENT_BUTTON = "xpath://button[@id='ow_open_My_Agents']"
LOC_WORKSPACE_NAVIGATION_MENU_CUSTOMER_JOURNEY = "xpath://button[@id='ow_open_Customer_Journey']"
LOC_WORKSPACE_NAVIGATION_MENU_PHONEBOOK = "xpath://button[@id='ow_open_Phonebook']"
LOC_WORKSPACE_NAVIGATION_MENU_WEB_STATISTIC = "xpath://button[@id='ow_open_web_statictis']"
LOC_WORKSPACE_NAVIGATION_LABEL_WEB_STATISTIC = "xpath://div[contains(text(),'Web Statistic')]"


LOC_WORKSPACE_NAVIGATION_MENU_CUSTOMER_DETAILS = "xpath://button[@aria-label='Customer Details']"
WORKCARD_ID_VAR = "${WORKCARD_ID}"
LOC_WORKSPACE_NAVIGATION_STATUS_CURRENT_CONTACT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@ng-if='!searchPanelActive']//tr[2]//td[2]"
LOC_WORKSPACE_NAVIGATION_DATE_CURRENT_CONTACT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@ng-if='!searchPanelActive']//tr[2]//td[1]"
LOC_WORKSPACE_NAVIGATION_STATUS_PREVIOUS_CONTACT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@ng-if='!searchPanelActive']//tr[4]//td[2]"
LOC_WORKSPACE_NAVIGATION_DATE_PREVIOUS_CONTACT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@ng-if='!searchPanelActive']//tr[4]//td[1]"
LOC_WORKSPACE_NAVIGATION_BTN_OPEN_CASE_DETAIL_PREVIOUS = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@ng-if='!searchPanelActive']//tr[4]//button"

LOC_WORKSPACE_NAVIGATION_TRANSCRIPT_PREVIOUS = "xpath://div[@class='chat-transcript']"
# LOC_WORKSPACE_NAVIGATION_TRANSCRIPT_PREVIOUS = "xpath://bdi[@class='chat-body chat-body-agent chat-message__body']"

# LOC_WORKSPACE_NAVIGATION_CHAT_FROM_AGENT = "xpath://td[@puppeteer-id='customer-history_interaction-details-container__1']//span//span[@class='chat-body chat-body-agent']//span"
LOC_WORKSPACE_NAVIGATION_CHAT_FROM_AGENT = "xpath://span[@class='chat-body chat-body-agent']//span"
# LOC_WORKSPACE_NAVIGATION_CHAT_FROM_CUSTOMER = "xpath://td[@puppeteer-id='customer-history_interaction-details-container__1']//span//span[@class='chat-body chat-body-customer']//span"
LOC_WORKSPACE_NAVIGATION_CHAT_FROM_CUSTOMER = "xpath://span[@class='chat-body chat-body-customer']//span"

LOC_WORKSPACE_NAVIGATION_MENU_BTN_SCREENPOP = "id:ow_open_Screenpop"
LOC_WORKSPACE_NAVIGATION_MENU_BTN_CUSTOMER_SEARCH = "id:ow_open_Customer_Search"
LOC_WORKSPACE_NAVIGATION_MENU_BTN_MULTIMEDIA_CONTACT_SEARCH = "id:ow_open_Multimedia_Contact_Search"

LOC_WORKSPACE_NAVIGATION_BTN_CUSTOMER_SEARCH = "xpath://button[@aria-label='Customer Search']"
LOC_WORKSPACE_NAVIGATION_BTN_MULTIMEDIA_CONTACT_SEARCH = "xpath://button[@aria-label='Multimedia Contact Search']"

LOC_WORKSPACE_NAVIGATION_MENU_BTN_HELP = "xpath://button[@aria-label='Help']"
LOC_WORKSPACE_NAVIGATION_HELP_TITLE = "xpath://td[@id='doctitle']"
# LOC_WORKSPACE_NAVIGATION_HELP_BTN_SEARCH = "xpath://*[@href='_search.html'][@target='navwin']"
# LOC_WORKSPACE_NAVIGATION_HELP_BTN_SEARCH = "xpath://*[@href='http://100.30.6.137:31380/services/UnifiedAgentController/workspaces/assets/help/aacc/en-us/_search.html'][@target='navwin']"
LOC_WORKSPACE_NAVIGATION_HELP_BTN_SEARCH = "xpath://*[@id='tab3']"

LOC_WORKSPACE_NAVIGATION_HELP_INPUT_SEARCH = "xpath://input[@id='zoom_searchbox']"
LOC_WORKSPACE_NAVIGATION_HELP_SEARCH_HEADING = "xpath://div[@class='searchheading']"

# LOC_WORKSPACE_NAVIGATION_MENU_BTN_SETTINGS = "xpath://button[@aria-label='Settings']"
LOC_WORKSPACE_NAVIGATION_MENU_BTN_SETTINGS = "xpath://button[@id='ow_open_Settings']"
LOC_WORKSPACE_NAVIGATION_SETTINGS_EMAIL_SIGNATURE = "xpath://md-tab-item//span[@puppeteer-id='settings-email-signature']"
LOC_WORKSPACE_NAVIGATION_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR = "xpath://div[@id='email--textarea']"
LOC_WORKSPACE_NAVIGATION_SETTINGS_EMAIL_SIGNATURE_BTN_SAVE = "xpath://*[@id='tab-content-16']/div/div[2]/progress-button/div/span/button"

# LOC_WORKSPACE_NAVIGATION_MENU_BTN_SCREENPOP = "xpath://button[@aria-label='Screenpop']"

