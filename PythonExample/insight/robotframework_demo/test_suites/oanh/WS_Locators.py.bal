
import uiautomation
import time
import subprocess
from pywinauto.application import Application
from os import listdir


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#***************                                      LoginLocator                                       ***************

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

LOC_WORKSPACE_LOGIN_IPT_USERNAME = "xpath://input[@id='username']"
LOC_WORKSPACE_LOGIN_IPT_PASSWORD = "xpath://input[@id='password']"
LOC_WORKSPACE_LOGIN_AGENT = "xpath://*[contains(text(), 'Login Agent')]"
LOC_WORKSPACE_LOGIN_AVATAR = "xpath://img[@class='agent-avatar']"
LOC_WORKSPACE_LOGIN_BTN_SIGNIN = "login-button"
LOC_WORKSPACE_LOGIN_BTN_ACTIVATE = "xpath://button[@puppeteer-id='activate--button']"
LOC_WORKSPACE_LOGIN_LABEL_AGENT = "xpath://h1[@class='md-title']"
LOC_WORKSPACE_LOGIN_BTN_STARTWORK = "xpath://button[@puppeteer-id='start-work--button']"
LOC_WORKSPACE_LOGOUT = "xpath://button[contains(@id, 'login-button') or contains(@id, 'ow_activate')]"
LOC_WORKSPACE_HOME_DROPDOWN_MENU = "xpath://button[@puppeteer-id='agent--dropdown-button']"
LOC_WORKSPACE_HOME_MENU_HEADER = "xpath://div[@class='menu-header__data']"
#LOC_WORKSPACE_HOME_DROPDOWN_READY = "xpath://button[@puppeteer-id='go-ready--dropdown-button']"
#   ======  ERROR MESSAGE  ======
LOC_WORKSPACE_ERROR_HEADER = "xpath://div[@class='error-header']"
LOC_WORKSPACE_ERROR_BODY = "xpath://div[@class='error-body']"

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#***************                             WidgetWelcomePageLocator                                    ***************

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# === WIDGET WELCOME PAGE ===

ID_AGENT_SEARCH = "xxx"

LOC_WIDGETWELCOME_IPT_SEARCH_TEAM = "xpath://input[@aria-label='Search Team']"
LOC_WIDGETWELCOME_MEMBER_SEARCH = "xpath://*[@id='ow_team_member_AGENT_expandedTeamView_" + ID_AGENT_SEARCH + "']"


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#***************                               WidgetSettingsLocator                                     ***************

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#   === WIDGETSETTINGS ===
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE = "xpath://md-tab-item//span[@puppeteer-id='settings-email-signature']"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR = "xpath://div[@id='email--textarea']"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BTN_SAVE = "xpath://progress-button[@puppeteer-id='email-signature-html--save-button']//button"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_CHECK_AUTO_INSERT = "xpath://md-tab-content[1]//md-checkbox"

LOC_WIDGETSETTINGS_SETTINGS_ABOUT_VERSION = "xpath://span[@puppeteer-id='settings-about_solution-version']"
LOC_WIDGETSETTINGS_SETTINGS_ABOUT_BUILD = "xpath://span[@puppeteer-id='settings-about_build-version']"

LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_ANY_EDIT_BTN = "xpath://cc-email-editor[@puppeteer-id='email-signature--html']//button"

# LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE = "xpath://cc-email-editor[@puppeteer-id='email-signature--html']//md-select[@ng-model='fontSize']"
# LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE = "xpath://cc-email-editor[@puppeteer-id='email-signature--html']//div[@class='toolbar-actions__item toolbar-actions__group']"
# LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE = "xpath://cc-email-editor[@puppeteer-id='email-signature--html']//div[@class='text-editor layout-column flex']//div[@class='text-editor__actions']//div[2]"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE = "xpath://*[@class='_md md-active']//div//cc-email-editor//div//div[1]//div[2]"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE_8 = "xpath://div[@class='md-select-menu-container md-active md-clickable']//md-option[@value='8']"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE_12 = "xpath://div[@class='md-select-menu-container md-active md-clickable']//md-option[@value='12']"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE_14 = "xpath://div[@class='md-select-menu-container md-active md-clickable']//md-option[@value='14']"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_FONT_SIZE_16 = "xpath://div[@class='md-select-menu-container md-active md-clickable']//md-option[@value='16']"


LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BOLD = "xpath://md-tab-content[1]//button[@aria-label='Bold']"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_LINK = "xpath://cc-email-editor[@puppeteer-id='email-signature--html']//button[@puppeteer-id='insert-link--email-widget-toolbar-button']"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_EDIT_LINK = "xpath://input[@id='edit-link']"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_SUBMIT_LINK = "xpath://button[@id='submit']"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_UNDO = "xpath://cc-email-editor[@puppeteer-id='email-signature--html']//button[@aria-label='Undo']"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_REDO = "xpath://cc-email-editor[@puppeteer-id='email-signature--html']//button[@aria-label='Redo']"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_CONTENT = "xpath://div[@id='email--textarea']"

#===================================================== LANGUAGE ========================================================
LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE = "xpath://md-tab-item//span[@puppeteer-id='settings-language']"
LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE_SELECT = "xpath://language-settings//md-select-value"
LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE_SELECT_LIST = "xpath://div[@class='md-select-menu-container md-active md-clickable']//md-select-menu//md-option"
LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE_SELECT_LIST_NAME = "xpath://div[@class='md-select-menu-container md-active md-clickable']//md-option//div[@class='md-text']"

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#***************                                  ScreenpopLocator                                       ***************

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# LOC_SCREENPOP_LIST_SPAN_SCREENPOP = 'xpath://div[@class="widget widget--screen-pop"]//md-tabs[@class="md-no-tab-content"]//md-tab-item/span'
LOC_SCREENPOP_LIST_SPAN_SCREENPOP = 'xpath://div[@class="widget widget--screen-pop"]//md-tabs[@class="md-no-tab-content"]//md-tab-item'

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#***************                                NavigationMenuLocator                                    ***************

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# NAVIGATION_MENU

LOC_WORKSPACE_NAVIGATION_MENU_WELCOME_PAGE_BUTTON = "xpath://div[@class='sidebar__container-top']//button[@id='ow_open_Welcome_Page']"
LOC_WORKSPACE_NAVIGATION_MENU_CHAT_BUTTON = "id:ow_open_Chat"
LOC_WORKSPACE_NAVIGATION_MENU_EMAIL_BUTTON = "id:ow_open_Email"
LOC_WORKSPACE_NAVIGATION_MENU_SMS_BUTTON = "id:ow_open_SMS"
# LOC_WORKSPACE_NAVIGATION_MENU_MY_AGENT_BUTTON = "id:ow_open_My_Agent"
LOC_WORKSPACE_NAVIGATION_MENU_MY_AGENT_BUTTON = "xpath://button[@id='ow_open_My_Agents']"
LOC_WORKSPACE_NAVIGATION_MENU_CUSTOMER_JOURNEY = "xpath://button[@id='ow_open_Customer_Journey']"


LOC_WORKSPACE_NAVIGATION_MENU_CUSTOMER_DETAILS = "xpath://button[@aria-label='Customer Details']"
WORKCARD_ID_VAR = "${WORKCARD_ID}"
LOC_WORKSPACE_NAVIGATION_STATUS_CURRENT_CONTACT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@ng-if='!searchPanelActive']//tr[2]//td[2]"
LOC_WORKSPACE_NAVIGATION_DATE_CURRENT_CONTACT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@ng-if='!searchPanelActive']//tr[2]//td[1]"
LOC_WORKSPACE_NAVIGATION_STATUS_PREVIOUS_CONTACT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@ng-if='!searchPanelActive']//tr[4]//td[2]"
LOC_WORKSPACE_NAVIGATION_DATE_PREVIOUS_CONTACT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@ng-if='!searchPanelActive']//tr[4]//td[1]"
LOC_WORKSPACE_NAVIGATION_BTN_OPEN_CASE_DETAIL_PREVIOUS = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@ng-if='!searchPanelActive']//tr[4]//button"

LOC_WORKSPACE_NAVIGATION_TRANSCRIPT_PREVIOUS = "xpath://bdi[@class='chat-body chat-body-agent chat-message__body']"

LOC_WORKSPACE_NAVIGATION_CHAT_FROM_AGENT = "xpath://td[@puppeteer-id='customer-history_interaction-details-container__1']//span//span[@class='chat-body chat-body-agent']//span"
LOC_WORKSPACE_NAVIGATION_CHAT_FROM_CUSTOMER = "xpath://td[@puppeteer-id='customer-history_interaction-details-container__1']//span//span[@class='chat-body chat-body-customer']//span"

LOC_WORKSPACE_NAVIGATION_MENU_BTN_SCREENPOP = "id:ow_open_Screenpop"
LOC_WORKSPACE_NAVIGATION_MENU_BTN_CUSTOMER_SEARCH = "id:ow_open_Customer_Search"

LOC_WORKSPACE_NAVIGATION_BTN_CUSTOMER_SEARCH = "xpath://button[@aria-label='Customer Search']"

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

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#***************                                 WidgetMyAgentLocator                                    ***************

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

CONTACT_INFO_VAR = "${CONTACT_INFO}"
STATUS_AGENT = "#{STATUS}"
LOC_MYAGENT_SEARCH_AGENT = "xpath://div[@class='widget widget--supervisor']//md-input-container[1]//input[@aria-label='Search Team']"
LOC_MYAGENT_DISPLAY_AGENT = "xpath://td[@class='agent-display-name']"
LOC_WORK_ITEM_OBSERVE = "xpath://td[@class='work-item']"

# LOC_MYAGENT_BTN_OBSERVE = "xpath://button[@aria-label='Observe Interaction']"
LOC_MYAGENT_BTN_OBSERVE = "xpath://td[text()=\'" + CONTACT_INFO_VAR + "\']//following-sibling::td//button[@aria-label='Observe Interaction']"
LOC_MYAGENT_BTN_STATUS_AGENT = "xpath://button[@aria-label='state']"
LOC_MYAGENT_SELECT_STATUS_AGENT = "xpath://button//span[text()=\'"+ STATUS_AGENT +"\']"
LOC_BTN_END_OBSERVE ="xpath://button[@aria-label='End Observe']"

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#***************                                  InteractionLogLocator                                  ***************

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

LOC_INTERACTIONLOG_BTN_INTERACTIONLOG = "xpath://button[@id='ow_open_logs']"
#LOC_INTERACTIONLOG_BTN_CALL = "xpath://md-tab-content[1]/div/md-content/md-card/md-card-content/md-list-item/span[@aria-label='Click to call tel:3309;phone-context=dialstring']"
LOC_INTERACTIONLOG_LINE_CALL = "xpath://md-content/cc-worklog/md-content/md-tabs/md-tabs-content-wrapper/md-tab-content[1]/div/md-content/md-card/md-card-content"
PHONE_URI = "XXX"
LOC_INTERACTIONLOG_BTN_CALL = "xpath://md-tab-content[1]/div/md-content/md-card/md-card-content/md-list-item/span[@aria-label='Click to call " + PHONE_URI + "']"

LOC_WORKSPACE_LOGIN_IPT_PASSWORD = "xpath://input[@id='password']"
LOC_WORKSPACE_LOGIN_AGENT = "xpath://*[contains(text(), 'Login Agent')]"
LOC_WORKSPACE_LOGIN_BTN_SIGNIN = "login-button"
LOC_WORKSPACE_LOGIN_BTN_ACTIVATE = "xpath://button[@puppeteer-id='activate--button']"
LOC_WORKSPACE_LOGIN_LABEL_AGENT = "xpath://h1[@class='md-title']"
LOC_WORKSPACE_LOGIN_BTN_STARTWORK = "xpath://button[@puppeteer-id='start-work--button']"
LOC_WORKSPACE_LOGOUT = "xpath://button[contains(@id, 'login-button') or contains(@id, 'ow_activate')]"
LOC_WORKSPACE_HOME_DROPDOWN_MENU = "xpath://button[@puppeteer-id='agent--dropdown-button']"
LOC_WORKSPACE_HOME_MENU_HEADER = "xpath://div[@class='menu-header__data']"
#LOC_WORKSPACE_HOME_DROPDOWN_READY = "xpath://button[@puppeteer-id='go-ready--dropdown-button']"

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#***************                                     WorkCardLocator                                     ***************

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# DYNAMIC VARIABLES FOR WORKCARD LOCATORS
DYNAMIC_VARIABLE_WORKCARD_SERVICE_NAME = "${WORKCARD_SERVICE_NAME}"
CONTACT_INFO_VAR = "${CONTACT_INFO}"
#CONTACT_SKILLSET_VAR = "${CONTACT_SKILLSET}"
WORKCARD_ID_VAR = "${WORKCARD_ID}"
WORKCARD_ORDER_VAR = "${WORKCARD_ORDER}"
ACTIVITY_NAME_VAR = "${ACTIVITY_NAME}"
DISPOSITION_NAME_VAR = "${DISPOSITION_NAME}"
SERVICE_NAME_TO_TRANSFER_VAR = "${SERVICE_NAME_TO_TRANSFER_VALUE}"


# ROOT: WORKCARD LOCATOR
# By TOOLTIP, example: //span[@aria-label='cust@one.com']/ancestor::card-container//card-summary//div
LOC_WORKCARD_LIST = "//cc-cards-collection//card-container"
#LOC_WORKCARD = "//span[@aria-label=\'" + CONTACT_INFO_VAR + "\']"
LOC_WORKCARD = "xpath://card-container[@interaction-title=\'" + CONTACT_INFO_VAR + "\']"
LOC_WORKCARD_ID = LOC_WORKCARD + "//cc-consult-menu"
LOC_WORKCARD_ID_BY_ORDER = "//cc-consult-menu[@menu-type='Transfer'][" + WORKCARD_ORDER_VAR + "]"
LOC_WORKCARD_CHOOSE = "xpath://card-container[@interaction-id='" + WORKCARD_ID_VAR +"']"

