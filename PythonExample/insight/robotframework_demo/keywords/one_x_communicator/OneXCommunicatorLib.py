import uiautomation as auto
import time
import subprocess

"""
This is avaya oneX communicator library for testing, dev with version 3.11
Huy, 11/03/2021
"""

auto.uiautomation.OPERATION_WAIT_TIME = 2
auto.uiautomation.TIME_OUT_SECOND = 15
auto.uiautomation.SEARCH_INTERVAL = 1


def _onex_window():
    onex_window = auto.WindowControl(searchDepth=1, AutomationId="Window", RegexName="Avaya one-X® Communicator")
    if not onex_window.Exists(15, 2, printIfNotExist=True):
        subprocess.Popen(r"C:\Program Files (x86)\Avaya\Avaya one-X Communicator\onexcui.exe")
        time.sleep(10)
        if not onex_window.Exists(30, 5, True):
            exit(-1)
    onex_window.SetActive()
    onex_window.SetFocus()
    return onex_window


def _config_phone_servers(window, phone_number, password, phone_servers_ip, phone_servers_port):
    windoh=1, foundIndex=1, AutomationId="ButtonMenu").Click(simulateMove=False)
    window.WindowControl(searchDepth=1, ClassName="Popup").MenuControl(searchDepth=1,
                                                                       ClassName="ContextMenu").PaneControl(
        searchDepth=1, AutomationId="ContextMenuScrollViewer").MenuItemControl(searchDepth=1,
                                                                               AutomationId="MenuItemSettingsGeneral").Click(
        simulateMove=False)
    setting_window = window.WindowControl(searchDepth=1, Name="WindowSettingsGeneral")

    def _ignore_ok_button():
        while auto.WindowControl(searchDepth=1, Name="WindowMessageBox").Exists(3, 1):
            auto.WindowControl(searchDepth=1, Name="WindowMessageBox").SetActive()
            auto.WindowControl(searchDepth=1, Name="WindowMessageBox").ButtonControl(searchDepth=1,
                                                                                     AutomationId="ButtonOk").Click(
                simulateMove=False, waitTime=0.5)

    _ignore_ok_button()w.ButtonControl(searchDept
    setting_phone = setting_window.CustomControl(searchDepth=1, AutomationId="SettingsPhone", foundIndex=1)
    choose_transport_button = "SIP"
    choose_transport = "ComboboxItemTLS"
    if phone_servers_port == "5060":
        choose_transport_button = "H.323"
        choose_transport = "ComboboxItemTCP"
    setting_phone.RadioButtonControl(searchDepth=1, Name=choose_transport_button).Click(simulateMove=False)
    setting_phone.EditControl(searchDepth=1, AutomationId="TextBoxExtension").SendKeys("{Ctrl}a" + phone_number,
                                                                                       interval=0.07, waitTime=1)
    setting_phone.EditControl(searchDepth=1, AutomationId="TextBoxPassword").SendKeys("{Ctrl}a" + password,
                                                                                      interval=0.07, waitTime=1)
    remove_button = setting_phone.ButtonControl(searchDepth=1, AutomationId="ButtonRemove")
    list_servers = setting_phone.ListControl(searchDepth=1, AutomationId="ListBoxControllers")
    while list_servers.ListItemControl(searchDepth=1).Exists(3, 1):
        list_servers.GetFirstChildControl().Click(simulateMove=False, waitTime=0.5)
        remove_button.Click(simulateMove=False, waitTime=0.5)
    setting_phone.ButtonControl(searchDepth=1, AutomationId="ButtonAdd").Click(simulateMove=False, waitTime=0.5)
    add_server_window = setting_window.WindowControl(searchDepth=1, Name="Add Server")
    add_server_window.EditControl(searchDepth=1, AutomationId="TextBoxAddress").SendKeys("{Ctrl}a" + phone_servers_ip,
                                                                                         interval=0.07, waitTime=1)
    add_server_window.EditControl(searchDepth=1, AutomationId="TextBoxPort").SendKeys("{Ctrl}a" + phone_servers_port,
                                                                                      interval=0.07, waitTime=1)
    transport = add_server_window.ComboBoxControl(searchDepth=1, AutomationId="ComboBoxTransport")
    transport.Click(simulateMove=False, waitTime=0.5)
    transport.ListItemControl(searchDepth=1, AutomationId=choose_transport).Click(simulateMove=False, waitTime=0.5)
    add_server_window.ButtonControl(searchDepth=1, AutomationId="ButtonOk").Click(simulateMove=False, waitTime=0.5)
    setting_window.ButtonControl(searchDepth=1, AutomationId="ButtonOk").Click(simulateMove=False, waitTime=0.5)
    message_box = setting_window.WindowControl(searchDepth=1, foundIndex=1)
    if message_box.Exists(3, 1):
        message_box.ButtonControl(searchDepth=1, AutomationId="ButtonOk").Click(simulateMove=False, waitTime=0.5)
        time.sleep(5)
    _ignore_ok_button()


def login_phone(phone_number: str, password: str, phone_servers_ip: str = None, phone_servers_port: str = None):
    if phone_servers_ip:
        _config_phone_servers(_onex_window(), phone_number, password, phone_servers_ip, phone_servers_port)


login_phone("123", "123", "123", "5061")
# Sai, viet lai
