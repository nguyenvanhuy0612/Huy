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


# Huy, 11/03/2021
def _phone_window():
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
            # Test
        number_of_find -= 1
    workplace_window.SetActive()
    time.sleep(1)
    return workplace_window


def _workplace_window():
    workplace_window = auto.WindowControl(searchDepth=1, AutomationId="DashboardWindow")
    return workplace_window


def _setting_windows():
    setting_window = auto.WindowControl(searchDepth=1, AutomationId="SettingsAutoConfigWindow")
    if not setting_window.Exists(15, 2, True):
        exit(-1)
    setting_window.ButtonControl(searchDepth=1, AutomationId="LoginLogoutLoginButton").Exists(60, 2, True)
    time.sleep(1)
    setting_window.SetActive()
    time.sleep(1)
    return setting_window


def _config_setting_window():
    config_setting_window = auto.WindowControl(searchDepth=1, AutomationId="SettingsWindow")
    if not config_setting_window.Exists(15, 2, True):
        exit(-1)
    config_setting_window.SetActive()
    time.sleep(1)
    return config_setting_window


# =============================================================================================================
def _open_setting_and_get_info(workplace_window: auto.WindowControl):
    workplace_window.ButtonControl(AutomationId="DashboardOpenSettingsButton").DoubleClick(simulateMove=False,
                                                                                           waitTime=1)
    config_setting_window = auto.WindowControl(searchDepth=1, AutomationId="SettingsWindow")
    config_setting_window.Exists(10, 1)
    config_setting_window.ListItemControl(AutomationId="SettingsCategoriesListBoxItem2").Click(simulateMove=False,
                                                                                               waitTime=1)
    current_phone = config_setting_window.TextControl(AutomationId="ConnectedAsLabel").GetNextSiblingControl().Name
    return current_phone


def _open_avatar_popup(workplace_window):
    if not workplace_window.ButtonControl(AutomationId="PresencePopupCloseAvatarButton").Exists(1, 0.5):
        workplace_window.ButtonControl(AutomationId="UserDashboardOpenAvatarButton").Click(simulateMove=False)
    workplace_window.ButtonControl(AutomationId="PresencePopupCloseAvatarButton").Exists(5, 1)
    workplace_window.CaptureToImage("open_avatar.png")
    time.sleep(3)


def _close_avatar_popup(workplace_window):
    if workplace_window.ButtonControl(AutomationId="PresencePopupCloseAvatarButton").Exists(2, 0.5):
        workplace_window.ButtonControl(AutomationId="PresencePopupCloseAvatarButton").Click(simulateMove=False)
    workplace_window.ButtonControl(AutomationId="PresencePopupCloseAvatarButton").Disappears(2, 1)
    workplace_window.CaptureToImage("close_avatar.png")
    time.sleep(2)


def _get_phone_extension(workplace_window):
    extension = ""
    _open_avatar_popup(workplace_window)
    extension_text_block = workplace_window.TextControl(AutomationId="PresencePopupExtensionTextBlock")
    if extension_text_block.Exists(10, 2):
        extension = extension_text_block.Name
    else:
        BuiltIn().log_to_console("Cannot find current phone number")
    _close_avatar_popup(workplace_window)
    BuiltIn().log_to_console("current phone number is " + extension)
    return extension


def open_config_setting_window(setting_window):
    setting_window.ButtonControl(AutomationId="DashboardOpenSettingsButton").DoubleClick(simulateMove=False)
    config_setting_window = _config_setting_window()
    config_setting_window.ListItemControl(AutomationId="SettingsCategoriesListBoxItem2").Click(simulateMove=False)
    current_phone = config_setting_window.TextControl(AutomationId="ConnectedAsLabel").GetNextSiblingControl().Name
    BuiltIn().log_to_console(f"current_phone is {current_phone}")


# Huy, 15/03/2021
# for Avaya IX workplace 3.17 only, other phone may wrong locator
def login_phone(phone_number: str, password: str, server_info: str = None):
    workplace_window = _phone_window()
    current_phone = _open_setting_and_get_info(workplace_window)
    if phone_number == current_phone:
        auto.WindowControl(AutomationId="SettingsWindow").ButtonControl(Name="DONE").Click(simulateMove=False,
                                                                                           waitTime=1)
        BuiltIn().log_to_console(f"The phone {phone_number} is now logged in, no need to re-login.")
        return
    else:
        auto.WindowControl(AutomationId="SettingsWindow").ButtonControl(Name="SIGN OUT").Click(simulateMove=False,
                                                                                               waitTime=5)

    setting_window = _setting_windows()
    setting_window.ButtonControl(searchDepth=1, AutomationId="AutoConfigOpenSettingsButton").DoubleClick(
        simulateMove=False)
    config_setting_window = _config_setting_window()

    categories = config_setting_window.ListControl(searchDepth=1, AutomationId="SettingsCategoriesListBox")
    categories.ListItemControl(searchDepth=1, AutomationId="SettingsCategoriesListBoxItem2").Click(simulateMove=False)
    pane = config_setting_window.PaneControl(searchDepth=1, AutomationId="NonScrollingSettings")
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
    config_setting_window.ButtonControl(searchDepth=1, Name="DONE").Click(simulateMove=False)
    setting_window.SetActive()
    setting_window.SetFocus()
    setting_window.ButtonControl(searchDepth=1, AutomationId="LoginLogoutLoginButton").Exists(30, 2, True)
    setting_window.ButtonControl(searchDepth=1, AutomationId="LoginLogoutLoginButton").Click(simulateMove=False)
    time.sleep(2)
    workplace_window.Refind(30, 2)
    if workplace_window.Exists(30, 1, True):
        BuiltIn().log_to_console("Login phone number " + phone_number + " success")


