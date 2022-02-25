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

driver = webdriver.Chrome(options=options)
driver.implicitly_wait(30)
driver.set_page_load_timeout(60)
action = ActionChains(driver)
wait = WebDriverWait(driver, 60)


def find_click(x1):
    global driver
    global wait
    e = wait.until(EC.element_to_be_clickable((By.XPATH, x1)))
    time.sleep(1)
    e.click()


def see_and_click(x1, x2 = "x1"):
    global driver
    global wait
    wait.until(EC.visibility_of_element_located((By.XPATH, x1)))
    time.sleep(1)
    if x2 == "x1":
        x2 = x1
    driver.find_element(By.XPATH, x2).click()


def wait_to_see(x1):
    global wait
    global driver
    wait.until(EC.visibility_of_element_located((By.XPATH, x1)))
    time.sleep(1)


def number_of(x1, t=3):
    global driver
    global wait
    driver.implicitly_wait(t)
    num = len(driver.find_elements(By.XPATH, x1))
    driver.implicitly_wait(30)
    return num


def try_click(x1):
    global driver, wait
    if number_of(x1) !=0:
        time.sleep(1)
        driver.find_element(By.XPATH, x1).click()
    time.sleep(1)


def login():
    global driver
    url = "https://dev-8.ixcc-sandbox.avayacloud.com/services/ApplicationCenter/AdminPortal"
    login_user, login_pass = "admin@pomsv1.com", "Avaya123$"
    # login
    driver.get(url)
    time.sleep(3)
    driver.find_element(By.ID, "username").send_keys(login_user)
    driver.find_element(By.ID, "tr-login").click()
    time.sleep(2)
    driver.find_element(By.ID, "password").send_keys(login_pass)
    driver.find_element(By.ID, "kc-login").click()
    time.sleep(20)


def add_queue(queue, description):
    global driver
    global wait
    #go to contact center
    if "expand" not in driver.find_element(By.XPATH, "//li[@data-sidebar-id='ContactCenter']").get_attribute("class"):
        driver.find_element(By.XPATH, "//li[@data-sidebar-id='ContactCenter']").click()
    #add queue
    find_click("//li[@data-sidebar-id='Queues']")
    wait_to_see("//div[@id='commProfForm']//tbody")
    time.sleep(1)
    if number_of("//div[@class='neo-sheet avaya-sheet ']") == 0:
        find_click("//button[text()='Create Queue']")
    else:
        driver.find_element(By.XPATH, "//input[@id='name']").send_keys(Keys.CONTROL, 'a')
        driver.find_element(By.XPATH, "//input[@id='name']").send_keys(Keys.DELETE)
        driver.find_element(By.XPATH, "//*[@id='description']").send_keys(Keys.CONTROL, 'a')
        driver.find_element(By.XPATH, "//*[@id='description']").send_keys(Keys.DELETE)
    driver.find_element(By.XPATH, "//input[@id='name']").send_keys(queue)
    driver.find_element(By.XPATH, "//*[@id='description']").send_keys(description)
    find_click("//div[@id='gcomp_content']//button[text()='Save']")
    if number_of("//app-notification-toast") != 0:
        ele = driver.find_element(By.XPATH, "//app-notification-toast")
        driver.execute_script("arguments[0].setAttribute('style', 'display:none')", ele)
    wait_to_see("//div[@id='commProfForm']//tbody")
    time.sleep(5)


def add_agent(agent_user, agent_pass, agent_queue, profile_name):
    global driver, wait
    #go to User management
    if "expand" not in driver.find_element(By.XPATH, "//li[@data-sidebar-id='Config']").get_attribute("class"):
        driver.find_element(By.XPATH, "//li[@data-sidebar-id='Config']").click()
    #go to user
    driver.find_element(By.XPATH, "//li[@data-sidebar-id='Manage Users']").click()

    wait_to_see("//div[@class='user-list-table']//div[@class='avaya-table avaya-table-streched']//tbody")
    time.sleep(2)
    if number_of("//div[@aria-label='New User Page']") != 0:
        find_click("//button[text()='Cancel']")
        try_click("//button[text()='Discard']")
        time.sleep(2)

    driver.find_element(By.XPATH, "//button[text()='Create User']").click()
    driver.find_element(By.XPATH, "//input[@placeholder='First Name of User']").send_keys(agent_user)
    driver.find_element(By.XPATH, "//input[@placeholder='Last Name of User']").send_keys(agent_user)
    driver.find_element(By.XPATH, "//input[@placeholder='Display Name of User']").send_keys(agent_user)
    driver.find_element(By.XPATH, "//input[@placeholder='Login ID for a User']").send_keys(agent_user)
    driver.find_element(By.XPATH, "//input[@placeholder='Password']").send_keys(agent_pass)
    driver.find_element(By.XPATH, "//input[@placeholder='Confirm Password']").send_keys(agent_pass)
    driver.find_element(By.XPATH, "//div[@aria-label='select profile']").click()
    driver.find_element(By.XPATH, "//div[@title='" + profile_name + "']").click()  # profile name: ProactiveOutreach
    time.sleep(3)
    driver.find_element(By.XPATH, "//div[@aria-labelledby='queue-nameid']").click()
    driver.find_element(By.XPATH, "//div[@aria-labelledby='queue-nameid']//div[@title='" + agent_queue + "']/parent::li").click() # queue name:
    time.sleep(1)
    driver.find_element(By.XPATH, "//div[@id='Manage Users']//button[text()='Save']").click()
    wait.until(EC.presence_of_element_located((By.XPATH, "//div[@class='user-list-table']//tbody[@style]")))
    time.sleep(3)


#TODO#####
login()
add_queue("tma22", "tma22")
add_agent("tma22", "Avaya123$", "tma22", "OutreachProfile")

