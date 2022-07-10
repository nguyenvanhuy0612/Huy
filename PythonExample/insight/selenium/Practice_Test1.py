def selenium_craw():
    from webdriver_manager.chrome import ChromeDriverManager
    from selenium.webdriver.chrome.service import Service as ChromeService
    from selenium.webdriver.chrome.options import Options
    from selenium.webdriver.support.ui import WebDriverWait
    from selenium.webdriver.common.action_chains import ActionChains
    from selenium import webdriver

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
    options.add_argument("--headless")

    driver = webdriver.Chrome(options=options, service=ChromeService(ChromeDriverManager().install()))
    driver.implicitly_wait(30)
    driver.set_page_load_timeout(60)
    action = ActionChains(driver)
    wait = WebDriverWait(driver, 60)
    return driver


def action(driver):
    pass