def end_all_calls():
    workplace_window = _workplace_window()
    list_phone_handle = workplace_window.ListControl(AutomationId="CallStackListBox")
    while list_phone_handle.GetLastChildControl():
        first_phone = list_phone_handle.GetLastChildControl()
        resume_call = first_phone.ButtonControl(Name="Resume call")
        if resume_call.Exists(0, 0):
            resume_call.Click(simulateMove=False, waitTime=2)
        end_call = first_phone.ButtonControl(Name="End Call")
        if end_call.Exists(0, 0):
            end_call.Click(simulateMove=False, waitTime=2)


# ======================================================================================================================
# todo the function
# Huy, 11/03/2021
def logout_phone():
    workplace_window = _workplace_window()
    workplace_window.ButtonControl(searchDepth=1, AutomationId="UserDashboardOpenAvatarButton").Click(
        simulateMove=False)
    time.sleep(0.5)
    popup_window = workplace_window.WindowControl(searchDepth=1, ClassName="Popup")
    popup_window.ButtonControl(searchDepth=1, AutomationId="PresencePopupLogOutButton").Click(
        simulateMove=False)
    workplace_window.Disappears(10, 2, True)


# Huy, 11/03/2021
def make_call_to_number(number: str):
    workplace_window = _workplace_window()
    time.sleep(1)
    workplace_window.EditControl(searchDepth=1, AutomationId="SearchTextBoxMain").SendKeys("{Ctrl}a" + number,
                                                                                           interval=0.1)
    make_call_button = workplace_window.EditControl(searchDepth=1, AutomationId="SearchTextBoxMain").ButtonControl(
        searchDepth=1, AutomationId="PART_MakeAVoiceCallButton")
    make_call_button.Exists(10, 1)
    make_call_button.Click(simulateMove=False)
    if workplace_window.ListControl(searchDepth=1, AutomationId="CallStackListBox").Exists(30, 2, True):
        BuiltIn().log_to_console("Calling to " + number + " ...")


# Huy, 12/05/2021
def accept_call(number: str):
    workplace_window = _workplace_window()
    time.sleep(1)
    list_phone_handle = workplace_window.ListControl(AutomationId="CallStackListBox")
    if list_phone_handle.GetFirstChildControl():
        first_phone = list_phone_handle.GetFirstChildControl()
        if number in first_phone.TextControl(foundIndex=1).Name:
            first_phone.ButtonControl(Name="Answer").Click(simulateMove=False, waitTime=1)


# Huy, 11/03/2021
def release_first_call():
    workplace_window = _workplace_window()
    time.sleep(1)
    call_stacks = workplace_window.ListControl(searchDepth=1, AutomationId="CallStackListBox")
    first_call_stack = call_stacks.GetFirstChildControl()
    if not first_call_stack:
        BuiltIn().log_to_console("Not found Call")
        return
    if "Pause" == first_call_stack.ButtonControl(searchDepth=1, foundIndex=1).Name:
        BuiltIn().log_to_console("Call is pause, unpause call and release")
        first_call_stack.ButtonControl(searchDepth=1, foundIndex=1).DoubleClick(simulateMove=False)
        time.sleep(1)
    end_button = first_call_stack.ButtonControl(searchDepth=1, Name="Drop")
    if not end_button.Exists(10, 2):
        BuiltIn().log_to_console("Not found End call button")
    else:
        end_button.DoubleClick(simulateMove=False, waitTime=2)


def close_phone():
    try:
        logout_phone()
    except:
        BuiltIn().log_to_console("Cannot logout phone")
    setting_window = _setting_windows()
    setting_window.ButtonControl(searchDepth=1, AutomationId="PART_Close").ButtonControl(searchDepth=1,
                                                                                         AutomationId="CloseWindowButton").DoubleClick(
        simulateMove=False)

# todo Test ============================================================================================================
# login_phone("6500336", "12345678", "10.128.228.162,5061,aaccaccs.tma.com")
