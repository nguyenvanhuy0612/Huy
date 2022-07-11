# Author: Oanh Ho
# Created date: 17/02/2020

import uiautomation
import time


# import os
# from pywinauto.application import Application


def check_error():
    # Wait and click OK on Audio Error message if it is displayed.
    while uiautomation.WindowControl(Name="WindowMessageBox").Exists(3):
        uiautomation.WindowControl(Name="WindowMessageBox").ButtonControl(Name="OK").Click()


def click_setting():
    OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    time.sleep(1)
    btn_Menu = OneX_Window.ButtonControl(AutomationId="ButtonMenu")
    time.sleep(1)
    btn_Menu.Click()
    choose_logout = OneX_Window.MenuItemControl(Name="Log Out")
    # logout phone if it is login before
    if choose_logout.Exists(2):
        choose_logout.Click()
        time.sleep(1)
        OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
        OneX_Window.SetFocus()
        btn_Menu = OneX_Window.ButtonControl(AutomationId="ButtonMenu")
        time.sleep(1)
        btn_Menu.Click()
    # click setting
    choose_setting = OneX_Window.MenuItemControl(Name="Settings")
    choose_setting.Click()

    audio_error = uiautomation.WindowControl(Name="WindowMessageBox")

    # Wait and click OK on Audio Error message if it is displayed.
    while uiautomation.WindowControl(Name="WindowMessageBox").Exists(5):
        uiautomation.WindowControl(Name="WindowMessageBox").ButtonControl(Name="OK").Click()


def setting_onex(phone_num, password_onex, CM_server):
    Setting_general = uiautomation.WindowControl(Name="WindowSettingsGeneral")
    Setting_general.SetFocus()

    # add Extension
    extension = Setting_general.EditControl(ClassName="TextBox")
    extension.SetFocus()
    extension.SendKeys('{Ctrl}' '{A}')
    extension.SendKeys('{DEL}')
    extension.SendKeys(phone_num)

    # add password
    pass_onex = uiautomation.EditControl(ClassName="PasswordBox")
    pass_onex.SetFocus()
    pass_onex.SendKeys('{Ctrl}' '{A}')
    pass_onex.SendKeys('{DEL}')
    pass_onex.SendKeys(password_onex)

    # Clean old Server IP
    list_server = Setting_general.ListControl(AutomationID="ListBoxControllers")
    list_server.SetFocus()
    child_list_server = Setting_general.ListItemControl(Name="onexcui.ViewModel.WindowControllerViewModel")
    # remove all old server
    while child_list_server.Exists(3):
        child_list_server.Click()
        btn_remove = Setting_general.ButtonControl(Name="Remove")
        btn_remove.Click()

    # add server IP
    # click add button
    btn_add = Setting_general.ButtonControl(Name="Add")
    btn_add.Click()
    # add IP
    Window_add = uiautomation.WindowControl(Name="Add Server")
    Window_add.SetFocus()
    add_CM = Window_add.EditControl(ClassName="TextBox")
    add_CM.SendKeys(CM_server)
    # click ok
    btn_ok_ip = Window_add.ButtonControl(ClassName="Button")
    btn_ok_ip.SetFocus()
    btn_ok_ip.Click()

    while uiautomation.WindowControl(Name="WindowMessageBox").Exists(3):
        uiautomation.WindowControl(Name="WindowMessageBox").ButtonControl(Name="OK").Click()

    # click OK_General Setting
    Setting_general = uiautomation.WindowControl(Name="WindowSettingsGeneral")
    Setting_general.SetFocus()
    btn_ok = Setting_general.ButtonControl(Name="OK")
    btn_ok.SetFocus()
    btn_ok.Click()

    while uiautomation.WindowControl(Name="WindowMessageBox").Exists(3):
        uiautomation.WindowControl(Name="WindowMessageBox").ButtonControl(Name="OK").Click()


def click_login():
    Win_one = uiautomation.WindowControl(ClassName="Window")
    Win_one.SetFocus()
    btn_login = Win_one.ButtonControl(Name="Log In")
    btn_login.Click()

    # # verify login
    Win_login = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    if not Win_login.Exists():
        raise ValueError("Cannot login One_x")

    while uiautomation.WindowControl(Name="WindowMessageBox").Exists(3):
        uiautomation.WindowControl(Name="WindowMessageBox").ButtonControl(Name="OK").Click()


