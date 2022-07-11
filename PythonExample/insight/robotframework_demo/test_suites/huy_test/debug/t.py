import pyautogui
import keyboard
from time import sleep

x1, y1 = 333, 17
x2, y2 = 555, 17
x3, y3 = 780, 17
cx, cy = 888, 450


def tab(x, y):
    pyautogui.click(x, y)
    sleep(2)


def conf(ip):
    pyautogui.write('root')
    pyautogui.hotkey('enter')
    sleep(1)
    pyautogui.write('1_Abc_123%tma246', interval=0.1)
    sleep(1)
    pyautogui.hotkey('enter')
    sleep(3)
    pyautogui.write('vi /etc/sysconfig/network-scripts/ifcfg-ens192', interval=0.1)
    sleep(1)
    pyautogui.hotkey('enter')
    sleep(1)
    pyautogui.keyDown('down')


def dbug():
    #press 8 lan
    print('down, 8')
    pyautogui.press('down', presses=8, interval=0.1)
    sleep(1)
    # right 7
    print('right, 7')
    pyautogui.press('right', presses=7, interval=0.1)
    sleep(1)
    print('insert')
    pyautogui.press('insert')
    sleep(1)
    pyautogui.write('100.30.7.182', interval=0.2)


def dbug2():
    sleep(2)
    # pyautogui.click(cx, cy)
    sleep(1)
    pyautogui.press('down')
    sleep(1)
    pyautogui.press('right')
    sleep(0.5)
    pyautogui.press('insert')
    sleep(0.5)
    pyautogui.write('100.30.7.182')


def test():
    sleep(2)
    # while 1:
    #     print(pyautogui.position())
    #     sleep(0.1)
    #     if keyboard.is_pressed('q'):
    #         break
    # pyautogui.click(x1, y1)
    sleep(1)
    pyautogui.click(cx, cy)
    sleep(1)
    # conf("100.30.7.182")
    # dbug()
    dbug2()


dbug2()
