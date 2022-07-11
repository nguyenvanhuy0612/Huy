import comtypes
import uiautomation as auto
from uiautomation import PropertyIdNames
from func import *

auto.uiautomation.DEBUG_EXIST_DISAPPEAR = True  # set it to False and try again, default is False
auto.uiautomation.DEBUG_SEARCH_TIME = True  # set it to False and try again, default is False
auto.uiautomation.TIME_OUT_SECOND = 10  # global time out

window = auto.PaneControl(ClassName='Chrome_WidgetWin_1') # search 2 times
if not window.SetActive():
    window.SetFocus()
#main_ctrl = window.GroupControl(AutomationId="js-repo-pjax-container")
#print(main_ctrl)

#window.HyperlinkControl(Name='nguyenvanhuy0612').Click()



#info(window.HyperlinkControl(Name="Change your avatar"))
btn_close = window.ButtonControl(Name="Close")
info(btn_close)
btn_close.Click()