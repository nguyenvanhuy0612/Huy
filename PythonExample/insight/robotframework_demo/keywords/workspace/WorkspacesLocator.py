
########################################################################################################################
#   =========================================== AGENT TOOLBAR LOCATOR ==================================================
########################################################################################################################

LOC_BTN_START_WORK = "xpath://button[@aria-label='Start Work']"
LOC_AGENT_STATE = "xpath://div[@title='Connected']"

LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE = "xpath://*[@class='footer-label']"
LOC_AGENT_TOOLBAR_BTN_DROP_DOWN_MENU = "id:ow_starting_work"
LOC_AGENT_TOOLBAR_BTN_START_WORK = "xpath://button[@puppeteer-id='start-work--dropdown-button']"
LOC_AGENT_TOOLBAR_BTN_READY = "xpath://button[@id='ow_go_ready']"
LOC_AGENT_TOOLBAR_BTN_NOT_READY = "id:ow_go_not_ready"
LOC_AGENT_TOOLBAR_BTN_ACW = "id:ow_go_acw"

NOT_READY_CODE = "${NRD_CODE}"
LOC_AGENT_TOOLBAR_BTN_NOT_READY_CODE = "id:ow_not_ready_" + NOT_READY_CODE

ACW_CODE = "${ACW_CODE_VAR}"
LOC_AGENT_TOOLBAR_BTN_ACW_CODE = "id:ow_acw_" + ACW_CODE

LOC_AGENT_TOOLBAR_TITLE_NRD_CODE = "xpath://div[@puppeteer-id='footer-reason-code--label']"

LOC_AGENT_TOOLBAR_TITLE_FOOTER = "xpath://div[@puppeteer-id='footer-state--label']"
LOC_AGENT_TOOLBAR_BTN_FINISH_WORK = "xpath://button[@puppeteer-id='finish-work--dropdown-button']"
LOC_AGENT_TOOLBAR_BTN_EXIT = "xpath://button[@ng-click='exit()']"

################# INTERACTION LOG ##############

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
LOC_AGENT_TOOLBAR_IPT_PHONEBOOK_SEARCH = "xpath://input[@puppeteer-id='search-contacts--input']"
AGENT_VAR = "${AGENTID}"
ID_AGENT = "${AGENTID}"
LOC_AGENT_TOOLBAR_PHONEBOOK_LIST = "xpath://cc-address-book//*[contains(text(),'" + AGENT_VAR + "')]"
LOC_AGENT_TOOLBAR_BTN_PHONEBOOK_CALL = "xpath://cc-address-book//button[@aria-label='Click to call " + ID_AGENT + "']"
LOC_WORKSPACE_LABEL_SIGNIN = "xpath://div[@class='login-form-container layout-align-center-center layout-row']/h1/span"
#   ===== TIMER =====
LOC_AGENT_TOOLBAR_TIMER = "xpath://div[@id='ow_Icon_State2']//cc-timer"


########################################################################################################################
#   ========================================= CUSTOMER DETAILS LOCATOR =================================================
########################################################################################################################

WORKCARD_ID_VAR = "${WORKCARD_ID}"
LOC_CUSTOMER_DETAIL_LINE_EMAIL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//a[@title='Open link in external email client']"
LOC_CUSTOMER_DETAIL_BTN_MORE_INFO = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@class='more-information-button md-button md-ink-ripple']"


#   ====== INTERACTION DETAILS ======
LOC_CUSTOMER_DETAIL_CHANEL_TYPE = "xpath://tr[@ng-if='context.channel']/td[2]"
LOC_CUSTOMER_DETAIL_SERVICE = "xpath://tr[@ng-if='context.topic']/td[2]"
LOC_CUSTOMER_DETAIL_DIRECTION = "xpath://tr[@ng-if='context.direction']/td[2]"
LOC_CUSTOMER_DETAIL_ORIGINAL_ADDRESS = "xpath://div[@class='widget widget--interaction-details']//*[@ng-if='context.originatingAddress']//td[2]"

