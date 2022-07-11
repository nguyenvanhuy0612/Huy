import uiautomation as auto
import uiautomation
import time
import subprocess

from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from uiautomation import Keys
from selenium.webdriver.support import expected_conditions as EC
#import pyautogui

"""
This is data management lib for delete customer data
"""

auto.uiautomation.OPERATION_WAIT_TIME = 2
auto.uiautomation.TIME_OUT_SECOND = 15
auto.uiautomation.SEARCH_INTERVAL = 1


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
        if self.win.ButtonControl(AutomationId="Close").Exists(5, 1):
            time.sleep(1)
            self.win.ButtonControl(AutomationId="Close").Click(waitTime=1)

    def close_ie(self):
        subprocess.call("taskkill /f /im iexplore.exe")

    def enter_url(self, ccma_url: str = "https://100.30.7.78"):
        self.win.PaneControl(ClassName="Address Band Root").Click(waitTime=1)
        self.ccma = ccma_url
        self.win.SendKeys("{ctrl}l", waitTime=1, interval=0.03)
        self.win.SendKeys("{ctrl}a" + self.ccma + "{enter}", waitTime=1)
        link_cer_error = self.win.HyperlinkControl(AutomationId="overridelink")
        if link_cer_error.Exists(5, 1):
            link_cer_error.Click(waitTime=1)

    def login_ccma(self, username: str = "nvhuy", password: str = "1_Abc_123"):
        self.win.TextControl(Name="Login").Exists(10, 1)
        self.win.EditControl(AutomationId="Username").Click(waitTime=1)
        self.win.SendKeys(username + "{tab}" + password + "{enter}", waitTime=1, interval=0.02)

    def goto_data_management(self):
        max_win = self.win.ButtonControl(Name="Maximize")
        if max_win.Exists(0, 0):
            max_win.Click(waitTime=1)
        link = self.win.GroupControl(Name="Click to show Data Management")
        if link.Exists(5, 1):
            link.Click(waitTime=1)
        else:
            self.win.SendKeys("{ctrl}l" + self.ccma + "/DataManagement/default.asp{enter}", waitTime=1, interval=0.02)
            link.Refind(5, 1)
            link.Click(waitTime=1)

    def open_data_management(self):
        pane = self.win.PaneControl(ClassName="SSTreeWndClass")
        pane.Click(waitTime=2)
        pane.SendKeys("{down 2}", waitTime=1, interval=0.05)
        pane.SendKeys("{space}", waitTime=1, interval=0.05)
        self.win.ButtonControl(AutomationId="btnLaunch").Click(waitTime=1)
        self.win.SetTopmost(isTopmost=False)


def safe_click(element, sleepTime: float = 1, simulateMove: bool = False, waitTime: float = 0.5):
    element.MoveCursorToMyCenter()
    time.sleep(sleepTime)
    element.Click(simulateMove=simulateMove)
    time.sleep(waitTime)


def open_data_management(ccma_url: str = "https://100.30.7.78"):
    if is_data_window_present():
        return None
    ie = IE()
    ie.open_ie()
    ie.enter_url(ccma_url)
    ie.login_ccma()
    ie.goto_data_management()
    ie.open_data_management()
    time.sleep(5)
    ie.close_ie()
    ok_button = uiautomation.WindowControl(Name="CCMM Data Management").ButtonControl(Name="OK")
    if ok_button.Exists(5, 1):
        safe_click(ok_button, sleepTime=0.5)


def is_data_window_present():
    data_window = auto.WindowControl(searchDepth=1, Name="CCMM Data Management")
    if data_window.Exists(5, 1):
        return True
    return False


def _data_window():
    data_window = auto.WindowControl(searchDepth=1, Name="CCMM Data Management")
    data_window.Exists(10, 1)
    data_window.SetActive()
    data_window.SetFocus()
    data_window.SetTopmost()
    return data_window


def set_window_minimum(data_window=None):
    if not data_window:
        data_window = _data_window()
    safe_click(data_window.ButtonControl(searchDepth=2, Name="Minimize"), waitTime=1)


def set_window_maximum(data_window=None):
    if not data_window:
        data_window = _data_window()
    safe_click(data_window.ButtonControl(searchDepth=2, Name="Maximize"), waitTime=1)


