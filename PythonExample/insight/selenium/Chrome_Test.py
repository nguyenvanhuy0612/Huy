import time
from selenium import webdriver
from selenium.webdriver import Keys
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager


def test():
    driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()))
    driver.implicitly_wait(30)

    driver.get("https://google.com")
    time.sleep(2)
    driver.find_element(By.NAME, "q").send_keys("TEST SELENIUM", Keys.RETURN)

    time.sleep(5)
    driver.quit()


if __name__ == "__main__":
    test()
