import uiautomation

# from oceana.keywords.workspace.interaction_area.WorkCardConstant import *


# DYNAMIC VARIABLES FOR WORKCARD LOCATORS
DYNAMIC_VARIABLE_WORKCARD_SERVICE_NAME = "${WORKCARD_SERVICE_NAME}"
CONTACT_INFO_VAR = "${CONTACT_INFO}"
# CONTACT_SKILLSET_VAR = "${CONTACT_SKILLSET}"
WORKCARD_ID_VAR = "${WORKCARD_ID}"
WORKCARD_ORDER_VAR = "${WORKCARD_ORDER}"
#ACTIVITY_NAME_VAR = "${ACTIVITY_NAME}"
DISPOSITION_NAME_VAR = "${DISPOSITION_NAME}"
SERVICE_NAME_TO_TRANSFER_VAR = "${SERVICE_NAME_TO_TRANSFER_VALUE}"

# ROOT: WORKCARD LOCATOR
# By TOOLTIP, example: //span[@aria-label='cust@one.com']/ancestor::card-container//card-summary//div
LOC_WORKCARD_LIST = "//cc-cards-collection//card-container"
# LOC_WORKCARD = "//span[@aria-label=\'" + CONTACT_INFO_VAR + "\']"
LOC_WORKCARD = "xpath://card-container[@interaction-title=\'" + CONTACT_INFO_VAR + "\']"
LOC_WORKCARD_ID = LOC_WORKCARD + "//cc-consult-menu"
LOC_WORKCARD_ID_BY_ORDER = "//cc-consult-menu[@menu-type='Transfer'][" + WORKCARD_ORDER_VAR + "]"
LOC_WORKCARD_CHOOSE = "xpath://card-container[@interaction-id='" + WORKCARD_ID_VAR + "']"

# WORKCARD ICONS, HEADER, MISSED MESSAGES, TIMER...
LOC_WORKCARD_HEADER_TITLE = LOC_WORKCARD + "//span[@class='card__header-text']"
LOC_WORKCARD_HEADER = "xpath://span[@class='card__header-text']"
LOC_WORKCARD_HEADER_TIMER = LOC_WORKCARD + "//cc-timer"
LOC_WORKCARD_HEADER_MISSED_MESSAGE = LOC_WORKCARD + "//span[@aria-label='Missed Messages']"

# Locator is used to get header of coming contact (contact is not accepted)
LOC_WORKCARD_ACCEPT_CONTACT_HEADER_TITLE = "//button[@id='ow_card_accept_btn']//ancestor::card-container//span[starts-with(@class,'card__header-title')]"

# ##################################################    HUY   ##########################################################
# Agent Accepts Any New Contact locate
LOC_WORKCARD_ACCEPT_NEW_CONTACT = "xpath://button[@id='ow_card_accept_btn']"
LOC_WORKCARD_END_CONTACT = "xpath://button[@ng-click='end()']"

LOC_WORK_CARDS = "xpath://card-container[contains(@interaction-title, '{}')]"

# ##################################################    HUY   ##########################################################
# Agent Accepts New Contact

LOC_WORKCARD_BTN_ACCEPT_NEW_CONTACT = "xpath://card-container[@interaction-title='{}']//button[@id='ow_card_accept_btn']"
LOC_WORKCARD_BTN_END_CONTACT_VERIFY = "xpath://card-container[@interaction-title='{}']//button[@ng-click='end()']"

########################################################################################################################


# WORKCARD SERVICE NAME, WORK CODE, DISPOSITION CODE, ICONS...
LOC_WORKCARD_SERVICE_NAME = LOC_WORKCARD + "//card-content[not(contains(@class,'card-details'))]//span"

# WORKCARD BODY MESSAGES

#   SKILLSET
LOC_WORKCARD_LABEL_SKILLSET = "xpath://div[@id='ow_Service_Name_" + WORKCARD_ID_VAR + "']//span"

