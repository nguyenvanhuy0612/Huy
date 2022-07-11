import uiautomation as auto
import subprocess
from robot.libraries.BuiltIn import *

"""
Huy, 13/6/2021
"""
auto.uiautomation.DEBUG_EXIST_DISAPPEAR = True
auto.uiautomation.DEBUG_SEARCH_TIME = True

auto.uiautomation.OPERATION_WAIT_TIME = 1
auto.uiautomation.TIME_OUT_SECOND = 15
auto.uiautomation.SEARCH_INTERVAL = 1

# todo System variables
ie_window: auto.WindowControl = None
multimedia_window: auto.WindowControl = None


def safe_click(element, sleepTime: float = 1, simulateMove: bool = False, waitTime: float = 0.5, focus: bool = False):
    if focus:
        element.SetFocus()
    element.MoveCursorToMyCenter()
    time.sleep(sleepTime)
    element.Click(simulateMove=simulateMove)
    time.sleep(waitTime)


def find_and_click(element, maxSearchTime: float = 3, searchInterval: float = 1, sleepTime: float = 1,
                   waitTime: float = 0.5, simulateMove: bool = False, focus: bool = False):
    if element.Exists(maxSearchTime, searchInterval):
        safe_click(element, sleepTime, simulateMove, waitTime, focus)
        return True
    return False


# todo child func
# Huy, 11/03/2021
def _open_global_ie_window():
    global ie_window
    ie_window = None
    print("global ie_window = ", ie_window)
    ie_path = r"C:\\Program Files\\Internet Explorer\\iexplore.exe"
    if "iexplore.exe" not in str(subprocess.run(['tasklist'], capture_output=True, text=True).stdout):
        print("iexplore.exe not in tasklist, subprocess.Popen(ie_path)")
        subprocess.Popen(ie_path)
        time.sleep(3)
    ie_window = auto.WindowControl(searchDepth=1, ClassName="IEFrame")
    if not ie_window.Exists(10, 1):
        print("ie not exists")
        BuiltIn().log_to_console("Cannot open IE")
        BuiltIn().fail("Fail to open IE")
    i = 5  # number of find
    time.sleep(2)
    while i > 0:
        print(i)
        if not ie_window.SetActive():
            ie_window.SetFocus()
        # find and close asks default
        find_and_click(ie_window.WindowControl(searchDepth=1, ClassName="#32770").ButtonControl(Name="Close"), 0, 0,
                       0.5, 1)
        # find and close Notify bar
        find_and_click(
            ie_window.PaneControl(searchDepth=1, ClassName="Frame Notification Bar").ButtonControl(Name="Close"), 0, 0,
            0.5, 1)
        i -= 1
        time.sleep(1)


# todo ie func
# Huy, 13/6/2021
def ie_close():
    global ie_window
    ie_window = None
    time.sleep(1)
    if "iexplore.exe" in str(subprocess.run(['tasklist'], capture_output=True, text=True).stdout):
        subprocess.call("taskkill /f /im iexplore.exe")


def ie_enter_url(ccma_url: str = "https://100.30.7.78"):
    global ie_window
    find_and_click(ie_window.PaneControl(ClassName="Address Band Root"), waitTime=1, focus=True)
    ie_window.SendKeys("{ctrl}l", waitTime=1, interval=0.03)
    ie_window.SendKeys("{ctrl}a" + ccma_url + "{enter}", waitTime=1, interval=0.05)
    # find (10s) and click to error cer
    find_and_click(ie_window.HyperlinkControl(AutomationId="overridelink"), 10, 1, 0.5, 1, focus=True)
    # Check Login page display
    ie_window.TextControl(Name="Login").Exists(15, 1)


def ie_login_ccma(username: str = "nvhuy", password: str = "1_Abc_123"):
    global ie_window
    ie_window.TextControl(Name="Login").Exists(30, 1)
    safe_click(ie_window.EditControl(AutomationId="Username"), waitTime=0.5, focus=True)
    ie_window.SendKeys(username + "{tab}" + password + "{enter}", waitTime=2, interval=0.05)


