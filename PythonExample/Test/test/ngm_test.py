from common import *
from ngm_locator import *

AGENT_LISTS = ["tma" + str(i) for i in range(1, 20)]
TEMPLATE_PROFILE_NAME = "OutreachProfile"
AGENT_PASSWORD = "Avaya123$"

#login
driver.get(URL)
wait_for_element(LOGIN_AGENT_USERNAME_LOC).send_keys(LOGIN_AGENT_USERNAME)
find_and_click(LOGIN_NEXT_BTN_LOC)
wait_for_element(LOGIN_AGENT_PASSWORD_LOC).send_keys(LOGIN_AGENT_PASSWORD)
find_and_click(LOGIN_BTN_LOC)
sleep(10)

if "expand" not in wait_for_element(CC_BTN_LOC).get_attribute("class"):
    find_and_click(CC_BTN_LOC)
find_and_click(QUEUE_BTN_LOC)
wait_for_element(TABLE_QUEUE_CHECK_LOC)
if number_of(NEW_QUEUE_CHECK_LOC) != 0:
    find_and_click(NEW_QUEUE_CANCEL_BTN_LOC)
    try_click(NEW_QUEUE_DISCARD_BTN_LOC)
find_and_click(CREATE_QUEUE_BTN_LOC)
wait_for_element(QUEUE_NAME_LOC).send_keys("tma_test")
wait_for_element(QUEUE_DESCRIPTION_LOC).send_keys("tma_test")
find_and_click(QUEUE_SAVE_BTN_LOC)
wait_for_element(TABLE_QUEUE_CHECK_LOC)
sleep(2)

if "expand" not in wait_for_element(USER_MANAGER_BTN_LOC).get_attribute("class"):
    find_and_click(USER_MANAGER_BTN_LOC)
find_and_click(USER_BTN_LOC)
wait_for_element_max_time(TABLE_USER_CHECK_LOC, 120)
find_and_click(CREATE_USER_BTN_LOC)
sleep(2)
wait_for_element(USER_FIRSTNAME_LOC).send_keys("tma_test")
wait_for_element(USER_LASTNAME_LOC).send_keys("tma_test")
wait_for_element(USER_DISPLAY_NAME_LOC).send_keys("tma_test")
wait_for_element(USER_LOGIN_ID_LOC).send_keys("tma_test")
wait_for_element(USER_PASSWORD_LOC).send_keys("Avaya123$")
wait_for_element(USER_CONFIRM_PASSWORD_LOC).send_keys("Avaya123$")
find_and_click(USER_SELECT_PROFILE_LOC)
find_and_click(USER_SAMPLE_PROFILE_FORMAT_LOC.format(TEMPLATE_PROFILE_NAME))
find_and_click(USER_QUEUE_SELECT_LOC)
find_and_click(USER_QUEUE_NAME_FORMAT_LOC.format("tma_test"))
find_and_click(USER_SAVE_BTN_LOC)
wait_for_element(LIST_USER_CHECK_LOC)