def click_logout():
    OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    onex_call = uiautomation.PaneControl(ClassName="ScrollViewer")
    onex_call.SetFocus()
    btn_setting = uiautomation.ButtonControl(AutomationId="ButtonMenu")
    btn_setting.Click()
    Menu = uiautomation.MenuControl(ClassName="ContextMenu")
    Menu.SetFocus()
    choose_logout = Menu.MenuItemControl(Name="Log Out")
    choose_logout.Click()


def click_exit():
    OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    OneX_Window.SendKeys('{Alt}' '{F4}')
    # time.sleep(1)
    # btn_Menu = OneX_Window.ButtonControl(AutomationId="ButtonMenu") vv
    # btn_Menu.Click()
    # Menu = uiautomation.MenuControl(ClassName="ContextMenu")
    # Menu.SetFocus()
    # choose_logout = Menu.MenuItemControl(Name="Exit")
    # choose_logout.Click()


def call_out(phone_num):
    # OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    # OneX_Window.SetFocus()
    onex_call = uiautomation.PaneControl(ClassName="ScrollViewer")
    onex_call.SetFocus()
    input_num = onex_call.EditControl(AutomationId="TextBoxSearch")
    input_num.SetFocus()
    input_num.SendKeys(phone_num + '{Enter}')
    # extension.SendKeys('{Ctrl}' '{A}')
    # extension.SendKeys('{DEL}')


def call_accept():
    OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    onex_call = uiautomation.PaneControl(ClassName="ScrollViewer")
    onex_call.SetFocus()
    btn_accept = onex_call.ButtonControl(AutomationId="ButtonHold")
    btn_accept.Click()


def end_call():
    OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    # onex_call = uiautomation.PaneControl(ClassName = "ScrollViewer")
    # onex_call.SetFocus()
    btn_end = OneX_Window.ButtonControl(AutomationId="ButtonEnd")
    btn_end.SetFocus()
    btn_end.Click()


def hold_call():
    OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    onex_call = uiautomation.PaneControl(ClassName="ScrollViewer")
    onex_call.SetFocus()
    btn_end = onex_call.ButtonControl(AutomationId="ButtonHold")
    btn_end.Click()


def unhold_call():
    OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    onex_call = uiautomation.PaneControl(ClassName="ScrollViewer")
    onex_call.SetFocus()
    btn_end = onex_call.ButtonControl(AutomationId="ButtonHold")
    btn_end.Click()


def close_onex():
    OneX_Window = uiautomation.WindowControl(Name="Avaya one-X® Communicator")
    OneX_Window.SetFocus()
    time.sleep(1)
    btn_Menu = OneX_Window.ButtonControl(AutomationId="ButtonClose")
    time.sleep(1)
    btn_Menu.Click()


