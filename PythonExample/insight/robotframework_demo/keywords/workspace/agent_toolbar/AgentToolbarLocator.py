# todo ==================== AGENT TOOLBAR - THE TOP OF WS PAGE ==================================

LOC_BTN_START_WORK = "xpath://button[@aria-label='Start Work']"

LOC_AGENT_TOOLBAR_BTN_DROP_DOWN_MENU = "id:ow_starting_work"
LOC_AGENT_TOOLBAR_BTN_START_WORK = "xpath://button[@puppeteer-id='start-work--dropdown-button']"
LOC_AGENT_TOOLBAR_BTN_READY = "xpath://button[@id='ow_go_ready']"
# LOC_AGENT_TOOLBAR_BTN_READY = "xpath://*[contains(text(), 'Go Ready')]"
LOC_AGENT_TOOLBAR_BTN_NOT_READY = "id:ow_go_not_ready"
LOC_AGENT_TOOLBAR_BTN_ACW = "id:ow_go_acw"
# puppeteer-id="go-not-ready--dropdown-button"

NOT_READY_CODE = "${NRD_CODE}"
LOC_AGENT_TOOLBAR_BTN_NOT_READY_CODE = "id:ow_not_ready_" + NOT_READY_CODE

ACW_CODE = "${ACW_CODE_VAR}"
LOC_AGENT_TOOLBAR_BTN_ACW_CODE = "id:ow_acw_" + ACW_CODE

LOC_AGENT_TOOLBAR_BTN_FINISH_WORK = "xpath://button[@puppeteer-id='finish-work--dropdown-button']"
LOC_AGENT_TOOLBAR_BTN_EXIT = "xpath://button[@ng-click='exit()']"

# todo ==================== AGENT FOOTER - THE BOTTOM OF THE WS PAGE ==================================

LOC_AGENT_STATE = "xpath://div[@title='Connected']"

LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE = "xpath://*[@class='footer-label']"

# Accept string: Connected , Not Ready , Ready
LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE_VERIFY = "xpath://div[@aria-label='Agent State'][@title='{}']"

LOC_FOOTER_LIST_ICON_COUNT = "xpath://div[contains(@class, 'state-panel')]/span/span"
# LOC_FOOTER_LIST_ICON_STATUS: format string with: Logged Out, Not Ready, Ready, After Contact Work Pending, After Contact Work
F_LOC_FOOTER_LIST_ICON_STATUS = "xpath://div[contains(@class, 'state-panel')]/span/span[contains(@title, \"'{}'\")]"

# LOC_AGENT_TOOLBAR_BTN_NOT_READY_DEFAULT = "xpath://*[@id='ow_not_ready_Not_Ready_Default_Reason_Code']"
LOC_AGENT_TOOLBAR_TITLE_NRD_CODE = "xpath://div[@puppeteer-id='footer-reason-code--label']"

LOC_AGENT_TOOLBAR_TITLE_FOOTER = "xpath://div[@puppeteer-id='footer-state--label']"












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

######### TOAST MESSAGE ############
# Toast Message
LOC_TOAST_MESSAGE = "xpath://span[@class='toast__heading--text']"  # "xpath://div[contains(@class,'toast__container')]/ul/li//span[contains(@class, 'text')]"
LOC_TOAST_MESSAGE_LAST_POSITION = "xpath:(//span[@class='toast__heading--text'])[last()]"