LOC_CUSTOMER_DETAIL_DESTINATION = "xpath://div[@class='widget__content--indented ps ps--active-x ps--active-y']//tr[@ng-if='context.destinationAddress']//td[2]"

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

########################################################################################################################
#   ========================================= CUSTOMER JOURNEY LOCATOR =================================================
########################################################################################################################

WORKCARD_ID_VAR = "${WORKCARD_ID}"

LOC_CUSTOMER_JOURNEY_TOUCHPOINT1 = "xpath://div[@class='journey-container']//*[contains(text(),'{}')]"
LOC_CUSTOMER_JOURNEY_TOUCHPOINT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR +"']//div[@class='journey-container']//*[contains(text(),{})]"
LOC_CUSTOMER_JOURNEY_TOUCHPOINT_LABEL = "xpath://*[@class='{}']"

LOC_CUSTOMER_JOURNEY_TRANSCRIPT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR +"']//div[@id='transcriptButton']"
LOC_CUSTOMER_JOURNEY_TRANSCRIPT_BTN = "xpath://div[@id='transcriptButton']"
LOC_CUSTOMER_JOURNEY_TRANSCRIPT_CHAT = "xpath://div[@class='journey-transcript-content']"
LOC_CUSTOMER_JOURNEY_TRANSCRIPT_EMAIL = "xpath://p[@class='email-body-content']"
LOC_CUSTOMER_JOURNEY_TRANSCRIPT_ATTACHMENT = "xpath://div[@class='uploaded-attachment_name flexAuto']"
LOC_CUSTOMER_JOURNEY_TRANSCRIPT_CONTENT = "xpath://div[@class='modal-content ui-draggable']"
LOC_CUSTOMER_JOURNEY_TRANSCRIPT_CLOSE_BTN = "xpath://button[@class='modal-footer-closeButton']"

LOC_CUSTOMER_JOURNEY_GET_CUSTOMER_ID = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR +"']//div[@ng-if='isIntrinsicPopulated']//table//tr[6]//td[2]"
LOC_CUSTOMER_JOURNEY_GET_CONTACT_TIME = "xpath://div[@class='widget__content--indented ps ps--active-y']//table//tr[8]//td[2]"
LOC_CUSTOMER_JOURNEY_TOOLTIP_TOUCHPOINT = "xpath://div[@class='journey-tooltip']"
LOC_CUSTOMER_JOURNEY_TOOLTIP_STATUS = "xpath://div[@class='summaryRow']"
LOC_CUSTOMER_JOURNEY_TOOLTIP_TIMELINE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR +"']//div[@id='cd-timeline']"
LOC_CUSTOMER_JOURNEY_TIME_RANGE_SELECTION = "xpath://select[@title='Time Range selection']"
LOC_CUSTOMER_JOURNEY_TIME_RANGE_OPTION = "xpath://select[@title='Time Range selection']//*[contains(text(),'{}')]"
LOC_CUSTOMER_JOURNEY_REFETCH_BTN = "xpath://button[@aria-label='Re-fetch Journey']"

########################################################################################################################
#   ====================================== CUSTOMER HISTORY SEARCH LOCATOR =============================================
########################################################################################################################