# WORKCARD ICONS, HEADER, MISSED MESSAGES, TIMER...
LOC_WORKCARD_HEADER_TITLE = LOC_WORKCARD + "//span[@class='card__header-text']"
LOC_WORKCARD_HEADER = "xpath://span[@class='card__header-text']"
LOC_WORKCARD_HEADER_TIMER = LOC_WORKCARD + "//cc-timer"
LOC_WORKCARD_HEADER_MISSED_MESSAGE = LOC_WORKCARD + "//span[@aria-label='Missed Messages']"

# Locator is used to get header of coming contact (contact is not accepted)
LOC_WORKCARD_ACCEPT_CONTACT_HEADER_TITLE = "//button[@id='ow_card_accept_btn']//ancestor::card-container//span[starts-with(@class,'card__header-title')]"

# WORKCARD SERVICE NAME, WORK CODE, DISPOSITION CODE, ICONS...
LOC_WORKCARD_SERVICE_NAME = LOC_WORKCARD + "//card-content[not(contains(@class,'card-details'))]//span"

# WORKCARD BODY MESSAGES

#   SKILLSET
LOC_WORKCARD_LABEL_SKILLSET = "xpath://div[@id='ow_Service_Name_" + WORKCARD_ID_VAR +"']//span"

# WORKCARD ACTIONS
LOC_WORKCARD_ACCEPT_CONTACT_BUTTON = "xpath://button[contains(@id, 'ow_card_accept_btn')]"
LOC_WORKCARD_BTN_ACCEPT_CONTACT = LOC_WORKCARD + "//button[@id='ow_card_accept_btn']"
LOC_WORKCARD_BTN_REJECT_CONTACT = LOC_WORKCARD + "//button[@aria-label='End']"
LOC_WORKCARD_BTN_END_ANY_CONTACT = "xpath://button[@aria-label='End']"
LOC_WORKCARD_BTN_END_CONTACT = LOC_WORKCARD + "//button[contains(@id, 'ow_Card_End_btn')]"
LOC_WORKCARD_BTN_END_INTERACTION = "xpath://div[@class='md-dialog-container']//md-dialog//button[@class='md-primary md-confirm-button md-button md-ink-ripple md-default-theme']"

LOC_WORKCARD_BTN_END_INTERACTION_CALL = "xpath://card-container[@interaction-title=\'" + CONTACT_INFO_VAR + "\']/ng-switch/div/ng-include/div/card-actions/div/span[1]/button"
NUM = "NUMBER"
LOC_WORKCARD_BTN_HOLD_ANY_CONTACT = "xpath://button[@aria-label='Unhold']"

LOC_WORKCARD_BTN_COMPLETE_CONTACT = LOC_WORKCARD + "//button[@aria-label='Complete']"
# LOC_WORKCARD_BTN_TRANSFER = LOC_WORKCARD + "//button[@class='card-button md-icon-button aoc-transfer-forward js-transfer md-button']"
LOC_WORKCARD_BTN_TRANSFER = LOC_WORKCARD + "//button[@aria-label='Transfer']"
LOC_WORKCARD_INPUT_EXTENSION_TRANSFER = "//input[@class='menu-input-white ng-pristine ng-valid md-autofocus md-input ng-empty ng-touched'][@aria-label='Enter extension'] "

LOC_WORKCARD_TRANSFER_CALL = LOC_WORKCARD + "//button[@aria-label='Transfer']"
LOC_WORKCARD_CONSULT_CALL = LOC_WORKCARD + "//button[@aria-label='Consult']"

LOC_WORKCARD_BTN_HOLD_CONTACT = LOC_WORKCARD + "//button[@aria-label='Hold']"
LOC_WORKCARD_BTN_UNHOLD_CONTACT = LOC_WORKCARD + "//button[@aria-label='Unhold']"
LOC_WORKCARD_BTN_MORE = "xpath://button[@id='ow_Card_More_btn_" + WORKCARD_ID_VAR +"']"
# LOC_WORKCARD_BTN_MORE = LOC_WORKCARD + "//button[@aria-label='More']"
LOC_WORKCARD_BTN_MORE_OUTGOING = "xpath://button[@id='ow_Card_More_btn_" + WORKCARD_ID_VAR + "']"
LOC_WORKCARD_BTN_END_OBSERVE = LOC_WORKCARD + "//button[@aria-label='End Observe']"
LOC_WORKCARD_BTN_COACH = LOC_WORKCARD + "//button[@aria-label='Coach']"
LOC_WORKCARD_BTN_END_COACH = LOC_WORKCARD + "//button[@aria-label='End Coach']"
LOC_WORKCARD_BTN_BARGE = LOC_WORKCARD + "//button[@aria-label='Barge']"


# ONLY use for BLIND ACTIONS, example keyword: "Release All Active Working Contacts"
LOC_WORKSPACE_BTN_ACCEPT_CONTACT = "//*[@id='ow_card_accept_btn']"
LOC_WORKSPACE_BTN_END_CONTACT = "xpath://button[contains(@id,\"ow_Card_End_btn\")]"
LOC_WORKSPACE_BTN_COMPLETE_CONTACT = "xpath://button[@aria-label=\"Complete\"]"


# Work Card Summary
LOC_WORKCARD_HEADER_SUMMARY_TEXT = LOC_WORKCARD + "//card-summary//div"


# WORKCARD TRANSFER MM
LOC_WORKCARD_BTN_SERVICES = "id:ow_navigate_next_Transfer_" + WORKCARD_ID_VAR
LOC_WORKCARD_SERVICE_SEARCH_BOX = '//div[starts-with(@id,"menu_container")][@aria-hidden="false"]//md-input-container[contains(@class,"service-search-input input-container--no-validation md-input-has-placeholder flex")]/input[@ng-model="query"]'
# LOC_WORKCARD_BTN_SERVICE_NAME_TO_TRANSFER = \
#     "//div[starts-with(@id,'menu_container')][@aria-hidden='false']//button[@type='button' and span[text()='" + SERVICE_NAME_TO_TRANSFER_VAR + "']]"
LOC_WORKCARD_BTN_SERVICE_NAME_TO_TRANSFER = "xpath://button[text()='" + SERVICE_NAME_TO_TRANSFER_VAR + "']"
LOC_WORKCARD_ICON_TRANSFER = "//span[@class='service-icon aoc-transfer-forward']"
LOC_WORKCARD_TRANSFER_TO_SERVICE_STATE = "//*[@id='ow_transferred_service_" + WORKCARD_ID_VAR + "']/div[@class='menu-item-value']"

# WORKCARD TRANSFER CALL
LOC_WORKCARD_BTN_TRANSFER_TEAM = "xpath://button[@puppeteer-id='consult-menu__team_Transfer_" + WORKCARD_ID_VAR + "']"
LOC_WORKCARD_IPT_TRANSFER_TEAM_SEARCH = "id:team_search_Transfer_" + WORKCARD_ID_VAR
LOC_WORKCARD_BTN_TRANSFER_TEAM_CHOOSED_AGENT = "xpath://*[@puppeteer-id='consult-menu__member-in-team_Transfer_" + WORKCARD_ID_VAR + "']"
LOC_WORKCARD_IPT_TRANSFER_EXTENSION = "xpath://*[@id='ow_enter_extension_Transfer_" + WORKCARD_ID_VAR + "']"
LOC_WORKCARD_BTN_TRANSFER_CALL = "xpath://button[@id='ow_click_to_call_consult_menu_Transfer_" + WORKCARD_ID_VAR + "']"

# WORKCARD CONFERENCE CALL
LOC_WORKCARD_BTN_CONSULT_TEAM = "xpath://button[@puppeteer-id='consult-menu__team_Consult_" + WORKCARD_ID_VAR + "']"
LOC_WORKCARD_IPT_CONSULT_TEAM_SEARCH = "id:team_search_Consult_" + WORKCARD_ID_VAR
LOC_WORKCARD_BTN_CONSULT_TEAM_CHOOSED_AGENT = "xpath://*[@puppeteer-id='consult-menu__member-in-team_Consult_" + WORKCARD_ID_VAR + "']"
LOC_WORKCARD_IPT_CONSULT_EXTENSION = "xpath://*[@id='ow_enter_extension_Consult_" + WORKCARD_ID_VAR + "']"
LOC_WORKCARD_BTN_CONSULT_CALL = "xpath://button[@id='ow_click_to_call_consult_menu_Consult_" + WORKCARD_ID_VAR + "']"

# WORK CODE (ACTIVITY CODE)
# LOC_WORKCARD_BTN_ACTIVITY = '//div[contains(@class,"md-open-menu-container") and @aria-hidden="false"]//work-code[@type="WORK"]/md-menu/button'
# LOC_WORKCARD_BTN_ACTIVITY = "xpath://md-menu[@class='work-code _md-nested-menu md-menu _md md-open']//button"
LOC_WORKCARD_BTN_ACTIVITY = "xpath://work-code[@type='WORK']//md-menu[@class='work-code _md-nested-menu md-menu _md']//button"
LOC_WORKCARD_IPT_ACTIVITY_SEARCH = '//div[contains(@class,"md-open-menu-container") and @aria-hidden="false"]/md-menu-content/form//md-input-container[starts-with(@class, "code-search-input")]//input'
# LOC_WORKCARD_BTN_ACTIVITY_CODE = '//div[contains(@class,"md-open-menu-container") and @aria-hidden="false"]//md-menu-item[@class="ws-dropdown-menu__item work-code__item"]//span[text()="' + ACTIVITY_NAME_VAR + '"]'
LOC_WORKCARD_BTN_ACTIVITY_CODE = "xpath://button[text()='" + ACTIVITY_NAME_VAR + "']"
LOC_WORKCARD_BTN_FIRST_ACTIVITY = '(//div[contains(@class,"md-open-menu-container") and @aria-hidden="false"]/md-menu-content/md-menu-item/span/button)[1]'
LOC_WORKCARD_TXT_ACTIVITY = "xpath://span[@puppeteer-id='card-content__work-code-icon--" + WORKCARD_ID_VAR + "']"
# DISPOSITION CODE
# LOC_WORKCARD_IPT_DISPOSITION_SEARCH = '//div[contains(@class,"md-open-menu-container") and @aria-hidden="false"]/md-menu-content/form//md-input-container[starts-with(@class, "code-search-input")]//input'
# LOC_WORKCARD_IPT_DISPOSITION_SEARCH = "xpath://input[@class='code-search-input ng-valid md-autofocus md-input ng-touched ng-dirty ng-valid-parse ng-empty']"
LOC_WORKCARD_IPT_DISPOSITION_SEARCH = "xpath://div[6]//input[@aria-label='Search']"
LOC_WORKCARD_BTN_DISPOSITION = '//div[contains(@class,"md-open-menu-container") and @aria-hidden="false"]//work-code[@type="DISPOSITION"]/md-menu/button'
LOC_WORKCARD_BTN_DISPOSITION_CODE = '//div[contains(@class,"md-open-menu-container") and @aria-hidden="false"]//md-menu-item[@class="ws-dropdown-menu__item work-code__item"]//span[text()="' + DISPOSITION_NAME_VAR + '"]'
LOC_WORKCARD_BTN_FIRST_DISPOSITION = '(//div[contains(@class,"md-open-menu-container") and @aria-hidden="false"]/md-menu-content/md-menu-item/span/button)[1]'
LOC_WORKCARD_TXT_DISPOSITION = "xpath://span[@puppeteer-id='card-content__disposition-code-icon--" + WORKCARD_ID_VAR + "']"

# INTERACTION DETAILS
LOC_WORKCARD_BTN_INTERACTION_DETAILS_BUTTON = "xpath://*[@id='ow_interaction_details_" + WORKCARD_ID_VAR + "']"
LOC_WORKCARD_INTERACTION_CHANNEL = "xpath://button[@id='ow_details_channel_" + WORKCARD_ID_VAR + "']//div[@class='menu-item-value']"
LOC_WORKCARD_INTERACTION_DIRECTION = "xpath://button[@id='ow_details_direction_" + WORKCARD_ID_VAR + "']//div[@class='menu-item-value']"
LOC_WORKCARD_INTERACTION_SERVICE = "xpath://button[@id='ow_interaction_topic_" + WORKCARD_ID_VAR + "']//div[@class='menu-item-value']"
LOC_WORKCARD_INTERACTION_DESTINATION_ADDRESS = "xpath://button[@id='ow_destination_address_" + WORKCARD_ID_VAR + "']//div[@class='menu-item-value']"
LOC_WORKCARD_INTERACTION_ORIGINAL_ADDRESS = "xpath://button[@id='ow_originating_address_" + WORKCARD_ID_VAR + "']//div[@class='menu-item-value']"
LOC_WORKCARD_INTERACTION_CONTACT_ID = "xpath://button[@id='ow_contact_id_" + WORKCARD_ID_VAR + "']//div[@class='menu-item-value']"

#   WEBCHAT

