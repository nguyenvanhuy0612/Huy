# SystemResources 7.0
*** Settings ***
Library     ../keywords_7_compress_layout/base_module/BaseKeyword.py
Library     ../keywords_7_compress_layout/mm_admin/MMAdmin.py
Library     Selenium2Library
Library     BuiltIn
Library    String
Library     Collections
Library    DateTime
Resource    ../keywords_7_compress_layout/workspace/login/Login.robot
Resource    ../keywords_7_compress_layout/acm/common/ACM.robot
Resource    ../keywords_7_compress_layout/workspace/agent_toolbar/AgentToolbar.robot
Resource    ../keywords_7_compress_layout/workspace/sms/WidgetSMS.robot
Resource    ../keywords_7_compress_layout/workspace/chat/widget_chat/WidgetChat.robot
Resource    ../keywords_7_compress_layout/workspace/chat/widget_suggested_content/WidgetSuggestedContent.robot
Resource    ../keywords_7_compress_layout/sms/SMS.robot
Resource    ../keywords_7_compress_layout/web_chat/WebChat.robot
Resource    ../keywords_7_compress_layout/workspace/interaction_area/WorkCard.robot
Resource    ../keywords_7_compress_layout/workspace/agent_state_summary/AgentStateSummary.robot
Resource    ../keywords_7_compress_layout/workspace/navigation_menu/NavigationMenu.robot
Resource    ../keywords_7_compress_layout/base_module/Utils.robot
Resource    ../keywords_7_compress_layout/acm/user/AcmUser.robot



*** Variables ***
###################################################################################
###############################    WEB BROWSER    #################################
###################################################################################
# Chrome, Firefox, Edge, Ie
${BROWSER_CUST_1}           Chrome
${BROWSER_CUST_2}           Chrome
${BROWSER_CUST_3}           Chrome
${BROWSER_CUST_4}           Chrome
${BROWSER_CUST_5}           Chrome

${BROWSER_AGENT_1}          Chrome
${BROWSER_AGENT_2}          Chrome
${BROWSER_AGENT_3}          Chrome
${BROWSER_AGENT_4}          Chrome
${BROWSER_AGENT_5}          Chrome

${BROWSER_ACM}              edge
${BROWSER_FIREFOX}          Firefox
${BROWSER_CHROME}           Chrome
${BROWSER_IE}               Ie

# BROWSER ALIAS
${BROWSER_CUST_ALIAS_1}     brs_cust1
${BROWSER_CUST_ALIAS_2}     brs_cust2
${BROWSER_CUST_ALIAS_3}     brs_cust3
${BROWSER_CUST_ALIAS_4}     brs_cust4
${BROWSER_CUST_ALIAS_5}     brs_cust5

${BROWSER_AGENT_ALIAS_1}    brs_agent_1
${BROWSER_AGENT_ALIAS_2}    brs_agent_2
${BROWSER_AGENT_ALIAS_3}    brs_agent_3
${BROWSER_AGENT_ALIAS_4}    brs_agent_4
${BROWSER_AGENT_ALIAS_5}    brs_agent_5

${BROWSER_ACM_ALIAS}        brs_ACM

###################################################################################
##############################    PROVIDERS    ####################################
###################################################################################
${OCEANA_PROVIDER_CHAT}    OCP CHAT
${OCEANA_PROVIDER_EMAIL}    OCP EMAIL
${OCEANA_PROVIDER_SMS}    OCP ShortMessageService
${OCEANA_PROVIDER_SOCIAL}    OCP Social

###################################################################################
###############################    IP ADDRESS    ##################################
###################################################################################
${OCP_CLUSTER_IP}           10.128.228.151
${OCEANA_CLUSTER_IP}        10.128.228.210

###################################################################################
###############################    URL    #########################################
###################################################################################
${WORKSPACE_URL}    http://10.128.228.210/services/UnifiedAgentController/workspaces/#/login
${WEB_CHAT_URL}     http://100.30.6.97/webUI70/home.html
${WEB_SMS_URL}      https://10.128.228.151/services/SMSVendorSnapin/SMSTest.html
${ACM_URL}          https://acmaoc111.aoc.com/ACCCM/
${ACM_URL_RETURN}   https://acmaoc111.aoc.com/ACCCM/

