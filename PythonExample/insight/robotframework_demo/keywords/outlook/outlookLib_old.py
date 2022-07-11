"""
Author: Huy Nguyen
Created date: 04/03/2021

This is library for Outlook use uiautomation


"""
import uiautomation as auto
import time
import subprocess
import os

auto.uiautomation.OPERATION_WAIT_TIME = 1
auto.uiautomation.TIME_OUT_SECOND = 15
auto.uiautomation.SEARCH_INTERVAL = 1

# todo System variables
outlook_window: auto.WindowControl = None
outlook_new_window: auto.WindowControl = None



def _outlook_window():
    return auto.WindowControl(searchDepth=1, ClassName="rctrl_renwnd32")


def safe_click(element, sleepTime: float = 1, simulateMove: bool = False, waitTime: int = 0.5):
    element.MoveCursorToMyCenter()
    time.sleep(sleepTime)
    element.Click(simulateMove=simulateMove)
    time.sleep(waitTime)


def _outlook_application():
    global outlook_window
    if "OUTLOOK.EXE" not in str(subprocess.run(['tasklist'], capture_output=True, text=True).stdout):
        subprocess.Popen(r'C:\Program Files (x86)\Microsoft Office\Office12\OUTLOOK.EXE')
        time.sleep(10)
    outlook_window = auto.WindowControl(searchDepth=1, ClassName="rctrl_renwnd32")
    if not outlook_window.Exists(30, 2):
        subprocess.Popen(r'C:\Program Files (x86)\Microsoft Office\Office12\OUTLOOK.EXE')
        time.sleep(3)
        if not outlook_window.Exists(60, 5, True):
            exit(-1)
    outlook_window.SetActive()
    time.sleep(1)
    return outlook_window


def _new_email_window():
    return auto.WindowControl(searchDepth=1, ClasName="rctrl_renwnd32", SubName="Message")


def _new_email_application():
    # New email
    outlook_window = _outlook_window()
    new_email_window = auto.WindowControl(searchDepth=1, ClasName="rctrl_renwnd32", SubName="Message")
    number_of_find = 10
    while number_of_find > 0:
        if new_email_window.Exists(2, 0.5):
            break
        if number_of_find % 2 == 0 and outlook_window.ButtonControl(Name="New").Exists(0, 0):
            outlook_window.ButtonControl(Name="New").Click(simulateMove=False, waitTime=1)
        if number_of_find % 2 != 0:
            outlook_window.SendKeys("{ctrl}n", waitTime=1)
        number_of_find -= 1
    new_email_window.SetActive()
    time.sleep(1)
    return new_email_window


# Huy, 08/03/2021
def customer_sent_an_email(email_to_address: str, email_subject: str, email_body: str, attachment_file: str = None,
                           customer_email: str = None):
    outlook_window = _outlook_application()
    new_email_window = _new_email_application()

    new_email_window.EditControl(searchDepth=4, Name="To").SendKeys("{ctrl}a" + email_to_address, interval=0.07)
    new_email_window.EditControl(searchDepth=4, Name="Subject:").SendKeys("{ctrl}a" + email_subject, interval=0.07)
    new_email_window.PaneControl(searchDepth=4, Name="Message").SendKeys("{ctrl}a" + email_body, interval=0.07)
    # Check attachment
    if attachment_file:
        # Example: attachment_file =  attachtFile.txt
        path_file = os.getenv("temp") + "\\" + attachment_file
        if "\\" in attachment_file:
            path_file = attachment_file
        with open(path_file, 'w') as file:
            file.write("This is sample attachment for AACC testing\n" * 10)
        new_email_window.ButtonControl(searchDepth=10, Name="Attach File").Click(simulateMove=False)
        attach_window = auto.WindowControl(searchDepth=2, Name="Insert File")
        attach_window.EditControl(searchDepth=3, Name="File name:").SendKeys(path_file, interval=0.03)
        attach_window.SplitButtonControl(searchDepth=1, Name="Insert").Click(simulateMove=False)
    # Choose customer email

    if customer_email:
        # try:
        #     new_email_window.ButtonControl(searchDepth=4, Name="Account").Click(simulateMove=False)
        #     for key, value in kwargs.items():
        #         new_email_window.SendKeys(kwargs.["customer"])
        # except:
        #     None
        new_email_window.ButtonControl(searchDepth=4, Name="Account").Click(simulateMove=False)
        child = new_email_window.MenuControl(searchDepth=1, Name="Context Menu").GetChildren()
        for item in child:
            if customer_email.lower() in item.Name.lower():
                item.Click(simulateMove=False)
                child = None
                break
        if child:
            from robot.libraries.BuiltIn import BuiltIn
            BuiltIn().log_to_console(f"Not found customer email: {customer_email}, use email 1st instead")
    # Click send
    new_email_window.ButtonControl(searchDepth=4, Name="Send").Click(simulateMove=False)
    time.sleep(2)
    # Send/Receive
    outlook_window.SendKeys("{F9}")
    time.sleep(5)
    # Close outlook
    outlook_window.SendKeys("{alt}{f4}")
    # outlook_window.ButtonControl(searchDepth=2, Name="Close").Click(simulateMove=False)


# Huy, 19-05-2021
def get_first_email_inbox():
    outlook_window = _outlook_window()
    outlook_window.SendKeys("{F9}", waitTime=3)
    outlook_window.TreeControl(Name="Mail Folders").TreeItemControl(Name="Inbox").Click(simulateMove=False, waitTime=1)
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
    # outlook_window.ButtonControl(AutomationId="Minimize-Restore").Click(simulateMove=False, waitTime=1)
    return [current_subject, current_from_email, current_to_email, first_attachment_name]