LOC_WORKCARD_TYPE_A_MESSAGE = "xpath://div[@class='super-input__input mousetrap dir_auto dir_aligned']"
LOC_TYPE_A_MESSAGE = "xpath://messenger-manager[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@class='super-input__input mousetrap dir_auto dir_aligned']"
# LOC_TYPE_A_MESSAGE = "xpath://messenger-manager[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@aria-label='Type a message...']"
# LOC_SEND_MESSAGE = "xpath://*[@puppeteer-id='messenger-input__send-button']"
LOC_SEND_MESSAGE = "xpath://messenger-manager[@interaction-id='" + WORKCARD_ID_VAR + "']//*[@puppeteer-id='messenger-input__send-button']"
LOC_WORKCARD_LABEL_CHAT = "xpath://div[@id='webchat__" + WORKCARD_ID_VAR + "']//md-content[@puppeteer-id='messages-content__agent-customer']//div[@class='message-info md-caption layout-align-start-center layout-row']//span[1]"
LOC_WORKCARD_CONTENT_CHAT = "xpath://div[@id='webchat__" + WORKCARD_ID_VAR + "']//div[2]//md-card//span[@class='message-body__text']"
# LOC_WORKCARD_CONTENT_CHAT = "xpath://div[@id='webchat__" + WORKCARD_ID_VAR + "']//md-content[@puppeteer-id='messages-content__agent-customer']//md-card[@class='message-body md-body-1 _md']//span[1]"
# LOC_WORKCARD_MESSENGER_STATUS = "xpath://div[@class='messenger-status layout-align-space-between-center layout-row']//p//span[1]"
LOC_WORKCARD_MESSENGER_STATUS = "xpath://context-canvas//div[2]//div[2]//messenger-status//div//p//span[1]"
# LOC_WORKCARD_MESSENGER_STATUS = "xpath://context-canvas//div[2]//div[2]//div[@class='messenger-status layout-align-space-between-center layout-row']//p//span[1]"
# LOC_WORKCARD_MESSENGER_STATUS = "xpath://div[@class='messenger-status layout-align-space-between-center layout-row']/p/span/span[1]/span"
LOC_WORKCARD_DISCONNECT = "xpath://messenger-manager[@interaction-id='" + WORKCARD_ID_VAR + "']//p/span"
# LOC_WORKCARD_DISCONNECT = "xpath://messenger-manager[@interaction-id='" + WORKCARD_ID_VAR + "']//p/span//span"

LOC_WORKCARD_TAB_PHRASE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR +"']//div[@class='widget__content']//md-pagination-wrapper[@aria-label='Use the left and right arrow keys to navigate between tabs']//md-tab-item[1]"
LOC_WORKCARD_IPT_PHRASE_SEARCH = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//input[@placeholder='Search by phrase']"
LOC_WORKCARD_BTN_SEND_PHRASE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Click to send phrase']"

LOC_WORKCARD_TAB_URL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR +"']//div[@class='widget__content']//md-pagination-wrapper[@aria-label='Use the left and right arrow keys to navigate between tabs']//md-tab-item[2]"
LOC_WORKCARD_IPT_URL_SEARCH = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//input[@placeholder='Search by url description or address']"
LOC_WORKCARD_BTN_SEND_URL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Click to send URL']"
LOC_WORKCARD_SCROLL_CHAT = "xpath://messenger-manager[@interaction-id='" + WORKCARD_ID_VAR + "']//md-content[@puppeteer-id='messages-content__agent-customer']//div[@class='ps__rail-y']//div[@class='ps__thumb-y']"
AGENT_FULLNAME = "NAME_AGENT"
SKILL_FROM = "SKILLSET_FROM"
SKILL_TO = "SKILLSET_TO"
MESSAGE_NOTIFY_TRANSFER = "Agent " + AGENT_FULLNAME + " has transferred this contact from skillset " + SKILL_FROM + " to skillset " + SKILL_TO

#   PARTICIPANTS LIST
GET_ARIA_OWN = "${GET_ARIA_OWN}"
LOC_WORKCARD_BTN_PARTICIPANT_LIST = "xpath://messenger-participants[@id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Participants List']"
LOC_WORKCARD_BTN_PART1_CUSTOMER = "xpath://*[@id='" + GET_ARIA_OWN + "']//md-menu-content//md-menu-item[1]//button//div//p[1]"
LOC_WORKCARD_BTN_PART1_CUSTOMER_LABEL = "xpath://*[@id='" + GET_ARIA_OWN + "']//md-menu-content//md-menu-item[1]//button//div//p[2]"
LOC_WORKCARD_BTN_PART2_AGENT = "xpath://*[@id='" + GET_ARIA_OWN + "']//md-menu-content//md-menu-item[2]//button//div//p[1]"
LOC_WORKCARD_BTN_PART2_AGENT_LABEL = "xpath://*[@id='" + GET_ARIA_OWN + "']//md-menu-content//md-menu-item[2]//button//div//p[2]"
LOC_WORKCARD_BTN_PART3_AGENT = "xpath://*[@id='" + GET_ARIA_OWN + "']//md-menu-content//md-menu-item[3]//button//div//p[1]"
LOC_WORKCARD_BTN_PART3_AGENT_LABEL = "xpath://*[@id='" + GET_ARIA_OWN + "']//md-menu-content//md-menu-item[3]//button//div//p[2]"


#   OBSERVE/ COACHING/ BARG-IN/
#   HISTORY
# LOC_WORKCARD_CHARACTER_COUND = "xpath://messenger-manager[@interaction-id='" + WORKCARD_ID_VAR + "']//p[@ng-if='charCountEnabled()']//span//span"
LOC_WORKCARD_CHARACTER_COUND = "xpath://messenger-manager[@interaction-id='" + WORKCARD_ID_VAR + "']//p[@ng-if='charCountEnabled()']//span"


def attach_file(attachment_name):

    Insert_Window = uiautomation.WindowControl(Name = "Open")
    Insert_Window.SetFocus()
    # source_Attach = Insert_Window.ToolBarControl()
    # source_Attach.Click()
    # source_Attach.SendKey("E:\OanhHo\Attach_file")
    # bnt_Goto = Insert_Window.ButtonControl(Name = "Go to \"E:\OanhHo\Attach_file\"")
    folder_Disk_E = Insert_Window.TreeItemControl(Name = "OCEANA (E:)")
    folder_Disk_E.Click()
    folder_OanhHo = Insert_Window.ListItemControl(Name = "OanhHo")
    folder_OanhHo.DoubleClick()
    folder_Attach_file = Insert_Window.ListItemControl(Name = "Attach_file")
    folder_Attach_file.DoubleClick()
    # Choose the file to attach
    Choose_file = Insert_Window.ListItemControl(Name = attachment_name)
    Choose_file.SetFocus()
    Choose_file.Click()
    btn_Insert = Insert_Window.SplitButtonControl(Name="Insert")
    # btn_Insert.SetFocus()
    btn_Insert.Click()

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#***************                              CustomerHistorySearchLocator                               ***************

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

VALUE_SEARCH_BY = "VALUE"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_SELECT_SEARCH = "xpath://md-input-container[@class='ch-type-selector md-input-has-placeholder']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_SELECT_SEARCH_BY = "xpath://md-option[@value='by" + VALUE_SEARCH_BY + "']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_SEARCH_FIELD = "xpath://div[@ng-switch='searchField']//md-input-container//input"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_SEARCH = "xpath://cc-history-search//button[@aria-label='Search']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_FROM_DATE = "xpath://div[@ng-switch='searchField']//md-input-container//input[@aria-label='From']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_TO_DATE = "xpath://div[@ng-switch='searchField']//md-input-container//input[@aria-label='To']"
LOC_WORKSPACE_CUSTOMER_HISTORY_BTN_SHOW_FIRST_DETAIL = "xpath://tr[1]//button[@aria-label='Toggle item details']"
LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_FROM = "xpath://span[@ng-if='detail.from']"
LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_TO = "xpath://span[@ng-if='detail.to']"
LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_SUBJECT = "xpath://div[@class='email email-agent']//span[@class='email-header-subject flex'][1]"
LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_CONTENT_LINE = "xpath://div[@class='text-editor text-editor--readonly text-editor--no-border layout-column flex']//div[@id='email--textarea']//div"

LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ICON_SELECT = "xpath://div[@class='layout-row']//md-select-value//span[@class='md-select-icon']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BY_CUST_EMAIL = "xpath://div[@class='md-text'][contains(text(),'Customer Email')]"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_CUST_EMAIL = "xpath://div[@class='ch-filters']//md-input-container//input"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_SEARCH = "xpath://button[@class='ch-filter-btn md-button md-ink-ripple']"

LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_RECORDS = "xpath://span[starts-with(text(),'Records')]/../.."

LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ROWS__PER_PAGE = "xpath://div[@class='ch-pagination-inner']//div[@class='ch-pagination-block']//md-select[@ng-model='pagination.recordsPerPage']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ROWS__PER_PAGE_ICON__SELECT = "xpath://div[@class='ch-pagination-block']//md-select[@ng-model='pagination.recordsPerPage']//span[@class='md-select-icon']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_NUM_ROWS__PER_PAGE = "xpath://div[@class='md-select-menu-container md-active md-clickable']//md-select-menu//md-content//md-option[@value=100]"

LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_PAGE = "xpath://div[@class='ch-pagination-inner']//div[@class='ch-pagination-block']//md-select[@ng-model='pagination.currentPage']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_PAGE_ICON__SELECT = "xpath://div[@class='ch-pagination-inner']//div[@class='ch-pagination-block']//md-select[@ng-model='pagination.currentPage']//md-select-value//span[@class='md-select-icon']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_CHOOSE_PAGE = "xpath:(//div[@class='md-select-menu-container md-active md-clickable']//md-select-menu//md-content//md-option[@ng-repeat='opts in pagination.currentPageOptions'])[last()]"

LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ICON_ADD_OF_CONTACT = "xpath:(//div[@ng-switch-when='true']//table[@class='widget__table widget__table--accessible']//tr[@ng-repeat-start='item in customerSearchResults track by $index']//td//button//div[@class='md-ripple-container'])[last()]"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_DATE_TIME_OF_CONTACT = "xpath:(//div[@ng-switch-when='true']//table[@class='widget__table widget__table--accessible']//tr[@ng-repeat-start='item in customerSearchResults track by $index']//td[1])[last()]"

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#***************                                 CustomerDetailsLocator                                  ***************

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#   ============== CUSTOMER DETAILS =============
# EMAIL_VAR = "XXX"
WORKCARD_ID_VAR = "${WORKCARD_ID}"
LOC_CUSTOMER_DETAIL_LINE_EMAIL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//a[@title='Open link in external email client']"
# LOC_CUSTOMER_DETAIL_LINE_EMAIL = "xpath://a[@ng-href='mailto:" + EMAIL_VAR +"']"
LOC_CUSTOMER_DETAIL_BTN_MORE_INFO = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@class='more-information-button md-button md-ink-ripple']"


#   ====== INTERACTION DETAILS ======
LOC_CUSTOMER_DETAIL_CHANEL_TYPE = "xpath://tr[@ng-if='context.channel']/td[2]"
LOC_CUSTOMER_DETAIL_SERVICE = "xpath://tr[@ng-if='context.topic']/td[2]"
LOC_CUSTOMER_DETAIL_DIRECTION = "xpath://tr[@ng-if='context.direction']/td[2]"
LOC_CUSTOMER_DETAIL_ORIGINAL_ADDRESS = "xpath://div[@class='widget widget--interaction-details']//*[@ng-if='context.originatingAddress']//td[2]"
# LOC_CUSTOMER_DETAIL_ORIGINAL_ADDRESS = "xpath://html/body/div[1]/div/div[1]/context-canvas/div[2]/div[1]/div[1]/div[2]/div/div/table/tbody/tr[7]/td[2]"

LOC_CUSTOMER_DETAIL_DESTINATION = "xpath://div[@class='widget__content--indented ps ps--active-x ps--active-y']//tr[@ng-if='context.destinationAddress']//td[2]"
# LOC_CUSTOMER_DETAIL_DIRECTION = "xpath://tr[@ng-if='context.direction']/td[2]"

#   ====== INTRINSICS ======
LOC_CUSTOMER_DETAIL_INTRINSIC_NAME = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR +"']//div[@ng-if='isIntrinsicPopulated']//table//tbody//tr//td[1]"
LOC_CUSTOMER_DETAIL_INTRINSIC_VALUE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR +"']//div[@ng-if='isIntrinsicPopulated']//table//tbody//tr//td[2]"
LOC_CUSTOMER_DETAIL_CONTACT_ID = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[1]//td[2]"
LOC_CUSTOMER_DETAIL_CONTACT_TYPE = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[2]//td[2]"
LOC_CUSTOMER_DETAIL_CONTACT_SIP_REQUEST_URI = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[3]//td[2]"
LOC_CUSTOMER_DETAIL_AD_CDN = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[4]//td[2]"
LOC_CUSTOMER_DETAIL_SIP_TO_ADDRESS = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[5]//td[2]"
LOC_CUSTOMER_DETAIL_SIP_DIALED_DN = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[7]//td[2]"
LOC_CUSTOMER_DETAIL_SIP_FROM_ADDRESS = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[14]//td[2]"
LOC_CUSTOMER_DETAIL_AD_CLID = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[15]//td[2]"

LOC_CUSTOMER_DETAIL_WIDGET_CONTENT = "xpath://div[@class='widget widget--interaction-details']"
LOC_CUSTOMER_DETAIL_WIDGET_HEADER = "xpath://h5[@class='widget__header aoc-interaction-details']"



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#***************                                   AgentToolbarLocator                                   ***************

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# FORMAT: LOC_{PAGE}_{TYPE_ELEMENT} = "{prefix}:{locator}"
# Prefix followed format of Selenium in Robot Framework

