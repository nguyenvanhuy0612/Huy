

# VALUE_SEARCH_BY = "VALUE"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_SELECT_SEARCH = "xpath://md-select[@aria-label='Select the filter']"
# LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_SELECT_SEARCH = "xpath://md-select[contains(@aria-label,'Select the filter')]"
# LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_SELECT_SEARCH = "xpath://md-input-container[@class='ch-type-selector md-input-has-placeholder']"
# LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_SELECT_SEARCH_BY = "xpath://div[contains(@class,'active')]//md-option[contains(@puppeteer-id,'history-search_search-type-option__by" + VALUE_SEARCH_BY + "')]"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_SELECT_SEARCH_BY = "xpath://div[contains(@class,'active')]//md-option[contains(@puppeteer-id,'history-search_search-type-option__by{}')]"

LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_SEARCH_FIELD = "xpath://div[@ng-switch='searchField']//md-input-container[contains(@ng-switch-when,'{}')]//input"
# LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_SEARCH_FIELD = "xpath://div[@ng-switch='searchField']//md-input-container//input"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_SEARCH = "xpath://cc-history-search//button[@aria-label='Search']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_FROM_DATE = "xpath://div[@ng-switch='searchField']//md-input-container//input[@aria-label='From']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_FROM_DATE = "xpath://md-input-container[@puppeteer-id='history-search_from-date-datepicker-container']//md-icon[@ng-click='expandCalendar($event)']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_CURRENT_DATE = "xpath://td[contains(@class,'focus')]"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_IPT_TO_DATE = "xpath://div[@ng-switch='searchField']//md-input-container//input[@aria-label='To']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_BTN_TO_DATE = "xpath://md-input-container[@puppeteer-id='history-search_to-date-datepicker-container']//md-icon[@ng-click='expandCalendar($event)']"
LOC_WORKSPACE_CUSTOMER_HISTORY_BTN_SHOW_FIRST_DETAIL = "xpath://tr[1]//button[@aria-label='Toggle item details']"
LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER = "xpath://button[@puppeteer-id='history-search_search-type-option__search.type']"
#"xpath://div[@class='md-text' and contains(text(), 'To address')]"

LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_NAME = "xpath://span[@ng-if='detail.name']"
LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_FROM = "xpath://span[@ng-if='detail.from']"
LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_TO = "xpath://span[@ng-if='detail.to']"
LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_SUBJECT = "xpath://span[@class='email-header-subject flex']"
# LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_SUBJECT = "xpath://div[@class='email email-agent']//span[@class='email-header-subject flex'][1]"
LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_CONTENT_LINE = "xpath://div[@class='text-editor text-editor--readonly text-editor--no-border layout-column flex']//div[@id='email--textarea']//div"
LOC_WORKSPACE_CUSTOMER_HISTORY_VERIFY_CONTENT = "xpath://div[@class='email-body']//div[@id='email--textarea']"




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

LOC_WORKSPACE_CUSTOMER_HISTORY_CHAT_CONTENT = "xpath://div[@class='chat-transcript']"
# LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_CHAT_FROM_AGENT = "xpath://span[@class='chat-body chat-body-agent']//span[@ng-bind-html='getMsgText(channelType, msg)']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_CHAT_FROM_AGENT = "xpath://span[@ng-bind-html='getMsgText(channelType, msg)']"
LOC_WORKSPACE_CUSTOMER_HISTORY_SEARCH_CHAT_FROM_CUSTOMER = "xpath://span[@class='chat-body chat-body-customer']//span"