VALUE_SEARCH_BY = "VALUE"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_SELECT_SEARCH = "xpath://md-input-container[@class='ch-type-selector md-input-has-placeholder']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_SELECT_SEARCH_BY = "xpath://md-option[@value='by" + VALUE_SEARCH_BY + "']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_SEARCH_FIELD = "xpath://div[@ng-switch='searchField']//md-input-container//input"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_SEARCH = "xpath://cc-history-search//button[@aria-label='Search']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_FROM_DATE = "xpath://div[@ng-switch='searchField']//md-input-container//input[@aria-label='From']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_TO_DATE = "xpath://div[@ng-switch='searchField']//md-input-container//input[@aria-label='To']"
LOC_WORKSPACE_CUSTOMER_HISTORY_BTN_SHOW_FIRST_DETAIL = "xpath://tr[1]//button[@aria-label='Toggle item details']"
LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_NAME = "xpath://span[@ng-if='detail.name']"
LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_FROM = "xpath://span[@ng-if='detail.from']"
LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_TO = "xpath://span[@ng-if='detail.to']"
LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_SUBJECT = "xpath://div[@class='email email-agent']//span[@class='email-header-subject flex'][1]"
LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_CONTENT_LINE = "xpath://div[@class='text-editor text-editor--readonly text-editor--no-border layout-column flex']//div[@id='email--textarea']//div"

LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ICON_SELECT = "xpath://div[@class='layout-row']//md-select-value//span[@class='md-select-icon']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BY_CUST_EMAIL = "xpath://div[@class='md-text'][contains(text(),'Customer Email')]"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_CUST_EMAIL = "xpath://div[@class='ch-filters']//md-input-container//input"
# LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_SEARCH = "xpath://button[@class='ch-filter-btn md-button md-ink-ripple']"

LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_RECORDS = "xpath://span[starts-with(text(),'Records')]/../.."

LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ROWS__PER_PAGE = "xpath://div[@class='ch-pagination-inner']//div[@class='ch-pagination-block']//md-select[@ng-model='pagination.recordsPerPage']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ROWS__PER_PAGE_ICON__SELECT = "xpath://div[@class='ch-pagination-block']//md-select[@ng-model='pagination.recordsPerPage']//span[@class='md-select-icon']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_NUM_ROWS__PER_PAGE = "xpath://div[@class='md-select-menu-container md-active md-clickable']//md-select-menu//md-content//md-option[@value=100]"

LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_PAGE = "xpath://div[@class='ch-pagination-inner']//div[@class='ch-pagination-block']//md-select[@ng-model='pagination.currentPage']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_PAGE_ICON__SELECT = "xpath://div[@class='ch-pagination-inner']//div[@class='ch-pagination-block']//md-select[@ng-model='pagination.currentPage']//md-select-value//span[@class='md-select-icon']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_CHOOSE_PAGE = "xpath:(//div[@class='md-select-menu-container md-active md-clickable']//md-select-menu//md-content//md-option[@ng-repeat='opts in pagination.currentPageOptions'])[last()]"

LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_ICON_ADD_OF_CONTACT = "xpath:(//div[@ng-switch-when='true']//table[@class='widget__table widget__table--accessible']//tr[@ng-repeat-start='item in customerSearchResults track by $index']//td//button//div[@class='md-ripple-container'])[last()]"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_DATE_TIME_OF_CONTACT = "xpath:(//div[@ng-switch-when='true']//table[@class='widget__table widget__table--accessible']//tr[@ng-repeat-start='item in customerSearchResults track by $index']//td[1])[last()]"

LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_CHAT_FROM_AGENT = "xpath://span[@ng-bind-html='getMsgText(channelType, msg)']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_CHAT_FROM_CUSTOMER = "xpath://span[@class='chat-body chat-body-customer']//span"

########################################################################################################################
#   =========================================== WIDGET EMAIL LOCATOR ===================================================
########################################################################################################################

import uiautomation
import time
import subprocess

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

########################################################################################################################
#   ============================================== WORKCARD LOCATOR ====================================================
########################################################################################################################

import uiautomation

DYNAMIC_VARIABLE_WORKCARD_SERVICE_NAME = "${WORKCARD_SERVICE_NAME}"
CONTACT_INFO_VAR = "${CONTACT_INFO}"
WORKCARD_ID_VAR = "${WORKCARD_ID}"
WORKCARD_ORDER_VAR = "${WORKCARD_ORDER}"
#ACTIVITY_NAME_VAR = "${ACTIVITY_NAME}"
DISPOSITION_NAME_VAR = "${DISPOSITION_NAME}"
SERVICE_NAME_TO_TRANSFER_VAR = "${SERVICE_NAME_TO_TRANSFER_VALUE}"