def close_data_management(data_window=None):
    if not data_window:
        data_window = _data_window()
    safe_click(data_window.ButtonControl(searchDepth=2, Name="Close"), waitTime=1)


def search_customer(search_content: str, search_by: str = "email"):
    return_data = ["Not found name with " + search_content, "Not found email/phone with " + search_content,
                   "Not found contacts ID with " + search_content]
    txt_customer = "txtCustomerEmail"
    index_id = 2
    if search_by.lower() == "id":
        txt_customer = "txtCustomerID"
        index_id = 1
    elif search_by.lower() == "phone":
        txt_customer = "txtCustomerPhoneNumber"
        index_id = 3
    data_window = _data_window()
    safe_click(data_window.TabItemControl(searchDepth=2, Name="Privacy"), waitTime=1)
    safe_click(data_window.TabItemControl(searchDepth=2, Name="Privacy").TreeItemControl(searchDepth=3, AutomationId="InformationRequest"), waitTime=1)
    del_cus_req = data_window.GroupControl(searchDepth=2, AutomationId="grpActionDetails")
    cus_search = del_cus_req.GroupControl(searchDepth=1, AutomationId="grpCustomerSearch")
    safe_click(cus_search.ComboBoxControl(searchDepth=1, ClassName="ComboBox"))
    safe_click(data_window.PaneControl(searchDepth=2, ClassName="ScrollViewer").ListItemControl(Name="CCMMArchive.RuleType", foundIndex=index_id))
    cus_search.EditControl(searchDepth=1, AutomationId=txt_customer).SendKeys("{Ctrl}a" + search_content, waitTime=1)
    safe_click(cus_search.ButtonControl(searchDepth=1, AutomationId="btnSearch"), waitTime=1)

    custom = cus_search.CustomControl(AutomationId="PART_GridViewVirtualizingPanel")

    if not custom.GetFirstChildControl() is None:
        return_data[0] = custom.GetFirstChildControl().TextControl(searchDepth=1, foundIndex=1,
                                                                   ClassName="GridViewCell").Name.strip()
        return_data[1] = custom.GetFirstChildControl().TextControl(searchDepth=1, foundIndex=2,
                                                                   ClassName="GridViewCell").Name.strip()
        return_data[2] = custom.GetFirstChildControl().TextControl(searchDepth=1, foundIndex=3,
                                                                   ClassName="GridViewCell").Name.strip()
    return return_data


def delete_customer(delete_content: str, delete_by: str = "email"):
    txt_customer = "txtCustomerEmail"
    index_id = 2
    if delete_by:
        if delete_by.lower() == "id":
            txt_customer = "txtCustomerID"
            index_id = 1
        elif delete_by.lower() == "phone":
            txt_customer = "txtCustomerPhoneNumber"
            index_id = 3
    data_window = _data_window()
    safe_click(data_window.TabItemControl(searchDepth=2, Name="Privacy"), waitTime=1)
    safe_click(data_window.TabItemControl(searchDepth=2, Name="Privacy").TreeItemControl(searchDepth=3, AutomationId="DeleteRequest"), waitTime=1)
    del_cus_req = data_window.GroupControl(searchDepth=2, Name="Delete Customer Request")
    cus_search = del_cus_req.GroupControl(searchDepth=1, AutomationId="grpCustomerSearch")
    safe_click(cus_search.ComboBoxControl(searchDepth=1, ClassName="ComboBox"))
    safe_click(data_window.PaneControl(searchDepth=2, ClassName="ScrollViewer").ListItemControl(Name="CCMMArchive.RuleType", foundIndex=index_id))
    cus_search.EditControl(searchDepth=1, AutomationId=txt_customer).SendKeys("{Ctrl}a" + delete_content, waitTime=1)
    safe_click(cus_search.ButtonControl(searchDepth=1, AutomationId="btnSearch"), waitTime=1)

    custom = cus_search.CustomControl(AutomationId="PART_GridViewVirtualizingPanel")

    if not custom.GetFirstChildControl() is None:
        safe_click(custom.GetFirstChildControl(), waitTime=1)
        safe_click(del_cus_req.ButtonControl(Name="Delete"), waitTime=1)
        safe_click(data_window.WindowControl(searchDepth=1, Name="CCMM Data Management").ButtonControl(searchDepth=1, Name="Yes"))
    time.sleep(1)
    set_window_minimum()
