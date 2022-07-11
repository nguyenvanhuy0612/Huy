# Author: Oanh Ho
# Created date: 17/02/2020

import uiautomation
import time
# import pywinauto.application
# import sys
# import sockets
# import subprocess
# from robotremoteserver import RobotRemoteServer
# import _elementtree

def click_setting():
    AvayaComm_Window = uiautomation.WindowControl(Name="Avaya Communicator")
    AvayaComm_Window.SetFocus()

    # logout old phone number
    not_login = AvayaComm_Window.TextControl(Name="Logged in")
    btn_ActionButton = AvayaComm_Window.ButtonControl(AutomationId="ActionButton")
    if not_login.Exists(1):
        not_login.Click()
        btn_logout = uiautomation.ButtonControl(Name="Logout")
        btn_logout.Click()
        time.sleep(2)
        btn_ActionButton.Click()
    # click Action button
    time.sleep(1)
    btn_ActionButton.Click()
    choose_setting = uiautomation.MenuItemControl(Name="Settings")
    choose_setting.Click()

def settings_server(server_IP, domain_server):
    Settings_Window = uiautomation.WindowControl(ClassName="Window")
    Settings_Window.SetFocus()

    server_List = Settings_Window.ListItemControl(Name="Server")
    server_List.Click()

    server_address = Settings_Window.TextControl(Name="Server address")
    Edit_ServerIP = server_address.GetNextSiblingControl()
    Edit_ServerIP.SendKeys('{Ctrl}' '{A}')
    Edit_ServerIP.SendKeys('{DEL}')
    Edit_ServerIP.SendKeys(server_IP)

    # server port 5060
    text_control = Settings_Window.TextControl(Name="Server port")
    Edit_Port = text_control.GetNextSiblingControl()
    Edit_Port.SendKeys('{Ctrl}' '{A}')
    Edit_Port.SendKeys('{DEL}')
    Edit_Port.SendKeys("5060")
    time.sleep(1)

    # Transport Type: TCP
    TCP = Settings_Window.RadioButtonControl(Name="TCP")
    TCP.Click()

    # # domain
    domain = Settings_Window.TextControl(Name="Domain")
    Edit_Domain = domain.GetNextSiblingControl()
    Edit_Domain.SendKeys('{Ctrl}' '{A}')
    Edit_Domain.SendKeys('{DEL}')
    Edit_Domain.SendKeys(domain_server)

    time.sleep(1)
    btn_OK = uiautomation.ButtonControl(Name="OK")
    btn_OK.Click()

def login_extension(phone, password):
    AvayaComm_Window = uiautomation.WindowControl(Name="Avaya Communicator")
    AvayaComm_Window.SetFocus()
    #Login_Button = AvayaComm_Window.ButtonControl(AutomationID="loginButton")
    Login_Button = AvayaComm_Window.TextControl(Name="Not logged in")
    Login_Button.Click()
    time.sleep(1)

    # edit phone
    btn_logout = uiautomation.ButtonControl(Name="Logout")
    Edit_phone1 = btn_logout.GetNextSiblingControl()
    Edit_phone = Edit_phone1.GetFirstChildControl()
    Edit_phone.SendKeys('{Ctrl}' '{A}')
    Edit_phone.SendKeys('{DEL}')
    Edit_phone.SendKeys(phone)
    time.sleep(1)
    Edit_phone.SendKeys('{Tab}')
    # edit password
    Edit_password1 = Edit_phone1.GetNextSiblingControl()
    Edit_password = Edit_password1.GetFirstChildControl()
    Edit_password.SendKeys('{Ctrl}' '{A}')
    Edit_password.SendKeys('{DEL}')
    Edit_password.SendKeys(password)
    Edit_password.SendKeys('{Enter}')
    logged_station_name = AvayaComm_Window.TextControl(Name="Incorrect extension or password.")
    if logged_station_name.Exists(1):
        raise Exception("Login Station Unsuccessfully")

def make_call_out_by_phoneset(call_out_number):
    AvayaComm_Window = uiautomation.WindowControl(Name="Avaya Communicator")
    AvayaComm_Window.SetFocus()
    #enter phone number
    new_conversation = AvayaComm_Window.ButtonControl(Name="new conversation")
    parent_conversation = new_conversation.GetParentControl()
    Enter_number = parent_conversation.GetFirstChildControl()
    Enter_number.Click()
    text_number = Enter_number.GetNextSiblingControl()
    text_number2 = text_number.GetNextSiblingControl()
    Enter_number = text_number2.GetNextSiblingControl()
    Enter_number.SendKeys(call_out_number)
    Enter_number.SendKeys('{Enter}')
    time.sleep(5)

def hold_call_by_phoneset():
    list_Item_Control = uiautomation.ListItemControl(Name="Avaya.Flare.Modules.Views.Compact.Conversation.DataTypes.IpoActiveCall")
    list_child_last = list_Item_Control.GetLastChildControl()
    btn_Hold_Call = list_child_last.GetPreviousSiblingControl()
    btn_Hold_Call.Click()

def unhold_call_by_phoneset():
    list_Item_Control = uiautomation.ListItemControl(Name="Avaya.Flare.Modules.Views.Compact.Conversation.DataTypes.IpoHeldCall")
    list_child_last = list_Item_Control.GetLastChildControl()
    btn_Unhold_Call = list_child_last.GetPreviousSiblingControl()
    btn_Unhold_Call.Click()

def release_call_by_phoneset():
    list_Item_Control = uiautomation.ListItemControl(Name="Avaya.Flare.Modules.Views.Compact.Conversation.DataTypes.IpoActiveCall")
    list_child1 = list_Item_Control.GetFirstChildControl()
    list_child2 = list_child1.GetNextSiblingControl()
    btn_End_Call = list_child2.GetNextSiblingControl()
    btn_End_Call.Click()

def switch_to_this_app():
    app_AvayaCommunicator = uiautomation.ButtonControl(Name="Avaya Communicator")
    app_AvayaCommunicator.Click()

