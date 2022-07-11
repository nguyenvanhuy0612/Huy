import csv
import time

from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC

import setup
from data import *

# driver.switch_to.frame("main")
# WebDriverWait(driver, 10).until(EC.frame_to_be_available_and_switch_to_it((By.NAME, "main")))
# table_body = driver.find_elements_by_xpath("//table[@class = 'leftcolumn']/tbody")
# print(table_body)


driver = setup.get_driver()

driver.get("https://google.com")

