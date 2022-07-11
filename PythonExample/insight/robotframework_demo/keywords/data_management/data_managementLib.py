import uiautomation as auto
import time
import subprocess
from robot.libraries.BuiltIn import *

"""
Huy, 13/6/2021
"""

auto.uiautomation.OPERATION_WAIT_TIME = 1
auto.uiautomation.TIME_OUT_SECOND = 15
auto.uiautomation.SEARCH_INTERVAL = 1

# todo System variables
ie_window: auto.WindowControl = None
data_management_window: auto.WindowControl = None


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
    i = 3  # number of find
    time.sleep(2)
    while i > 0:
        print(i)
        if not ie_window.SetActive():
            ie_window.SetFocus()
        # find and close asks default
        a1 = find_and_click(ie_window.WindowControl(searchDepth=1, ClassName="#32770").ButtonControl(Name="Close"), 1,0.2,0.5, 1)
        # find and close Notify bar
        a2 = find_and_click(ie_window.PaneControl(searchDepth=1, ClassName="Frame Notification Bar").ButtonControl(Name="Close"), 1,0.2,0.5, 1)
        time.sleep(1)
        if a1 or a2:
            print(a1, a2)
            i = 3
            continue
        i -= 1


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


def ie_goto_data_management():
    global ie_window
    find_and_click(ie_window.ButtonControl(Name="Maximize"), 0, 0)
    if not find_and_click(ie_window.GroupControl(Name="Click to show Data Management").GetParentControl(), 5, 1, 1):
        ie_enter_url("https://100.30.7.78/DataManagement/default.asp")


def ie_open_data_management():
    global ie_window
    time.sleep(3)
    find_and_click(ie_window.PaneControl(ClassName="SSTreeWndClass"), 5, 1, 1, 2, focus=True)
    pane_control = ie_window.PaneControl(ClassName="SSTreeWndClass")
    print(pane_control.SetFocus(), pane_control)
    pane_control.SendKeys("{down 2}", waitTime=1, interval=0.05)
    pane_control.SendKeys("{space}", waitTime=1, interval=0.05)
    find_and_click(ie_window.ButtonControl(AutomationId="btnLaunch"), 5, 1, 0.5, 1, focus=True)
    i = 3
    while i > 0:
        print(i)
        # find and click Open button in notify bar
        # find and click OK button if an instance Data management is already running
        # find and click YES button if user already logged in to Data management
        a1 = find_and_click(ie_window.PaneControl(searchDepth=1, ClassName="Frame Notification Bar").ButtonControl(Name="Open"),2, 0.5, 0.5, 2, focus=True)
        a2 = find_and_click(auto.WindowControl(searchDepth=1, AutomationId="TrustManagerPromptUI").ButtonControl(AutomationId="btnInstall"), 2,0.5,0.5,10,True)
        a3 = find_and_click(auto.WindowControl(searchDepth=1, Name="CCMM Data Management").ButtonControl(Name="OK"), 2, 0.5, 0.5,1, focus=True)
        a4 = find_and_click(auto.WindowControl(searchDepth=1, Name="Data Management").ButtonControl(Name="Yes"), 2, 0.5, 0.5,1, focus=True)
        if a1 or a2 or a3 or a4:
            print(a1, a2, a3, a4)
            i = 3
            continue
        i -= 1


# todo data management func
# Huy, 13/6/2021
def _global_data_management_window(maxSearchTime: float = 10, searchInterval: float = 1):
    global data_management_window
    data_management_window = None
    data_management_window = auto.WindowControl(searchDepth=1, Name="CCMM Data Management")
    if not data_management_window.Exists(maxSearchTime, searchInterval):
        print("Cannot find CCMM data management")
        return "not found"
    if not data_management_window.SetActive():
        data_management_window.SetFocus()
    time.sleep(1)
    return "found"


def open_data_management(ccma_url: str = "https://100.30.7.78", username: str = "nvhuy", password: str = "1_Abc_123"):
    if _global_data_management_window(5, 1) == "found":
        print("found CCMM data management, skip open ie")
        ie_close()
    else:
        print("Go to open CCMM data managenent")
        _open_global_ie_window()
        ie_enter_url(ccma_url)
        ie_login_ccma(username, password)
        ie_goto_data_management()
        ie_open_data_management()
    if not _global_data_management_window(30, 2):
        BuiltIn().log_to_console("Fail to open data managemet")
    else:
        ie_close()