###################################################################################
###############################    SYSTEM VARIABLE    #############################
###################################################################################
${WAIT_TIME_SHORT}    3
${WAIT_TIME_MEDIUM}   10
${WAIT_TIME_LONG}     30
${ACW_TIME}           30
${RONA_TIME}          30

${CONTACT_ROUTING_TIMEOUT}    120
${TIMEOUT_EXTRA_SHORT}    2
${TIMEOUT_SHORT}    5
${TIMEOUT_MEDIUM}   30
${TIMEOUT_LONG}     60
${TIMEOUT_EXTRA_LONG}     90


${ACM_user}    itnv
${ACM_pass}    1_Abc_2018
${ACM_page_title}    AVAYA Control Manager 8.1.0.0
${ACM_page_alias}    ACM_page_alias

###################################################################################
#############################    CUSTOMER     #####################################
###################################################################################
@{CUST1_INFO}    cust_firstname_1    cust_lastname_1    cust@one.com    +11    011   7000342    cust_title_1    cust_value_1
${CUST1_FIRST_NAME}         cust_firstname_1
${CUST1_LAST_NAME}          cust_lastname_1
${CUST1_EMAIL}              cust@one.com
${CUST1_COUNTRY_NUM}        +11
${CUST1_AREA_NUM}           011
${CUST1_PHONE_NUM}          7000342    # Will be used for 'Click to call', SMS, etc.
${CUST1_FIELD_TITLE}        cust_title_1
${CUST1_FIELD_VALUE}        cust_value_1

@{CUST2_INFO}    cust_firstname_2    cust_lastname_2    cust_two@two.com    +22     022    7000343    cust_title_2    cust_value_2
${CUST2_FIRST_NAME}         cust_firstname_2
${CUST2_LAST_NAME}          cust_lastname_2
${CUST2_EMAIL}              cust_two@two.com
${CUST2_COUNTRY_NUM}        +22
${CUST2_AREA_NUM}           022
${CUST2_PHONE_NUM}          7000343
${CUST2_FIELD_TITLE}        cust_title_2
${CUST2_FIELD_VALUE}        cust_value_2

@{CUST3_INFO}    cust_firstname_3    cust_lastname_3    cust_three@three.com    +33     033    7000344    cust_title_3    cust_value_3
${CUST3_FIRST_NAME}         cust_firstname_3
${CUST3_LAST_NAME}          cust_lastname_3
${CUST3_EMAIL}              cust_three@three.com
${CUST3_COUNTRY_NUM}        +33
${CUST3_AREA_NUM}           033
${CUST3_PHONE_NUM}          7000344
${CUST3_FIELD_TITLE}        cust_title_3
${CUST3_FIELD_VALUE}        cust_value_3

@{CUST4_INFO}    cust_firstname_4    cust_lastname_4    cust_four@four.com    +44    044    7000345    cust_title_4    cust_value_4
${CUST4_FIRST_NAME}         cust_firstname_4
${CUST4_LAST_NAME}          cust_lastname_4
${CUST4_EMAIL}              cust_four@four.com
${CUST4_COUNTRY_NUM}        +44
${CUST4_AREA_NUM}           044
${CUST4_PHONE_NUM}          7000345
${CUST4_FIELD_TITLE}        cust_title_4
${CUST4_FIELD_VALUE}        cust_value_4

###################################################################################
#################################    AGENT    #####################################
###################################################################################

############################     AGENT_1     ###############################
#${AGENT1_USERNAME}          tuan7100337@aoc.com
#${AGENT1_PASSWORD}          1_Abc_123
#${AGENT1_FIRSTNAME}         tuan
#${AGENT1_LASTNAME}          lc7100337
#${AGENT1_FULLNAME}          tuan lc7100337
#${AGENT1_PHONE_NUMBER}      7000337

${AGENT1_USERNAME}          atagent7100181@aoc.com
${AGENT1_PASSWORD}          1_Abc_123
${AGENT1_FIRSTNAME}         AtAgent
${AGENT1_LASTNAME}          7100181
${AGENT1_FULLNAME}          AtAgent 7100181
${AGENT1_PHONE_NUMBER}      7000181

