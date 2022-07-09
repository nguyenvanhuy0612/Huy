from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support.ui import Select


def test():
    print("Hello")
    driver = webdriver.Chrome()
    driver.maximize_window()
    driver.implicitly_wait(30)
    driver.get("https://google.com")
    driver.find_element(By.XPATH, "//*[contains(text(), 'Username')]")


test()
