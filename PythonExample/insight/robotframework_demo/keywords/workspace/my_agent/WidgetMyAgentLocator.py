CONTACT_INFO_VAR = "${CONTACT_INFO}"
STATUS_AGENT = "#{STATUS}"
LOC_MYAGENT_SEARCH_AGENT = "xpath://div[@class='widget widget--supervisor']//md-input-container[1]//input[@aria-label='Search Team']"
LOC_MYAGENT_DISPLAY_AGENT = "xpath://td[@class='agent-display-name']"
LOC_WORK_ITEM_OBSERVE = "xpath://td[@class='work-item']"

# LOC_MYAGENT_BTN_OBSERVE = "xpath://button[@aria-label='Observe Interaction']"
LOC_MYAGENT_BTN_OBSERVE = "xpath://td[text()=\'" + CONTACT_INFO_VAR + "\']//following-sibling::td//button[@aria-label='Observe Interaction']"
LOC_MYAGENT_BTN_STATUS_AGENT = "xpath://button[@aria-label='state']"
LOC_MYAGENT_SELECT_STATUS_AGENT = "xpath://button//span[text()=\'"+ STATUS_AGENT +"\']"
LOC_BTN_END_OBSERVE ="xpath://button[@aria-label='End Observe']"