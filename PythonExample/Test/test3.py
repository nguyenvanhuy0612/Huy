import requests
from bs4 import BeautifulSoup
import time
from selenium import webdriver
from selenium.webdriver import Keys
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager

url = 'https://tinhocngoisao.com/bang-gia-ban'
##page = requests.get(url, timeout=(3.05, 27))

option = webdriver.ChromeOptions()
option.add_argument('--headless')

driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()), options=option)
driver.implicitly_wait(30)

driver.get(url)


def save_html(html, path):
    with open(path, 'wb+') as f:
        f.write(html)


# soup = BeautifulSoup(page.text, 'html.parser')
# print(soup.prettify())
save_html(driver.page_source.encode('utf-8'), "gia.html")