# WORKCARD ACTIONS
LOC_WORKCARD_ACCEPT_CONTACT_BUTTON = "xpath://button[contains(@id, 'ow_card_accept_btn')]"
LOC_WORKCARD_BTN_ACCEPT_CONTACT = LOC_WORKCARD + "//button[@id='ow_card_accept_btn']"
LOC_WORKCARD_BTN_REJECT_CONTACT = LOC_WORKCARD + "//button[@aria-label='End']"
LOC_WORKCARD_BTN_END_ANY_CONTACT = "xpath://button[@aria-label='End']"
LOC_WORKCARD_BTN_END_CONTACT = LOC_WORKCARD + "//button[contains(@id, 'ow_Card_End_btn')]"
LOC_VERIFY_WORKCARD_END_BUTTON = "xpath://card-container[contains(@interaction-title, '{}')]//button[@aria-label='End']"
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
LOC_WORKCARD_BTN_MORE = "xpath://button[@id='ow_Card_More_btn_" + WORKCARD_ID_VAR + "']"
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

# todo: Huy: Transfer To Service loc
F_LOC_WORKCARD_ID = "xpath://card-container[@interaction-title='{}']"
F_LOC_WORKCARD_BTN_XFER = "xpath://card-container[@interaction-title='{}']//button[@aria-label='Transfer']"


# WORKCARD TRANSFER MM
LOC_WORKCARD_BTN_SERVICES = "id:ow_navigate_next_Transfer_" + WORKCARD_ID_VAR
# LOC_WORKCARD_SERVICE_SEARCH_BOX = 'xpath://div[starts-with(@id,"menu_container")][@aria-hidden="false"]//md-input-container[contains(@class,"service-search-input input-container--no-validation md-input-has-placeholder flex")]/input[@ng-model="query"]'
# Huy Edited =>
LOC_WORKCARD_SERVICE_SEARCH_BOX = "xpath://input[starts-with(@id,'services_search_Transfer_')]"
# LOC_WORKCARD_BTN_SERVICE_NAME_TO_TRANSFER = \
#     "//div[starts-with(@id,'menu_container')][@aria-hidden='false']//button[@type='button' and span[text()='" + SERVICE_NAME_TO_TRANSFER_VAR + "']]"
LOC_WORKCARD_BTN_SERVICE_NAME_TO_TRANSFER = "xpath://button[text()='" + SERVICE_NAME_TO_TRANSFER_VAR + "']"
LOC_WORKCARD_ICON_TRANSFER = "xpath://span[@class='service-icon aoc-transfer-forward']"
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
LOC_WORKCARD_BTN_ACTIVITY_CODE = "xpath://button[text()='{}']"
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
# LOC_TYPE_A_MESSAGE = "xpath://messenger-manager[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@class='super-input__input mousetrap dir_auto dir_aligned']"
LOC_TYPE_A_MESSAGE = "xpath://messenger-manager[@interaction-id='" + WORKCARD_ID_VAR + "']//textarea[@aria-label='Type a message...']"
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

LOC_WORKCARD_TAB_PHRASE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@class='widget__content']//md-pagination-wrapper[@aria-label='Use the left and right arrow keys to navigate between tabs']//md-tab-item[1]"
LOC_WORKCARD_IPT_PHRASE_SEARCH = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//input[@placeholder='Search by phrase']"
LOC_WORKCARD_BTN_SEND_PHRASE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Click to send phrase']"

LOC_WORKCARD_TAB_URL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@class='widget__content']//md-pagination-wrapper[@aria-label='Use the left and right arrow keys to navigate between tabs']//md-tab-item[2]"
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
    Insert_Window = uiautomation.WindowControl(Name="Open")
    Insert_Window.SetFocus()
    # source_Attach = Insert_Window.ToolBarControl()
    # source_Attach.Click()
    # source_Attach.SendKey("E:\OanhHo\Attach_file")
    # bnt_Goto = Insert_Window.ButtonControl(Name = "Go to \"E:\OanhHo\Attach_file\"")
    folder_Disk_E = Insert_Window.TreeItemControl(Name="OCEANA (E:)")
    folder_Disk_E.Click()
    folder_OanhHo = Insert_Window.ListItemControl(Name="OanhHo")
    folder_OanhHo.DoubleClick()
    folder_Attach_file = Insert_Window.ListItemControl(Name="Attach_file")
    folder_Attach_file.DoubleClick()
    # Choose the file to attach
    Choose_file = Insert_Window.ListItemControl(Name=attachment_name)
    Choose_file.SetFocus()
    Choose_file.Click()
    btn_Insert = Insert_Window.SplitButtonControl(Name="Insert")
    # btn_Insert.SetFocus()
    btn_Insert.Click()
