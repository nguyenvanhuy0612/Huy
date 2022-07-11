import pyautogui
import keyboard

from time import sleep


while not keyboard.is_pressed('q'):
    sleep(0.5)
    print(pyautogui.locateOnScreen('ccmm.png'))



