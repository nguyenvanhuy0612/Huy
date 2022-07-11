import uiautomation as auto
import time
import subprocess
from robot.libraries.BuiltIn import BuiltIn

"""
This is avaya IX Workplace library for testing, dev with version 3.11
Huy, 11/03/2021
"""

auto.uiautomation.OPERATION_WAIT_TIME = 2
auto.uiautomation.TIME_OUT_SECOND = 15
auto.uiautomation.SEARCH_INTERVAL = 1


class AvayaIXWorkplace:
    # Huy, 11/03/2021
    def _workplace_window(self):
        workplace_window = auto.WindowControl(searchDepth=1, AutomationId="DashboardWindow")
        if not workplace_window.Exists(15, 2, printIfNotExist=True):
            subprocess.Popen(r"C:\Program Files (x86)\Avaya\Avaya IX Workplace\Avaya IX Workplace.exe")
            time.sleep(10)
            if not workplace_window.Exists(60, 5, True):
                exit(-1)
        workplace_window.SetActive()
        workplace_window.SetFocus()
        return workplace_window

    def _setting_windows(self):
        setting_window = auto.WindowControl(searchDepth=1, AutomationId="SettingsAutoConfigWindow")
        if not setting_window.Exists(15, 2, True):
            exit(-1)
        setting_window.ButtonControl(searchDepth=1, AutomationId="LoginLogoutLoginButton").Exists(60, 2, True)
        time.sleep(1)
        setting_window.SetFocus()
        return setting_window

    # Huy, 11/03/2021
    def login_phone(self, phone_number: str, password: str):
        workplace_window = self._workplace_window()
        workplace_window.ButtonControl(searchDepth=1, AutomationId="UserDashboardOpenAvatarButton").Click(
            simulateMove=False)
        time.sleep(0.5)
        popup_window = workplace_window.WindowControl(searchDepth=1, ClassName="Popup")
        if phone_number != popup_window.CustomControl(searchDepth=1,
                                                      ClassName="PresenceNameControl").GetNextSiblingControl().Name:
            popup_window.ButtonControl(searchDepth=1, AutomationId="PresencePopupLogOutButton").Click(
                simulateMove=False)
        else:
            popup_window.ButtonControl(searchDepth=1, AutomationId="PresencePopupCloseAvatarButton").Click(
                simulateMove=False)
            BuiltIn().log_to_console("The phone " + phone_number + " is now logged in, no need to re-login.")
            return
        setting_window = self._setting_windows()
        setting_window.ButtonControl(searchDepth=1, AutomationId="AutoConfigOpenSettingsButton").DoubleClick(
            simulateMove=False)
        config_setting_window = auto.WindowControl(searchDepth=1, AutomationId="SettingsWindow")
        config_setting_window.Exists(30, 2, True)
        config_setting_window.SetActive()
        config_setting_window.ListControl(searchDepth=1, AutomationId="SettingsCategoriesListBox").ListItemControl(
            searchDepth=1, AutomationId="SettingsCategoriesListBoxItem2").Click(simulateMove=False)
        pane = config_setting_window.PaneControl(searchDepth=1, AutomationId="NonScrollingSettings")
        pane.EditControl(searchDepth=1, AutomationId="SipExtensionAutomationIdTextSettingTextBox").SendKeys(
            "{Ctrl}a" + phone_number, interval=0.07)
        pane.EditControl(searchDepth=1, AutomationId="SipPasswordAutomationId").SendKeys("{Ctrl}a" + password,
                                                                                         interval=0.07, waitTime=1)
        config_setting_window.ButtonControl(searchDepth=1, Name="DONE").Click(simulateMove=False)
        setting_window.SetActive()
        setting_window.SetFocus()
        setting_window.ButtonControl(searchDepth=1, AutomationId="LoginLogoutLoginButton").Exists(30, 2, True)
        setting_window.ButtonControl(searchDepth=1, AutomationId="LoginLogoutLoginButton").Click(simulateMove=False)
        time.sleep(2)
        if workplace_window.Exists(30, 2, True):
            BuiltIn().log_to_console("Login phone number " + phone_number + " success")

    # Huy, 11/03/2021
    def logout_phone(self):
        workplace_window = self._workplace_window()
        workplace_window.ButtonControl(searchDepth=1, AutomationId="UserDashboardOpenAvatarButton").Click(
            simulateMove=False)
        time.sleep(0.5)
        popup_window = workplace_window.WindowControl(searchDepth=1, ClassName="Popup")
        popup_window.ButtonControl(searchDepth=1, AutomationId="PresencePopupLogOutButton").Click(
            simulateMove=False)
        workplace_window.Disappears(10, 2, True)

    # Huy, 11/03/2021
    def make_call_to_number(self, number: str):
        workplace_window = self._workplace_window()
        time.sleep(1)
        workplace_window.EditControl(searchDepth=1, AutomationId="SearchTextBoxMain").SendKeys("{Ctrl}a" + number,
                                                                                               interval=0.1)
        make_call_button = workplace_window.EditControl(searchDepth=1, AutomationId="SearchTextBoxMain").ButtonControl(
            searchDepth=1, AutomationId="PART_MakeAVoiceCallButton")
        make_call_button.Exists(10, 1)
        make_call_button.Click(simulateMove=False)
        if workplace_window.ListControl(searchDepth=1, AutomationId="CallStackListBox").Exists(30, 2, True):
            BuiltIn().log_to_console("Calling to " + number + " ...")

    # Huy, 11/03/2021
    def release_call(self):
        workplace_window = self._workplace_window()
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

    def close_phone(self):
        try:
            self.logout_phone()
        except:
            BuiltIn().log_to_console("Cannot logout phone")
        setting_window = self._setting_windows()
        setting_window.ButtonControl(searchDepth=1, AutomationId="PART_Close").ButtonControl(searchDepth=1,
                                                                                             AutomationId="CloseWindowButton").DoubleClick(
            simulateMove=False)