LOC_WORKCARD_LIST = "//cc-cards-collection//card-container"
LOC_WORKCARD = "xpath://card-container[@interaction-title=\'" + CONTACT_INFO_VAR + "\']"
LOC_WORKCARD_ID = LOC_WORKCARD + "//cc-consult-menu"
LOC_WORKCARD_ID_BY_ORDER = "//cc-consult-menu[@menu-type='Transfer'][" + WORKCARD_ORDER_VAR + "]"
LOC_WORKCARD_CHOOSE = "xpath://card-container[@interaction-id='" + WORKCARD_ID_VAR +"']"

# WORKCARD ICONS, HEADER, MISSED MESSAGES, TIMER...
LOC_WORKCARD_HEADER_TITLE = LOC_WORKCARD + "//span[@class='card__header-text']"
LOC_WORKCARD_HEADER = "xpath://span[@class='card__header-text']"
LOC_WORKCARD_HEADER_TIMER = LOC_WORKCARD + "//cc-timer"
LOC_WORKCARD_HEADER_MISSED_MESSAGE = LOC_WORKCARD + "//span[@aria-label='Missed Messages']"

LOC_WORKCARD_ACCEPT_CONTACT_HEADER_TITLE = "//button[@id='ow_card_accept_btn']//ancestor::card-container//span[starts-with(@class,'card__header-title')]"

# WORKCARD SERVICE NAME, WORK CODE, DISPOSITION CODE, ICONS...
LOC_WORKCARD_SERVICE_NAME = LOC_WORKCARD + "//card-content[not(contains(@class,'card-details'))]//span"

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
LOC_WORKCARD_BTN_TRANSFER = LOC_WORKCARD + "//button[@aria-label='Transfer']"
LOC_WORKCARD_INPUT_EXTENSION_TRANSFER = "//input[@class='menu-input-white ng-pristine ng-valid md-autofocus md-input ng-empty ng-touched'][@aria-label='Enter extension'] "

LOC_WORKCARD_TRANSFER_CALL = LOC_WORKCARD + "//button[@aria-label='Transfer']"
LOC_WORKCARD_CONSULT_CALL = LOC_WORKCARD + "//button[@aria-label='Consult']"

LOC_WORKCARD_BTN_HOLD_CONTACT = LOC_WORKCARD + "//button[@aria-label='Hold']"
LOC_WORKCARD_BTN_UNHOLD_CONTACT = LOC_WORKCARD + "//button[@aria-label='Unhold']"
LOC_WORKCARD_BTN_MORE = "xpath://button[@id='ow_Card_More_btn_" + WORKCARD_ID_VAR +"']"
LOC_WORKCARD_BTN_MORE_OUTGOING = "xpath://button[@id='ow_Card_More_btn_" + WORKCARD_ID_VAR + "']"
LOC_WORKCARD_BTN_END_OBSERVE = LOC_WORKCARD + "//button[@aria-label='End Observe']"
LOC_WORKCARD_BTN_COACH = LOC_WORKCARD + "//button[@aria-label='Coach']"
LOC_WORKCARD_BTN_END_COACH = LOC_WORKCARD + "//button[@aria-label='End Coach']"
LOC_WORKCARD_BTN_BARGE = LOC_WORKCARD + "//button[@aria-label='Barge']"

LOC_WORKSPACE_BTN_ACCEPT_CONTACT = "//*[@id='ow_card_accept_btn']"
LOC_WORKSPACE_BTN_END_CONTACT = "xpath://button[contains(@id,\"ow_Card_End_btn\")]"
LOC_WORKSPACE_BTN_COMPLETE_CONTACT = "xpath://button[@aria-label=\"Complete\"]"