@{AGENT1_ATTRIBUTE_SET}    at_chat1    at_sms1    at_email1    at_social1    at_lang1    at_loc1    at_transfer1    at_transfer2
${AGENT1_SUP}

############################     AGENT_2     ###############################
${AGENT2_USERNAME}          atagent7100182@aoc.com
${AGENT2_PASSWORD}          1_Abc_123
${AGENT2_FIRSTNAME}         AtAgent
${AGENT2_LASTNAME}          7100182
${AGENT2_FULLNAME}          AtAgent 7100182
${AGENT2_PHONE_NUMBER}      7000182

@{AGENT2_ATTRIBUTE_SET}    at_chat1    at_sms2    at_email2    at_social2    at_lang2    at_loc2    at_transfer1    at_transfer2
${AGENT2_SUP}    at_aoc_7100181

############################     AGENT_3     ###############################
${AGENT3_USERNAME}          atagent7100183@aoc.com
${AGENT3_PASSWORD}          1_Abc_123
${AGENT3_FIRSTNAME}         AtAgent
${AGENT3_LASTNAME}          7100183
${AGENT3_FULLNAME}          AtAgent 7100183
${AGENT3_PHONE_NUMBER}      7000183

@{AGENT3_ATTRIBUTE_SET}    at_chat3    at_sms3    at_email3    at_social3    at_lang3    at_loc3    at_transfer1    at_transfer2
${AGENT3_SUP}    at_aoc_7100181

############################     AGENT_4     ###############################
${AGENT4_USERNAME}          atagent7100184@aoc.com
${AGENT4_PASSWORD}          1_Abc_123
${AGENT4_FIRSTNAME}         AtAgent
${AGENT4_LASTNAME}          7100184
${AGENT4_FULLNAME}          AtAgent 7100184
${AGENT4_PHONE_NUMBER}      7000184

@{AGENT4_ATTRIBUTE_SET}    at_transfer1    at_transfer2
${AGENT4_SUP}    at_aoc_7100181

###################################################################################
#################################    SERVICE    ###################################
###################################################################################

${SERVICE_CHAT_1}    at_service_chat1
@{SERVICE_CHAT_1_ATT}    at_attr_cat.at_chat1    at_attr_cat.at_transfer1

${SERVICE_SMS_1}    at_service_sms1
@{SERVICE_CHAT_1_ATT}    at_attr_cat.at_sms1

${SERVICE_EMAIL_1}    at_service_email1
@{SERVICE_EMAIL_1_ATT}    at_attr_cat.at_email1

${SERVICE_SOCIAL_1}    at_service_social1
@{SERVICE_SOCIAL_1_ATT}    at_attr_cat.at_social1

${SERVICE_TRANSFER_1}    at_service_transfer1
@{SERVICE_TRANSFER_1_ATT}    at_attr_cat.at_transfer1

${SERVICE_TRANSFER_2}    at_service_transfer2
@{SERVICE_TRANSFER_2_ATT}    at_attr_cat.at_transfer2

###################################################################################
#################################    WEBCHAT    ###################################
###################################################################################

# IP =====> See [IP ADDRESS]
# Attributes =====> See [SERVICE INFO]
# Customer info =====> See [CUSTOMER INFO]

##################    EMAIL CHAT SCRIPT CHECKBOX    ######################
${EMAIL_CHATSCRIPT_NO}    no
${EMAIL_CHATSCRIPT_YES}    yes

###########################    AUTO-PHRASE    #############################
${CHAT_AUTO_PHRASE_GROUP_1}     at_auto_phrase_chat_group1
${CHAT_AUTO_PHRASE_GROUP_1_PHRASE_1_NAME}    at_auto phr@&$ CHAT gro^p #1 phra~e '1 name!
${CHAT_AUTO_PHRASE_GROUP_1_PHRASE_2_NAME}    at_auto phr@&$ CHAT gro^p #1 phra~e '2 name!
${CHAT_AUTO_PHRASE_GROUP_1_PHRASE_3_NAME}    at_auto phr@&$ CHAT gro^p #1 phra~e '3 name!
${CHAT_AUTO_PHRASE_GROUP_1_PHRASE_4_NAME}    at_auto phr@&$ CHAT gro^p #1 phra~e '4 name!
${CHAT_AUTO_PHRASE_GROUP_1_PHRASE_5_NAME}    at_auto phr@&$ CHAT gro^p #1 phra~e '5 name!

