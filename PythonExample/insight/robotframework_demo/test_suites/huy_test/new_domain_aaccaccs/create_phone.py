import os
from time import sleep

from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.common.exceptions import TimeoutException, WebDriverException, NoSuchElementException


def get_lib(lib_in: str = None):
    BuiltIn().import_library("Selenium2Library")
    lib = lib_in or "Selenium2Library"
    selenium2lib = BuiltIn().get_library_instance(lib)
    driver = selenium2lib.driver


def initialize_driver():
    driver = webdriver.Chrome(executable_path="../../../web_drivers/chromedriver.exe")
    driver.implicitly_wait(30)
    driver.set_page_load_timeout(30)
    return driver


def get_driver():
    chrome_driver = "../../../web_drivers/chromedriver.exe"
    options = Options()
    outputs = os.popen('wmic process get CommandLine').readlines()
    if "remote-debugging-port" in str(outputs):
        print(1)
        options.add_experimental_option("debuggerAddress", "127.0.0.1:9222")
    else:
        print(2)
        options.add_argument("--remote-debugging-port=9222")
    # options.add_argument("--user-data-dir=remote-profile")
    # options.add_argument("--test-type")
    options.add_argument("--ignore-certificate-errors")
    options.add_argument("--incognito")
    driver = webdriver.Chrome(executable_path=chrome_driver, options=options)
    driver.implicitly_wait(20)
    driver.set_page_load_timeout(60)
    return driver


def test(start_phone_number: int = 6500349, stop_phone_number: int = 6500350):
    driver = get_driver()
    short_wait = WebDriverWait(driver, 5)
    med_wait = WebDriverWait(driver, 60)
    long_wait = WebDriverWait(driver, 200)
    url = "https://10.128.228.160"
    driver.get(url)
    try:
        short_wait.until(EC.presence_of_element_located((By.XPATH, "//button[contains(text(), 'Advanced')]"))).click()
        sleep(1)
        driver.find_element_by_xpath("//a[contains(text(), 'Proceed to')]").click()
    except:
        print("No need bypass")
    sleep(2)
    driver.find_element_by_css_selector("#IDToken1,#j_username").send_keys("admin2")
    sleep(1)
    driver.find_element_by_css_selector("#IDToken2,#j_password").send_keys("1_Abc_smgr_160")
    sleep(1)
    driver.find_element_by_css_selector("#SubmitButton").click()
    sleep(2)
    try:
        ok1 = med_wait.until(EC.presence_of_element_located((By.XPATH, "//span[text()='OK']/ancestor::button")))
        sleep(1)
        print("Saw OK button, click to OK button")
        ok1.click()
        sleep(10)
        print("Click to next OK button")
        driver.find_element_by_xpath("//span[text()='OK']/ancestor::button").click()
    except (NoSuchElementException, TimeoutException, WebDriverException):
        print("no need click OK Button")

    sleep(2)
    actions = ActionChains(driver)
    user_elem = driver.find_element_by_xpath("//span[text()='Users']/ancestor::a")
    actions.move_to_element(user_elem).perform()
    sleep(1)
    um_elem = driver.find_element_by_xpath("//a[text()='User Management']/ancestor::div[1]")
    actions.move_to_element(um_elem).perform()
    sleep(1)
    mu_elem = driver.find_element_by_xpath("//a[text()='Manage Users']/ancestor::div[1]")
    actions.click(mu_elem).perform()

    sleep(5)
    driver.switch_to.frame("iframe0")
    sleep(1)
    long_wait.until(EC.presence_of_element_located((By.XPATH, "//div[@id='filter_icon_firstName']"))).click()
    sleep(1)
    driver.find_element_by_css_selector("#filter_textfield_firstName").send_keys("6500310", Keys.ENTER)
    sleep(2)
    driver.find_element_by_xpath("(//input[@class='ant-checkbox-input'])[2]").click()

    # todo Runner
    long_wait = WebDriverWait(driver, 200)
    sleep(1)
    for ip in range(start_phone_number, stop_phone_number):
        print(ip)
        # Click double button
        sleep(1)
        med_wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button.ant-btn._dupbtn"))).click()
        try:
            # Identity tab
            sleep(2)
            med_wait.until(EC.element_to_be_clickable((By.XPATH, "//a[text()='Identity']/parent::div"))).click()
        except WebDriverException:
            pass
        sleep(1)
        driver.find_element_by_css_selector("#surname").send_keys(str(ip))
        driver.find_element_by_css_selector("#givenName").send_keys(str(ip))
        driver.find_element_by_css_selector("#loginName").send_keys(str(ip) + "@aaccaccs.tma.com")

        # Communication Profile tab
        med_wait.until(
            EC.element_to_be_clickable((By.XPATH, "//a[text()='Communication Profile']/parent::div"))).click()

        def _phone(index, num):
            # SIP phone
            sleep(1)  # New button
            med_wait.until(
                EC.element_to_be_clickable(
                    (By.CSS_SELECTOR, "button.ant-btn.commAddr_new_btn.ant-btn-primary"))).click()
            sleep(1)
            med_wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR,
                                                       "div.ant-col-16.ant-form-item-control-wrapper > div > div > "
                                                       "div.ant-select-selection.ant-select-selection--single"))).click()
            sleep(1)  # index
            med_wait.until(
                EC.element_to_be_clickable(
                    (By.CSS_SELECTOR, "ul.ant-select-dropdown-menu-root > li:nth-child(" + index + ")"))).click()
            sleep(1)  # Num
            med_wait.until(
                EC.element_to_be_clickable((By.CSS_SELECTOR, "#handle"))).send_keys(num)
            sleep(1)  # domain
            med_wait.until(
                EC.element_to_be_clickable((By.CSS_SELECTOR,
                                            "div.ant-col-16.ant-form-item-control-wrapper div:nth-child(3) "
                                            "div.ant-select-selection.ant-select-selection--single"))).click()
            sleep(1)  # select domain
            med_wait.until(EC.element_to_be_clickable((By.XPATH, "//li[text()='aaccaccs.tma.com']"))).click()
            sleep(1)  # Save
            driver.find_element_by_css_selector("button.ant-btn.ant-btn-primary.ant-btn-lg").click()
            sleep(1)

        # SIP phone
        _phone("1", str(ip))
        # E164 phone
        _phone("2", "+" + str(ip))

        # Click to CM endpoint
        # CM endpoint
        med_wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "li:nth-child(2) > a.commProfAnchor"))).click()

        sleep(2)
        med_wait.until(
            EC.element_to_be_clickable((By.XPATH, "(//input[@id='extension_input'])[2]"))).send_keys(str(ip))

        sleep(1)
        driver.find_element_by_css_selector("button.ant-btn.user_editor_commit.ant-btn-primary").click()

        long_wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, "button.ant-btn._dupbtn")))


test()