LOC_WORKCARD_HEADER_SUMMARY_TEXT = LOC_WORKCARD + "//card-summary//div"

LOC_WORKCARD_BTN_SERVICES = "id:ow_navigate_next_Transfer_" + WORKCARD_ID_VAR
LOC_WORKCARD_SERVICE_SEARCH_BOX = '//div[starts-with(@id,"menu_container")][@aria-hidden="false"]//md-input-container[contains(@class,"service-search-input input-container--no-validation md-input-has-placeholder flex")]/input[@ng-model="query"]'

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

LOC_WORKCARD_BTN_ACTIVITY = "xpath://work-code[@type='WORK']//md-menu[@class='work-code _md-nested-menu md-menu _md']//button"
LOC_WORKCARD_IPT_ACTIVITY_SEARCH = '//div[contains(@class,"md-open-menu-container") and @aria-hidden="false"]/md-menu-content/form//md-input-container[starts-with(@class, "code-search-input")]//input'
LOC_WORKCARD_BTN_ACTIVITY_CODE = "xpath://button[text()='{}']"
LOC_WORKCARD_BTN_FIRST_ACTIVITY = '(//div[contains(@class,"md-open-menu-container") and @aria-hidden="false"]/md-menu-content/md-menu-item/span/button)[1]'
LOC_WORKCARD_TXT_ACTIVITY = "xpath://span[@puppeteer-id='card-content__work-code-icon--" + WORKCARD_ID_VAR + "']"

# DISPOSITION CODE
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

LOC_SEND_MESSAGE = "xpath://messenger-manager[@interaction-id='" + WORKCARD_ID_VAR + "']//*[@puppeteer-id='messenger-input__send-button']"
LOC_WORKCARD_LABEL_CHAT = "xpath://div[@id='webchat__" + WORKCARD_ID_VAR + "']//md-content[@puppeteer-id='messages-content__agent-customer']//div[@class='message-info md-caption layout-align-start-center layout-row']//span[1]"
LOC_WORKCARD_CONTENT_CHAT = "xpath://div[@id='webchat__" + WORKCARD_ID_VAR + "']//div[2]//md-card//span[@class='message-body__text']"

LOC_WORKCARD_MESSENGER_STATUS = "xpath://context-canvas//div[2]//div[2]//messenger-status//div//p//span[1]"
LOC_WORKCARD_DISCONNECT = "xpath://messenger-manager[@interaction-id='" + WORKCARD_ID_VAR + "']//p/span"

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


# ???
# def attach_file(attachment_name):
#
#     Insert_Window = uiautomation.WindowControl(Name = "Open")
#     Insert_Window.SetFocus()
#     folder_Disk_E = Insert_Window.TreeItemControl(Name = "OCEANA (E:)")
#     folder_Disk_E.Click()
#     folder_OanhHo = Insert_Window.ListItemControl(Name = "OanhHo")
#     folder_OanhHo.DoubleClick()
#     folder_Attach_file = Insert_Window.ListItemControl(Name = "Attach_file")
#     folder_Attach_file.DoubleClick()
#     # Choose the file to attach
#     Choose_file = Insert_Window.ListItemControl(Name = attachment_name)
#     Choose_file.SetFocus()
#     Choose_file.Click()
#     btn_Insert = Insert_Window.SplitButtonControl(Name="Insert")
#     btn_Insert.Click()

########################################################################################################################
#   ========================================== INTERACTION LOG LOCATOR =================================================
########################################################################################################################

LOC_INTERACTIONLOG_BTN_INTERACTIONLOG = "xpath://button[@id='ow_open_logs']"

LOC_INTERACTIONLOG_LINE_CALL = "xpath://md-content/cc-worklog/md-content/md-tabs/md-tabs-content-wrapper/md-tab-content[1]/div/md-content/md-card/md-card-content"
PHONE_URI = "XXX"
LOC_INTERACTIONLOG_BTN_CALL = "xpath://md-tab-content[1]/div/md-content/md-card/md-card-content/md-list-item/span[@aria-label='Click to call " + PHONE_URI + "']"

