import uiautomation as auto
import time
import subprocess
from robot.libraries.BuiltIn import BuiltIn

"""
This is avaya IX Workplace library for testing, dev with Avaya IX Workplace version 3.17
Huy, 8/6/2021
"""

auto.uiautomation.OPERATION_WAIT_TIME = 1
auto.uiautomation.TIME_OUT_SECOND = 15
auto.uiautomation.SEARCH_INTERVAL = 1

# todo System variables
workplace_window: auto.WindowControl = None
workplace_setting_window: auto.WindowControl = None
workplace_config_setting_window: auto.WindowControl = None


def safe_click(element, sleepTime: float = 1, simulateMove: bool = False, waitTime: float = 0.5):
    element.MoveCursorToMyCenter()
    time.sleep(sleepTime)
    element.Click(simulateMove=simulateMove)
    time.sleep(waitTime)


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
        sign_btn = setting_win.ButtonControl(AutomationId="LoginLogoutLoginButton")
        if sign_btn.Exists(0, 0):
            time.sleep(1)
            safe_click(sign_btn, waitTime=7)
        number_of_find -= 1
    workplace_window.SetActive()
    time.sleep(1)


# todo working Func
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
    if not workplace_window.IsTopmost():
        workplace_window.SetTopmost()
    workplace_window.SetActive()
    # verify phone number
    avatar = workplace_window.ButtonControl(AutomationId="UserDashboardOpenAvatarButton")
    safe_click(avatar)
    time.sleep(2)
    extension_text_block = workplace_window.TextControl(AutomationId="PresencePopupExtensionTextBlock")
    extension_text_block.Exists()
    current_phone = extension_text_block.Name
    if phone_number == current_phone:
        BuiltIn().log_to_console(f"The phone {phone_number} is now logged in, no need to re-login.")
        safe_click(workplace_window.ButtonControl(AutomationId="PresencePopupCloseAvatarButton"), waitTime=1)
        return
    else:
        BuiltIn().log_to_console(f"{phone_number} != {current_phone}, need re-login.")
        safe_click(workplace_window.ButtonControl(AutomationId="PresencePopupLogOutButton"), waitTime=5)
    # find setting window
    workplace_setting_window = auto.WindowControl(searchDepth=1, AutomationId="SettingsAutoConfigWindow")
    workplace_setting_window.Exists(30, 1)

    workplace_setting_window.ButtonControl(searchDepth=1, AutomationId="AutoConfigOpenSettingsButton").DoubleClick()
    workplace_config_setting_window = auto.WindowControl(searchDepth=1, AutomationId="SettingsWindow")
    workplace_config_setting_window.Exists(15, 1)

    categories = workplace_config_setting_window.ListControl(searchDepth=1, AutomationId="SettingsCategoriesListBox")
    safe_click(categories.ListItemControl(searchDepth=1, AutomationId="SettingsCategoriesListBoxItem2"))
    pane = workplace_config_setting_window.PaneControl(searchDepth=1, AutomationId="NonScrollingSettings")
    pane.EditControl(searchDepth=1, AutomationId="SipExtensionAutomationIdTextSettingTextBox").SendKeys(
        "{Ctrl}a" + phone_number, interval=0.07)
    pane.EditControl(searchDepth=1, AutomationId="SipPasswordAutomationId").SendKeys("{Ctrl}a" + password,
                                                                                     interval=0.07, waitTime=1)
    if server_info:
        info = server_info.split(',')
        safe_click(categories.ListItemControl(searchDepth=1, AutomationId="SettingsCategoriesListBoxItem3"),
                   waitTime=0.5)
        if pane.ButtonControl(searchDepth=1, AutomationId="SettingsToggleLinkButton").Name == "Show Details":
            safe_click(pane.ButtonControl(searchDepth=1, AutomationId="SettingsToggleLinkButton"), waitTime=0.5)
        safe_click(pane.ButtonControl(searchDepth=1, AutomationId="SipNavigationContentButton"), waitTime=0.5)
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
            safe_click(btn_tls, waitTime=0.5)
    time.sleep(1.5)
    safe_click(workplace_config_setting_window.ButtonControl(searchDepth=1, Name="DONE"))
    workplace_setting_window.Refind()
    workplace_setting_window.ButtonControl(searchDepth=1, AutomationId="LoginLogoutLoginButton").Exists(30, 2, True)
    safe_click(workplace_setting_window.ButtonControl(searchDepth=1, AutomationId="LoginLogoutLoginButton"),
               sleepTime=0.5)
    time.sleep(2)
    workplace_window.Refind(30, 2)
    if workplace_window.Exists(30, 1, True):
        BuiltIn().log_to_console("Login phone number " + phone_number + " success")
    workplace_setting_window = workplace_config_setting_window = None
    if workplace_window.IsTopmost():
        workplace_window.SetTopmost(False)