def set_minimum():
    global data_management_window
    if data_management_window.SetActive():
        data_management_window.SetFocus()
    find_and_click(data_management_window.ButtonControl(searchDepth=2, Name="Minimize"), sleepTime=0.5, waitTime=1)


def set_maximum():
    global data_management_window
    if data_management_window.SetActive():
        data_management_window.SetFocus()
    find_and_click(data_management_window.ButtonControl(searchDepth=2, Name="Maximize"), sleepTime=0.5, waitTime=1)


def close_data_management():
    global data_management_window
    if data_management_window.SetActive():
        data_management_window.SetFocus()
    find_and_click(data_management_window.ButtonControl(searchDepth=2, Name="Close"), sleepTime=0.5, waitTime=1)


def search_customer(search_content: str, search_by: str = "email"):
    # pre config
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
    # process
    global data_management_window
    if data_management_window.SetActive():
        data_management_window.SetFocus()
    safe_click(data_management_window.TabItemControl(searchDepth=2, Name="Privacy"), sleepTime=0.5, waitTime=1)
    safe_click(data_management_window.TabItemControl(searchDepth=2, Name="Privacy").TreeItemControl(searchDepth=3,
                                                                                                    AutomationId="InformationRequest"),
               sleepTime=0.5, waitTime=1)
    del_cus_req = data_management_window.GroupControl(searchDepth=2, AutomationId="grpActionDetails")
    cus_search = del_cus_req.GroupControl(searchDepth=1, AutomationId="grpCustomerSearch")
    safe_click(cus_search.ComboBoxControl(searchDepth=1, ClassName="ComboBox"), sleepTime=0.5)
    safe_click(data_management_window.PaneControl(searchDepth=2, ClassName="ScrollViewer").ListItemControl(
        Name="CCMMArchive.RuleType", foundIndex=index_id), sleepTime=0.5)
    cus_search.EditControl(searchDepth=1, AutomationId=txt_customer).SendKeys("{Ctrl}a" + search_content, waitTime=1)
    safe_click(cus_search.ButtonControl(searchDepth=1, AutomationId="btnSearch"), sleepTime=0.5, waitTime=1)

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
    # process
    global data_management_window
    if data_management_window.SetActive():
        data_management_window.SetFocus()
    safe_click(data_management_window.TabItemControl(searchDepth=2, Name="Privacy"), sleepTime=0.5, waitTime=1)
    safe_click(data_management_window.TabItemControl(searchDepth=2, Name="Privacy").TreeItemControl(searchDepth=3,
                                                                                                    AutomationId="DeleteRequest"),
               sleepTime=0.5, waitTime=1)
    del_cus_req = data_management_window.GroupControl(searchDepth=2, Name="Delete Customer Request")
    cus_search = del_cus_req.GroupControl(searchDepth=1, AutomationId="grpCustomerSearch")
    safe_click(cus_search.ComboBoxControl(searchDepth=1, ClassName="ComboBox"), sleepTime=0.5)
    safe_click(data_management_window.PaneControl(searchDepth=2, ClassName="ScrollViewer").ListItemControl(
        Name="CCMMArchive.RuleType", foundIndex=index_id))
    cus_search.EditControl(searchDepth=1, AutomationId=txt_customer).SendKeys("{Ctrl}a" + delete_content, waitTime=1)
    safe_click(cus_search.ButtonControl(searchDepth=1, AutomationId="btnSearch"), sleepTime=0.5, waitTime=1)

    custom = cus_search.CustomControl(AutomationId="PART_GridViewVirtualizingPanel")

    if not custom.GetFirstChildControl() is None:
        safe_click(custom.GetFirstChildControl(), sleepTime=0.5, waitTime=1)
        safe_click(del_cus_req.ButtonControl(Name="Delete"), sleepTime=0.5, waitTime=1)
        safe_click(data_management_window.WindowControl(searchDepth=1, Name="CCMM Data Management").ButtonControl(
            searchDepth=1, Name="Yes"), sleepTime=0.5)
    time.sleep(1)
    set_minimum()
