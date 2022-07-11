import uiautomation as auto
import time
import subprocess
from robot.libraries.BuiltIn import BuiltIn

"""
This is avaya IX Workplace library for testing, dev with Avaya IX Workplace version 3.11
Huy, 11/03/2021
"""

auto.uiautomation.OPERATION_WAIT_TIME = 2
auto.uiautomation.TIME_OUT_SECOND = 15
auto.uiautomation.SEARCH_INTERVAL = 1


def _workplace_window():
    workplace_window = auto.WindowControl(searchDepth=1, AutomationId="DashboardWindow")
    print(workplace_window.Exists(0, 0))
    if not workplace_window.Exists(0, 0):
        print(workplace_window.Exists(0, 0))
    cmd_out_put = subprocess.run(['tasklist'], capture_output=True, text=True).stdout
    print(cmd_out_put, type(cmd_out_put))
    if "Avaya IX Workplace.exe" not in str(cmd_out_put):
        print("Not in")
    else:
        print("OK")



def end_all_calls():
    workplace_window = workplace_window = auto.WindowControl(searchDepth=1, AutomationId="DashboardWindow")
    workplace_window.SetActive()
    workplace_window.SetTopmost()
    list_phone_handle = workplace_window.ListControl(AutomationId="CallStackListBox")
    while list_phone_handle.GetLastChildControl():
        first_phone = list_phone_handle.GetLastChildControl()
        resume_call = first_phone.ButtonControl(Name="Resume call")
        if resume_call.Exists(3, 1):
            resume_call.Click(simulateMove=False, waitTime=2)
        end_call = first_phone.ButtonControl(Name="End Call")
        if end_call.Exists(3, 1):
            end_call.Click(simulateMove=False, waitTime=2)


# end_all_calls()