${CHAT_AUTO_PHRASE_GROUP_1_PHRASE_1_TEXT}    at_auto phr@&$ CHAT gro^p #1 phra~e '1 text!
${CHAT_AUTO_PHRASE_GROUP_1_PHRASE_2_TEXT}    at_auto phr@&$ CHAT gro^p #1 phra~e '2 text!
${CHAT_AUTO_PHRASE_GROUP_1_PHRASE_3_TEXT}    at_auto phr@&$ CHAT gro^p #1 phra~e '3 text!
${CHAT_AUTO_PHRASE_GROUP_1_PHRASE_4_TEXT}    at_auto phr@&$ CHAT gro^p #1 phra~e '4 text!
${CHAT_AUTO_PHRASE_GROUP_1_PHRASE_5_TEXT}    at_auto phr@&$ CHAT gro^p #1 phra~e '5 text!


${SMS_AUTO_PHRASE_GROUP_1}     at_auto_phrase_sms_group1
${SMS_AUTO_PHRASE_GROUP_1_PHRASE_1_NAME}    at_auto phr\@\&\$ SMS gro^p \#1 phra~e '1 name!    # at_auto phr@&$ SMS gro^p #1 phra~e '1 name!
${SMS_AUTO_PHRASE_GROUP_1_PHRASE_2_NAME}    at_auto phr\@\&\$ SMS gro^p \#1 phra~e '2 name!    # at_auto phr@&$ SMS gro^p #1 phra~e '2 name!
${SMS_AUTO_PHRASE_GROUP_1_PHRASE_3_NAME}    at_auto phr\@\&\$ SMS gro^p \#1 phra~e '3 name!    # at_auto phr@&$ SMS gro^p #1 phra~e '3 name!
${SMS_AUTO_PHRASE_GROUP_1_PHRASE_4_NAME}    at_auto phr\@\&\$ SMS gro^p \#1 phra~e '4 name!    # at_auto phr@&$ SMS gro^p #1 phra~e '4 name!
${SMS_AUTO_PHRASE_GROUP_1_PHRASE_5_NAME}    at_auto phr\@\&\$ SMS gro^p \#1 phra~e '5 name!    # at_auto phr@&$ SMS gro^p #1 phra~e '5 name!


${SMS_AUTO_PHRASE_GROUP_1_PHRASE_1_TEXT}    at_auto phr\@\&\$ SMS gro^p \#1 phra~e '1 text!    # at_auto phr@&$ SMS gro^p #1 phra~e '1 text!
${SMS_AUTO_PHRASE_GROUP_1_PHRASE_2_TEXT}    at_auto phr\@\&\$ SMS gro^p \#1 phra~e '2 text!    # at_auto phr@&$ SMS gro^p #1 phra~e '2 text!
${SMS_AUTO_PHRASE_GROUP_1_PHRASE_3_TEXT}    at_auto phr\@\&\$ SMS gro^p \#1 phra~e '3 text!    # at_auto phr@&$ SMS gro^p #1 phra~e '3 text!
${SMS_AUTO_PHRASE_GROUP_1_PHRASE_4_TEXT}    at_auto phr\@\&\$ SMS gro^p \#1 phra~e '4 text!    # at_auto phr@&$ SMS gro^p #1 phra~e '4 text!
${SMS_AUTO_PHRASE_GROUP_1_PHRASE_5_TEXT}    at_auto phr\@\&\$ SMS gro^p \#1 phra~e '5 text!    # at_auto phr@&$ SMS gro^p #1 phra~e '5 text!

###########################    PAGEPUSH URL    #############################
${CHAT_PAGE_PUSH_URLS_GROUP_1}    at_page_push_urls_CHAT_group_1
${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_1}    http://at_pp_URL_CHAT_group1/url1
${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_2}    https://at_pp_URL_CHAT_group1/url2
${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_3}    http://at_pp_URL_CHAT_group1/url3/url3
${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_4}    https://at_pp_URL_CHAT_group1/url?4
${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_5}    http://at_pp_URL_CHAT_group1/url=5
${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_LIST}    ${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_1}    ${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_2}    ${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_3}    ${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_4}    ${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_5}