LOC_BTN_START_WORK = "xpath://button[@aria-label='Start Work']"
LOC_AGENT_STATE = "xpath://div[@title='Connected']"
# AGENT TOOLBAR

LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE = "xpath://*[@class='footer-label']"
#LOC_AGENT_TOOLBAR_BTN_DROP_DOWN_MENU = "id:ow_starting_work"
LOC_AGENT_TOOLBAR_BTN_START_WORK = "xpath://button[@puppeteer-id='start-work--dropdown-button']"
LOC_AGENT_TOOLBAR_BTN_READY = "xpath://button[@id='ow_go_ready']"
# LOC_AGENT_TOOLBAR_BTN_READY = "xpath://*[contains(text(), 'Go Ready')]"
LOC_AGENT_TOOLBAR_BTN_NOT_READY = "id:ow_go_not_ready"
LOC_AGENT_TOOLBAR_BTN_ACW = "id:ow_go_acw"
#puppeteer-id="go-not-ready--dropdown-button"

NOT_READY_CODE = "${NRD_CODE}"
LOC_AGENT_TOOLBAR_BTN_NOT_READY_CODE = "id:ow_not_ready_" + NOT_READY_CODE

ACW_CODE = "${ACW_CODE_VAR}"
LOC_AGENT_TOOLBAR_BTN_ACW_CODE = "id:ow_acw_" + ACW_CODE

#LOC_AGENT_TOOLBAR_BTN_NOT_READY_DEFAULT = "xpath://*[@id='ow_not_ready_Not_Ready_Default_Reason_Code']"
LOC_AGENT_TOOLBAR_TITLE_NRD_CODE = "xpath://div[@puppeteer-id='footer-reason-code--label']"

LOC_AGENT_TOOLBAR_TITLE_FOOTER = "xpath://div[@puppeteer-id='footer-state--label']"
LOC_AGENT_TOOLBAR_BTN_FINISH_WORK = "xpath://button[@puppeteer-id='finish-work--dropdown-button']"
LOC_AGENT_TOOLBAR_BTN_EXIT = "xpath://button[@ng-click='exit()']"

################################################
################# INTERACTION LOG ##############
################################################
LOC_AGENT_TOOLBAR_TXT_EXIT_NOTIFY = "xpath://button[@id='login-button']"
LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG = "xpath://button[@class='toolbar__button-icon aoc-worklog md-button md-ink-ripple']"
LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_MISSED = "xpath://md-tab-item//span[@class='missed']"
LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_CONTACT_TYPE_MISSED = "xpath://md-content[@puppeteer-id='interaction-log__missed-interaction-list']//md-card[1]//md-list-item//div[1]//span"
LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_CONTACT_MISSED = "xpath://md-content[@puppeteer-id='interaction-log__missed-interaction-list']//md-card[1]//md-list-item//div[1]//div"
LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_SKILL_CONTACT_MISSED = "xpath://md-content[@puppeteer-id='interaction-log__missed-interaction-list']//md-card[1]//md-list-item//div[1]//div//strong"

LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_INBOUND = "xpath://md-tab-item//span[@class='aoc-inbound']"
LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_CONTACT_TYPE_INBOUND = "xpath://md-content[@puppeteer-id='interaction-log__incoming-interaction-list']//md-card[1]//md-list-item//div[1]//span"
LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_CONTACT_INBOUND = "xpath://md-content[@puppeteer-id='interaction-log__incoming-interaction-list']//md-card[1]//md-list-item//div[1]//div"
LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_SKILL_CONTACT_INBOUND = "xpath://md-content[@puppeteer-id='interaction-log__incoming-interaction-list']//md-card[1]//md-list-item//div[1]//div//strong"


LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_OUTBOUND = "xpath://md-tab-item//span[@class='aoc-outbound']"

LOC_AGENT_TOOLBAR_TABLE_INTERACTION_LOG = "xpath://md-tab-content[@class='_md md-no-scroll md-active']"
LOC_AGENT_TOOLBAR_ICON_WC_INTERACTION_LOG = "xpath:"

LOC_AGENT_TOOLBAR_CARD_AGENT_ID = "xpath://*[@id='ow_Card_AgentId']//dl[1]//dd"
LOC_AGENT_TOOLBAR_CARD_STATION_ID = "xpath://*[@id='ow_Card_StationId']//dd"

LOC_AGENT_TOOLBAR_BTN_CREATE_EMAIL = "xpath://button[@aria-label='Create Email']"

######### AGENT CALLS OUT ###########
LOC_AGENT_TOOLBAR_IPT_PHONE = "xpath://input[@id='ow_enter_phone_number']"
LOC_AGENT_TOOLBAR_BTN_CALL_OUT = "xpath://button[@id='ow_search_button_call']"
LOC_AGENT_TOOLBAR_BTN_REDIAL = "xpath://button[@aria-label='Redial']"

######### SPERVISOR CALL ############
LOC_AGENT_TOOLBAR_BTN_SUPERVISOR_CALL = "xpath://button[@id='ow_call_supervisor']"

######### PHONEBOOK CALL OUT ############
LOC_AGENT_TOOLBAR_BTN_PHONEBOOK = "xpath://button[@id='ow_address_book_']"
# LOC_AGENT_TOOLBAR_IPT_PHONEBOOK_SEARCH = "xpath://input[@id='ow_search_contacts']"
LOC_AGENT_TOOLBAR_IPT_PHONEBOOK_SEARCH = "xpath://input[@puppeteer-id='search-contacts--input']"
# LOC_AGENT_TOOLBAR_PHONEBOOK_LIST = "xpath://cc-address-book//md-list[@puppeteer-id='address-book--members-list']"
AGENT_VAR = "${AGENTID}"
ID_AGENT = "${AGENTID}"
LOC_AGENT_TOOLBAR_PHONEBOOK_LIST = "xpath://cc-address-book//*[contains(text(),'" + AGENT_VAR + "')]"
# LOC_AGENT_TOOLBAR_BTN_PHONEBOOK_CALL = "xpath://cc-address-book//*[@id='ow_click_to_call']"
LOC_AGENT_TOOLBAR_BTN_PHONEBOOK_CALL = "xpath://cc-address-book//button[@aria-label='Click to call " + ID_AGENT + "']"
LOC_WORKSPACE_LABEL_SIGNIN = "xpath://div[@class='login-form-container layout-align-center-center layout-row']/h1/span"
#   ===== TIMER =====
LOC_AGENT_TOOLBAR_TIMER = "xpath://div[@id='ow_Icon_State2']//cc-timer"


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#***************                                      WebChatLocator                                     ***************

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# FORMAT: {PAGE}_{TYPE_VARIABLE}_{VARIABLE}
CHAT_MESSAGE_FROM_CUSTOMER = "Chat message from customer"
CHAT_MESSAGE_FROM_CUSTOMER_CONTENT_SPECIAL1 =   "https://google.com.vn"
CHAT_MESSAGE_FROM_CUSTOMER_CONTENT_SPECIAL2 =   "http://google.com.vn"

DYNAMIC_VARIABLE_COMFORT_MESSAGE_INDEX = "1"

DYNAMIC_VARIABLE_MESSAGE_ORDER = "${MESSAGE_ORDER}"


DYNAMIC_VARIABLE_LINK_DOWNLOAD_FILE = "${FILE_NAME}"

LOC_WEBCHAT_INIT_CHAT_BUTTON = "xpath://div[@id='chatPanel']//a"       #"id:chatPanel"
LOC_WEBCHAT_CUST_NAME = "id:user-chat"
#LOC_WEBCHAT_CUST_LAST_NAME = "id:user-chat-last"
LOC_WEBCHAT_CUST_EMAIL = "id:email-chat"
#LOC_WEBCHAT_CUST_COUNTRY_NUM = "id:phone-country"
#LOC_WEBCHAT_CUST_AREA_NUM = "id:phone-area"
#LOC_WEBCHAT_CUST_PHONE_NUM = "id:phone-chat"
#LOC_WEBCHAT_CUST_FIELD_TITLE = "id:customFieldTitle"
#LOC_WEBCHAT_CUST_FIELD_VALUE = "id:customFieldValue"
LOC_WEBCHAT_SKILLSET = "id:skillset-chat"
#????????????
CONTACT_SKILLSET_VAR =  "CUST_SKILLSET"
LOC_WEBCHAT_SELECT_SKILLSET = "xpath=//select[@id='skillset-chat']/option[@value=\'" + CONTACT_SKILLSET_VAR + "\']"
# LOC_WEBCHAT_SELECT_SKILLSET = "xpath=//select[@id='skillset-chat']/option[@value='WC_oanh1']"
#LOC_WEBCHAT_SELECT_DEFAULT_SKILLSET = "xpath=//select[@id='skillset-chat']/option[@value='WC_Default_Skillset']"
#LOC_WEBCHAT_SELECT_OANH1_SKILLSET = "xpath=//select[@id='skillset-chat']/option[@value='WC_Oanh1']"

LOC_WEBCHAT_CHECKBOX_EMAIL_TRANSCRIPT = "xpath://input[@type='checkbox' and @id='transcript-chat']"
LOC_WEBCHAT_CHAT_NOW_BUTTON = "id:openbutton-chat"

LOC_WEBCHAT_WINDOW_WELCOME_MESSAGE = "xpath://*[contains(text(), 'Login request received and approved')]"
LOC_WEBCHAT_WINDOW_CLOSE_BUTTON = "xpath://button[@id='closebutton-chat']"

LOC_WEBCHAT_WINDOW__TEXTBOX_MESSAGE = "xpath://input[@id='outmessage']"

LOC_WEBCHAT_WINDOW_MESSAGE_CONTENT_AGENT_LAST_MESSAGE = "xpath://div[@id='messages']//p[@class='response'][last()]/span[1]"
LOC_WEBCHAT_WINDOW_MESSAGE_CONTENT_AGENT_LAST_MESSAGE_AGENT_INFO = \
    "xpath://div[@id='messages']//p[@class = 'agentDate'][last()]/span[1]"
LOC_WEBCHAT_WINDOW_MESSAGE_CONTENT_AGENT_LAST_MESSAGE_DATETIME = \
    "xpath://div[@id='messages']//p[@class = 'agentDate'][last()]/span[5]"

CUST_LAST_MESSAGE = '//div[@id="messages"]//p[@class="sent"][last()]/span'
CUST_LAST_SYSTEM_MESSAGE = '//div[@id="messages"]//p[@class="system"][(last)]/span'
LOC_WEBCHAT_WINDOW_MESSAGE_CONTENT_CUST_LAST_MESSAGE = "xpath:" + CUST_LAST_MESSAGE
CUST_LAST_MESSAGE_INFO = "//div[@id='messages']//p[@class='date'][last()]/span"
LOC_WEBCHAT_WINDOW_MESSAGE_CONTENT_CUST_LAST_MESSAGE_INFO = "xpath:" + CUST_LAST_MESSAGE_INFO

LOC_WEBCHAT_CHAT_FIELD = "id:outmessage"
LOC_WEBCHAT_INT_URL = "xpath://input[@type='url']"
LOC_WEBCHAT_AGENT_LABEL = "xpath://div[@class='user']"

LOC_WEBCHAT_BTN_SEND_BUTTON = "id:sendbutton-chat"
LOC_WEBCHAT_BTN_SEND_URL = "xpath://button[@id='sendurl-chat']"
LOC_WEBCHAT_AGENT_RESPONSE = \
   "xpath:(//div[@id='chatInterface']/div[@id='messages']/p[@class='response'])[" + DYNAMIC_VARIABLE_COMFORT_MESSAGE_INDEX + "]"

# LOC_WEBCHAT_CONFIG_ATTRIBUTE_LIST_BUTTON = 'xpath://table[contains(@id, "attributesTable")]//td//button'
LOC_WEBCHAT_WINDOW_CHAT = "xpath://div[@id='messages']//p"
LOC_WEBCHAT_WINDOW_URL = "xpath://div[@id='messages']//a"
LOC_WEBCHAT_WINDOW_ON_HOLD_URL_GROUP = "xpath://*[@id='messages']/p[3]/span[1]"
LOC_WEBCHAT_WINDOW_ON_HOLD_URL_MESSAGE = "xpath://*[@id='messages']/p[3]/span[3]/a"
LOC_WEBCHAT_WINDOW_ON_HOLD_URL_NUMBER = "xpath://*[@id='messages']/p/span/a"

LOC_WEBCHAT_MESSAGE = 'xpath://div[@id="messages"]//p['+ DYNAMIC_VARIABLE_MESSAGE_ORDER +']/span'
LOC_WEBCHAT_LAST_SYSTEM_MESSAGE='xpath://div[@id="messages"]//p[@class="system"][last()]/span'

LOC_WEBCHAT_ON_HOLD_MESSAGE_TEXT = "xpath://*[@id='messages']/p[3]"

