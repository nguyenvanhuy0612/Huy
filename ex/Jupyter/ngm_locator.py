URL = "https://dev-8.ixcc-sandbox.avayacloud.com/services/ApplicationCenter/AdminPortal"
LOGIN_AGENT_USERNAME = "admin@pomsv1.com"
LOGIN_AGENT_PASSWORD = "Avaya123$"
LOGIN_AGENT_USERNAME_LOC = "//*[@id='username']"
LOGIN_AGENT_PASSWORD_LOC = "//*[@id='password']"
LOGIN_NEXT_BTN_LOC = "//*[@id='tr-login']"
LOGIN_BTN_LOC = "//*[@id='kc-login']"

AGENT_LISTS = ["tma" + str(i) for i in range(1, 20)]
TEMPLATE_PROFILE_NAME = "OutreachProfile"
AGENT_PASSWORD = "Avaya123$"

# todo queue
CC_BTN_LOC = "//li[@data-sidebar-id='ContactCenter']"
QUEUE_BTN_LOC = "//li[@data-sidebar-id='Queues']"
TABLE_QUEUE_CHECK_LOC = "//div[@id='commProfForm']//tbody"
QUEUE_FORM_CHECK_LOC = ""

CREATE_QUEUE_BTN_LOC = "//button[text()='Create Queue']"
QUEUE_NAME_LOC = "//input[@id='name']"
QUEUE_DESCRIPTION_LOC = "//*[@id='description']"
QUEUE_SAVE_BTN_LOC = "//div[@id='gcomp_content']//button[text()='Save']"

TOAST_LOC = "//app-notification-toast"

# todo user
USER_MANAGER_BTN_LOC = "//li[@data-sidebar-id='Config']"
USER_BTN_LOC = "//li[@data-sidebar-id='Manage Users']"

TABLE_USER_CHECK_LOC = "//div[@class='user-list-table']//div[@class='avaya-table avaya-table-streched']//tbody"

CREATE_USER_BTN_LOC = "//button[text()='Create User']"

USER_FIRSTNAME_LOC = "//input[@placeholder='First Name of User']"
USER_LASTNAME_LOC = "//input[@placeholder='Last Name of User']"
USER_DISPLAY_NAME_LOC = "//input[@placeholder='Display Name of User']"
USER_LOGIN_ID_LOC = "//input[@placeholder='Login ID for a User']"
USER_PASSWORD_LOC = "//input[@placeholder='Password']"
USER_CONFIRM_PASSWORD_LOC = "//input[@placeholder='Confirm Password']"
USER_SELECT_PROFILE_LOC = "//div[@aria-label='select profile']"
USER_SAMPLE_PROFILE_FORMAT_LOC = "//div[@title='{}']"
USER_QUEUE_SELECT_LOC = "//div[@aria-labelledby='queue-nameid']"
USER_QUEUE_NAME_FORMAT_LOC = "//div[@aria-labelledby='queue-nameid']//div[@title='{}']/parent::li"
USER_SAVE_BTN_LOC = "//div[@id='Manage Users']//button[text()='Save']"

LIST_USER_CHECK_LOC = "//div[@class='user-list-table']//tbody[@style]"

# todo rule
RULE_BTN_LOC = ""
CONTEXT_DATA_RULE_BTN_LOC = ""

TABLE_RULE_CHECK_LOC = ""

ADD_RULE_BTN_LOC = ""

RULE_NAME_LOC = "//input[@placeholder='Context Rule Name']"
RULE_CONDITION_KEY_LOC = "//input[@placeholder='Context Rule Name']"
RULE_CONDITION_VALUE_LOC = "//input[@placeholder='']"
RULE_ROUTING_QUEUE_SELECT_LOC = "//*[@placeholder='Select Routing Queue']"
RULE_ROUTING_QUEUE_FORMAT_LOC = "//input[@placeholder='Context Rule Name']"