${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_1_DESCRIPTION}    at_page_push_urls CHAT group_1 URL 1 description
${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_2_DESCRIPTION}    at_page_push_urls CHAT group_1 URL 2 description
${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_3_DESCRIPTION}    at_page_push_urls CHAT group_1 URL 3 description
${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_4_DESCRIPTION}    at_page_push_urls CHAT group_1 URL 4 description
${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_5_DESCRIPTION}    at_page_push_urls CHAT group_1 URL 5 description
${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_DESCRIPTION_LIST}    ${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_1_DESCRIPTION}    ${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_2_DESCRIPTION}    ${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_3_DESCRIPTION}    ${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_4_DESCRIPTION}    ${CHAT_PAGE_PUSH_URLS_GROUP_1_URL_5_DESCRIPTION}


${SMS_PAGE_PUSH_URLS_GROUP_1}    at_page_push_urls_SMS_group_1
${SMS_PAGE_PUSH_URLS_GROUP_1_URL_1}    http://at_pp_URL_SMS_group1/url1
${SMS_PAGE_PUSH_URLS_GROUP_1_URL_2}    https://at_pp_URL_SMS_group1/url2
${SMS_PAGE_PUSH_URLS_GROUP_1_URL_3}    http://at_pp_URL_SMS_group1/url3/url3
${SMS_PAGE_PUSH_URLS_GROUP_1_URL_4}    https://at_pp_URL_SMS_group1/url?4
${SMS_PAGE_PUSH_URLS_GROUP_1_URL_5}    http://at_pp_URL_SMS_group1/url=5
${SMS_PAGE_PUSH_URLS_GROUP_1_URL_LIST}   ${SMS_PAGE_PUSH_URLS_GROUP_1_URL_1}    ${SMS_PAGE_PUSH_URLS_GROUP_1_URL_2}    ${SMS_PAGE_PUSH_URLS_GROUP_1_URL_3}    ${SMS_PAGE_PUSH_URLS_GROUP_1_URL_4}    ${SMS_PAGE_PUSH_URLS_GROUP_1_URL_5}

${SMS_PAGE_PUSH_URLS_GROUP_1_URL_1_DESCRIPTION}    at_page_push_urls SMS group_1 URL 1 description
${SMS_PAGE_PUSH_URLS_GROUP_1_URL_2_DESCRIPTION}    at_page_push_urls SMS group_1 URL 2 description
${SMS_PAGE_PUSH_URLS_GROUP_1_URL_3_DESCRIPTION}    at_page_push_urls SMS group_1 URL 3 description
${SMS_PAGE_PUSH_URLS_GROUP_1_URL_4_DESCRIPTION}    at_page_push_urls SMS group_1 URL 4 description
${SMS_PAGE_PUSH_URLS_GROUP_1_URL_5_DESCRIPTION}    at_page_push_urls SMS group_1 URL 5 description
${SMS_PAGE_PUSH_URLS_GROUP_1_URL_DESCRIPTION_LIST}    ${SMS_PAGE_PUSH_URLS_GROUP_1_URL_1_DESCRIPTION}    ${SMS_PAGE_PUSH_URLS_GROUP_1_URL_2_DESCRIPTION}    ${SMS_PAGE_PUSH_URLS_GROUP_1_URL_3_DESCRIPTION}    ${SMS_PAGE_PUSH_URLS_GROUP_1_URL_4_DESCRIPTION}    ${SMS_PAGE_PUSH_URLS_GROUP_1_URL_5_DESCRIPTION}

#########################    WEB-ONHOLD MESSAGE    #######################
${ON_HOLD_MSG_EXTEND_TIME}    4                #### as an issue of web-chat

${ON_HOLD_MESSAGE_GROUP_1}     at_on_hold_msg_group1
${ON_HOLD_MESSAGE_GROUP_1_DELAY_TIME}    10
${ON_HOLD_MESSAGE_GROUP_1_MSG_1}    at_on_hold_msg group 1 msg 1
${ON_HOLD_MESSAGE_GROUP_1_MSG_2}    at_on_hold_msg group 1 msg 2
${ON_HOLD_MESSAGE_GROUP_1_MSG_3}    at_on_hold_msg group 1 msg 3
${ON_HOLD_MESSAGE_GROUP_1_MSG_4}    at_on_hold_msg group 1 msg 4
${ON_HOLD_MESSAGE_GROUP_1_MSG_5}    at_on_hold_msg group 1 msg 5