LOC_WEBCHAT_LIST_OF_SYSTEM_MESSAGE = "xpath://div[@id='chatInterface']/div[@id='messages']/p[@class='system']"
LOC_WEBCHAT_LIST_OF_CUSTOMER_MESSAGE = "xpath://div[@id='chatInterface']/div[@id='messages']/p[@class='sent']"
# LOC_WEBCHAT_LIST_OF_AGENT_MESSAGE = "xpath://div[@id='chatInterface']/div[@id='messages']/p[@class='response']"
LOC_WEBCHAT_LIST_OF_AGENT_MESSAGE = "xpath://div[@id='chatInterface']/div[@id='messages']"
LOC_WEBCHAT_FIRST_PRECEDING_AGENT_DATE = "xpath:(//div[@id='chatInterface']/div[@id='messages']/p[@class='response'])[" + DYNAMIC_VARIABLE_MESSAGE_ORDER + "]//preceding::p[@class='agentDate'][1]"
LOC_WEBCHAT_FIRST_PRECEDING_CUSTOMER_DATE = "xpath:(//div[@id='chatInterface']/div[@id='messages']/p[@class='sent'])[" + DYNAMIC_VARIABLE_MESSAGE_ORDER + "]//preceding::p[@class='date'][1]"
LOC_WEBCHAT_FIRST_PRECEDING_SYSTEM_DATE = "xpath:(//div[@id='chatInterface']/div[@id='messages']/p[@class='system'])[" + DYNAMIC_VARIABLE_MESSAGE_ORDER + "]/preceding::p[@class='agentDate'][1]"

LOC_WORKSPACE_WIDGET_CHAT_MESSAGE_CONTENT_AGENT_LAST_MESSAGE_HAVING_MAIL_TO = "//*[@class='response'][last()]/span[contains(text(), 'mailto')]"

LOC_WEBCHAT_LINK_DOWNLOAD = "xpath://*[@id='messages']//span[contains(text(), '"+ DYNAMIC_VARIABLE_LINK_DOWNLOAD_FILE +"')]/../span/a"

LOC_WEBCHAT_AGENT_LINK_DOWNLOAD = "xpath://*[@id='tabs']//a[contains(text(), '"+ DYNAMIC_VARIABLE_LINK_DOWNLOAD_FILE +"')]"

# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# ***************                                OneXCommunicatorLocator                                  ***************

# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

WORKCARD_ID_VAR = "${WORKCARD_ID}"
#   EMAIL
LOC_WIDGETEMAIL_WORKCARD = "xpath://card-container[@interaction-direction='OUTGOING']"
LOC_WIDGETEMAIL_BTN_CHOOSE_SKILLSET = "xpath://div[@id='ow_Email_Outbound_From']//md-select-value[@class='md-select-value']"
LOC_WIDGETEMAIL_BTN_CHOOSE_SKILLSET_LIST = "xpath://md-select-menu[@class='_md md-overflow']//md-option//div"
LOC_WIDGETEMAIL_BTN_CHOOSE_SKILLSET_LIST_ELEMENT = "xpath://md-select-menu[@class='_md md-overflow']//md-option"

LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_TO = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//input[@id='ow_Email_Field_To']"
LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_TO_REPLY = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@class='md-chip-content _md-chip-content-edit-is-enabled']//span"
LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_CC = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//input[@id='ow_Email_Field_CC']"
LOC_WIDGETEMAIL_IPT_SUBJECT_EMAIL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//input[@id='ow_Email_Field_Subject']"
LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL1 = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']"
LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div[1]"
LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_LINE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']/div"
LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_LINE_REPLY = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div"
LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_SUGGEST = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div[2]"
LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_LINK = "xpath://div[@id='email--textarea']//div//a"
LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_PLAIN = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//textarea[@aria-label='Email signature text editor']//div[1]"
# LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_PLAIN = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//textarea[@aria-label='Email signature text editor']"

LOC_WIDGETEMAIL_BTN_SEND_EMAIL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@puppeteer-id='email-send--button']"
LOC_WIDGETEMAIL_BTN_CANCEL_SEND_EMAIL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@puppeteer-id='cancel-button--email-widget']"
LOC_WIDGETEMAIL_BTN_END_INTERACTION = "xpath://div[@class='md-dialog-container']//md-dialog//button[@class='md-primary md-confirm-button md-button md-ink-ripple md-default-theme']"

LOC_WIDGETEMAIL_BTN_SEND_REPLY_EMAIL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@puppeteer-id='email-send--button']"
LOC_WIDGETEMAIL_BTN_ATTACH_FILE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@puppeteer-id='email-attach-file-button']"
LOC_WIDGETEMAIL_BTN_SELECT_FILE_ATTACH = "xpath://button[@cc-choose-file-button='add-new-file']"
LOC_WIDGETEMAIL_BTN_UPLOAD_ALL_ATTACH = "xpath://button[@puppeteer-id='email-upload-all-button']"
LOC_WIDGETEMAIL_ERROR_MESSAGE_UPLOAD = "xpath://span[@class='toast__heading--text']"

LOC_WIDGETEMAIL_BTN_REPLY_EMAIL = "xpath://button[@ng-click='reply()']"
LOC_WIDGETEMAIL_BTN_REPLY_ALL_EMAIL = "xpath://button[@ng-click='replyAll()']"
LOC_WIDGETEMAIL_BTN_INSERT_EMAIL_SIGNATURE = "xpath://*[@ng-click='includeSignature()']"

LOC_WIDGETEMAIL_SHOW_ATTACHMENT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@class='file-attachment__name flex-auto']"

LOC_WIDGETEMAIL_RECEIVE_SUBJECT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@class='email-info__subject email-no-hide-whitespaces']"
LOC_WIDGETEMAIL_RECEIVE_TO = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//span[@class='email-addresses__label']//strong"
LOC_WIDGETEMAIL_RECEIVE_FROM = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//span[@class='email-addresses__label email-addresses__label--teal']"
LOC_WIDGETEMAIL_RECEIVE_CONTENT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div//p"
# LOC_WIDGETEMAIL_RECEIVE_CONTENT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']"

# EMAIL TEMPLATE
EMAIL_TEMPLATE_NAME = "TEMPLATE"
LINE_EMAIL_TEMPLATE = "LINE"
LOC_WIDGETEMAIL_IPT_SEARCH_TEMPLATE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//input[@placeholder='Search Templates and Categories...']"
LOC_WIDGETEMAIL_IPT_SEARCH_TEMPLATE_NEW_EMAIL = "xpath://input[@placeholder='Search Templates and Categories...']"
LOC_WIDGETEMAIL_SELECT_EMAIL_TEMPLATE_GROUP = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@puppeteer-id-name='template-list-item__item-name:" + EMAIL_TEMPLATE_NAME + "'][@puppeteer-id__email-templates_resource-type='GROUP']"
LOC_WIDGETEMAIL_SELECT_EMAIL_TEMPLATE_MIME = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@puppeteer-id-name='template-list-item__item-name:" + EMAIL_TEMPLATE_NAME + "'][@puppeteer-id__email-templates_resource-type='MIME']"
LOC_WIDGETEMAIL_BTN_INSERTT_TEMPLATE = LINE_EMAIL_TEMPLATE + "//button[@aria-label='Insert']"
LOC_WIDGETEMAIL_BTN_PREVIEW_TEMPLATE = LINE_EMAIL_TEMPLATE + "//button[@aria-label='Preview']"
LOC_WIDGETEMAIL_BTN_CANCEL_PREVIEW_TEMPLATE = "xpath://button[@puppeteer-id='template-details__cancel-button']"
LOC_WIDGETEMAIL_TEMPLATE_NAME = "xpath://div[@ng-if='isTemplateView']//div[@layout-align='space-between center']//h3"
LOC_WIDGETEMAIL_TEMPLATE_SUBJECT = "xpath://div[@ng-if='isTemplateView']//div[@class='details layout-row']//span//span"
LOC_WIDGETEMAIL_TEMPLATE_CONTENT = "xpath://div[@ng-if='isTemplateView']//div[@id='email--textarea']//div"

# LOC_WIDGETEMAIL_BOLD = "xpath://button[@aria-label='Bold']"
# LOC_WIDGETEMAIL_ITALIC = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Italic']"
# LOC_WIDGETEMAIL_UNDERLINE = "xpath://button[@aria-label='Underline']"
# LOC_WIDGETEMAIL_NUMBER_LIST = "xpath://button[@aria-label='Insert Numbered List']"
# LOC_WIDGETEMAIL_INSERT_LIST = "xpath://button[@aria-label='Insert List']"
# LOC_WIDGETEMAIL_QUOTE = "xpath://button[@aria-label='Quote']"
# LOC_WIDGETEMAIL_INSERT_LINK = "xpath://button[@aria-label='Insert Link']"
# LOC_WIDGETEMAIL_ALIGN_LEFT = "xpath://button[@aria-label='Align Left']"
# LOC_WIDGETEMAIL_ALIGN_CENTER = "xpath://button[@aria-label='Align Center']"
# LOC_WIDGETEMAIL_ALIGN_RIGHT = "xpath://button[@aria-label='Align Right']"
# LOC_WIDGETEMAIL_ALIGN_UNDO = "xpath://button[@aria-label='Undo']"
# LOC_WIDGETEMAIL_ALIGN_REDO = "xpath://button[@aria-label='Redo']"
# LOC_WIDGETEMAIL_INSERT_IMAGE = "xpath://button[@aria-label='Insert Image']"
# LOC_WIDGETEMAIL_ADD_BCC = "xpath://a[@ng-click='toggleBcc()']"
# LOC_WIDGETEMAIL_REMOVE_BCC = "xpath://a[@ng-click='toggleBcc()']"
# LOC_WIDGETEMAIL_INPUT_BCC = "xpath://input[@class='email-address-input-row_bcc dir_ltr dir_aligned md-input']"

LOC_WIDGETEMAIL_BOLD = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Bold']"
LOC_WIDGETEMAIL_ITALIC = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Italic']"
LOC_WIDGETEMAIL_UNDERLINE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Underline']"
LOC_WIDGETEMAIL_NUMBER_LIST = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Insert Numbered List']"
LOC_WIDGETEMAIL_INSERT_LIST = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Insert List']"
LOC_WIDGETEMAIL_QUOTE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Quote']"
LOC_WIDGETEMAIL_INSERT_LINK = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Insert Link']"
LOC_WIDGETEMAIL_IPT_EDIT_TEXT_LINK = "xpath://input[@id='edit-text']"
LOC_WIDGETEMAIL_IPT_EDIT_LINK = "xpath://input[@id='edit-link']"
LOC_WIDGETEMAIL_BTN_INSERT_LINK = "xpath://button[@puppeteer-id='insert-link-button--insert-link']"
LOC_WIDGETEMAIL_ALIGN_LEFT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Align Left']"
LOC_WIDGETEMAIL_ALIGN_CENTER = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Align Center']"
LOC_WIDGETEMAIL_ALIGN_RIGHT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Align Right']"
LOC_WIDGETEMAIL_ALIGN_UNDO = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Undo']"
LOC_WIDGETEMAIL_ALIGN_REDO = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Redo']"
LOC_WIDGETEMAIL_INSERT_IMAGE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Insert Image']"
LOC_WIDGETEMAIL_DISPLAY_INLINE_IMAGE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//img"

LOC_WIDGETEMAIL_BTN_UPLOAD_IMAGE = "xpath://button[@cc-choose-file-button='upload-new-file']"
LOC_WIDGETEMAIL_WARNING_MESS_UPLOAD_IMAGE = "xpath://div[@class='aoc-warning-filled error-msg']//span//span"
LOC_WIDGETEMAIL_BTN_INSERT_INLINE_IMAGE = "xpath://button[@class='md-primary md-button_high-contrast md-raised md-button md-ink-ripple']"
LOC_WIDGETEMAIL_BTN_DELETE_INLINE_IMAGE = "xpath://button[@class='md-primary md-button_high-contrast md-raised margin-right md-button md-ink-ripple']"
LOC_WIDGETEMAIL_BTN_EXIT_UPLOAD_IMAGE_WINDOW = "xpath://i[@aria-label='Cancel']"
LOC_WIDGETEMAIL_CHOOSE_SELECTED_IMAGE = "xpath://md-grid-tile[@puppeteer-id='image-pool__image']"

LOC_WIDGETEMAIL_VERIFY_CONTENT_BOLD = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//b"
LOC_WIDGETEMAIL_VERIFY_CONTENT_ITALIC = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//i"
LOC_WIDGETEMAIL_VERIFY_CONTENT_UNDERLINE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//u"
LOC_WIDGETEMAIL_VERIFY_CONTENT_NUMBER_LIST = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//ol//li"
LOC_WIDGETEMAIL_VERIFY_CONTENT_INSERT_LIST = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//ul//li"
LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_8 = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div//span[@style='font-size:8pt']"
LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_12 = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div//span[@style='font-size:12pt']"
LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_14 = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div//span[@style='font-size:14pt']"
LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_16 = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div//span[@style='font-size:16pt']"
LOC_WIDGETEMAIL_VERIFY_ALIGN_LEFT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div[@class=' align-left']"
LOC_WIDGETEMAIL_VERIFY_ALIGN_CENTER = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div[@class=' align-center']"
LOC_WIDGETEMAIL_VERIFY_ALIGN_RIGHT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div[@class=' align-right']"


LOC_WIDGETEMAIL_ADD_BCC = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//a[@ng-click='toggleBcc()']"
LOC_WIDGETEMAIL_REMOVE_BCC = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//a[@ng-click='toggleBcc()']"
LOC_WIDGETEMAIL_INPUT_BCC = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//input[@class='email-address-input-row_bcc dir_ltr dir_aligned md-input']"

LOC_WIDGETEMAIL_IPT_SEARCH_SUGGEST = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//input[@ng-model='suggestedResponsesQuery.text']"
LOC_WIDGETEMAIL_IPT_CHOOSE_SUGGEST = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@puppeteer-index-id='suggested-content__response-phrase-0']"