def logout_phone():
    global workplace_window
    time.sleep(1)
    safe_click(workplace_window.ButtonControl(AutomationId="UserDashboardOpenAvatarButton"))
    time.sleep(0.5)
    popup_window = workplace_window.WindowControl(searchDepth=1, ClassName="Popup")
    safe_click(popup_window.ButtonControl(searchDepth=1, AutomationId="PresencePopupLogOutButton"))
    workplace_window.Disappears(15, 1, True)
    workplace_window = None


def make_call_to_number(number: str):
    global workplace_window
    workplace_window.SetActive()
    time.sleep(1)
    workplace_window.EditControl(searchDepth=1, AutomationId="SearchTextBoxMain").SendKeys("{Ctrl}a" + number,
                                                                                           interval=0.1)
    make_call_button = workplace_window.EditControl(searchDepth=1, AutomationId="SearchTextBoxMain").ButtonControl(
        searchDepth=1, AutomationId="PART_MakeAVoiceCallButton")
    make_call_button.Exists(10, 1)
    safe_click(make_call_button, waitTime=1)
    if workplace_window.ListControl(searchDepth=1, AutomationId="CallStackListBox").Exists(30, 2, True):
        BuiltIn().log_to_console("Calling to " + number + " ...")


def accept_call(number: str):
    global workplace_window
    workplace_window.SetActive()
    time.sleep(1)
    list_phone_handle = workplace_window.ListControl(AutomationId="CallStackListBox")
    if list_phone_handle.GetFirstChildControl():
        first_phone = list_phone_handle.GetFirstChildControl()
        if number in first_phone.TextControl(foundIndex=1).Name:
            safe_click(first_phone.ButtonControl(Name="Answer"), waitTime=1)


def release_first_call():
    global workplace_window
    workplace_window.SetActive()
    time.sleep(0.5)
    call_stacks = workplace_window.ListControl(searchDepth=1, AutomationId="CallStackListBox")
    first_call_stack = call_stacks.GetFirstChildControl()
    if not first_call_stack:
        BuiltIn().log_to_console("Not found Call")
        return
    if "Held" in first_call_stack.Name:
        BuiltIn().log_to_console("Call is pause, unpause call and release")
        safe_click(first_call_stack.ButtonControl(searchDepth=1, foundIndex=1), waitTime=1)
    end_button = first_call_stack.ButtonControl(searchDepth=1, Name="End Call")
    if not end_button.Exists(10, 2):
        BuiltIn().log_to_console("Not found End call button")
    else:
        safe_click(end_button, waitTime=2)


def end_all_calls():
    global workplace_window
    workplace_window.SetActive()
    time.sleep(0.5)
    list_phone_handle = workplace_window.ListControl(AutomationId="CallStackListBox")
    while list_phone_handle.GetLastChildControl():
        first_phone = list_phone_handle.GetLastChildControl()
        resume_call = first_phone.ButtonControl(Name="Resume call")
        if resume_call.Exists(0, 0):
            safe_click(resume_call, waitTime=2)
        end_call = first_phone.ButtonControl(Name="End Call")
        if end_call.Exists(0, 0):
            safe_click(end_call, waitTime=3)