#
#
# def open_one_x_communicator(self, one_x_path):
#     app = Application(backend="uia").start(r"" + one_x_path)
#     onex = app.window(best_match=ONEX_COMMUNICATOR)
#     onex.wait("visible", 30)
#
#     # Author: Phuc Hoang
#     # Created Date: 08/14/2018
# def __get_onex_application(self):
#     return Application(backend="uia").connect(title_re=ONEX_COMMUNICATOR_TITLE)
#
#     # Author: Phuc Hoang
#     # Created Date: 08/14/2018
# def __get_onex_communicator(self):
#         app = Application(backend="uia").connect(title_re=ONEX_COMMUNICATOR_TITLE)
#         return app.window(best_match=ONEX_COMMUNICATOR)
#
#     # Author: Phuc Hoang
#     # Created Date: 08/14/2018
#     # Click button number in onex
#     # Variable:
#     #       number: / Ex 1, 2, 3, 4, 5
# def __click_button_number(self, number):
#     onex = self.__get_onex_communicator()
#     if number == '0':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_ZERO).click()
#     elif number == '1':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_ONE).click()
#     elif number == '2':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_TWO).click()
#     elif number == '3':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_THREE).click()
#     elif number == '4':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_FOUR).click()
#     elif number == '5':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_FIVE).click()
#     elif number == '6':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_SIX).click()
#     elif number == '7':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_SEVEN).click()
#     elif number == '8':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_EIGHT).click()
#     elif number == '9':
#         onex.child_window(auto_id=ONEX_DIAL_BUTTON_NINE).click()
#
# def add_servers_for_h323(server_urls):
#     # Click menu setting
#     onex = uiautomation.WindowControl(AutomationID="Window")
#     onex.SetFocus()
#     onex.child_window(auto_id=ONEX_LOGIN_MENU).Click()
#     onex.child_window(auto_id=ONEX_LOGIN_MENU_SETTING).Click()
#     # windowOnexC.ButtonControl(AutomationId="ButtonMenu").Click()
#     # contextMenu = windowOnexC.PaneControl(AutomationId="ContextMenuScrollViewer")
#     # contextMenu.MenuItemControl(AutomationId="MenuItemSettingsGeneral").Click()
#
#         # Close error message box
#     audio_error = uiautomation.WindowControl(best_match=ONEX_COMMUNICATOR_MESSAGE_BOX)
#     if audio_error.exists(2):
#         audio_error.child_window(auto_id=ONEX_COMMUNICATOR_MESSAGE_BOX_BTN_OK).click()
#         audio_error.child_window(auto_id=ONEX_COMMUNICATOR_MESSAGE_BOX_BTN_OK).click()
#
#             # # Check and click OK if Audio Error displays
#             # while automation.WindowControl(Name="WindowMessageBox").Exists(5):
#             #     automation.WindowControl(Name="WindowMessageBox").TextControl(Name="OK").Click()
#
#
#         # Click Telephony
#     generel_settings = onex.child_window(best_match=ONEX_LOGIN_MENU_SETTING)
#     generel_settings.child_window(auto_id=ONEX_LOGIN_SETTINGS_TELEPHONY).select()
#
#         # Click H.323
#     generel_settings.child_window(best_match=ONEX_LOGIN_SETTINGS_TELEPHONY_H323).select()
#
#         # Clear Server
#     server_list = generel_settings.child_window(auto_id=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_LIST, control_type="List")
#     server_count = server_list.item_count()
#     for i in range(server_count):
#         server_list.child_window(best_match="ListItem" + str((i + 1))).select()
#         generel_settings.child_window(best_match=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_BTN_REMOVE).click()
#
#         # Add Servers
#     for server_url in server_urls:
#         generel_settings.child_window(best_match=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_BTN_ADD).click()
#         generel_settings.window(best_match=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_DIALOG)\
#             .child_window(best_match=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_EDT_SERER_URL)\
#             .set_edit_text(server_url)
#         generel_settings.window(best_match=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_DIALOG)\
#             .child_window(best_match=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_BTN_OK).click()
#
#         # Verify servers is in list
#     server_list = generel_settings.child_window(auto_id=ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_LIST, control_type="List")
#     for server_url in server_urls:
#         server_list.child_window(title=str(server_url)).is_visible()
#
#         # Click OK to save configuration and close settings
#     generel_settings.window(best_match=ONEX_LOGIN_SETTINGS_BTN_OK).click()
#     if audio_error.exists(2):
#         audio_error.child_window(auto_id=ONEX_COMMUNICATOR_MESSAGE_BOX_BTN_OK).click()
#
#     # Author: Phuc Hoang
#     # Created Date: 08/14/2018
#     # Login Station
#     # Variable:
#     #       station: station number
#     #       password: password
# def login_station(self, station, password):
#     app = self.__get_onex_application()
#     onex = self.__get_onex_communicator()
#
#         # Input station number and password
#     onex.child_window(auto_id=ONEX_LOGIN_EDT_STATION).set_edit_text(station)
#     onex.child_window(auto_id=ONEX_LOGIN_EDT_PASSWORD).set_edit_text(password)
#
#         # Click Button Login
#     onex.child_window(best_match=ONEX_LOGIN_BTN_LOGIN).click()
#
#         # Close Audio Error
#     audio_error = app.window(best_match=ONEX_COMMUNICATOR_MESSAGE_BOX)
#     if audio_error.exists(2):
#         audio_error.child_window(auto_id=ONEX_COMMUNICATOR_MESSAGE_BOX_BTN_OK).click()
#         audio_error.child_window(auto_id=ONEX_COMMUNICATOR_MESSAGE_BOX_BTN_OK).click()
#
#         # Verify login successfully
#     logged_station_name = onex.child_window(auto_id=ONEX_BLOCK_USER_NAME).legacy_properties()['Name']
#     if logged_station_name != station:
#         raise Exception("Login Station Unsuccessfully")
#
#     # Author: Phuc Hoang
#     # Created Date: 08/14/2018
#     # Make call to station
#     # Variable: station_number
# def make_call_to_station(self, station_number):
#         # Connect onex c
#     onex = self.__get_onex_communicator()
#
#         # Input phone number
#     onex.child_window(auto_id=ONEX_EDT_PHONE_NUMBER_OR_NAME_SEARCH).set_edit_text(station_number)
#     onex.child_window(auto_id=ONEX_BTN_DIAL).click()
#
#         # Verify make call success
#     onex.child_window(auto_id=ONEX_BTN_HOLD).is_visible()
#
#     # Author: Phuc Hoang
#     # Created Date: 08/14/2018
#     # Make call to oceana system
#     # Variable:
#     #       oceana_number: phone number of oceana system
#     #       customer_id: customer id
#     #       service:    / Ex 1
#     #       attributes: list of attributes / Ex: [1 , 3 , 5]
#     # ONGOING: PHUC HOANG
# def make_call_to_oceana(self, oceana_number, account_num, request_service, department, language):
#         # Connect onex c
#     onex = self.__get_onex_communicator()
#
#         # Input phone number
#     onex.child_window(auto_id=ONEX_EDT_PHONE_NUMBER_OR_NAME_SEARCH).set_edit_text(oceana_number)
#
#         # Press call number
#     onex.child_window(auto_id=ONEX_BTN_DIAL).click()
#
#         # Show Dial Pad
#     dial_pad = onex.child_window(auto_id=ONEX_BTN_DIAL_PAD)
#     dial_pad_tooltip = dial_pad.legacy_properties()['Help']
#     print(dial_pad_tooltip)
#     if dial_pad_tooltip == 'Show Dialpad':
#         dial_pad.click()
#
#     time.sleep(3)
#
#         # Pick account number
#     self.__click_button_number(account_num)
#     time.sleep(5)
#
#         # Pick service number
#     self.__click_button_number(request_service)
#     time.sleep(5)
#
#         # Pick department number
#     self.__click_button_number(department)
#     time.sleep(5)
#
#         # Pick language number
#     self.__click_button_number(language)
#
# def kill_onex(self):
#     app = Application(backend="uia").connect(title_re=ONEX_COMMUNICATOR_TITLE)
#     app.kill()
#
#
#
#
# def login_onex(extension, extensionpw):
#     launch_onex()
#     windowOnexC = automation.WindowControl(Name="Avaya one-X® Communicator")
#     windowOnexC.ImageControl(AutomationId="PART_img_over").SetFocus()
#         # Click Menu/Settings
#     windowOnexC.ButtonControl(AutomationId="ButtonMenu").Click()
#     contextMenu = windowOnexC.PaneControl(AutomationId="ContextMenuScrollViewer")
#     contextMenu.MenuItemControl(AutomationId="MenuItemSettingsGeneral").Click()
#        # Check and click OK if Audio Error displays
#     while automation.WindowControl(Name="WindowMessageBox").Exists(5):
#         automation.WindowControl(Name="WindowMessageBox").TextControl(Name="OK").Click()
#
#         # Input extension and password
#     windowsettings = automation.WindowControl(Name="WindowSettingsGeneral")
#     usercontrolsettings = windowsettings.CustomControl(ClassName="UserControlSettingsPhone")
#     usercontrolsettings.EditControl(AutomationId="TextBoxExtension").SetValue(extensionValue)
#     usercontrolsettings.EditControl(AutomationId="TextBoxPassword").SetValue(extensionPw)
#
#         # Click Ok button
#     windowsettings.ButtonControl(Name="OK").Click()
#      # Wait and click OK on Audio Error message if it is displayed.
#     while automation.WindowControl(Name="WindowMessageBox").Exists(5):
#         automation.WindowControl(Name="WindowMessageBox").TextControl(Name="OK").Click()
#
#         # Click Log In button
#     windowOnexC.ButtonControl(Name="Log In").Click()
#
#         # Wait and click OK on Audio Error message if it is displayed.
#     while automation.WindowControl(Name="WindowMessageBox").Exists(5):
#         automation.WindowControl(Name="WindowMessageBox").TextControl(Name="OK").Click()
#         # Verify if Onex is logged in successfully.
#     if automation.WindowControl(Name="Avaya one-X® Communicator").Exists(5):
#         return True
#     else:
#         return False
#
#