########################    WEB-ONHOLD URLs    ############################
${ON_HOLD_URL_EXTEND_TIME}    4                #### as an issue of web-chat

${ON_HOLD_URL_TAG_1}    at_on_hold_url_tag_1
${ON_HOLD_URL_TAG_1_DESCRIPTION}    URL tag1 description
${ON_HOLD_URL_TAG_1_HOLD_TIME}    10
${ON_HOLD_URL_TAG_1_URL_1}    http://at_url_tag1.com/url1
${ON_HOLD_URL_TAG_1_URL_2}    https://at_url_tag1.com/url2
${ON_HOLD_URL_TAG_1_URL_3}    https://at_url_tag1.com/url3/url3
${ON_HOLD_URL_TAG_1_URL_4}    https://at_url_tag1.com/url?4
${ON_HOLD_URL_TAG_1_URL_5}    http://at_url_tag1.com/url=5

##########################    COMFORT MESSAGE    #########################
${COMFORT_MSG_EXTEND_TIME}    4                #### as an issue of web-chat

${COMFORT_MESSAGE_GROUP_1}    at_comfort_message_group1
${COMFORT_MESSAGE_GROUP_1_DELAY_TIME}    10
${COMFORT_MESSAGE_GROUP_1_MSG_1}    at_comfort_message group1 msg1
${COMFORT_MESSAGE_GROUP_1_MSG_2}    at_comfort_message group1 msg2
${COMFORT_MESSAGE_GROUP_1_MSG_3}    at_comfort_message group1 msg3
${COMFORT_MESSAGE_GROUP_1_MSG_4}    at_comfort_message group1 msg4
${COMFORT_MESSAGE_GROUP_1_MSG_5}    at_comfort_message group1 msg5

@{COMFORT_MESSAGE_GROUP_1_MSG_LIST}    ${COMFORT_MESSAGE_GROUP_1_MSG_1}    ${COMFORT_MESSAGE_GROUP_1_MSG_2}    ${COMFORT_MESSAGE_GROUP_1_MSG_3}    ${COMFORT_MESSAGE_GROUP_1_MSG_4}    ${COMFORT_MESSAGE_GROUP_1_MSG_5}

###################################################################################
#################################    WEB SMS    ###################################
###################################################################################
# Customner number =====> see [CUSTOMER INFO]
# Service =====> see [SERVICE INFO]
# auto-phrase =====> see [AUTO-PHRASE CONFIG]
# pagepush urls =====> see [PAGEPUSH URL CONFIG]

# SMS_CENTER_NUM will relate to the service in [SERVICE INFO]
${SMS_CENTER_NUM_1}    201801
${SMS_CENTER_NUM_2}    201802
${SMS_CENTER_NUM_3}    201803

${SMS_MAX_LENGTH}

###################################################################################
##############################    SCREEN-POP    ###################################
###################################################################################
# INCOMING; Filter Name : Blank; Provider : Voice Provider, Launch internal: NO
${SCREENPOP_VOICE1_INCOMING}    oceana_auto_voice1_incoming
${SCREENPOP_VOICE1_INCOMING_URL}   https://google.com

# OUTGOING Filter Name : Blank; Provider : Chat Provider, Launch internal: NO
${SCREENPOP_CHAT1_OUTGOING}    oceana_auto_chat1_outgoing
${SCREENPOP_CHAT1_OUTGOING_URL}    http://robotframework.org

# INCOMING; Filter Name : Blank; Provider : Chat Provider, Launch internal: NO
${SCREENPOP_CHAT1_INCOMING}    oceana_auto_chat1_incoming
${SCREENPOP_CHAT1_INCOMING_URL}    https://en.wikipedia.org/wiki/Avaya

# INCOMING; Filter Name : Voice filter ( for service 1 ); Provider :  Chat Provider, Launch internal: NO
${SCREENPOP_CHAT2_INCOMING}    oceana_auto_chat2_incoming
${SCREENPOP_CHAT2_INCOMING_URL}    https://vi.wikipedia.org/wiki/Robot
