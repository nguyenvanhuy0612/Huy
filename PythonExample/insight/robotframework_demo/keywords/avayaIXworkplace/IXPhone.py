import uiautomation as auto
import time
import subprocess
from robot.libraries.BuiltIn import BuiltIn

auto.uiautomation.OPERATION_WAIT_TIME = 1
auto.uiautomation.TIME_OUT_SECOND = 15
auto.uiautomation.SEARCH_INTERVAL = 1


class IXPhone(object):
    workplace_window = None
    setting_window = None
    config_setting_window = None

    def __init__(self):
        pass

    def is_run_on_system(self):
        if "Avaya IX Workplace.exe" in str(subprocess.run(['tasklist'], capture_output=True, text=True).stdout):
            return True
        return False

    def is_in_sign_in(self, maxTime: int = 10, interval: int = 1):
        configure_window = auto.WindowControl(searchDepth=1, AutomationId="SettingsAutoConfigWindow")
        if configure_window.Exists(maxTime, interval):
            return configure_window
        return None

    def is_phone_open(self, maxTime: int = 10, interval: int = 1):
        workplace_window = auto.WindowControl(searchDepth=1, AutomationId="DashboardWindow")
        if workplace_window.Exists(maxTime, interval):
            return workplace_window
        return None

    def is_config_setting_window(self, maxTime: int = 10, interval: int = 1):
        setting_window = auto.WindowControl(searchDepth=1, AutomationId="SettingsWindow")
        if setting_window.Exists(maxTime, interval):
            return setting_window
        return None

    def config_phone(self, workplace_window, phone_number: str, password: str, server_info: str = None):
        workplace_window.ButtonControl(AutomationId="PresencePopupLogOutButton").DoubleClick(simulateMove=False)
        config_setting_window = self.is_config_setting_window()
        config_setting_window.SetActive()
        config_setting_window.SetFocus()
        categories = config_setting_window.ListControl(searchDepth=1, AutomationId="SettingsCategoriesListBox")
        categories.ListItemControl(searchDepth=1, AutomationId="SettingsCategoriesListBoxItem2").Click(
            simulateMove=False)
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
            pane.EditControl(searchDepth=1, AutomationId="SipServerAddressTextSettingTextBox").SendKeys(
                "{Ctrl}a" + info[0],
                interval=0.07,
                waitTime=0.5)
            pane.EditControl(searchDepth=1, AutomationId="SipServerPortNumericSettingTextBox").SendKeys(
                "{Ctrl}a" + info[1],
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

    def login_phone(self, phone_number: str, password: str, server_info: str = None):
        if not self.is_run_on_system():
            subprocess.Popen(r"C:\Program Files (x86)\Avaya\Avaya IX Workplace\Avaya IX Workplace.exe")
            time.sleep(10)
        for i in range(10):
            self.workplace_window = self.is_phone_open(5, 1)
            if self.workplace_window:
                self.workplace_window.SetActive()
                self.workplace_window.SetFocus()