########################################################################################################################
#   =============================================== LOGIN LOCATOR ======================================================
########################################################################################################################

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

#   ======  ERROR MESSAGE  ======
LOC_WORKSPACE_ERROR_HEADER = "xpath://div[@class='error-header']"
LOC_WORKSPACE_ERROR_BODY = "xpath://div[@class='error-body']"

########################################################################################################################
#   ========================================== WIDGET MY AGENT LOCATOR =================================================
########################################################################################################################

CONTACT_INFO_VAR = "${CONTACT_INFO}"
STATUS_AGENT = "#{STATUS}"
LOC_MYAGENT_SEARCH_AGENT = "xpath://div[@class='widget widget--supervisor']//md-input-container[1]//input[@aria-label='Search Team']"
LOC_MYAGENT_DISPLAY_AGENT = "xpath://td[@class='agent-display-name']"
LOC_WORK_ITEM_OBSERVE = "xpath://td[@class='work-item']"

LOC_MYAGENT_BTN_OBSERVE = "xpath://td[text()=\'" + CONTACT_INFO_VAR + "\']//following-sibling::td//button[@aria-label='Observe Interaction']"
LOC_MYAGENT_BTN_STATUS_AGENT = "xpath://button[@aria-label='state']"
LOC_MYAGENT_SELECT_STATUS_AGENT = "xpath://button//span[text()=\'"+ STATUS_AGENT +"\']"
LOC_BTN_END_OBSERVE ="xpath://button[@aria-label='End Observe']"

########################################################################################################################
#   ========================================== NAVIGATION MENU LOCATOR =================================================
########################################################################################################################

LOC_WORKSPACE_NAVIGATION_MENU_WELCOME_PAGE_BUTTON = "xpath://div[@class='sidebar__container-top']//button[@id='ow_open_Welcome_Page']"
LOC_WORKSPACE_NAVIGATION_MENU_CHAT_BUTTON = "id:ow_open_Chat"
LOC_WORKSPACE_NAVIGATION_MENU_EMAIL_BUTTON = "id:ow_open_Email"
LOC_WORKSPACE_NAVIGATION_MENU_SMS_BUTTON = "id:ow_open_SMS"
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

LOC_WORKSPACE_NAVIGATION_CHAT_FROM_AGENT = "xpath://span[@class='chat-body chat-body-agent']//span"
LOC_WORKSPACE_NAVIGATION_CHAT_FROM_CUSTOMER = "xpath://span[@class='chat-body chat-body-customer']//span"

LOC_WORKSPACE_NAVIGATION_MENU_BTN_SCREENPOP = "id:ow_open_Screenpop"
LOC_WORKSPACE_NAVIGATION_MENU_BTN_CUSTOMER_SEARCH = "id:ow_open_Customer_Search"

LOC_WORKSPACE_NAVIGATION_BTN_CUSTOMER_SEARCH = "xpath://button[@aria-label='Customer Search']"

LOC_WORKSPACE_NAVIGATION_MENU_BTN_HELP = "xpath://button[@aria-label='Help']"
LOC_WORKSPACE_NAVIGATION_HELP_TITLE = "xpath://td[@id='doctitle']"
LOC_WORKSPACE_NAVIGATION_HELP_BTN_SEARCH = "xpath://*[@id='tab3']"

LOC_WORKSPACE_NAVIGATION_HELP_INPUT_SEARCH = "xpath://input[@id='zoom_searchbox']"
LOC_WORKSPACE_NAVIGATION_HELP_SEARCH_HEADING = "xpath://div[@class='searchheading']"

