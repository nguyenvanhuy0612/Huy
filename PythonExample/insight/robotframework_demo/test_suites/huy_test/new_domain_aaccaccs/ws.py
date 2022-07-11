import pyautogui
import time
import uiautomation

x = 590
y = 397

while 0:
    print(pyautogui.position())
    time.sleep(1)

# pyautogui.click(x, y)
uiautomation.Click(x, y)
time.sleep(1)
pyautogui.write("root{enter}", interval=0.1)
time.sleep(1)
uiautomation.SendKeys("1_Ace_246_Tma_Aacc${enter}", interval=0.1)
