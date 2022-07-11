

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
LOC_WEBCHAT_SELECT_SKILLSET = "xpath://select[@id='skillset-chat']/option[@value=\'" + CONTACT_SKILLSET_VAR + "\']"
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


