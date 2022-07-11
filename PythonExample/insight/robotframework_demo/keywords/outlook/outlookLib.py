"""
Author: Huy Nguyen
Created date: 04/03/2021

This is library for Outlook use uiautomation

"""
import time

import uiautomation as auto
import subprocess
import os
from robot.libraries.BuiltIn import *

auto.uiautomation.OPERATION_WAIT_TIME = 1
auto.uiautomation.TIME_OUT_SECOND = 15
auto.uiautomation.SEARCH_INTERVAL = 1

# todo System variables
outlook_window: auto.WindowControl = None
outlook_new_window: auto.WindowControl = None


# todo child func ============================================================================================
# Huy
def safe_click(element, sleepTime: float = 1, simulateMove: bool = False, waitTime: float = 0.5, focus: bool = False):
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


def _open_global_outlook_window():
    global outlook_window
    outlook_window = None
    isProcess = isFound = False
    if "OUTLOOK.EXE" in str(subprocess.run(['tasklist'], capture_output=True, text=True).stdout):
        isProcess = True
    if auto.WindowControl(searchDepth=1, ClassName="rctrl_renwnd32").Exists(3, 1):
        isFound = True
    if not (isProcess or isFound):
        subprocess.Popen(r'C:\Program Files (x86)\Microsoft Office\Office12\OUTLOOK.EXE')
        auto.WindowControl(searchDepth=1, ClassName="rctrl_renwnd32").Exists(30, 1)
    outlook_window = auto.WindowControl(searchDepth=1, ClassName="rctrl_renwnd32")
    if not outlook_window.SetActive():
        outlook_window.SetFocus()
    find_and_click(outlook_window.ButtonControl(AutomationId="4352"), 1, 0.2, focus=True)
    time.sleep(1)


def open_outlook():
    global outlook_window
    _open_global_outlook_window()


def open_new_email():
    global outlook_new_window
    outlook_new_window = auto.WindowControl(searchDepth=1, ClasName="rctrl_renwnd32", SubName="Message")
    if not outlook_new_window.Exists(2, 1):
        outlook_window.SendKeys("{ctrl}n", waitTime=1)
    if not outlook_new_window.Exists(5, 1):
        find_and_click(outlook_window.CustomControl(Name="New"), focus=True)
    time.sleep(2)
    if not outlook_new_window.SetActive():
        outlook_new_window.SetFocus()
    time.sleep(1)


def add_attachment_file(attachment_file):
    global outlook_new_window
    if attachment_file:
        # Example: attachment_file =  attachtFile.txt
        path_file = os.getenv("temp") + "\\" + attachment_file
        if "\\" in attachment_file:
            path_file = attachment_file
        with open(path_file, 'w') as file:
            file.write("This is sample attachment for AACC testing\n" * 10)
        safe_click(outlook_new_window.ButtonControl(searchDepth=10, Name="Attach File"), waitTime=1)
        attach_window = auto.WindowControl(searchDepth=2, Name="Insert File")
        attach_window.EditControl(searchDepth=3, Name="File name:").SendKeys(path_file, interval=0.03)
        safe_click(attach_window.SplitButtonControl(searchDepth=1, Name="Insert"), sleepTime=0.5)


# Huy, 08/03/2021
def customer_sent_an_email(email_to_address: str, email_subject: str, email_body: str, attachment_file: str = None,
                           customer_email: str = None):
    global outlook_window
    global outlook_new_window
    _open_global_outlook_window()
    outlook_new_window = auto.WindowControl(searchDepth=1, ClasName="rctrl_renwnd32", SubName="Message")
    if not outlook_new_window.Exists(2, 1):
        outlook_window.SendKeys("{ctrl}n", waitTime=1)
    if not outlook_new_window.Exists(5, 1):
        find_and_click(outlook_window.CustomControl(Name="New"), focus=True)
    time.sleep(2)
    if not outlook_new_window.SetActive():
        outlook_new_window.SetFocus()
    outlook_new_window.EditControl(searchDepth=4, Name="To").SendKeys("{ctrl}a" + email_to_address, interval=0.07)
    outlook_new_window.EditControl(searchDepth=4, Name="Subject:").SendKeys("{ctrl}a" + email_subject, interval=0.07)
    outlook_new_window.PaneControl(searchDepth=4, Name="Message").SendKeys("{ctrl}a" + email_body, interval=0.07)
    # Check attachment
    if attachment_file:
        # Example: attachment_file =  attachtFile.txt
        path_file = os.getenv("temp") + "\\" + attachment_file
        if "\\" in attachment_file:
            path_file = attachment_file
        with open(path_file, 'w') as file:
            file.write("This is sample attachment for AACC testing\n" * 10)
        safe_click(outlook_new_window.ButtonControl(searchDepth=10, Name="Attach File"), waitTime=1)
        attach_window = auto.WindowControl(searchDepth=2, Name="Insert File")
        attach_window.EditControl(searchDepth=3, Name="File name:").SendKeys(path_file, interval=0.03)
        safe_click(attach_window.SplitButtonControl(searchDepth=1, Name="Insert"), sleepTime=0.5)
    # Choose customer email
    if customer_email:
        safe_click(outlook_new_window.ButtonControl(searchDepth=4, Name="Account"))
        child = outlook_new_window.MenuControl(searchDepth=1, Name="Context Menu").GetChildren()
        for item in child:
            if customer_email.lower() in item.Name.lower():
                safe_click(item)
                child = None
                break
        if child:
            BuiltIn().log_to_console(f"Not found customer email: {customer_email}, use email 1st instead")
    # Click send
    find_and_click(outlook_new_window.ButtonControl(searchDepth=4, Name="Send"), waitTime=3, focus=True)
    outlook_new_window.Disappears(15, 1)
    # Send/Receive
    outlook_window.SendKeys("{F9}")
    outlook_new_window = None
    find_and_click(outlook_window.ButtonControl(Name="Minimize"), 5, 1, 0.2, 1, focus=True)


# Huy, 19-05-2021
def get_first_email_inbox():
    global outlook_window
    outlook_window.SetActive()
    time.sleep(1)
    outlook_window.SendKeys("{F9}", waitTime=3)
    safe_click(outlook_window.TreeControl(Name="Mail Folders").TreeItemControl(Name="Inbox"), waitTime=1)
    # outlook_window.PaneControl(Name="Message Read").SetFocus()
    from_regions = outlook_window.PaneControl(AutomationId="106").PaneControl(AutomationId="258")
    current_subject = from_regions.EditControl(AutomationId="4101").GetValuePattern().Value
    current_from_email = from_regions.EditControl(AutomationId="4097").GetValuePattern().Value
    current_to_email = from_regions.EditControl(AutomationId="4099").GetValuePattern().Value
    first_attachment_name = ''
    try:
        first_attachment_name = from_regions.ListControl(
            AutomationId="4623").GetFirstChildControl().GetNextSiblingControl().Name
    except LookupError:
        pass
    # outlook_window.ButtonControl(AutomationId="Minimize-Restore").Click(, waitTime=1)
    return [current_subject, current_from_email, current_to_email, first_attachment_name]
