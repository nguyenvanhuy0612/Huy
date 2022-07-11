import os
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys

from data import *


def get_driver():
    chrome_path = r"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    chrome_driver = r"C:\Users\Administrator\Documents\AACC_AUTO\aacc\web_drivers\chromedriver.exe"
    options = Options()
    options.binary_location = chrome_path
    outputs = os.popen('wmic process get CommandLine').readlines()
    # options.add_argument("start-maximized")
    # options.add_argument("disable-infobars")
    # options.add_argument("--disable-gpu")
    # options.add_argument("--disable-dev-shm-usage")
    # options.add_argument("--no-sandbox")
    # options.add_argument("--headless")

    # options.add_argument('--ignore-certificate-errors')
    # options.add_argument("--test-type")
    # java
    # options.addArguments("test-type");
    # options.addArguments("start-maximized");
    # options.addArguments("--window-size=1920,1080");
    # options.addArguments("--enable-precise-memory-info");
    # options.addArguments("--disable-popup-blocking");
    # options.addArguments("--disable-default-apps");
    # options.addArguments("test-type=browser");
    # options.AddArgument("--incognito");
    # options.AddArgument("--no-sandbox");

    if "remote-debugging-port" in str(outputs):
        print(1)
        options.add_experimental_option("debuggerAddress", "127.0.0.1:9222")
        # options.add_argument("--disable-dev-shm-usage")
        # options.add_argument("--disable-gpu")
        # options.add_argument("--no-sandbox")
        # options.add_argument("--disable-infobars")
        # options.add_argument("--start-maximized")
        # options.add_argument("--headless")
    else:
        print(2)
        options.add_argument("--remote-debugging-port=9222")
        # options.add_experimental_option("debuggerAddress", "127.0.0.1:9222")
    options.add_argument("--user-data-dir=remote-profile")

    # remove image
    # chrome_options.add_experimental_option("prefs", {"profile.managed_default_content_settings.images": 2})
    # set developer mode
    # chrome_options.add_experimental_option('excludeSwitches', ['enable-automation'])
    # chrome_options.add_experimental_option("excludeSwitches", ["enable-logging"])
    driver = webdriver.Chrome(executable_path=chrome_driver, options=options)
    driver.implicitly_wait(30)
    driver.set_page_load_timeout(30)
    return driver