LOC_WORKSPACE_NAVIGATION_MENU_BTN_SETTINGS = "xpath://button[@id='ow_open_Settings']"
LOC_WORKSPACE_NAVIGATION_SETTINGS_EMAIL_SIGNATURE = "xpath://md-tab-item//span[@puppeteer-id='settings-email-signature']"
LOC_WORKSPACE_NAVIGATION_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR = "xpath://div[@id='email--textarea']"
LOC_WORKSPACE_NAVIGATION_SETTINGS_EMAIL_SIGNATURE_BTN_SAVE = "xpath://*[@id='tab-content-16']/div/div[2]/progress-button/div/span/button"

########################################################################################################################
#   ============================================= PHONEBOOK LOCATOR ====================================================
########################################################################################################################

PHONEBOOK_FILTER1 = "xpath://table[@class='table-search']//tr[@class='border_bottom']//td[1]"
PHONEBOOK_FILTER2 = "xpath://table[@class='table-search']//tr[@class='border_bottom']//td[2]"
PHONEBOOK_FILTER3 = "xpath://table[@class='table-search']//tr[@class='border_bottom']//td[3]//input"
PHONEBOOK_FILTER1_SELECT = "xpath://table[@class='table-search']//tr[@class='border_bottom']//td[1]//select"
                            # All, Custom Contacts, Favorite, Speed Dial
PHONEBOOK_FILTER2_SELECT = "xpath://table[@class='table-search']//tr[@class='border_bottom']//td[2]//select"
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

PHONEBOOK_BTN_CALL_OUT = "xpath://td[7]//button[@aria-label='Click to call']"
PHONEBOOK_BTN_END_CALL = "xpath://button[contains(@id, 'ow_Card_End_btn')]"

PHONEBOOK_TABLE_ROW_CONENT = "xpath://tbody//tr//td[{}]"
PHONEBOOK_ROW_PER_PAGE = "xpath://md-select[contains(@aria-label,'Records per page')]//md-select-value"
PHONEBOOK_SELECT_ROW_PER_PAGE = "xpath://div[contains(@class,'md-active')]//md-option[@value='{}']"

PHONEBOOK_CHECK_TAGGING_CONTACT = "xpath://md-checkbox[@aria-label='{}']"    # Favorite or Speed Dial
PHONEBOOK_INPUT_FIELD_CONTACT = "xpath://label[contains(text(),'{}')]/following-sibling::input"
PHONEBOOK_ENTER_FIELD_LABEL = "xpath://h4[contains(text(),'Enter fields')]"

########################################################################################################################
#   ============================================= SCREENPOP LOCATOR ====================================================
########################################################################################################################

LOC_SCREENPOP_LIST_SPAN_SCREENPOP = 'xpath://div[@class="widget widget--screen-pop"]//md-tabs[@class="md-no-tab-content"]//md-tab-item'

########################################################################################################################
#   ========================================== WIDGET SETTINGS LOCATOR =================================================
########################################################################################################################

LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE = "xpath://md-tab-item//span[@puppeteer-id='settings-email-signature']"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_TEXT_EDITOR = "xpath://div[@id='email--textarea']"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_BTN_SAVE = "xpath://progress-button[@puppeteer-id='email-signature-html--save-button']//button"
LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_CHECK_AUTO_INSERT = "xpath://md-tab-content[1]//md-checkbox"

LOC_WIDGETSETTINGS_SETTINGS_ABOUT_VERSION = "xpath://span[@puppeteer-id='settings-about_solution-version']"
LOC_WIDGETSETTINGS_SETTINGS_ABOUT_BUILD = "xpath://span[@puppeteer-id='settings-about_build-version']"

LOC_WIDGETSETTINGS_SETTINGS_EMAIL_SIGNATURE_ANY_EDIT_BTN = "xpath://cc-email-editor[@puppeteer-id='email-signature--html']//button"

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

#   ==== LANGUAGE ====

LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE = "xpath://md-tab-item//span[@puppeteer-id='settings-language']"
LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE_SELECT = "xpath://language-settings//md-select-value"
LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE_SELECT_LIST = "xpath://div[@class='md-select-menu-container md-active md-clickable']//md-select-menu//md-option"
LOC_WIDGETSETTINGS_SETTINGS_LANGUAGE_SELECT_LIST_NAME = "xpath://div[@class='md-select-menu-container md-active md-clickable']//md-option//div[@class='md-text']"

########################################################################################################################
#   ========================================= WEBSTATISTIC LOCATOR =================================================
########################################################################################################################

LOC_WEBSTATISTIC_BTN_SORT = "xpath://button[@id='webstat_sort_icon']"
LOC_WEBSTATISTIC_BTN_CHART = "xpath://button[@id='webstat_chart_type_icon']"
CLASS_BTN_CHART = "neo-btn neo-btn--ghost neo-icon-{}-chart"
LOC_WEBSTATISTIC_BTN_REFRESH = "xpath://button[@id='refreshButtonId']"
LOC_WEBSTATISTIC_CHECKBOX_ALERT = "xpath://md-checkbox[@aria-label='Alert']"
LOC_WEBSTATISTIC_SELECT_SKILLSET = "xpath://li//*[contains(text(),'{}')]"
LOC_WEBSTATISTIC_SKILLSET_VIEW = "xpath://div[@class='skillsetView']//*[@id='{}']"  # skillsetname     serviceLevel    maxWait
LOC_WEBSTATISTIC_SERVICE_LEVEL = "xpath://span[@id='serviceLevel']"
LOC_WEBSTATISTIC_MAX_WALT_TIME = "xpath://span[@id='maxWait']"
LOC_WEBSTATISTIC_CHART_AGENT = "xpath://canvas[@id='agentsChart']"
LOC_WEBSTATISTIC_CHART_CONTACT = "xpath://canvas[@id='contactsChart']"
LOC_WEBSTATISTIC_ALERT = "xpath://md-checkbox[@aria-label='Alert']"
LOC_WEBSTATISTIC_WARNING_SIGN = "xpath://li[@class='neo-tabs__item selectedSkillset']//span[@class='neo-icons__value neo-icon-error-filled notice-error']"

def DownloadChart(ccsIDElement, filetosave: str):
    import base64
    from robot.libraries.BuiltIn import BuiltIn
    driver = BuiltIn().get_library_instance("Selenium2Library").driver

    canvas = driver.find_element_by_css_selector("#"+ccsIDElement)

    # get the canvas as a PNG base64 string
    canvas_base64 = driver.execute_script("return arguments[0].toDataURL('image/png').substring(21);", canvas)

    # decode
    canvas_png = base64.b64decode(canvas_base64)

    # save to a file
    with open(filetosave, 'wb') as f:
        f.write(canvas_png)

def compare_images(a,b):
    from PIL import Image, ImageChops
    import numpy as np
    img1 = Image.open(a)
    img2 = Image.open(b)
    diff = ImageChops.difference(img1, img2)
    if diff.getbbox():
        diff.show()
    result = not np.any(diff)
    return result

########################################################################################################################
#   ====================================== WIDGET WELCOME PAGE LOCATOR =================================================
########################################################################################################################

ID_AGENT_SEARCH = "xxx"

LOC_WIDGETWELCOME_IPT_SEARCH_TEAM = "xpath://input[@aria-label='Search Team']"
LOC_WIDGETWELCOME_MEMBER_SEARCH = "xpath://*[@id='ow_team_member_AGENT_expandedTeamView_" + ID_AGENT_SEARCH + "']"

########################################################################################################################
#   =========================================  LOCATOR =================================================
########################################################################################################################

########################################################################################################################
#   =========================================  LOCATOR =================================================
########################################################################################################################

########################################################################################################################
#   =========================================  LOCATOR =================================================
########################################################################################################################

########################################################################################################################
#   =========================================  LOCATOR =================================================
########################################################################################################################

