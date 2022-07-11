# Author: Oanh Ho
# Created date: 23/02/2020

import uiautomation
import time
# from pywinauto.application import Application


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
    ix_call = uiautomation.WindowControl(Name="Avaya I X Workplace")
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
    btn_accept = ix_call.ButtonControl(Name="Answer")
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