def ie_goto_multimedia():
    global ie_window
    find_and_click(ie_window.ButtonControl(Name="Maximize"), 0, 0)
    if not find_and_click(ie_window.HyperlinkControl(SubName="Multimedia"), 5, 1, 1):
        ie_enter_url("https://100.30.7.78/DataManagement/default.asp")


def ie_open_multimedia():
    global ie_window
    time.sleep(3)
    find_and_click(ie_window.PaneControl(ClassName="SSTreeWndClass"), 5, 1, 1, 2, focus=True)
    pane_control = ie_window.PaneControl(ClassName="SSTreeWndClass")
    print(pane_control.SetFocus(), pane_control)
    pane_control.SendKeys("{down 2}", waitTime=1, interval=0.05)
    pane_control.SendKeys("{space}", waitTime=1, interval=0.05)
    find_and_click(ie_window.ButtonControl(AutomationId="btnLaunch"), 5, 1, 0.5, 1, focus=True)
    number_of_scan = 3
    while number_of_scan >= 0:
        # find and click Open button in notify bar
        a1 = find_and_click(ie_window.PaneControl(searchDepth=1, ClassName="Frame Notification Bar").ButtonControl(Name="Open"),3, 1, 0.5, 1, focus=True)
        # find and click run button
        a2 = find_and_click(auto.WindowControl(searchDepth=1, AutomationId="TrustManagerPromptUI").ButtonControl(AutomationId="btnInstall"), 2,0.5,0.5,10,True)
        # find and click OK button if an instance Data management is already running
        a3 = find_and_click(auto.WindowControl(searchDepth=1, Name="CCMM Data Management").ButtonControl(Name="OK"), 2, 1, 0.5,1, focus=True)
        # find and click YES button if user already logged in to Data management
        a4 = find_and_click(auto.WindowControl(searchDepth=1, Name="Data Management").ButtonControl(Name="Yes"), 2, 1, 0.5,1, focus=True)
        if a1 or a2 or a3 or a4:
            number_of_scan = 3
            continue
        number_of_scan -= 1


# todo Multimedia func
# Huy, 13/6/2021
def _global_multimedia_window(maxSearchTime: float = 10, searchInterval: float = 1):
    global multimedia_window
    multimedia_window = None
    multimedia_window = auto.WindowControl(searchDepth=1, Name="CCMM Administration")
    if not multimedia_window.Exists(maxSearchTime, searchInterval):
        print("Cannot find CCMM data management")
        return "not found"
    if not multimedia_window.SetActive():
        multimedia_window.SetFocus()
    time.sleep(1)
    return "found"


def open_multimedia(ccma_url: str = "https://100.30.7.78", username: str = "nvhuy", password: str = "1_Abc_123"):
    if _global_multimedia_window(5, 1) == "found":
        print("found CCMM Multimedia, skip open ie")
        ie_close()
    else:
        print("Go to open CCMM data managenent")
        _open_global_ie_window()
        ie_enter_url(ccma_url)
        ie_login_ccma(username, password)
        ie_goto_multimedia()
        ie_open_multimedia()
    if not _global_multimedia_window(30, 2):
        BuiltIn().log_to_console("Fail to open data managemet")
    else:
        ie_close()


def CCMM_Agent_Desktop_Configuration():
    global multimedia_window
    tabs = multimedia_window.TabControl(searchDepth=1, AutomationId="tbctrlMenuBar")
    tbCCAD = tabs.TabItemControl(searchDepth=1, AutomationId="tbCCAD")
    find_and_click(tbCCAD, focus=True)
    find_and_click(tbCCAD.TreeItemControl(AutomationId="trCCADCommonSettings"), focus=True)
    warning_ok_btn = multimedia_window.WindowControl(Name="Warning").ButtonControl(Name="OK")
    if warning_ok_btn.Exists(2,0.5):
        pass