LOC_WIDGETEMAIL_FOUND_MATCHES = "xpath://md-content/md-virtual-repeat-container//div[@class='template-name flex']"
def attach_file(attachment_name):
    Insert_Window = uiautomation.WindowControl(Name="Open")
    Insert_Window.SetFocus()

    file_name = Insert_Window.EditControl(Name="File name:")
    # file_name.SendKey(attachment_name)
    file_name.SendKeys(attachment_name)
    time.sleep(1)
    btn_file_type = Insert_Window.ComboBoxControl(Name="Files of type:")
    btn_Insert = btn_file_type.GetNextSiblingControl()
    time.sleep(1)
    btn_Insert.Click()
    time.sleep(3)


def verify_download_attachment(attachment_name):
    # open File Explorer
    subprocess.Popen(r'explorer')
    Explorer_Window = uiautomation.WindowControl(Name="File Explorer", searchDepth=1)
    Explorer_Window.SetFocus()
    Address_toolbar = Explorer_Window.ToolBarControl(Name="Address: Quick access")
    Address_toolbar.Click()
    Address_edit = Explorer_Window.EditControl(Name="Address")
    Address_edit.SendKeys('Downloads')
    Address_edit.SendKeys('{Enter}')
    time.sleep(1)

    lst_item = Explorer_Window.ListControl(searchDepth=6, ClassName="UIItemsView")
    temp = lst_item.GetGridPattern()
    temp_value = temp.RowCount
    for i in range(1, temp_value + 1):
        item = lst_item.ListItemControl(searchDepth=1, foundIndex=i)
        item_name = item.GetValuePattern().Value
        if (item_name == attachment_name):
            return "true"
    return "false"

def delete_download_attachment(attachment_name):
    Explorer_Window = uiautomation.WindowControl(Name="Downloads")
    Explorer_Window.SetFocus()
    lst_item = Explorer_Window.ListControl(searchDepth=6, ClassName="UIItemsView")
    temp = lst_item.GetGridPattern()
    temp_value = temp.RowCount
    for i in range(1, temp_value + 1):
        item = lst_item.ListItemControl(searchDepth=1, foundIndex=i)
        item_name = item.GetValuePattern().Value
        if (item_name == attachment_name):
            item.Click()
            item.SendKeys('{DEL}')
            break
    # close File Explorer window
    Explorer_Window.SendKeys('{Alt}' '{F4}')

def close_file_explorer_window():
    Explorer_Window = uiautomation.WindowControl(Name="Downloads")
    Explorer_Window.SetFocus()
    Explorer_Window.SendKeys('{Alt}' '{F4}')


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#***************                                OneXCommunicatorLocator                                  ***************

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


# Author: Oanh Ho
# Created date: 17/02/2020

def check_error():
    # Wait and click OK on Audio Error message if it is displayed.
    while uiautomation.WindowControl(Name="WindowMessageBox").Exists(3):
        uiautomation.WindowControl(Name="WindowMessageBox").ButtonControl(Name="OK").Click()

