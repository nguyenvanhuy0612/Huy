from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support.ui import Select
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

options = Options()
#options.add_argument("--disable-extensions")
options.add_argument("--allow-running-insecure-content")
options.add_argument("use-fake-device-for-media-stream")
options.add_argument("use-fake-ui-for-media-stream")
options.add_argument("disable-features=WebRtcHideLocalIpsWithMdns")
options.add_argument("disable-infobars")
options.add_argument("disable-notifications")
options.add_argument("disable-popup-blocking")
options.add_argument("excludeSwitches")
options.add_argument("--start-maximized")

driver = webdriver.Chrome(options=options)
driver.implicitly_wait(30)
driver.set_page_load_timeout(30)
action = ActionChains(driver)
wait = WebDriverWait(driver, 60)


#driver.find_element(By.XPATH, )


# wait.until(EC.element_to_be_clickable(driver.find_element_by_id("")))


def add_queue(q):
    global driver
    time.sleep(5)


add_queue("a")