# if __name__ == '__main__':
#     onex = OneXCommunicator()
#     onex.open_one_x_communicator("C:\Program Files\Avaya\Avaya one-X Communicator\onexcui.exe")
#     list = ["10.128.228.103", "10.128.228.119"]
#     onex.add_servers_for_h323(list)
#     onex.login_station("7000156", "12345678")
#     onex.make_call_to_oceana("8088000","1","1","3","4")
#     #onex.kill_onex()
#     pass

# Application
ONEX_COMMUNICATOR_TITLE = 'Avaya one-X® Communicato'
ONEX_COMMUNICATOR = 'Avayaone-X®CommunicatorDialog'

# ERROR MESSAGE BOX
ONEX_COMMUNICATOR_MESSAGE_BOX = 'MessageBox'
ONEX_COMMUNICATOR_MESSAGE_BOX_BTN_OK = 'ButtonOk'

# OneX Login
ONEX_LOGIN_MENU = "ButtonMenu"
ONEX_LOGIN_MENU_SETTING = "MenuItemSettingsGeneral"
ONEX_LOGIN_EDT_STATION = "TextBoxUser"
ONEX_LOGIN_EDT_PASSWORD = "PasswordBoxUser"
ONEX_LOGIN_BTN_LOGIN = "Login"

# Login Setting
ONEX_LOGIN_SETTINGS_TELEPHONY = "ListBoxItemPhone"
ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_LIST = "ListBoxControllers"
ONEX_LOGIN_SETTINGS_TELEPHONY_H323 = "H.323"
ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_BTN_REMOVE = "Remove"
ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_BTN_ADD = "Add"
ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_DIALOG = "Dialog"
ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_BTN_OK = "OK"
ONEX_LOGIN_SETTINGS_TELEPHONY_SERVER_EDT_SERER_URL = "ServerEdit"
ONEX_LOGIN_SETTINGS_BTN_OK = "OKButton"

