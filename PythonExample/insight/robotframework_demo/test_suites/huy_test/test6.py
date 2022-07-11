"""
Author: Huy Nguyen
Created date: 04/03/2021

This is library for Outlook use uiautomation


"""
import uiautomation as auto
import time
import subprocess
import os

auto.OPERATION_WAIT_TIME = 5
auto.TIME_OUT_SECOND = 15


def _outlook_window():
    outlook_path = r'C:\Program Files (x86)\Microsoft Office\Office12\OUTLOOK.EXE'
    outlook_win = auto.WindowControl(searchDepth=1, ClassName="rctrl_renwnd32")
    if not outlook_win.Exists(15, 2, True):
        subprocess.Popen(outlook_path)
        time.sleep(3)
        if not outlook_win.Exists(60, 5, True):
            exit(-1)
    outlook_win.SetActive()
    outlook_win.SetFocus()
    time.sleep(1)
    return outlook_win


outlook_window = _outlook_window()
new_email_window = auto.WindowControl(searchDepth=1, ClasName="rctrl_renwnd32", SubName="Message")
if not new_email_window.Exists(5, 1):
    print("Not found")
    outlook_window.SendKeys("{ctrl}n")
print(new_email_window.GetPropertyValue(30113))
print(new_email_window.GetPropertyValue(30092)) #name
print(new_email_window.GetPattern(10014))
print(new_email_window.GetPattern(10032))