import uiautomation
import subprocess


def abc():
    try:
        win = uiautomation.WindowControl(searchDepth=1, foundIndex=1, ClassName="MMCMainFrameas")
        print(win)
    except LookupError:
        print("failed")


def _delete_(win: uiautomation.uiautomation.WindowControl):
    lst = win.ListControl(searchDepth=4, ClassName="SysListView32")
    itx = lst.ListItemControl(searchDepth=1, Name="nvhuy0")
    for i in range(100):
        name = int(itx.Name[5:6])
        if name >= 2:
            print("Del " + itx.Name)
            itx.Click(simulateMove=False, waitTime=1)
            btn_del = win.ButtonControl(searchDepth=4, Name="Delete")
            btn_del.Click(simulateMove=False, waitTime=1)
            conf = win.ButtonControl(searchDepth=2, Name="Yes")
            conf.Click(simulateMove=False, waitTime=1)
        else:
            itx = itx.GetNextSiblingControl()


def _create_(win: uiautomation.uiautomation.WindowControl, user_name: str, user_pass: str = "1_Abc_123"):
    create = win.ButtonControl(Name="Create a new user in the current container.", searchDepth=4)
    create.Click(simulateMove=False, waitTime=0.3)
    new_win = win.WindowControl(searchDepth=1, Name="New Object - User")
    first_name = new_win.EditControl(searchDepth=2, Name="First name:")
    first_name.SendKeys(user_name, waitTime=0.3)
    users_name = new_win.EditControl(searchDepth=2, Name="User logon name:")
    users_name.SendKeys(user_name, waitTime=0.3)
    btn_next1 = new_win.ButtonControl(searchDepth=1, Name="Next >")
    btn_next1.Click(simulateMove=False, waitTime=0.3)
    pwd = new_win.EditControl(searchDepth=2, Name="Password:")
    conf_pwd = new_win.EditControl(searchDepth=2, Name="Confirm password:")
    pwd.SendKeys(user_pass, waitTime=0.3)
    conf_pwd.SendKeys(user_pass, waitTime=0.3)
    btn_need_change_pwd = new_win.CheckBoxControl(searchDepth=2, Name="User must change password at next logon")
    btn_need_change_pwd.Click(simulateMove=False, waitTime=0.3)
    btn_not_change_pwd = new_win.CheckBoxControl(searchDepth=2, Name="User cannot change password")
    btn_pwd_expires = new_win.CheckBoxControl(searchDepth=2, Name="Password never expires")
    btn_pwd_expires.Click(simulateMove=False, waitTime=0.3)
    btn_next2 = new_win.ButtonControl(searchDepth=2, Name="Next >")
    btn_next2.Click(simulateMove=False, waitTime=0.3)
    btn_finish = new_win.ButtonControl(searchDepth=2, Name="Finish")
    btn_finish.Click(simulateMove=False, waitTime=3)


def find():
    # "C:\Windows\System32\ServerManager.exe"
    # mmc.exe dsa.msc
    #
    # import subprocess
    # subprocess.Popen(r"mmc.exe dsa.msc")
    # try:
    #     # uiautomation.SetGlobalSearchTimeout(10)
    #     win = uiautomation.WindowControl(searchDepth=1, foundIndex=1, ClassName="MMCMainFrame")
    # except LookupError:
    #     # uiautomation.SetGlobalSearchTimeout(5)
    #     subprocess.Popen(r"mmc.exe dsa.msc")
    #     win = uiautomation.WindowControl(searchDepth=1, foundIndex=1, ClassName="MMCMainFrame")
    subprocess.Popen(r"mmc.exe dsa.msc")
    win = uiautomation.WindowControl(searchDepth=1, foundIndex=1, ClassName="MMCMainFrame")
    if not win.Exists(3, 1):
        print("Not found")
        exit(0)
    print(win, type(win))
    win.SetActive()
    return win


def _import_(win: uiautomation.uiautomation.WindowControl):
    import csv
    with open('h.csv') as file_csv:
        csv_reader = csv.reader(file_csv, delimiter=',')
        for rows in csv_reader:
            row = str(rows[0])
            print("Create user: " + row)
            _create_(win, user_name=row)


def create_user():
    win = find()
    _import_(win)


create_user()
