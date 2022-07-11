import datetime
import os
import re
import time
from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
import pyperclip

# Author: Phuc Hoang
# Created Date: 5/8/2018
# Class BaseKeyword is used for declaring common methods that applied for all keywords
from selenium.webdriver import ActionChains


class BaseKeyword:
    def __init__(self):
        pass

    # Author: Phuc Hoang
    # Created Date: 5/8/2018
    # highlight element
    def highlight_element(self, element):
        """Highlights (blinks) a Selenium Webdriver element"""
        driver = element._parent
        def apply_style(s):
            driver.execute_script("arguments[0].setAttribute('style', arguments[1]);", element, s)
        original_style = element.get_attribute('style')
        apply_style("background: yellow; border: 2px solid red;")
        time.sleep(1)
        apply_style(original_style)

    # Author: Phuc Hoang
    # Created Date: 5/8/2018
    # get web driver url
    def get_current_web_driver_url(self):
        sele2lib = BuiltIn().get_library_instance("Selenium2Library")
        driver = sele2lib._current_browser()
        return driver.command_executor._url

    # Author: Phuc Hoang
    # Created Date: 5/8/2018
    # get web driver session id
    def get_current_web_driver_session_id(self):
        sele2lib = BuiltIn().get_library_instance("Selenium2Library")
        driver = sele2lib._current_browser()
        return driver.session_id

    # Author: Phuc Hoang
    # Created Date: 5/8/2018
    # Connect existing web driver and register it to selenium2library
    def register_web_driver(self, url, session_id, alias = ""):
        sele2lib = BuiltIn().get_library_instance("Selenium2Library")
        driver = webdriver.Remote(command_executor=url, desired_capabilities={})
        driver.session_id = session_id
        sele2lib.register_driver(driver, alias)

    # Author: Phuc Hoang
    # Created Date: 5/8/2018
    # Get current web driver from Selenium2Library
    def get_current_web_driver(self):
        sele2lib = BuiltIn().get_library_instance("Selenium2Library")
        return sele2lib.driver

    # Author: Phuc Hoang
    # Created Date: 5/8/2018
    # Find element by Selenium2Library of Robot Framework
    def find_element(self, locator, parent=None):
        sele2lib = BuiltIn().get_library_instance("Selenium2Library")
        return sele2lib.find_element(locator, parent)

    # Author: Phuc Hoang
    # Created Date: 5/8/2018
    # Find element by Selenium2Library of Robot Framework
    def find_elements(self, locator, parent=None):
        sele2lib = BuiltIn().get_library_instance("Selenium2Library")
        return sele2lib.find_elements(locator, parent)
    
    def click_element_ex(self, locator):
        sele2lib = BuiltIn().get_library_instance("Selenium2Library")
        driver = sele2lib._current_browser()
        element = sele2lib.find_element(locator)
        driver.execute_script("arguments[0].click();", element)
        
    def send_keys_ex(self, locator, text):
        sele2lib = BuiltIn().get_library_instance("Selenium2Library")
        driver = sele2lib._current_browser()
        element = sele2lib.find_element(locator)
        driver.execute_script("arguments[0].value='"+ text + "';", element)
        
    def split_string_using_regrex(self, string, regrex):
        result = re.compile(regrex).split(string)
        return result

#   def get_string_match_with_regrex(self, string, regrex):
#       result = re.find_all(regrex,string)
#       return result

    def format_time(self, time, input_format, output_format):
        return datetime.datetime.strptime(time, input_format).strftime(output_format)
    
    # Author: Phuc Hoang
    # Created Date: 17-Oct-2018
    def scroll_element_to_view(self, element):
        """
        Scroll element into view
        param: element
        """
        driver = self.get_current_web_driver()
        driver.execute_script("arguments[0].scrollIntoView(true);", element)

    # Author: ttvo
    # Created Date: 23-Nov-2018
    def get_download_file_path(self, file_name):
        return os.path.join(os.path.expanduser('~'), "Downloads", file_name).replace("\\", "\\\\")

    def get_upload_file_path(self, file_name):
        return (os.getcwd() + "\\oceana\\resources\\upload_files\\" + file_name).replace("\\", "\\\\")

    # Created by: lcntuan
    # Created date: 10-Dec-2018
    def copy_to_clipboard(self, data):
        pyperclip.copy(data)

    def paste_from_clipboard(self):
        return pyperclip.paste()

    def bring_current_browser_to_the_front(self):
        driver = self.get_current_web_driver()
        driver.switch_to.window(driver.current_window_handle)