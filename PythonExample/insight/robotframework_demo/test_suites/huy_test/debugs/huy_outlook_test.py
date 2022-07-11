# """
# Test safe open outlook
# """
#
# import keywords.outlook.OutlookLocator as outlook
#
#
# outlook.safe_open_outlook('C:/Program Files (x86)/Microsoft Office/Office12/OUTLOOK.EXE')

from keywords.outlook.outlookLib import *

customer_sent_an_email(email_to_address="nvhuy_esl@acc.com", email_body="123", email_subject="123", customer_email="nvhuy2@acc.com")