# OneX
ONEX_BLOCK_USER_NAME = "TextBlockUserName"
ONEX_EDT_PHONE_NUMBER_OR_NAME_SEARCH = "TextBoxSearch"
ONEX_BTN_DIAL = "ButtonDial"
ONEX_BTN_DIAL_PAD = "ButtonDialpad"
ONEX_BTN_HOLD = "ButtonHold"
ONEX_TOOLTIP_SHOW_DIAL = "Show Dialpad"
ONEX_TOOLTIP_HIDE_DIAL = "Hide Dialpad"

# Dial Pad
ONEX_DIAL_BUTTON_ZERO = 'DialButtonZero'
ONEX_DIAL_BUTTON_ONE = 'DialButtonOne'
ONEX_DIAL_BUTTON_TWO = 'DialButtonTwo'
ONEX_DIAL_BUTTON_THREE = 'DialButtonThree'
ONEX_DIAL_BUTTON_FOUR = 'DialButtonFour'
ONEX_DIAL_BUTTON_FIVE = 'DialButtonFive'
ONEX_DIAL_BUTTON_SIX = 'DialButtonSix'
ONEX_DIAL_BUTTON_SEVEN = 'DialButtonSeven'
ONEX_DIAL_BUTTON_EIGHT = 'DialButtonEight'
ONEX_DIAL_BUTTON_NINE = 'DialButtonNine'
