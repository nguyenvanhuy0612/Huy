# Author: Oanh Ho
# Created date: 17/02/2020
import uiautomation
import time
import subprocess


CONTENT_ELEMENT_EMAIL_WEB = "xpath://div[@class='widget widget--email']//cc-email-editor//div[@id='email--textarea']//p"
# CONTENT_ELEMENT_EMAIL_WEB = "xpath://div[@class='widget widget--email']//div[@id='email--textarea']//div//p"
CONTENT_EMAIL_WEB = "xpath://div[@class='widget widget--email']//div[@id='email--textarea']"
# CUST1_EMAIL = "WS_CUSTOMER1@acc7dc.tma.com"
# CUST2_EMAIL = "WS_CUSTOMER2@acc7dc.tma.com"
# CUST3_EMAIL = "WS_CUSTOMER3@acc7dc.tma.com"


# from os import listdir

def safe_open_outlook(outlook_path):
    outlook_window = uiautomation.WindowControl(searchDepth=1, ClassName="rctrl_renwnd32")
    if not outlook_window.Exists():
        subprocess.Popen(outlook_path)


def click_new_button():
    Outlook_Window = uiautomation.WindowControl(searchDepth=1, ClassName="rctrl_renwnd32")
    Outlook_Window.SetFocus()
    Outlook_Window.SendKeys('{Ctrl}n')


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
    cust_email_1 = Utitled_Window.MenuControl(Name="Context Menu")
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
    # set_Message.Click()
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
    # set_Message.Click()
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
    bnt_Attach = toolbar_ctr.ButtonControl(Name="Attach File")
    time.sleep(1)
    bnt_Attach.Click()
    Insert_Window = uiautomation.WindowControl(Name="Insert File")
    Insert_Window.SetFocus()

    Insert_Window.SendKeys('{Alt}' '{N}')
    Insert_Window.SendKeys(attachment_name)
    time.sleep(1)
    # click insert button
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
    # click Insert button
    insert_win.SendKeys('{Alt}' '{S}')
    time.sleep(2)


def click_send_button():
    bnt_Send = uiautomation.ButtonControl(Name="Send")
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
        raise ValueError("Cannot find the attachment")


def close_outlook():
    Outlook_Window = uiautomation.WindowControl(Name="Inbox - Microsoft Outlook")
    Outlook_Window.SetFocus()
    Outlook_Window.SendKeys('{Alt}' '{F4}')
    # btn_File = Outlook_Window.ButtonControl(Name = "Close")
    # btn_File.Click()
    # time.sleep(0.5)


# Huy - 4/3/2021
def create_new_email_without_attachment(to_email_address: str, subject: str, body: str):
    pass
