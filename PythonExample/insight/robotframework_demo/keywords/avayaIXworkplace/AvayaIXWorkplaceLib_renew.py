import uiautomation as auto
import time
import subprocess
from robot.libraries.BuiltIn import BuiltIn

"""
This is avaya IX Workplace library for testing, dev with Avaya IX Workplace version 3.11
Huy, 11/03/2021
"""

auto.uiautomation.OPERATION_WAIT_TIME = 1
auto.uiautomation.TIME_OUT_SECOND = 15
auto.uiautomation.SEARCH_INTERVAL = 1

# todo System variables
workplace_window: auto.WindowControl = None
workplace_setting_window: auto.WindowControl = None
workplace_config_setting_window: auto.WindowControl = None


# todo child func
# Huy, 11/03/2021
def _open_global_workplace_window():
    global workplace_window
    # Find `Avaya IX Workplace.exe` in window process
    if "Avaya IX Workplace.exe" not in str(subprocess.run(['tasklist'], capture_output=True, text=True).stdout):
        subprocess.Popen(r"C:\Program Files (x86)\Avaya\Avaya IX Workplace\Avaya IX Workplace.exe")
        time.sleep(10)
    workplace_window = auto.WindowControl(searchDepth=1, AutomationId="DashboardWindow")
    number_of_find = 10
    while number_of_find > 0:
        # Find `Avaya IX Workplace` window control
        if workplace_window.Exists(5, 1, True):
            break
        # Find `Avaya IX Workplace Setting` window control
        setting_win = auto.WindowControl(searchDepth=1, AutomationId="SettingsAutoConfigWindow")
        if setting_win.Exists(0, 0):
            setting_win.SetActive()
            setting_win.SetTopmost()
        sign_btn = setting_win.ButtonControl(AutomationId="LoginLogoutLoginButton")
        if sign_btn.Exists(0, 0):
            time.sleep(1)
            sign_btn.Click(simulateMove=False, waitTime=7)
        number_of_find -= 1
    workplace_window.SetActive()
    time.sleep(1)


# todo working Func ====================================================================================================
# Huy, 15/03/2021
# for Avaya IX workplace 3.17 only, other phone may wrong locator
def login_phone(phone_number: str, password: str, server_info: str = None):
    global workplace_window
    global workplace_setting_window
    global workplace_config_setting_window
    # initiate workplace_window
    if workplace_window is None:
        print("_open_global_workplace_window")
        _open_global_workplace_window()
    workplace_window.Refind()
    workplace_window.SetTopmost()
    # verify phone number
    workplace_window.ButtonControl(AutomationId="UserDashboardOpenAvatarButton").Click(simulateMove=False)
    time.sleep(2)
    extension_text_block = workplace_window.TextControl(AutomationId="PresencePopupExtensionTextBlock")
    extension_text_block.Exists()
    current_phone = extension_text_block.Name
    if phone_number == current_phone:
        BuiltIn().log_to_console(f"The phone {phone_number} is now logged in, no need to re-login.")
        workplace_window.ButtonControl(AutomationId="PresencePopupCloseAvatarButton").Click(simulateMove=False, waitTime=1)
        return
    else:
        BuiltIn().log_to_console(f"{phone_number} != {current_phone}, need re-login.")
        workplace_window.ButtonControl(AutomationId="PresencePopupLogOutButton").Click(simulateMove=False, waitTime=5)
    # find setting window
    workplace_setting_window = auto.WindowControl(searchDepth=1, AutomationId="SettingsAutoConfigWindow")
    workplace_setting_window.Exists(30, 1)

    workplace_setting_window.ButtonControl(searchDepth=1, AutomationId="AutoConfigOpenSettingsButton").DoubleClick(simulateMove=False)
    workplace_config_setting_window = auto.WindowControl(searchDepth=1, AutomationId="SettingsWindow")
    workplace_config_setting_window.Exists(15, 1)

    categories = workplace_config_setting_window.ListControl(searchDepth=1, AutomationId="SettingsCategoriesListBox")
    categories.ListItemControl(searchDepth=1, AutomationId="SettingsCategoriesListBoxItem2").Click(simulateMove=False)
    pane = workplace_config_setting_window.PaneControl(searchDepth=1, AutomationId="NonScrollingSettings")
    pane.EditControl(searchDepth=1, AutomationId="SipExtensionAutomationIdTextSettingTextBox").SendKeys(
        "{Ctrl}a" + phone_number, interval=0.07)
    pane.EditControl(searchDepth=1, AutomationId="SipPasswordAutomationId").SendKeys("{Ctrl}a" + password,
                                                                                     interval=0.07, waitTime=1)
    if server_info:
        info = server_info.split(',')
        categories.ListItemControl(searchDepth=1, AutomationId="SettingsCategoriesListBoxItem3").Click(
            simulateMove=False, waitTime=0.5)
        if pane.ButtonControl(searchDepth=1, AutomationId="SettingsToggleLinkButton").Name == "Show Details":
            pane.ButtonControl(searchDepth=1, AutomationId="SettingsToggleLinkButton").Click(simulateMove=False,
                                                                                             waitTime=0.5)
        pane.ButtonControl(searchDepth=1, AutomationId="SipNavigationContentButton").Click(simulateMove=False,
                                                                                           waitTime=0.5)
        pane.EditControl(searchDepth=1, AutomationId="SipServerAddressTextSettingTextBox").SendKeys("{Ctrl}a" + info[0],
                                                                                                    interval=0.07,
                                                                                                    waitTime=0.5)
        pane.EditControl(searchDepth=1, AutomationId="SipServerPortNumericSettingTextBox").SendKeys("{Ctrl}a" + info[1],
                                                                                                    interval=0.07,
                                                                                                    waitTime=0.5)
        pane.EditControl(searchDepth=1, AutomationId="SipDomainTextSettingTextBox").SendKeys("{Ctrl}a" + info[2],
                                                                                             interval=0.07,
                                                                                             waitTime=0.5)
        btn_tls = pane.ButtonControl(searchDepth=1, Name="Use TLS")
        # a = btn_tls.GetTogglePattern().ToggleState
        # a = btn_tls.GetLegacyIAccessiblePattern().State
        if btn_tls.GetTogglePattern().ToggleState != auto.ToggleState.On:
            btn_tls.Click(simulateMove=False, waitTime=0.5)
    time.sleep(1.5)
    workplace_config_setting_window.ButtonControl(searchDepth=1, Name="DONE").Click(simulateMove=False)
    workplace_setting_window.Refind()
    workplace_setting_window.ButtonControl(searchDepth=1, AutomationId="LoginLogoutLoginButton").Exists(30, 2, True)
    workplace_setting_window.ButtonControl(searchDepth=1, AutomationId="LoginLogoutLoginButton").Click(simulateMove=False)
    time.sleep(2)
    workplace_window.Refind(30, 2)
    if workplace_window.Exists(30, 1, True):
        BuiltIn().log_to_console("Login phone number " + phone_number + " success")
    workplace_setting_window = workplace_config_setting_window = None


def logout_phone():
    global workplace_window
    workplace_window.ButtonControl(searchDepth=1, AutomationId="UserDashboardOpenAvatarButton").Click(
        simulateMove=False)
    time.sleep(0.5)
    popup_window = workplace_window.WindowControl(searchDepth=1, ClassName="Popup")
    popup_window.ButtonControl(searchDepth=1, AutomationId="PresencePopupLogOutButton").Click(
        simulateMove=False)
    workplace_window.Disappears(10, 2, True)