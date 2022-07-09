import time

from selenium import webdriver
from selenium.webdriver.edge.service import Service as EdgeService
from webdriver_manager.microsoft import EdgeChromiumDriverManager

service = EdgeService(EdgeChromiumDriverManager().install())

driver = webdriver.Edge(service=service)
driver.get("https://google.com")
time.sleep(2)
driver.quit()