def click_setting():
    OneX_Window = uiautomation.WindowControl(Name = "Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    time.sleep(1)
    btn_Menu = OneX_Window.ButtonControl(AutomationId="ButtonMenu")
    time.sleep(1)
    btn_Menu.Click()
    choose_logout = OneX_Window.MenuItemControl(Name="Log Out")
    # logout phone if it is login before
    if choose_logout.Exists(2):
        choose_logout.Click()
        time.sleep(1)
        OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
        OneX_Window.SetFocus()
        btn_Menu = OneX_Window.ButtonControl(AutomationId="ButtonMenu")
        time.sleep(1)
        btn_Menu.Click()
    # click setting
    choose_setting = OneX_Window.MenuItemControl(Name = "Settings")
    choose_setting.Click()

    audio_error = uiautomation.WindowControl(Name="WindowMessageBox")

    # Wait and click OK on Audio Error message if it is displayed.
    while uiautomation.WindowControl(Name="WindowMessageBox").Exists(5):
        uiautomation.WindowControl(Name="WindowMessageBox").ButtonControl(Name="OK").Click()

def setting_onex(phone_num, password_onex, CM_server):
    Setting_general = uiautomation.WindowControl(Name = "WindowSettingsGeneral")
    Setting_general.SetFocus()

    # add Extension
    extension = Setting_general.EditControl(ClassName = "TextBox")
    extension.SetFocus()
    extension.SendKeys('{Ctrl}' '{A}')
    extension.SendKeys('{DEL}')
    extension.SendKeys(phone_num)

    #add password
    pass_onex = uiautomation.EditControl(ClassName = "PasswordBox")
    pass_onex.SetFocus()
    pass_onex.SendKeys('{Ctrl}' '{A}')
    pass_onex.SendKeys('{DEL}')
    pass_onex.SendKeys(password_onex)

    # Clean old Server IP
    list_server = Setting_general.ListControl(AutomationID="ListBoxControllers")
    list_server.SetFocus()
    child_list_server = Setting_general.ListItemControl(Name="onexcui.ViewModel.WindowControllerViewModel")
        # remove all old server
    while child_list_server.Exists(3):
        child_list_server.Click()
        btn_remove = Setting_general.ButtonControl(Name="Remove")
        btn_remove.Click()

    #add server IP
       #click add button
    btn_add = Setting_general.ButtonControl(Name =	"Add")
    btn_add.Click()
        #add IP
    Window_add = uiautomation.WindowControl(Name = "Add Server")
    Window_add.SetFocus()
    add_CM = Window_add.EditControl(ClassName = "TextBox")
    add_CM.SendKeys(CM_server)
        #click ok
    btn_ok_ip = Window_add.ButtonControl(ClassName = "Button")
    btn_ok_ip.SetFocus()
    btn_ok_ip.Click()

    while uiautomation.WindowControl(Name="WindowMessageBox").Exists(3):
        uiautomation.WindowControl(Name="WindowMessageBox").ButtonControl(Name="OK").Click()

    #click OK_General Setting
    Setting_general = uiautomation.WindowControl(Name = "WindowSettingsGeneral")
    Setting_general.SetFocus()
    btn_ok = Setting_general.ButtonControl(Name = "OK")
    btn_ok.SetFocus()
    btn_ok.Click()

    while uiautomation.WindowControl(Name="WindowMessageBox").Exists(3):
        uiautomation.WindowControl(Name="WindowMessageBox").ButtonControl(Name="OK").Click()

def click_login():
    Win_one = uiautomation.WindowControl(ClassName = "Window")
    Win_one.SetFocus()
    btn_login = Win_one.ButtonControl(Name = "Log In")
    btn_login.Click()

    # # verify login
    Win_login = uiautomation.WindowControl(Name = "Avaya one-X® Communicator")
    if not Win_login.Exists():
        raise valueError ("Cannot login One_x")

    while uiautomation.WindowControl(Name="WindowMessageBox").Exists(3):
        uiautomation.WindowControl(Name="WindowMessageBox").ButtonControl(Name="OK").Click()

def click_logout():
    OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    onex_call = uiautomation.PaneControl(ClassName="ScrollViewer")
    onex_call.SetFocus()
    btn_setting = uiautomation.ButtonControl(AutomationId="ButtonMenu")
    btn_setting.Click()
    Menu = uiautomation.MenuControl(ClassName="ContextMenu")
    Menu.SetFocus()
    choose_logout = Menu.MenuItemControl(Name="Log Out")
    choose_logout.Click()

def click_exit():
    OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    OneX_Window.SendKeys('{Alt}' '{F4}')
    # time.sleep(1)
    # btn_Menu = OneX_Window.ButtonControl(AutomationId="ButtonMenu")
    # btn_Menu.Click()
    # Menu = uiautomation.MenuControl(ClassName="ContextMenu")
    # Menu.SetFocus()
    # choose_logout = Menu.MenuItemControl(Name="Exit")
    # choose_logout.Click()

def call_out(phone_num):
    # OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    # OneX_Window.SetFocus()
    onex_call = uiautomation.PaneControl(ClassName = "ScrollViewer")
    onex_call.SetFocus()
    input_num = onex_call.EditControl(AutomationId = "TextBoxSearch")
    input_num.SetFocus()
    input_num.SendKeys(phone_num + '{Enter}')
    # extension.SendKeys('{Ctrl}' '{A}')
    # extension.SendKeys('{DEL}')

def call_accept():
    OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    onex_call = uiautomation.PaneControl(ClassName = "ScrollViewer")
    onex_call.SetFocus()
    btn_accept = onex_call.ButtonControl(AutomationId = "ButtonHold")
    btn_accept.Click()

def end_call():
    OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    # onex_call = uiautomation.PaneControl(ClassName = "ScrollViewer")
    # onex_call.SetFocus()
    btn_end = OneX_Window.ButtonControl(AutomationId = "ButtonEnd")
    btn_end.SetFocus()
    btn_end.Click()

def hold_call():
    OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    onex_call = uiautomation.PaneControl(ClassName="ScrollViewer")
    onex_call.SetFocus()
    btn_end = onex_call.ButtonControl(AutomationId="ButtonHold")
    btn_end.Click()

def unhold_call():
    OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    onex_call = uiautomation.PaneControl(ClassName="ScrollViewer")
    onex_call.SetFocus()
    btn_end = onex_call.ButtonControl(AutomationId="ButtonHold")
    btn_end.Click()


def close_onex():
    OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    time.sleep(1)
    btn_Menu = OneX_Window.ButtonControl(AutomationId="ButtonClose")
    time.sleep(1)
    btn_Menu.Click()

#
#
# def open_one_x_communicator(self, one_x_path):
#     app = Application(backend="uia").start(r"" + one_x_path)
#     onex = app.window(best_match=ONEX_COMMUNICATOR)
#     onex.wait("visible", 30)
#
#     # Author: Phuc Hoang
#     # Created Date: 08/14/2018
# def __get_onex_application(self):
#     return Application(backend="uia").connect(title_re=ONEX_COMMUNICATOR_TITLE)
#
#     # Author: Phuc Hoang
#     # Created Date: 08/14/2018
# def __get_onex_communicator(self):
#         app = Application(backend="uia").connect(title_re=ONEX_COMMUNICATOR_TITLE)
#         return app.window(best_match=ONEX_COMMUNICATOR)
#
#     # Author: Phuc Hoang
#     # Created Date: 08/14/2018
#     # Click button number in onex
#     # Variable:
#     #       number: / Ex 1, 2, 3, 4, 5
# def __click_button_number(self, number):
#     onex = self.__get_onex_communicator()
#     if number == '0':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_ZERO).click()
#     elif number == '1':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_ONE).click()
#     elif number == '2':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_TWO).click()
#     elif number == '3':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_THREE).click()
#     elif number == '4':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_FOUR).click()
#     elif number == '5':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_FIVE).click()
#     elif number == '6':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_SIX).click()
#     elif number == '7':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_SEVEN).click()
#     elif number == '8':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_EIGHT).click()
#     elif number == '9':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_NINE).click()
#
# def add_servers_for_h323(server_urls):
#     # Click menu setting
#     onex = uiautomation.WindowControl(AutomationID="Window")
#     onex.SetFocus()
#     onex.child_window(auto_id=ONEX_LOGIN_MENU).Click()
#     onex.child_window(auto_id=ONEX_LOGIN_MENU_SETTING).Click()
#     # windowOnexC.ButtonControl(AutomationId="ButtonMenu").Click()
#     # contextMenu = windowOnexC.PaneControl(AutomationId="ContextMenuScrollViewer")
#     # contextMenu.MenuItemControl(AutomationId="MenuItemSettingsGeneral").Click()
#
#         # Close error message box
#     audio_error = uiautomation.WindowControl(best_match=ONEX_COMMUNICATOR_MESSAGE_BOX)
#     if audio_error.exists(2):
#         audio_error.child_window(auto_id=ONEX_COMMUNICATOR_MESSAGE_BOX_BTN_OK).click()
#         audio_error.child_window(auto_id=ONEX_COMMUNICATOR_MESSAGE_BOX_BTN_OK).click()
#
#             # # Check and click OK if Audio Error displays
#             # while automation.WindowControl(Name="WindowMessageBox").Exists(5):
#             #     automation.WindowControl(Name="WindowMessageBox").TextControl(Name="OK").Click()
#
#
#         # Click Telephony
#     generel_settings = onex.child_window(best_match=ONEX_LOGIN_MENU_SETTING)
#     generel_settings.child_window(auto_id=ONEX_LOGIN_SETTINGS_TELEPHONY).select()
#
#         # Click H.323
#     generel_settings.child_window(best_match=ONEX_LOGIN_SETTINGS_TELEPHONY_H323).select()
#
#         # Clear Server
#     server_list = generel_settings.child_window(auto_id=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_LIST, control_type="List")
#     server_count = server_list.item_count()
#     for i in range(server_count):
#         server_list.child_window(best_match="ListItem" + str((i + 1))).select()
#         generel_settings.child_window(best_match=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_BTN_REMOVE).click()
#
#         # Add Servers
#     for server_url in server_urls:
#         generel_settings.child_window(best_match=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_BTN_ADD).click()
#         generel_settings.window(best_match=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_DIALOG)\
#             .child_window(best_match=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_EDT_SERER_URL)\
#             .set_edit_text(server_url)
#         generel_settings.window(best_match=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_DIALOG)\
#             .child_window(best_match=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_BTN_OK).click()
#
#         # Verify servers is in list
#     server_list = generel_settings.child_window(auto_id=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_LIST, control_type="List")
#     for server_url in server_urls:
#         server_list.child_window(title=str(server_url)).is_visible()
#
#         # Click OK to save configuration and close settings
#     generel_settings.window(best_match=ONEX_LOGIN_SETTINGS_BTN_OK).click()
#     if audio_error.exists(2):
#         audio_error.child_window(auto_id=ONEX_COMMUNICATOR_MESSAGE_BOX_BTN_OK).click()
#
#     # Author: Phuc Hoang
#     # Created Date: 08/14/2018
#     # Login Station
#     # Variable:
#     #       station: station number
#     #       password: password
# def login_station(self, station, password):
#     app = self.__get_onex_application()
#     onex = self.__get_onex_communicator()
#
#         # Input station number and password
#     onex.child_window(auto_id=ONEX_LOGIN_EDT_STATION).set_edit_text(station)
#     onex.child_window(auto_id=ONEX_LOGIN_EDT_PASSWORD).set_edit_text(password)
#
#         # Click Button Login
#     onex.child_window(best_match=ONEX_LOGIN_BTN_LOGIN).click()
#
#         # Close Audio Error
#     audio_error = app.window(best_match=ONEX_COMMUNICATOR_MESSAGE_BOX)
#     if audio_error.exists(2):
#         audio_error.child_window(auto_id=ONEX_COMMUNICATOR_MESSAGE_BOX_BTN_OK).click()
#         audio_error.child_window(auto_id=ONEX_COMMUNICATOR_MESSAGE_BOX_BTN_OK).click()
#
#         # Verify login successfully
#     logged_station_name = onex.child_window(auto_id=ONEX_BLOCK_USER_NAME).legacy_properties()['Name']
#     if logged_station_name != station:
#         raise Exception("Login Station Unsuccessfully")
#
#     # Author: Phuc Hoang
#     # Created Date: 08/14/2018
#     # Make call to station
#     # Variable: station_number
# def make_call_to_station(self, station_number):
#         # Connect onex c
#     onex = self.__get_onex_communicator()
#
#         # Input phone number
#     onex.child_window(auto_id=ONEX_EDT_PHONE_NUMBER_OR_NAME_SEARCH).set_edit_text(station_number)
#     onex.child_window(auto_id=ONEX_BTN_DIAL).click()
#
#         # Verify make call success
#     onex.child_window(auto_id=ONEX_BTN_HOLD).is_visible()
#
#     # Author: Phuc Hoang
#     # Created Date: 08/14/2018
#     # Make call to oceana system
#     # Variable:
#     #       oceana_number: phone number of oceana system
#     #       customer_id: customer id
#     #       service:    / Ex 1
#     #       attributes: list of attributes / Ex: [1 , 3 , 5]
#     # ONGOING: PHUC HOANG
# def make_call_to_oceana(self, oceana_number, account_num, request_service, department, language):
#         # Connect onex c
#     onex = self.__get_onex_communicator()
#
#         # Input phone number
#     onex.child_window(auto_id=ONEX_EDT_PHONE_NUMBER_OR_NAME_SEARCH).set_edit_text(oceana_number)
#
#         # Press call number
#     onex.child_window(auto_id=ONEX_BTN_DIAL).click()
#
#         # Show Dial Pad
#     dial_pad = onex.child_window(auto_id=ONEX_BTN_DIAL_PAD)
#     dial_pad_tooltip = dial_pad.legacy_properties()['Help']
#     print(dial_pad_tooltip)
#     if dial_pad_tooltip == 'Show Dialpad':
#         dial_pad.click()
#
#     time.sleep(3)
#
#         # Pick account number
#     self.__click_button_number(account_num)
#     time.sleep(5)
#
#         # Pick service number
#     self.__click_button_number(request_service)
#     time.sleep(5)
#
#         # Pick department number
#     self.__click_button_number(department)
#     time.sleep(5)
#
#         # Pick language number
#     self.__click_button_number(language)
#
# def kill_onex(self):
#     app = Application(backend="uia").connect(title_re=ONEX_COMMUNICATOR_TITLE)
#     app.kill()
#
#
#
#
# def login_onex(extension, extensionpw):
#     launch_onex()
#     windowOnexC = automation.WindowControl(Name="Avaya one-X® Communicator")
#     windowOnexC.ImageControl(AutomationId="PART_img_over").SetFocus()
#         # Click Menu/Settings
#     windowOnexC.ButtonControl(AutomationId="ButtonMenu").Click()
#     contextMenu = windowOnexC.PaneControl(AutomationId="ContextMenuScrollViewer")
#     contextMenu.MenuItemControl(AutomationId="MenuItemSettingsGeneral").Click()
#        # Check and click OK if Audio Error displays
#     while automation.WindowControl(Name="WindowMessageBox").Exists(5):
#         automation.WindowControl(Name="WindowMessageBox").TextControl(Name="OK").Click()
#
#         # Input extension and password
#     windowsettings = automation.WindowControl(Name="WindowSettingsGeneral")
#     usercontrolsettings = windowsettings.CustomControl(ClassName="UserControlSettingsPhone")
#     usercontrolsettings.EditControl(AutomationId="TextBoxExtension").SetValue(extensionValue)
#     usercontrolsettings.EditControl(AutomationId="TextBoxPassword").SetValue(extensionPw)
#
#         # Click Ok button
#     windowsettings.ButtonControl(Name="OK").Click()
#      # Wait and click OK on Audio Error message if it is displayed.
#     while automation.WindowControl(Name="WindowMessageBox").Exists(5):
#         automation.WindowControl(Name="WindowMessageBox").TextControl(Name="OK").Click()
#
#         # Click Log In button
#     windowOnexC.ButtonControl(Name="Log In").Click()
#
#         # Wait and click OK on Audio Error message if it is displayed.
#     while automation.WindowControl(Name="WindowMessageBox").Exists(5):
#         automation.WindowControl(Name="WindowMessageBox").TextControl(Name="OK").Click()
#         # Verify if Onex is logged in successfully.
#     if automation.WindowControl(Name="Avaya one-X® Communicator").Exists(5):
#         return True
#     else:
#         return False
#
#


# if __name__ == '__main__':
#     onex = OneXCommunicator()
#     onex.open_one_x_communicator("C:\Program Files\Avaya\Avaya one-X Communicator\onexcui.exe")
#     list = ["10.128.228.103", "10.128.228.119"]
#     onex.add_servers_for_h323(list)
#     onex.login_station("7000156", "12345678")
#     onex.make_call_to_oceana("8088000","1","1","3","4")
#     #onex.kill_onex()
#     pass

# Application
ONEX_COMMUNICATOR_TITLE = 'Avaya one-X® Communicato'
ONEX_COMMUNICATOR = 'Avayaone-X®CommunicatorDialog'

# ERROR MESSAGE BOX
ONEX_COMMUNICATOR_MESSAGE_BOX = 'MessageBox'
ONEX_COMMUNICATOR_MESSAGE_BOX_BTN_OK = 'ButtonOk'

# OneX Login
ONEX_LOGIN_MENU = "ButtonMenu"
ONEX_LOGIN_MENU_SETTING = "MenuItemSettingsGeneral"
ONEX_LOGIN_EDT_STATION = "TextBoxUser"
ONEX_LOGIN_EDT_PASSWORD = "PasswordBoxUser"
ONEX_LOGIN_BTN_LOGIN = "Login"

# Login Setting
ONEX_LOGIN_SETTINGS_TELEPHONY = "ListBoxItemPhone"
ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_LIST = "ListBoxControllers"
ONEX_LOGIN_SETTINGS_TELEPHONY_H323 = "H.323"
ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_BTN_REMOVE = "Remove"
ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_BTN_ADD = "Add"
ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_DIALOG = "Dialog"
ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_BTN_OK = "OK"
ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_EDT_SERER_URL = "ServerEdit"
ONEX_LOGIN_SETTINGS_BTN_OK = "OKButton"

# OneX
ONEX_BLOCK_USER_NAME = "TextBlockUserName"
ONEX_EDT_PHONE_NUMBER_OR_NAME_SEARCH = "TextBoxSearch"
ONEX_BTN_DIAL = "ButtonDial"
ONEX_BTN_DIAL_PAD = "ButtonDialpad"
ONEX_BTN_HOLD= "ButtonHold"
ONEX_TOOLTIP_SHOW_DIAL="Show Dialpad"
ONEX_TOOLTIP_HIDE_DIAL="Hide Dialpad"

# Dial Pad
ONEX_DIAL_BUTTON_ZERO = 'DialButtonZero'
ONEX_DIAL_BUTTON_ONE = 'DialButtonOne'
ONEX_DIAL_BUTTON_TWO = 'DialButtonTwo'
ONEX_DIAL_BUTTON_THREE = 'DialButtonThree'
ONEX_DIAL_BUTTON_FOUR = 'DialButtonFour'
ONEX_DIAL_BUTTON_FIVE = 'DialButtonFive'
ONEX_DIAL_BUTTON_SIX = 'DialButtonSix'
ONEX_DIAL_BUTTON_SEVEN = 'DialButtonSeven'
ONEX_DIAL_BUTTON_EIGHT = 'DialButtonEight'
ONEX_DIAL_BUTTON_NINE = 'DialButtonNine'



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#***************                                     AvayaIXLocator                                      ***************

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Author: Oanh Ho
# Created date: 23/02/2020

# def check_error():
#     # Wait and click OK on Audio Error message if it is displayed.
#     while uiautomation.WindowControl(Name="WindowMessageBox").Exists(3):
#         uiautomation.WindowControl(Name="WindowMessageBox").ButtonControl(Name="OK").Click()

def check_Other_AvayaIX():
    while uiautomation.WindowControl(Name="Other Avaya IX Workplace instances are detected").Exists(3):
        uiautomation.WindowControl(Name="Other Avaya IX Workplace instances are detected").SendKeys('{Alt}' '{N}')

def check_tip():
    while uiautomation.WindowControl(Name="window").Exists(3):
        uiautomation.WindowControl(Name="window").ButtonControl(Name="SKIP TUTORIAL").Click()

def check_login():
    # logout phone if it being login
    while uiautomation.WindowControl(Name="Avaya IX Workplace").Exists(3):
        click_logout()

def click_setting():
    ix_Window = uiautomation.WindowControl(Name = "Settings")
    ix_Window.SetFocus()
    time.sleep(1)
    btn_setting = ix_Window.ButtonControl(Name="Options and Settings")
    btn_setting.Click()
    time.sleep(1)

def setting_ix(phone_num, password_ix, sm_server, port, domain):
    Setting_general = uiautomation.WindowControl(Name = "Avaya Engage Settings")
    Setting_general.SetFocus()

    # add account
    btn_accounts = Setting_general.ListItemControl(Name = "Accounts")
    btn_accounts.Click()
    time.sleep(1)
    # input axtension
    extension_text = Setting_general.TextControl(Name="Extension")
    extension = extension_text.GetPreviousSiblingControl()
    extension.SendKeys('{Ctrl}' '{A}')
    extension.SendKeys('{DEL}')
    extension.SendKeys(phone_num)
    time.sleep(1)
    # input password
    password_text = Setting_general.TextControl(Name="Password")
    pass_ix = password_text.GetPreviousSiblingControl()
    pass_ix.SendKeys('{Ctrl}' '{A}')
    pass_ix.SendKeys('{DEL}')
    pass_ix.SendKeys(password_ix)
    time.sleep(1)

    # input SM server
    btn_service = Setting_general.ListItemControl(Name="Services")
    btn_service.Click()
    time.sleep(1)
    btn_show_detail = Setting_general.ButtonControl(Name="Show Details")
    while btn_show_detail.Exists(3):
        btn_show_detail.Click()
        time.sleep(1)
    btn_phone_service = Setting_general.ButtonControl(Name="Phone Service")
    btn_phone_service.Click()
    time.sleep(1)

    # add address server
    server_text = Setting_general.TextControl(Name="Server Address")
    input_server = server_text.GetNextSiblingControl()
    input_server.SendKeys('{Ctrl}' '{A}')
    input_server.SendKeys('{DEL}')
    input_server.SendKeys(sm_server)
    time.sleep(1)

    # add server port
    server_port_text = Setting_general.TextControl(Name="Server Port")
    input_port = server_port_text.GetNextSiblingControl()
    input_port.SendKeys('{Ctrl}' '{A}')
    input_port.SendKeys('{DEL}')
    input_port.SendKeys(port)
    time.sleep(1)

    # add domain
    domain_text = Setting_general.TextControl(Name="Domain")
    input_domain = domain_text.GetNextSiblingControl()
    input_domain.SendKeys('{Ctrl}' '{A}')
    input_domain.SendKeys('{DEL}')
    input_domain.SendKeys(domain)
    time.sleep(1)

    #Click Done button
    btn_done = Setting_general.ButtonControl(Name="DONE")
    time.sleep(2)

def click_login():
    ix_Window = uiautomation.WindowControl(Name="Settings")
    ix_Window.SetFocus()
    btn_login = ix_Window.ButtonControl(Name = "SIGN OUT")
    btn_login.Click()
    time.sleep(2)

def click_logout():
    ix_Window = uiautomation.WindowControl(Name="Avaya IX Workplace")
    ix_Window.SetFocus()

    btn_user = ix_Window.ButtonControl(Name="Open User Dashboard")
    btn_user.Click()
    time.sleep(1)

    btn_logout = ix_Window.ButtonControl(Name="SIGN OUT")
    btn_logout.Click()

    while uiautomation.TextControl(Name="You have active calls, are you sure you want to logout application?").Exists(3):
        uiautomation.WindowControl(Name="Avaya IX Workplace").ButtonControl(Name="Yes").Click()
    time.sleep(2)

def call_out(phone_num):
    ix_call = uiautomation.WindowControl(Name = "Avaya IX Workplace")
    ix_call.SetFocus()
    Show_Dialpad = ix_call.ButtonControl(Name="Show Dialpad")
    input_num = Show_Dialpad.GetNextSiblingControl()
    input_num.SetFocus()
    input_num.SendKeys(phone_num)
    time.sleep(2)
    input_num.SendKeys('{Enter}')
    # extension.SendKeys('{Ctrl}' '{A}')
    # extension.SendKeys('{DEL}')

def call_accept():
    ix_call = uiautomation.WindowControl(Name="Avaya IX Workplace")
    ix_call.SetFocus()
    btn_accept = ix_call.ButtonControl(Name = "Answer")
    btn_accept.Click()
    time.sleep(2)

def end_call():
    ix_call = uiautomation.WindowControl(Name="Avaya IX Workplace")
    ix_call.SetFocus()
    btn_end = ix_call.ButtonControl(Name = "Drop")
    btn_end.Click()
    time.sleep(1)

def hold_call():
    ix_call = uiautomation.WindowControl(Name="Avaya IX Workplace")
    ix_call.SetFocus()
    btn_end = ix_call.ButtonControl(Name="Pause")
    btn_end.Click()
    time.sleep(1)

def unhold_call():
    ix_call = uiautomation.WindowControl(Name="Avaya IX Workplace")
    ix_call.SetFocus()
    btn_end = ix_call.ButtonControl(Name="Pause")
    btn_end.Click()
    time.sleep(1)

def close_AvayaIX():
    time.sleep(1)
    AvayaIX_Window = uiautomation.WindowControl(Name="Settings")
    AvayaIX_Window.SetFocus()
    AvayaIX_Window.SendKeys('{Alt}' '{F4}')
    # btn_exit = AvayaIX_Window.GetLastChildControl()
    # time.sleep(1)
    # btn_exit.DoubleClick()
    time.sleep(1)


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#***************                                        OutlookLocator                                   ***************

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Author: Oanh Ho
# Created date: 17/02/2020

CONTENT_ELEMENT_EMAIL_WEB = "xpath://div[@class='widget widget--email']//cc-email-editor//div[@id='email--textarea']//p"
# CONTENT_ELEMENT_EMAIL_WEB = "xpath://div[@class='widget widget--email']//div[@id='email--textarea']//div//p"
CONTENT_EMAIL_WEB = "xpath://div[@class='widget widget--email']//div[@id='email--textarea']"
# CUST1_EMAIL = "WS_CUSTOMER1@acc7dc.tma.com"
# CUST2_EMAIL = "WS_CUSTOMER2@acc7dc.tma.com"
# CUST3_EMAIL = "WS_CUSTOMER3@acc7dc.tma.com"

def click_new_button():
    Outlook_Window = uiautomation.WindowControl(Name="Inbox - Microsoft Outlook")
    Outlook_Window.SetFocus()
    Outlook_Window.SendKeys('{Ctrl}' '{N}')

# def choose_account(email):
#     # Utitled_Window = uiautomation.WindowControl(Name="Untitled - Message (HTML) ")
#     # Utitled_Window.SetFocus()
#     Utitled_Window = uiautomation.PaneControl(Name="Form Regions")
#     Utitled_Window.SetFocus()
#     btn_Account = Utitled_Window.SendKeys('{Alt}' '{A}')
#     time.sleep(1)
#     cust_email_1 =Utitled_Window.MenuControl(Name="Context Menu")
#     if email == CUST2_EMAIL:
#         Utitled_Window.SendKeys('{2}')
#     if email == CUST1_EMAIL:
#         Utitled_Window.SendKeys('{1}')

def choose_account(num_email):
    # Utitled_Window = uiautomation.WindowControl(Name="Untitled - Message (HTML) ")
    # Utitled_Window.SetFocus()
    Utitled_Window = uiautomation.PaneControl(Name="Form Regions")
    Utitled_Window.SetFocus()
    btn_Account = Utitled_Window.SendKeys('{Alt}' '{A}')
    time.sleep(1)
    cust_email_1 =Utitled_Window.MenuControl(Name="Context Menu")
    Utitled_Window.SendKeys(num_email)

def create_new_email(mail_to, subject_mail, message_mail):
    Utitled_Window = uiautomation.WindowControl(Name="Untitled - Message (HTML) ")
    Utitled_Window.SetFocus()
    set_Mail_To = Utitled_Window.EditControl(Name="To")
    set_Mail_To.SendKeys(mail_to)
    time.sleep(0.5)
    set_Subject = Utitled_Window.EditControl(Name="Subject:")
    set_Subject.SendKeys(subject_mail)
    time.sleep(0.5)
    set_Message = Utitled_Window.PaneControl(Name="Message")
    #set_Message.Click()
    set_Message.SendKeys('Hi AACC,')
    set_Message.SendKeys('{Enter}')
    set_Message.SendKeys(message_mail)
    set_Message.SendKeys('{Enter}')
    set_Message.SendKeys('Best regards,')
    set_Message.SendKeys('{Enter}')
    set_Message.SendKeys('Customer')

def create_new_email_plain(mail_to, subject_mail, message_mail):
    Utitled_Window = uiautomation.WindowControl(Name="Untitled - Message (HTML) ")
    Utitled_Window.SetFocus()
    option_tab = Utitled_Window.TabItemControl(Name="Options")
    option_tab.Click()
    time.sleep(0.5)
    Utitled_Window.SendKeys('{Alt}' '{P}')
    Utitled_Window.SendKeys('{L}')
    time.sleep(0.5)
    set_Mail_To = Utitled_Window.EditControl(Name="To")
    set_Mail_To.SendKeys(mail_to)
    time.sleep(0.5)
    set_Subject = Utitled_Window.EditControl(Name="Subject:")
    set_Subject.SendKeys(subject_mail)
    time.sleep(0.5)
    set_Message = Utitled_Window.PaneControl(Name="Message")
    #set_Message.Click()
    set_Message.SendKeys('Hi AACC,')
    set_Message.SendKeys('{Enter}')
    set_Message.SendKeys(message_mail)
    set_Message.SendKeys('{Enter}')
    set_Message.SendKeys('Best regards,')
    set_Message.SendKeys('{Enter}')
    set_Message.SendKeys('Customer')
    time.sleep(1)
    option_tab = Utitled_Window.TabItemControl(Name="Message")
    option_tab.Click()
    time.sleep(0.5)

def attach_file(attachment_name):
    toolbar_ctr = uiautomation.ToolBarControl(Name="Include")
    toolbar_ctr.SetFocus()
    bnt_Attach = toolbar_ctr.ButtonControl(Name = "Attach File")
    time.sleep(1)
    bnt_Attach.Click()
    Insert_Window = uiautomation.WindowControl(Name = "Insert File")
    Insert_Window.SetFocus()

    Insert_Window.SendKeys('{Alt}' '{N}')
    Insert_Window.SendKeys(attachment_name)
    time.sleep(1)
    #click insert button
    Insert_Window.SendKeys('{Alt}' '{S}')
    time.sleep(2)

def insert_inline_image(link_file):
    # Utitled_Window = uiautomation.WindowControl(Name="Untitled - Message (HTML) ")
    # Utitled_Window.SetFocus()
    set_Message = uiautomation.PaneControl(Name="Message")
    set_Message.SetFocus()
    # open insert picture window
    set_Message.SendKeys('{Alt}' '{N}' '{P}')
    time.sleep(1)
    insert_win = uiautomation.WindowControl(Name="Insert Picture")
    insert_win.SetFocus()
    insert_win.SendKeys('{Alt}' '{N}')
    insert_win.SendKeys(link_file)
    time.sleep(1)
    #click Insert button
    insert_win.SendKeys('{Alt}' '{S}')
    time.sleep(2)

def click_send_button():
    bnt_Send = uiautomation.ButtonControl(Name = "Send")
    bnt_Send.Click()

# 06/04/2020
def delete_old_email():
    Outlook_Window = uiautomation.WindowControl(Name="Inbox - Microsoft Outlook")
    Outlook_Window.SetFocus()
    # delete all email in Inbox
    tree_control = Outlook_Window.TreeControl(Name="Favorite Folders")
    tree_control.SetFocus()
    inbox = tree_control.TreeItemControl(Name="Inbox")
    inbox.Click()
    # inbox_table = uiautomation.PaneControl(Name="Message Read")           #(Name="Message Read")
    while uiautomation.PaneControl(Name="Message Read").Exists(1):
        inbox_table = uiautomation.PaneControl(Name="Message Read")
        inbox_table.Click()
        inbox_table.SendKeys('{Ctrl}' '{D}')
        while uiautomation.PaneControl(Name="Message Unread").Exists(1):
            inbox_table = uiautomation.PaneControl(Name="Message Unread")
            inbox_table.Click()
            inbox_table.SendKeys('{Ctrl}' '{D}')
    while uiautomation.PaneControl(Name="Message Unread").Exists(1):
        inbox_table = uiautomation.PaneControl(Name="Message Unread")
        inbox_table.Click()
        inbox_table.SendKeys('{Ctrl}' '{D}')
        while uiautomation.PaneControl(Name="Message Read").Exists(1):
            inbox_table = uiautomation.PaneControl(Name="Message Read")
            inbox_table.Click()
            inbox_table.SendKeys('{Ctrl}' '{D}')
    time.sleep(1)

# 06/04/2020
def click_receive_button():
    Outlook_Window = uiautomation.WindowControl(Name="Inbox - Microsoft Outlook")
    Outlook_Window.SetFocus()
    Outlook_Window.SendKeys('{F9}')
    time.sleep(1)
    tree_control = Outlook_Window.TreeControl(Name="Favorite Folders")
    tree_control.SetFocus()
    inbox = tree_control.TreeItemControl(Name="Inbox")
    inbox.Click()
    inbox_table = uiautomation.PaneControl(Name="Message Unread")
    inbox_table.Click()

# 06/04/2020
def verify_subject_receive():
    subject = uiautomation.EditControl(Name="Subject")
    subject_text = subject.GetValuePattern().Value
    time.sleep(1)
    return subject_text

# 06/04/2020
def verify_email_receive():
    from_email = uiautomation.EditControl(Name="From")
    email_text = from_email.GetValuePattern().Value
    time.sleep(1)
    return email_text

# 21/05/2020
def verify_email_to():
    from_email = uiautomation.EditControl(Name="To:")
    email_text = from_email.GetValuePattern().Value
    time.sleep(1)
    return email_text

def verify_content_email():
    # mess = uiautomation.PaneControl(Name="Message")
    # mess.Click()
    # mess.SendKeys('{Ctrl}' '{A}')
    # mess.SendKeys('{Ctrl}' '{C}')
    # # get_mess = mess.SendKeys('{Ctrl}' '{V}')
    # get_mess = pywinauto.controls.mess.texts()
    inbox_table = uiautomation.PaneControl(Name="Message Unread")
    inbox_table.SendKeys('{Enter}')
    receive_win = uiautomation.WindowControl(Class="rctrl_renwnd32")
    receive_win.SetFocus()
    time.sleep(0.5)
    # #check inline image
    # show_image = receive_win.EditControl(Name="Info Bar")
    # if show_image.Exists(2):
    #     show_image.Click()
    #     time.sleep(1)
    # download_inline_image = uiautomation.MenuItemControl(Name="Download Pictures")
    # if download_inline_image.Exists(2):
    #     download_inline_image.Click()
    #     time.sleep(1)
    mess = uiautomation.PaneControl(Name="Message")
    mess.Click()
    time.sleep(1)
    select_btn = receive_win.SplitButtonControl(Name="Select")
    select_btn.Click()
    # mess.SendKeys('{Alt}' '{H}')
    # mess.SendKeys('{S}' '{L}')
    time.sleep(1)
    # mess.SendKeys('{A}')
    select_all = uiautomation.MenuItemControl(Name="Select All")
    select_all.Click()
    time.sleep(1)
    mess.SendKeys('{Ctrl}' '{C}')
    time.sleep(1)
    mess.SendKeys('{Alt}' '{F4}')
    time.sleep(1)
    # get_mess = mess.SendKeys('{Ctrl}' '{V}')
    # print(listdir("*******************"))
    # print(listdir(get_mess))
    # end = len(get_mess)
    # check = get_mess.find(content, 0, end)
    # print(listdir(check))

    # mess.SendKeys('{Ctrl}' '{N}')
    # time.sleep(1)
    # Utitled_Window = uiautomation.WindowControl(Name="Untitled - Message (HTML) ")
    # Utitled_Window.SetFocus()
    # set_Message = Utitled_Window.PaneControl(Name="Message")
    # set_Message.SendKeys('{Ctrl}' '{V}')
    # # get_mess = set_Message.GetValuePattern().Value
    # get_mess = mess.SendKeys('{Ctrl}' '{C}')



# # 07/05/2020
# def verify_content_email_receive():
#     content_email = uiautomation.PaneControl(Name="Message")
#     email_text = content_email
#     time.sleep(1)
#     return email_text

# 06/04/2020
def verify_attachment(attachment):
    attach_list = uiautomation.ListControl(Name="Attachments")
    # attach_name = attach_list.ListItemControl().GetTogglePattern()
    attach_name = attach_list.GetLastChildControl().Name
    time.sleep(1)
    # len_attach = len(attachment)
    check_attach = attach_name.find(attachment)
    if check_attach >= 0:
        pass
    elif check_attach == -1:
        fail("Cannot find the attachment")

def close_outlook():
    Outlook_Window = uiautomation.WindowControl(Name = "Inbox - Microsoft Outlook")
    Outlook_Window.SetFocus()
    Outlook_Window.SendKeys('{Alt}' '{F4}')
    # btn_File = Outlook_Window.ButtonControl(Name = "Close")
    # btn_File.Click()
    # time.sleep(0.5)
