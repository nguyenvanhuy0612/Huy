from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support.ui import Select
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
# from ngm_locator import *

options = Options()
# options.add_argument("--disable-extensions")
options.add_argument("--allow-running-insecure-content")
options.add_argument("use-fake-device-for-media-stream")
options.add_argument("use-fake-ui-for-media-stream")
options.add_argument("disable-features=WebRtcHideLocalIpsWithMdns")
options.add_argument("disable-infobars")
options.add_argument("disable-notifications")
options.add_argument("disable-popup-blocking")
options.add_argument("excludeSwitches")
options.add_argument("--start-maximized")

MAX_FIND_TIME_SEC = 3
IMPLICIT_WAIT_SEC = 30
EXPLICIT_WAIT_SEC = 60
PAGE_LOAD_SEC = 45
DELAY_CLICK_SEC = 1


driver = webdriver.Chrome(options=options)
driver.implicitly_wait(IMPLICIT_WAIT_SEC)
driver.set_page_load_timeout(PAGE_LOAD_SEC)
action = ActionChains(driver)
wait = WebDriverWait(driver, EXPLICIT_WAIT_SEC)


def find_and_click(xpath: str):
    element = wait.until(EC.element_to_be_clickable((By.XPATH, xpath)))
    sleep(DELAY_CLICK_SEC)
    element.click()
    return element


def find_and_click_max_time(xpath: str, max_time):
    element = WebDriverWait(driver, max_time).until(EC.element_to_be_clickable((By.XPATH, xpath)))
    sleep(DELAY_CLICK_SEC)
    element.click()
    return element


def try_click(xpath: str):
    if number_of(xpath) != 0:
        find_and_click(xpath)
        return True
    return False


def wait_for_element(xpath: str):
    element = wait.until(EC.visibility_of_element_located((By.XPATH, xpath)))
    sleep(DELAY_CLICK_SEC)
    return element


def wait_for_element_max_time(xpath: str, max_time: int):
    element = WebDriverWait(driver, max_time).until(EC.visibility_of_element_located((By.XPATH, xpath)))
    sleep(DELAY_CLICK_SEC)
    return element


def number_of(xpath: str):
    driver.implicitly_wait(MAX_FIND_TIME_SEC)
    num = len(driver.find_elements(By.XPATH, xpath))
    driver.implicitly_wait(IMPLICIT_WAIT_SEC)
    return num


def sleep(sec):
    time.sleep(sec)
