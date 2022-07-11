import pyautogui
import uiautomation
import time
import subprocess

uiautomation.uiautomation.TIME_OUT_SECOND = 20
uiautomation.uiautomation.OPERATION_WAIT_TIME = 1


class IE:
    win: uiautomation.uiautomation.WindowControl = None
    ccma = "https://100.30.7.78"

    def open_ie(self, ie_path: str = "C:\\Program Files\\Internet Explorer\\iexplore.exe"):
        self.win = uiautomation.WindowControl(searchDepth=1, ClassName="IEFrame")
        if not self.win.Exists(0, 0):
            subprocess.Popen(ie_path)
        self.win.SetFocus()
        self.win.SetActive()
        self.win.SetTopmost()

    def close_ie(self):
        subprocess.call("taskkill /f /im iexplore.exe")

    def enter_url(self, ccma_url: str = "https://100.30.7.78"):
        self.ccma = ccma_url
        self.win.SendKeys("{ctrl}l", waitTime=1)
        self.win.SendKeys(ccma_url + "{enter}", waitTime=1)
        link_cer_error = self.win.HyperlinkControl(AutomationId="overridelink")
        if link_cer_error.Exists(5, 1):
            link_cer_error.Click(simulateMove=False, waitTime=1)

    def login_ccma(self, username: str = "nvhuy", password: str = "1_Abc_123"):
        self.win.TextControl(Name="Login").Exists(10, 1)
        self.win.SendKeys(username+"{tab}"+password+"{enter}", waitTime=1, interval=0.02)

    def goto_data_management(self):
        max_win = self.win.ButtonControl(Name="Maximize")
        if max_win.Exists(0, 0):
            max_win.Click(simulateMove=False, waitTime=1)
        link = self.win.GroupControl(Name="Click to show Data Management")
        if link.Exists(5, 1):
            link.Click(simulateMove=False, waitTime=1)
        else:
            self.win.SendKeys("{WIN}l"+self.ccma+"/DataManagement/default.asp{enter}", waitTime=1, interval=0.02)
            link.Refind(10, 1)
            link.Click(simulateMove=False, waitTime=1)

    def open_data_management(self):
        pane = self.win.PaneControl(ClassName="SSTreeWndClass")
        pane.Click(waitTime=1, simulateMove=False)
        pane.SendKeys("{down}", waitTime=1)
        pane.SendKeys("{space}", waitTime=1)
        self.win.ButtonControl(AutomationId="btnLaunch").Click(waitTime=1, simulateMove=False)
        self.win.SetTopmost(isTopmost=False)




