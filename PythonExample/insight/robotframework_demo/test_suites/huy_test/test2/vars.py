ACTIVATED_CUSTOMER_WIDGET_ = "xpath://div[@class='context-tab layout-row flex']"

CUSTOMER_SEARCH_BTN_CREATE_NEW_CUSTOMER = ACTIVATED_CUSTOMER_WIDGET_ + "//button[@ng-click='changeView()']"
CUSTOMER_SEARCH_INPUT_CONTENT_TITLE = ACTIVATED_CUSTOMER_WIDGET_ + "//input[@name='title']"
CUSTOMER_SEARCH_INPUT_CONTENT_LASTNAME = ACTIVATED_CUSTOMER_WIDGET_ + "//input[@name='lastName']"
CUSTOMER_SEARCH_INPUT_CONTENT_FIRSTNAME = ACTIVATED_CUSTOMER_WIDGET_ + "//input[@name='firstName']"
CUSTOMER_SEARCH_INPUT_CONTENT_EMAIL = ACTIVATED_CUSTOMER_WIDGET_ + "//input[@name='email']"
CUSTOMER_SEARCH_INPUT_CONTENT_INTERCODE = ACTIVATED_CUSTOMER_WIDGET_ + "//input[@name='interCode']"
CUSTOMER_SEARCH_INPUT_CONTENT_AREACODE = ACTIVATED_CUSTOMER_WIDGET_ + "//input[@name='areaCode']"
CUSTOMER_SEARCH_INPUT_CONTENT_NUMBER = ACTIVATED_CUSTOMER_WIDGET_ + "//input[@name='number']"
CUSTOMER_SEARCH_INPUT_CONTENT_SIPURI = ACTIVATED_CUSTOMER_WIDGET_ + "//input[@name='sipuri']"
CUSTOMER_SEARCH_CHECKBOX_IS_RESTRICTED = ACTIVATED_CUSTOMER_WIDGET_ + "//md-checkbox[@aria-label='Restricted']"

EMAIL_FIELD_ = ACTIVATED_CUSTOMER_WIDGET_ + "//div[@ng-repeat='email in userInput.emailAddress track by $index']"
CUSTOMER_SEARCH_CHECKBOX_IS_EMAIL_DEFAULT = EMAIL_FIELD_ + "//md-checkbox"

PHONE_FIELD_ = ACTIVATED_CUSTOMER_WIDGET_ + "//div[@ng-repeat='phone in userInput.phoneNumber track by $index']"
CUSTOMER_SEARCH_CHECKBOX_IS_PHONE_BARRED = PHONE_FIELD_ + "//md-checkbox[@title='Barred']"
CUSTOMER_SEARCH_CHECKBOX_IS_PHONE_DEFAULT = PHONE_FIELD_ + "//md-checkbox[@title='Default']"

SIPURI_FIELD_ = ACTIVATED_CUSTOMER_WIDGET_ + "//div[@ng-repeat='sipUri in userInput.sipUri track by $index']"
CUSTOMER_SEARCH_CHECKBOX_IS_SIPURI_DEFAULT = SIPURI_FIELD_ + "//md-checkbox[@title='Default']"
