import uiautomation
import time
import subprocess
import os


def attach_file(attachment_name):
    with open(attachment_name, 'w') as file:
        file.write("This is sample attachment for AACC testing\n" * 10)
    Insert_Window = uiautomation.WindowControl(Name="Open")
    Insert_Window.SetFocus()
    file_name = Insert_Window.EditControl(Name="File name:")
    # file_name.SendKey(attachment_name)
    file_name.SendKeys(attachment_name)
    time.sleep(1)
    btn_file_type = Insert_Window.ComboBoxControl(Name="Files of type:")
    btn_Insert = btn_file_type.GetNextSiblingControl()
    time.sleep(1)
    btn_Insert.Click()
    time.sleep(3)


def verify_download_attachment(attachment_name):
    # open File Explorer
    subprocess.Popen(r'explorer')
    Explorer_Window = uiautomation.WindowControl(Name="File Explorer", searchDepth=1)
    Explorer_Window.SetFocus()
    Address_toolbar = Explorer_Window.ToolBarControl(Name="Address: Quick access")
    Address_toolbar.Click()
    Address_edit = Explorer_Window.EditControl(Name="Address")
    Address_edit.SendKeys('Downloads')
    Address_edit.SendKeys('{Enter}')
    time.sleep(1)

    lst_item = Explorer_Window.ListControl(searchDepth=6, ClassName="UIItemsView")
    temp = lst_item.GetGridPattern()
    temp_value = temp.RowCount
    for i in range(1, temp_value + 1):
        item = lst_item.ListItemControl(searchDepth=1, foundIndex=i)
        item_name = item.GetValuePattern().Value
        if (item_name == attachment_name):
            return "true"
    return "false"

def delete_download_attachment(attachment_name):
    Explorer_Window = uiautomation.WindowControl(Name="Downloads")
    Explorer_Window.SetFocus()
    lst_item = Explorer_Window.ListControl(searchDepth=6, ClassName="UIItemsView")
    temp = lst_item.GetGridPattern()
    temp_value = temp.RowCount
    for i in range(1, temp_value + 1):
        item = lst_item.ListItemControl(searchDepth=1, foundIndex=i)
        item_name = item.GetValuePattern().Value
        if (item_name == attachment_name):
            item.Click()
            item.SendKeys('{DEL}')
            break
    # close File Explorer window
    Explorer_Window.SendKeys('{Alt}' '{F4}')

def close_file_explorer_window():
    Explorer_Window = uiautomation.WindowControl(Name="Downloads")
    Explorer_Window.SetFocus()
    Explorer_Window.SendKeys('{Alt}' '{F4}')

#=======================================================================================================================
#                                                        MAIL
#=======================================================================================================================
def close_mail_app():
    AddWindow = uiautomation.WindowControl(Name="Add an account")
    AddWindow.SetFocus()
    AddWindow.SendKeys('{Alt}' '{F4}')
    time.sleep(5)
    MailWindow = uiautomation.WindowControl(Name="Mail")
    MailWindow.SetFocus()
    MailWindow.SendKeys('{Alt}' '{F4}')
    time.sleep(1)