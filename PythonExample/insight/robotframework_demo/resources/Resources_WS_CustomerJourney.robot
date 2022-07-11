
*** Settings ***
Library     Selenium2Library

Library     subprocess  # library for open the application
Library     os          # library for open the application
Library     BuiltIn
Library     Calculator
Library     String

Library     ../keywords/base_module/BaseKeyword.py
Library     ../keywords/mm_admin/MMAdmin.py
Library     ../keywords/avaya_communicator/AvayaCommunicatorLocator.py
Library     ../keywords/one_x_communicator/OneXCommunicatorLocator.py
Library     ../keywords/avaya_ix/AvayaIXLocator.py
Library     ../keywords/outlook/OutlookLocator.py
Library     ../keywords/workspace/email/WidgetEmailLocator.py

Resource    ../keywords/workspace/login/Login.robot
Resource    ../keywords/workspace/agent_toolbar/AgentToolbar.robot
Resource    ../keywords/workspace/chat/widget_chat/WidgetChat.robot
Resource    ../keywords/workspace/interaction_area/WorkCard.robot
Resource    ../keywords/workspace/agent_state_summary/AgentStateSummary.robot
Resource    ../keywords/workspace/navigation_menu/NavigationMenu.robot
Resource    ../keywords/workspace/email/WidgetEmail.robot
Resource    ../keywords/workspace/my_agent/WidgetMyAgent.robot
Resource    ../keywords/workspace/settings/WidgetSettings.robot
Resource    ../keywords/workspace/welcome_page/WidgetWelcomePage.robot
Resource    ../keywords/workspace/customer_search/customer_history_search/CustomerHistorySearch.robot
Resource    ../keywords/workspace/interaction_log/InteractionLog.robot
Resource    ../keywords/workspace/customer_details/CustomerDetails.robot
Resource    ../keywords/workspace/customer_journey/CustomerJourney.robot
Resource    ../keywords/workspace/screenpop/Screenpop.robot
Resource    ../keywords/base_module/Utils.robot
Resource    ../keywords/avaya_communicator/AvayaCommunicator.robot
Resource    ../keywords/one_x_communicator/OneXCommunicator.robot
Resource    ../keywords/avaya_ix/AvayaIX.robot
Resource    ../keywords/outlook/Outlook.robot




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
${BROWSER_CUST_6}           Chrome

${BROWSER_AGENT_0}          Chrome
${BROWSER_AGENT_1}          Chrome
${BROWSER_AGENT_2}          Chrome
${BROWSER_AGENT_3}          Chrome
${BROWSER_AGENT_4}          Chrome
${BROWSER_AGENT_5}          Chrome
${BROWSER_AGENT_6}          Chrome

${BROWSER_EDGE}              edge
${BROWSER_FIREFOX}          Firefox
${BROWSER_CHROME}           Chrome
${BROWSER_IE}               Ie


# BROWSER ALIAS
${BROWSER_CUST_ALIAS_1}     brs_cust1
${BROWSER_CUST_ALIAS_2}     brs_cust2
${BROWSER_CUST_ALIAS_3}     brs_cust3
${BROWSER_CUST_ALIAS_4}     brs_cust4
${BROWSER_CUST_ALIAS_5}     brs_cust5
${BROWSER_CUST_ALIAS_6}     brs_cust6

${BROWSER_AGENT_ALIAS_0}    brs_agent_0
${BROWSER_AGENT_ALIAS_1}    brs_agent_1
${BROWSER_AGENT_ALIAS_2}    brs_agent_2
${BROWSER_AGENT_ALIAS_3}    brs_agent_3
${BROWSER_AGENT_ALIAS_4}    brs_agent_4
${BROWSER_AGENT_ALIAS_5}    brs_agent_5
${BROWSER_AGENT_ALIAS_6}    brs_agent_6

${BROWSER_HELP_ALIAS}       brs_help

${BROWSER_CCMA_ALIAS_1}     brs_CCMA_1


###################################################################################
#############################    APPLICATION    ###################################
###################################################################################
${OUTLOOK_APP}              C:/Program Files (x86)/Microsoft Office/Office12/OUTLOOK.EXE
${ONE_X_COMMUNICATOR}       C:/Program Files (x86)/Avaya/Avaya one-X Communicator/onexcui.exe
${AVAYA_COMMUNICATOR}       C:/Program Files (x86)/Avaya/Avaya Communicator/AvayaCommunicator.exe
${AVAYA_IX_WORKPLACE}       C:/Program Files (x86)/Avaya/Avaya IX Workplace/Avaya IX Workplace.exe

###################################################################################
###############################    URL    #########################################
###################################################################################

#${WORKSPACE_URL}    http://100.30.6.137:31380/Login/?returnpage=../services/UnifiedAgentController/workspaces/
${WORKSPACE_URL}    http://100.30.7.108:31380/Login/?returnpage=../services/UnifiedAgentController/workspaces/
#${WORKSPACE_URL}    http://10.128.228.174:31380/Login/?returnpage=../services/UnifiedAgentController/workspaces/
${WEB_CHAT_URL}     http://10.30.1.210:81/EWC_newSDK_AACC185_hostname/   #http://localhost:8080/ewcsite/          #http://100.30.6.97/webui63/home.html   http://100.30.7.103:8080/ewcsite/
#${WEB_CHAT_URL}     http://100.30.7.241:8080/ewcsite/      #http://10.30.1.72:8080/ewcsite/
${HELP_URL}         http://100.30.6.137:31380/services/UnifiedAgentController/workspaces/assets/help/aacc/en-us/index.html
${SERVER_H323}      100.30.6.150
${SERVER_SM}        100.30.5.51     #100.30.6.226
${PORT}     5060
${DOMAIN}   aoc     #automation     #auracc8.com
###################################################################################
###############################    SYSTEM VARIABLE    #############################
###################################################################################
${WAIT_TIME_SHORT}    3
${WAIT_TIME_MEDIUM}   10
${WAIT_TIME_LONG}     30
${ACW_TIME}           30
${RONA_TIME}          30

${CONTACT_ROUTING_TIMEOUT}    180
${TIMEOUT_EXTRA_SHORT}    2
${TIMEOUT_SHORT}    5
${TIMEOUT_MEDIUM}   30
${TIMEOUT_LONG}     60
${TIMEOUT_EXTRA_LONG}     90

###################################################################################
#############################    CUSTOMER     #####################################
###################################################################################

##############################     CUSTOMER 1     #################################
@{CUST1_INFO}    cust_name_1    WS_CUSTOMER1@acc7dc.com
${CUST1_NAME}         cust_name_1
${CUST1_EMAIL}        WS_CUSTOMER1@acc7dc.com
${CUST1_PHONE}          6500718  #3307        #61141      #51015
${CUST1_PHONE_PASSWORD}     12345678
${CUST1_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
${CUST1_DOMAIN}             aoc.com   #auracc8.com
#${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
${CUST1_URI}         tel:${CUST1_PHONE};phone-context=dialstring       #tel:${CUST1_PHONE};phone-context=dialstring
${CUST1_URI_CDN}      sip:+${CUST1_PHONE}@${CUST1_DOMAIN}

##############################     CUSTOMER 2     #################################
@{CUST2_INFO}    cust_name_2    1WS_CUSTOMER2@acc7dc.com
${CUST2_NAME}         cust_name_2
${CUST2_EMAIL}        1WS_CUSTOMER2@acc7dc.com
${CUST2_PHONE}          6500718        #61141      #51015
${CUST2_PHONE_PASSWORD}     12345678
${CUST2_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
${CUST2_DOMAIN}             aoc.com
#${CUST1_URI}         sip:${CUST2_PHONE}@${CUST2_DOMAIN}
${CUST2_URI}          tel:${CUST2_PHONE};phone-context=dialstring   #tel:${CUST2_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
${CUST2_URI_CDN}      sip:${CUST2_PHONE}@${CUST2_DOMAIN}

##############################     CUSTOMER 3     #################################
@{CUST3_INFO}    cust_name_3    1WS_CUSTOMER3@acc7dc.com
${CUST3_NAME}         cust_name_3
${CUST3_EMAIL}        1WS_CUSTOMER3@acc7dc.com
${CUST3_PHONE}          3307        #61141      #51015
${CUST3_PHONE_PASSWORD}     12345678
${CUST3_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
${CUST3_DOMAIN}             auracc8.com
#${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
${CUST3_URI}           tel:${CUST3_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
${CUST3_URI_CDN}       sip:${CUST3_PHONE}@${CUST3_DOMAIN}

##############################     CUSTOMER 4     #################################
@{CUST4_INFO}    cust_name_4    1WS_EM_customer4444@acc7dc.com    WC_oanh1
${CUST4_NAME}         cust_name_4
${CUST4_EMAIL}        1WS_EM_customer4444@acc7dc.com
${CUST4_PHONE}          3307        #61141      #51015
${CUST4_PHONE_PASSWORD}     12345678
${CUST4_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
${CUST4_DOMAIN}             auracc8.com
#${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
${CUST4_URI}           tel:${CUST4_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
${CUST4_URI_CDN}       sip:${CUST4_PHONE}@${CUST4_DOMAIN}

##############################     CUSTOMER 5     #################################
@{CUST5_INFO}    cust_name_5    1b@b.com
${CUST5_NAME}         cust_name_5
${CUST5_EMAIL}        1b@b.com
${CUST5_PHONE}          3307        #61141      #51015
${CUST5_PHONE_PASSWORD}     12345678
${CUST5_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
${CUST5_DOMAIN}             auracc8.com
#${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
${CUST5_URI}           tel:${CUST5_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
${CUST5_URI_CDN}       sip:${CUST5_PHONE}@${CUST5_DOMAIN}

###############################     CUSTOMER 5     #################################
#@{CUST5_INFO}    cust_name_5    WS5@acc7dc.com
#${CUST5_NAME}         cust_name_5
#${CUST5_EMAIL}        WS5@acc7dc.com
#${CUST5_PHONE}          3307        #61141      #51015
#${CUST5_PHONE_PASSWORD}     12345678
#${CUST5_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
#${CUST5_DOMAIN}             auracc8.com
##${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
#${CUST5_URI}           tel:${CUST5_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
#${CUST5_URI_CDN}       sip:${CUST5_PHONE}@${CUST5_DOMAIN}

##############################     CUSTOMER 6     #################################
@{CUST6_INFO}    cust_name_6    66@acc7dc.com    #customer6@acc7dc.com
${CUST6_NAME}         cust_name_6
${CUST6_EMAIL}        66@acc7dc.com       #customer6@acc7dc.com
${CUST6_PHONE}          3307        #61141      #51015
${CUST6_PHONE_PASSWORD}     12345678
${CUST6_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
${CUST6_DOMAIN}             auracc8.com
#${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
${CUST6_URI}           tel:${CUST6_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
${CUST6_URI_CDN}       sip:${CUST6_PHONE}@${CUST6_DOMAIN}

##############################     CUSTOMER 7     #################################
@{CUST7_INFO}    ${EMPTY}    oanhho_cust7@acc7dc.com
${CUST7_NAME}         ${EMPTY}
${CUST7_EMAIL}        oanhho_cust7@acc7dc.com
${CUST7_PHONE}          3307        #61141      #51015
${CUST7_PHONE_PASSWORD}     12345678
${CUST7_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
${CUST7_DOMAIN}             auracc8.com
#${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
${CUST7_URI}           tel:${CUST7_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
${CUST7_URI_CDN}       sip:+${CUST7_PHONE}@${CUST7_DOMAIN}

###################################################################################
#######      Config System Dilivery Failure Rule for skillset of Agent      #######
${ADMIN_EMAIL}      Administrator@automation.tma.com
${ADMIN_SUBJECT}    Undeliverable
${ADMIN_CONTENT_EMAIL}  The e-mail account does not exist at the organization this message was sent to.  Check the e-mail address, or contact the recipient directly to find out the correct address.

###################################################################################
#################################    AGENT    #####################################
###################################################################################

############################     SUP0 (VOICE0)    ###############################
${AGENT0_USERNAME}          ${DOMAIN}\\AACC_AUTO_VOICE0
${AGENT0_PASSWORD}          1_Abc_123
${AGENT0_FIRSTNAME}         AACC_AUTO_VOICE0
${AGENT0_LASTNAME}          AACC_AUTO_VOICE0
${AGENT0_FULLNAME}          AACC_AUTO_VOICE0
${AGENT0_ID}                6500710
${AGENT0_PHONE_NUMBER}      6500710
${AGENT0_VOICE_URI}         sip:${AGENT0_PHONE_NUMBER}@aoc.com  #auracc8.com
${AGENT0_SKILLSET_VOICE1}      SKILLSET_FOR_Voice1
${AGENT0_SKILLSET_VOICE2}      SKILLSET_FOR_Voice2
${AGENT0_SKILLSET_EM}      EM_SKILLSET_FOR_WC
#${AGENT0_MAIL}              WS_Voice0@automation.tma.com
${AGENT0_SUP}               WS_WC_Agent5_Blended

############################     AGENT_1     ###############################
${AGENT1_USERNAME}          ${DOMAIN}\\AACC_AUTO_WC1_MM
${AGENT1_PASSWORD}          1_Abc_123
${AGENT1_FIRSTNAME}         AACC_AUTO_WC1_MM
${AGENT1_LASTNAME}          AACC_AUTO_WC1_MM
${AGENT1_FULLNAME}          AACC_AUTO_WC1_MM
${AGENT1_ID}                6500721
${AGENT1_PHONE_NUMBER}      6500721
${AGENT1_VOICE_URI}         sip:${AGENT1_PHONE_NUMBER}@aoc.com  #auracc8.com
${AGENT1_SKILLSET_WC1}      WC_SKILLSET_FOR_WC1
${AGENT1_SKILLSET_WC2}      WC_SKILLSET_FOR_WC2
${AGENT1_SKILLSET_EM}       EM_SKILLSET_FOR_WC
${AGENT1_MAIL}              WS_WC1@acc7dc.com
${AGENT1_SUP}               WS_Voice0

############################     AGENT_2     ###############################
${AGENT2_USERNAME}          ${DOMAIN}\\AACC_AUTO_WC2_MM
${AGENT2_PASSWORD}          1_Abc_123
${AGENT2_FIRSTNAME}         AACC_AUTO_WC2_MM
${AGENT2_LASTNAME}          AACC_AUTO_WC2_MM
${AGENT2_FULLNAME}          AACC_AUTO_WC2_MM
${AGENT2_ID}                6500722
${AGENT2_PHONE_NUMBER}      6500722
${AGENT2_VOICE_URI}         sip:${AGENT2_PHONE_NUMBER}@aoc.com  #auracc8.com
${AGENT2_SKILLSET_WC1}      WC_SKILLSET_FOR_WC1
${AGENT2_SKILLSET_WC2}      WC_SKILLSET_FOR_WC2
${AGENT2_SKILLSET_EM}      EM_SKILLSET_FOR_WC
#${AGENT2_MAIL}              WS_Voice2@automation.tma.com
${AGENT2_SUP}               WS_Voice1

############################     AGENT_3     ###############################
${AGENT3_USERNAME}          ${DOMAIN}\\AACC_AUTO_WC3_BL
${AGENT3_PASSWORD}          1_Abc_123
${AGENT3_FIRSTNAME}         AACC_AUTO_WC3_BL
${AGENT3_LASTNAME}          AACC_AUTO_WC3_BL
${AGENT3_FULLNAME}          AACC_AUTO_WC3_BL
${AGENT3_ID}                6500723
${AGENT3_PHONE_NUMBER}      6500723
${AGENT3_VOICE_URI}         sip:${AGENT3_PHONE_NUMBER}@aoc.com  #auracc8.com
${AGENT3_SKILLSET_VOICE1}      SKILLSET_FOR_WC
${AGENT3_SKILLSET_EM}      EM_SKILLSET_FOR_WC
${AGENT3_SKILLSET_WC1}      WC_SKILLSET_FOR_WC1
${AGENT3_SKILLSET_WC2}      WC_SKILLSET_FOR_WC2
${AGENT3_MAIL}              WS_Voice3_Blended@acc7dc.com
${AGENT3_SUP}               WS_Voice1

############################     AGENT_4     ###############################
${AGENT4_USERNAME}          ${DOMAIN}\\AACC_AUTO_WC4_BL
${AGENT4_PASSWORD}          1_Abc_123
${AGENT4_FIRSTNAME}         AACC_AUTO_WC4_BL
${AGENT4_LASTNAME}          AACC_AUTO_WC4_BL
${AGENT4_FULLNAME}          AACC_AUTO_WC4_BL
${AGENT4_ID}                6500724
${AGENT4_PHONE_NUMBER}      6500724
${AGENT4_VOICE_URI}         sip:${AGENT4_PHONE_NUMBER}@aoc.com  #@auracc8.com
${AGENT4_SKILLSET_VOICE1}      SKILLSET_FOR_Voice1
${AGENT4_SKILLSET_EM}      EM_SKILLSET_FOR_WC
${AGENT4_SKILLSET_WC1}      WC_SKILLSET_FOR_WC1
${AGENT4_SKILLSET_WC2}      WC_SKILLSET_FOR_WC2
${AGENT4_MAIL}              WS_Voice3_Blended@acc7dc.com
${AGENT4_SUP}               WS_Voice1

############################     AGENT_5     ###############################
${AGENT5_USERNAME}          ${DOMAIN}\\AACC_AUTO_SANITY1_V
${AGENT5_PASSWORD}          1_Abc_123
${AGENT5_FIRSTNAME}         AACC_AUTO_SANITY1_V
${AGENT5_LASTNAME}          AACC_AUTO_SANITY1_V
${AGENT5_FULLNAME}          AACC_AUTO_SANITY1_V
${AGENT5_ID}                6500701
${AGENT5_PHONE_NUMBER}      6500701
${AGENT5_VOICE_URI}         sip:${AGENT5_PHONE_NUMBER}@aoc.com  #auracc8.com
${AGENT5_SKILLSET_VOICE1}      SKILLSET_FOR_SANITY1
${AGENT1_SUP}               WS_SANITY_SUP


###################################################################################
#############################    NOT READY CODE    ################################
###################################################################################
${RRD_CODE1}    Not_Ready_Default_Reason_Code
${RRD_CODE2}    NotRdy_Pull_Mode_Default_Code
${RRD_CODE3}    CC1026_NRRC
${RRD_CODE4}    ACC7_ForceNRRC_NR_161601
${RRD_CODE5}    ACC7_ForceNRRC_NR_161602
${RRD_CODE6}    ACC7_ForceNRRC_NR_161603
${RRD_CODE7}    ACC7_ForceNRRC_NR_161604
${RRD_CODE8}    ACC7_ForceNRRC_NR_161605
${RRD_CODE9}    ACC7_ForceNRRC_NR_161606
${RRD_CODE10}   ACC7_ForceNRRC_NR_161607

###################################################################################
################################    ACW CODE    ###################################
###################################################################################
${ACW_CODE1}    Default_ACW
${ACW_CODE2}    ACC7_ForceNRRC_ACW_1616001
${ACW_CODE3}    ACC7_ForceNRRC_ACW_1616002
${ACW_CODE4}    ACC7_ForceNRRC_ACW_1616003

###################################################################################
##############################    ACTIVITY CODE    ################################
###################################################################################
${ACTIVITY_CODE1}    CC1026_AC
${ACTIVITY_CODE2}    Skillset_Default_Activity_Code
${ACTIVITY_CODE3}    System_Default_Activity_Code
${ACTIVITY_CODE4}    TeaNov2016_AC1
${ACTIVITY_CODE5}    TeaNov2016_AC2

###################################################################################
###########################    DISPOSITION CODE    ################################
###################################################################################
${DISPOSITION_CODE1}    Completed
${DISPOSITION_CODE2}    CRC_Completed
${DISPOSITION_CODE3}    CRC_WebComms

###################################################################################
##################################    CDN    ######################################
###################################################################################
${CDN1}     55088   #44196   #44193       #45459
${CDN1_URI}     sip:${CDN1}@aoc.com     #sip:${CDN1}@auracc8.com
${CDN2}     55086
${CDN2_URI}     sip:${CDN2}@auracc8.com
${CDN3}
${CDN4}

###################################################################################
############################    EMAIL SIGNATURE    ################################
###################################################################################
${EMAIL_SIGNATURE}  THIS IS EMAIL SIGNATURE ROW
${EMAIL_SIGNATURE2}  ********** TMA **********
${EMAIL_SIGNATURE3_SPECIAL_CHARACTERS}  ~ ` ! @ # $ % ^ & * ( ) _ + { } [ ] | \ : " ; ' < > ? , . /


###################################################################################
###########################    EMAIL INFORMATION    ###############################
###################################################################################
${SUBJECT_EMAIL1}   This is Email from Agent
${CONTENT_EMAIL1}   1234567890 1234567890 1234567890 1234567890 1234567890 qwertyuiop asdfghjkl;'xcvbnm,][poiuytdfvbnm
${SUBJECT_MAIL1}        THIS IS MAIL FROM OANH_CUSTOMER
${MESSAGE_EMAIL1}       One two three four five six seven eight nine ten
${SUBJECT_MAIL2}        REQUEST CHANGE PASSWORD OF CUSTOMER
${MESSAGE_EMAIL2}       I need to change my password to 123456789
###################################################################################
###########################    EMAIL ATTACHMENTS    ###############################
###################################################################################
${ATTACHMENT_NAME1}      1CLWujF.png
${ATTACH_LINK_1}         C:\\Users\\Administrator\\Documents\\1CLWujF.png
${ATTACHMENT_SAME_NAME1}      1CLWujF.png
${ATTACH_SAME_LINK_1}         C:\\Users\\Administrator\\Pictures\\1CLWujF.png
${ATTACHMENT_LONG_NAME2}      This is attachment with having a long name_1111111111111111112222222222222333333333334444444445555555555566666666666777777778888888888999999999999900000000001111122222222222223333333123456789123456789.png
${ATTACH_LINK_2}         C:\\Users\\Administrator\\Documents\\This is attachment with having a long name_1111111111111111112222222222222333333333334444444445555555555566666666666777777778888888888999999999999900000000001111122222222222223333333123456789123456789.png
${ATTACHMENT_NAME3}      CCMA_A_PM.ppt
${ATTACH_LINK_3}         C:\\Users\\Administrator\\Documents\\CCMA_A_PM.ppt
${ATTACHMENT_NAME4}      Consolidated_ConfigurationTool.xlsm
${ATTACH_LINK_4}         C:\\Users\\Administrator\\Documents\\Consolidated_ConfigurationTool.xlsm
${ATTACHMENT_NAME5}      week3_1.zip
${ATTACH_LINK_5}         C:\\Users\\Administrator\\Documents\\week3_1.zip
${ATTACH_LARGER_25MB}    Pics.zip
${ATTACH_LARGER_25MB_LINK}    C:\\Users\\Administrator\\Documents\\Pics.zip
${VALID_SPECIAL_NAME}    Valid Special Characters Name!@#$%^&().png
${VALID_SPECIAL_NAME_LINK}     C:\\Users\\Administrator\\Documents\\Valid Special Characters Name!@#$%^&().png

${INLINE_IMAGE_NO_EXTENTION}       IMAGE_NO_EXTENTION
${INLINE_IMAGE_NO_EXTENTION_LINK}     C:\\Users\\Administrator\\Documents\\IMAGE_NO_EXTENTION
${INLINE_IMAGE_INVALID_EXTENTION}       CCMA_A_PM.ppt
${INLINE_IMAGE_INVALID_EXTENTION_LINK}     C:\\Users\\Administrator\\Documents\\CCMA_A_PM.ppt
${INLINE_IMAGE_SPECIAL_FILE_TYPE}       sPECILA FILE tYPE.jpeg.PNG
${INLINE_IMAGE_SPECIAL_FILE_TYPE_LINK}     C:\\Users\\Administrator\\Documents\\sPECILA FILE tYPE.jpeg.PNG
${INLINE_IMAGE_SPECIAL_NAME}       Valid Special Characters Name!@#$%^&().png
${INLINE_IMAGE_SPECIAL_NAME_LINK}     C:\\Users\\Administrator\\Documents\\Valid Special Characters Name!@#$%^&().png
${INLINE_IMAGE_1}       abcdef.png
${INLINE_IMAGE_LINK_1}       C:\\Users\\Administrator\\Documents\\abcdef.png
${INLINE_IMAGE_2}       abcdef.jpg
${INLINE_IMAGE_LINK_2}       C:\\Users\\Administrator\\Documents\\abcdef.jpg
${INLINE_IMAGE_3}       abcdef.jpeg
${INLINE_IMAGE_LINK_3}       C:\\Users\\Administrator\\Documents\\abcdef.jpeg
${INLINE_IMAGE_GIF_4}       pusheen gif.gif
${INLINE_IMAGE_GIF_LINK_4}       C:\\Users\\Administrator\\Documents\\pusheen gif.gif
###################################################################################
##############################    SUGGEST EMAIL    ################################
###################################################################################
${SUGGEST_EMAIL_1}      This is auto-suggest oanh1
${SUGGEST_EMAIL_CONTENT_1}      123 123 123
${SUGGEST_EMAIL_2}      This is auto-suggest oanh2
${SUGGEST_EMAIL_CONTENT_2}      hi hi hi hi hi
${SUGGEST_EMAIL_3}      This is auto-suggest oanh3
${SUGGEST_EMAIL_CONTENT_3}
###################################################################################
#################################    WEBCHAT    ###################################
###################################################################################

# IP =====> See [IP ADDRESS]
# Attributes =====> See [SERVICE INFO]
# Customer info =====> See [CUSTOMER INFO]
${DEFAULT_CUSTOMER_LABEL}   CustomerLabel

##################    EMAIL CHAT SCRIPT CHECKBOX    ######################
${EMAIL_CHATSCRIPT_NO}    no
${EMAIL_CHATSCRIPT_YES}    yes

############################    AUTO-PHRASE    #############################
${AUTO_PHRASES1}    This is auto phrases 1 from Agent
${AUTO_PHRASES2}    1234 1234 1234 1234 1234
${AUTO_PHRASES3}    !@#$%^&*()_+{}:"?

############################    PUSH-URLS    #############################
${PUSH_URL1}    https://google.com
${PUSH_URL2}    http://100.30.6.98/agentdesktop
${PUSH_URL3}    https://autosrv98.automation.tma.com

##########################    WEB-ONHOLD MESSAGE    #######################
${DEFAULT_WELCOME_MESSAGE}  WCCF_063_Default Welcome Message
${ON_HOLD1}     Hi Customer, please wait a moment!
${ON_HOLD2}     All agents are busy
${ON_HOLD3}     ==========TMA==========

#########################    WEB-ONHOLD URLs    ############################

###########################    COMFORT MESSAGE    #########################
${COMFORT_MESSAGE1}     Sorry Customer, network connection is not stable
${COMFORT_MESSAGE2}     Please wait a few minutes
${COMFORT_MESSAGE3}     Agent will answer you now

###################################################################################
#############################    EMAIL TEMPLATES   ################################
###################################################################################
${EMAIL_TEMPLATE1}    Ctrl - Help PyCharm
${EMAIL_TEMPLATE2}    gif1
${EMAIL_TEMPLATE3}    Learn English Online British Council
${EMAIL_TEMPLATE4}    template2_pic_a71
${EMAIL_TEMPLATE5}    Template include hyperlink
${EMAIL_TEMPLATE6}    Learn English Online British Council - Learn English Online British Council (((^@__@^)))


###################################################################################
##############################    SCREEN-POP    ###################################
###################################################################################

${SCREENPOP_NAME1}  AAAD
${SCREENPOP_NAME1_URL}      http://autosrv98/agentdesktop
${SCREENPOP_NAME2}  Google
${SCREENPOP_NAME1_URL}      https://www.google.com/

${MESSAGE_LESS_THAN_10000}    Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast
${MESSAGE_EQUAL_10000}    Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast.
${MESSAGE_MORE_THAN_10000}    Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast...


#=====================
#=====================
${CCMA_URL}     https://autosrv98.automation.tma.com
${CCMA_USER}    webadmin
${CCMA_PASS}    webadmin







## SystemResources 6.3
#
#*** Settings ***
#Library     Selenium2Library
#
#Library     subprocess  # library for open the application
#Library     os          # library for open the application
#Library     BuiltIn
#Library     Calculator
#Library     String
#
#Library     ../keywords/base_module/BaseKeyword.py
#Library     ../keywords/mm_admin/MMAdmin.py
#Library     ../keywords/avaya_communicator/AvayaCommunicatorLocator.py
#Library     ../keywords/one_x_communicator/OneXCommunicatorLocator.py
#Library     ../keywords/avaya_ix/AvayaIXLocator.py
#Library     ../keywords/outlook/OutlookLocator.py
#Library     ../keywords/workspace/email/WidgetEmailLocator.py
#
#Resource    ../keywords/workspace/login/Login.robot
#Resource    ../keywords/workspace/agent_toolbar/AgentToolbar.robot
#Resource    ../keywords/workspace/chat/widget_chat/WidgetChat.robot
#Resource    ../keywords/workspace/interaction_area/WorkCard.robot
#Resource    ../keywords/workspace/agent_state_summary/AgentStateSummary.robot
#Resource    ../keywords/workspace/navigation_menu/NavigationMenu.robot
#Resource    ../keywords/workspace/email/WidgetEmail.robot
#Resource    ../keywords/workspace/my_agent/WidgetMyAgent.robot
#Resource    ../keywords/workspace/settings/WidgetSettings.robot
#Resource    ../keywords/workspace/welcome_page/WidgetWelcomePage.robot
#Resource    ../keywords/workspace/customer_search/customer_history_search/CustomerHistorySearch.robot
#Resource    ../keywords/workspace/interaction_log/InteractionLog.robot
#Resource    ../keywords/workspace/customer_details/CustomerDetails.robot
#Resource    ../keywords/workspace/screenpop/Screenpop.robot
#Resource    ../keywords/base_module/Utils.robot
#Resource    ../keywords/avaya_communicator/AvayaCommunicator.robot
#Resource    ../keywords/one_x_communicator/OneXCommunicator.robot
#Resource    ../keywords/avaya_ix/AvayaIX.robot
#Resource    ../keywords/outlook/Outlook.robot
#
#
#
#
#*** Variables ***
####################################################################################
################################    WEB BROWSER    #################################
####################################################################################
## Chrome, Firefox, Edge, Ie
#${BROWSER_CUST_1}           Chrome
#${BROWSER_CUST_2}           Chrome
#${BROWSER_CUST_3}           Chrome
#${BROWSER_CUST_4}           Chrome
#${BROWSER_CUST_5}           Chrome
#${BROWSER_CUST_6}           Chrome
#
#${BROWSER_AGENT_0}          Chrome
#${BROWSER_AGENT_1}          Chrome
#${BROWSER_AGENT_2}          Chrome
#${BROWSER_AGENT_3}          Chrome
#${BROWSER_AGENT_4}          Chrome
#${BROWSER_AGENT_5}          Chrome
#${BROWSER_AGENT_6}          Chrome
#
#${BROWSER_EDGE}              edge
#${BROWSER_FIREFOX}          Firefox
#${BROWSER_CHROME}           Chrome
#${BROWSER_IE}               Ie
#
#
## BROWSER ALIAS
#${BROWSER_CUST_ALIAS_1}     brs_cust1
#${BROWSER_CUST_ALIAS_2}     brs_cust2
#${BROWSER_CUST_ALIAS_3}     brs_cust3
#${BROWSER_CUST_ALIAS_4}     brs_cust4
#${BROWSER_CUST_ALIAS_5}     brs_cust5
#${BROWSER_CUST_ALIAS_6}     brs_cust6
#
#${BROWSER_AGENT_ALIAS_0}    brs_agent_0
#${BROWSER_AGENT_ALIAS_1}    brs_agent_1
#${BROWSER_AGENT_ALIAS_2}    brs_agent_2
#${BROWSER_AGENT_ALIAS_3}    brs_agent_3
#${BROWSER_AGENT_ALIAS_4}    brs_agent_4
#${BROWSER_AGENT_ALIAS_5}    brs_agent_5
#${BROWSER_AGENT_ALIAS_6}    brs_agent_6
#
#${BROWSER_HELP_ALIAS}       brs_help
#
#${BROWSER_CCMA_ALIAS_1}     brs_CCMA_1
#
#
####################################################################################
##############################    APPLICATION    ###################################
####################################################################################
#${OUTLOOK_APP}              C:/Program Files (x86)/Microsoft Office/Office12/OUTLOOK.EXE
#${ONE_X_COMMUNICATOR}       C:/Program Files (x86)/Avaya/Avaya one-X Communicator/onexcui.exe
#${AVAYA_COMMUNICATOR}       C:/Program Files (x86)/Avaya/Avaya Communicator/AvayaCommunicator.exe
#${AVAYA_IX_WORKPLACE}       C:/Program Files (x86)/Avaya/Avaya IX Workplace/Avaya IX Workplace.exe
#
####################################################################################
################################    URL    #########################################
####################################################################################
#
##${WORKSPACE_URL}    http://100.30.6.137:31380/Login/?returnpage=../services/UnifiedAgentController/workspaces/
#${WORKSPACE_URL}    http://100.30.7.108:31380/Login/?returnpage=../services/UnifiedAgentController/workspaces/
#${WEB_CHAT_URL}     http://10.30.1.210:81/EWC_newSDK_AACC185_hostname/   #http://localhost:8080/ewcsite/          #http://100.30.6.97/webui63/home.html   http://100.30.7.103:8080/ewcsite/
#${HELP_URL}         http://100.30.6.137:31380/services/UnifiedAgentController/workspaces/assets/help/aacc/en-us/index.html
#${SERVER_H323}      100.30.6.150
#${SERVER_SM}        100.30.5.51     #100.30.6.226
#${PORT}     5060
#${DOMAIN}   aoc     #automation     #auracc8.com
####################################################################################
################################    SYSTEM VARIABLE    #############################
####################################################################################
#${WAIT_TIME_SHORT}    3
#${WAIT_TIME_MEDIUM}   10
#${WAIT_TIME_LONG}     30
#${ACW_TIME}           30
#${RONA_TIME}          30
#
#${CONTACT_ROUTING_TIMEOUT}    180
#${TIMEOUT_EXTRA_SHORT}    2
#${TIMEOUT_SHORT}    5
#${TIMEOUT_MEDIUM}   30
#${TIMEOUT_LONG}     60
#${TIMEOUT_EXTRA_LONG}     90
#
####################################################################################
##############################    CUSTOMER     #####################################
####################################################################################
#
###############################     CUSTOMER 1     #################################
#@{CUST1_INFO}    cust_name_1    WS_EM_customer1@automation.tma.com    WC_oanh1
#${CUST1_NAME}         cust_name_1
#${CUST1_EMAIL}        WS_EM_customer1@automation.tma.com
#${CUST1_PHONE}          6500719  #3307        #61141      #51015
#${CUST1_PHONE_PASSWORD}     12345678
#${CUST1_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
#${CUST1_DOMAIN}             aoc.com   #auracc8.com
##${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
#${CUST1_URI}         tel:${CUST1_PHONE};phone-context=dialstring       #tel:${CUST1_PHONE};phone-context=dialstring
#${CUST1_URI_CDN}      sip:+${CUST1_PHONE}@${CUST1_DOMAIN}
#
###############################     CUSTOMER 2     #################################
#@{CUST2_INFO}    cust_name_2    WS_EM_customer2@automation.tma.com    WC_oanh1
#${CUST2_NAME}         cust_name_2
#${CUST2_EMAIL}        WS_EM_customer2@automation.tma.com
#${CUST2_PHONE}          6500718        #61141      #51015
#${CUST2_PHONE_PASSWORD}     12345678
#${CUST2_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
#${CUST2_DOMAIN}             auracc8.com
##${CUST1_URI}         sip:${CUST2_PHONE}@${CUST2_DOMAIN}
#${CUST2_URI}          tel:${CUST2_PHONE};phone-context=dialstring   #tel:${CUST2_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
#${CUST2_URI_CDN}      sip:+${CUST2_PHONE}@${CUST2_DOMAIN}
#
###############################     CUSTOMER 3     #################################
#@{CUST3_INFO}    cust_name_3    WS_EM_CUSTOMER3@automation.tma.com    WC_oanh1
#${CUST3_NAME}         cust_name_3
#${CUST3_EMAIL}        WS_EM_CUSTOMER3@automation.tma.com
#${CUST3_PHONE}          3307        #61141      #51015
#${CUST3_PHONE_PASSWORD}     12345678
#${CUST3_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
#${CUST3_DOMAIN}             auracc8.com
##${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
#${CUST3_URI}           tel:${CUST3_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
#${CUST3_URI_CDN}       sip:${CUST3_PHONE}@${CUST3_DOMAIN}
#
###############################     CUSTOMER 4     #################################
#@{CUST4_INFO}    cust_name_4    WS_EM_customer4444.tma.com    WC_oanh1
#${CUST4_NAME}         cust_name_4
#${CUST4_EMAIL}        WS_EM_customer4444@automation.tma.com
#${CUST4_PHONE}          3307        #61141      #51015
#${CUST4_PHONE_PASSWORD}     12345678
#${CUST4_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
#${CUST4_DOMAIN}             auracc8.com
##${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
#${CUST4_URI}           tel:${CUST4_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
#${CUST4_URI_CDN}       sip:${CUST4_PHONE}@${CUST4_DOMAIN}
#
###############################     CUSTOMER 5     #################################
#@{CUST5_INFO}    cust_name_5    WS5@automation.tma.com    WC_oanh1
#${CUST5_NAME}         cust_name_5
#${CUST5_EMAIL}        WS5@automation.tma.com
#${CUST5_PHONE}          3307        #61141      #51015
#${CUST5_PHONE_PASSWORD}     12345678
#${CUST5_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
#${CUST5_DOMAIN}             auracc8.com
##${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
#${CUST5_URI}           tel:${CUST5_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
#${CUST5_URI_CDN}       sip:${CUST5_PHONE}@${CUST5_DOMAIN}
#
###############################     CUSTOMER 6     #################################
#@{CUST6_INFO}    cust_name_6    oanhho_cust6@automation.tma.com    WC_oanh1
#${CUST6_NAME}         cust_name_6
#${CUST6_EMAIL}        oanhho_cust6@automation.tma.com
#${CUST6_PHONE}          3307        #61141      #51015
#${CUST6_PHONE_PASSWORD}     12345678
#${CUST6_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
#${CUST6_DOMAIN}             auracc8.com
##${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
#${CUST6_URI}           tel:${CUST6_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
#${CUST6_URI_CDN}       sip:${CUST6_PHONE}@${CUST6_DOMAIN}
#
###############################     CUSTOMER 7     #################################
#@{CUST7_INFO}    ${EMPTY}    oanhho_cust7@automation.tma.com    WC_oanh1
#${CUST7_NAME}         ${EMPTY}
#${CUST7_EMAIL}        oanhho_cust7@automation.tma.com
#${CUST7_PHONE}          3307        #61141      #51015
#${CUST7_PHONE_PASSWORD}     12345678
#${CUST7_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
#${CUST7_DOMAIN}             auracc8.com
##${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
#${CUST7_URI}           tel:${CUST7_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
#${CUST7_URI_CDN}       sip:+${CUST7_PHONE}@${CUST7_DOMAIN}
#
####################################################################################
########      Config System Dilivery Failure Rule for skillset of Agent      #######
#${ADMIN_EMAIL}      Administrator@automation.tma.com
#${ADMIN_SUBJECT}    Undeliverable
#${ADMIN_CONTENT_EMAIL}  The e-mail account does not exist at the organization this message was sent to.  Check the e-mail address, or contact the recipient directly to find out the correct address.
#
####################################################################################
##################################    AGENT    #####################################
####################################################################################
#
#############################     SUP0 (VOICE0)    ###############################
#${AGENT0_USERNAME}          ${DOMAIN}\\WS_Voice0
#${AGENT0_PASSWORD}          1_Abc_123
#${AGENT0_FIRSTNAME}         WS_Voice0
#${AGENT0_LASTNAME}          WS_Voice0
#${AGENT0_FULLNAME}          WS_Voice0
#${AGENT0_ID}                6500710
#${AGENT0_PHONE_NUMBER}      6500710
#${AGENT0_VOICE_URI}         sip:${AGENT0_PHONE_NUMBER}@aoc.com  #auracc8.com
#${AGENT0_SKILLSET_VOICE1}      SKILLSET_FOR_Voice1
#${AGENT0_SKILLSET_VOICE2}      SKILLSET_FOR_Voice2
#${AGENT0_SKILLSET_EM}      EM_SKILLSET_FOR_EM
##${AGENT0_MAIL}              WS_Voice0@automation.tma.com
#${AGENT0_SUP}               WS_WC_Agent5_Blended
#
#############################     AGENT_1     ###############################
#${AGENT1_USERNAME}          ${DOMAIN}\\WS_Voice1
#${AGENT1_PASSWORD}          1_Abc_123
#${AGENT1_FIRSTNAME}         WS_Voice1
#${AGENT1_LASTNAME}          WS_Voice1
#${AGENT1_FULLNAME}          WS_Voice1
#${AGENT1_ID}                6500711
#${AGENT1_PHONE_NUMBER}      6500711
#${AGENT1_VOICE_URI}         sip:${AGENT1_PHONE_NUMBER}@aoc.com  #auracc8.com
#${AGENT1_SKILLSET_VOICE1}      SKILLSET_FOR_Voice1
#${AGENT1_SKILLSET_VOICE2}      SKILLSET_FOR_Voice2
#${AGENT1_SKILLSET_EM}      EM_SKILLSET_FOR_EM
##${AGENT1_MAIL}              WS_Voice1@automation.tma.com
#${AGENT1_SUP}               WS_Voice0
#
#############################     AGENT_2     ###############################
#${AGENT2_USERNAME}          ${DOMAIN}\\WS_Voice2
#${AGENT2_PASSWORD}          1_Abc_123
#${AGENT2_FIRSTNAME}         WS_Voice2
#${AGENT2_LASTNAME}          WS_Voice2
#${AGENT2_FULLNAME}          WS_Voice2
#${AGENT2_ID}                6500712
#${AGENT2_PHONE_NUMBER}      6500712
#${AGENT2_VOICE_URI}         sip:${AGENT2_PHONE_NUMBER}@aoc.com  #auracc8.com
#${AGENT2_SKILLSET_VOICE1}      SKILLSET_FOR_Voice1
#${AGENT2_SKILLSET_VOICE2}      SKILLSET_FOR_Voice2
#${AGENT2_SKILLSET_EM}      EM_SKILLSET_FOR_EM
##${AGENT2_MAIL}              WS_Voice2@automation.tma.com
#${AGENT2_SUP}               WS_Voice1
#
#############################     AGENT_3     ###############################
#${AGENT3_USERNAME}          ${DOMAIN}\\WS_Voice3_Blended
#${AGENT3_PASSWORD}          1_Abc_123
#${AGENT3_FIRSTNAME}         WS_Voice3_Blended
#${AGENT3_LASTNAME}          WS_Voice3_Blended
#${AGENT3_FULLNAME}          WS_Voice3_Blended
#${AGENT3_ID}                6500713
#${AGENT3_PHONE_NUMBER}      6500713
#${AGENT3_VOICE_URI}         sip:${AGENT3_PHONE_NUMBER}@aoc.com  #auracc8.com
#${AGENT3_SKILLSET_VOICE1}      SKILLSET_FOR_Voice1
#${AGENT3_SKILLSET_VOICE2}      SKILLSET_FOR_Voice2
#${AGENT3_SKILLSET_EM}      EM_SKILLSET_FOR_EM
#${AGENT3_SKILLSET_WC}      WC_SKILLSET_FOR_VOICE
#${AGENT3_MAIL}              WS_Voice3_Blended@acc7dc.com
#${AGENT3_SUP}               WS_Voice1
#
#############################     AGENT_4     ###############################
#${AGENT4_USERNAME}          ${DOMAIN}\\WS_Voice4_Blended
#${AGENT4_PASSWORD}          1_Abc_123
#${AGENT4_FIRSTNAME}         WS_Voice4_Blended
#${AGENT4_LASTNAME}          WS_Voice4_Blended
#${AGENT4_FULLNAME}          WS_Voice4_Blended
#${AGENT4_ID}                6500714
#${AGENT4_PHONE_NUMBER}      6500714
#${AGENT4_VOICE_URI}         sip:${AGENT4_PHONE_NUMBER}@aoc.com  #@auracc8.com
#${AGENT4_SKILLSET_VOICE1}      SKILLSET_FOR_Voice1
#${AGENT4_SKILLSET_VOICE2}      SKILLSET_FOR_Voice2
#${AGENT4_SKILLSET_EM}      EM_SKILLSET_FOR_EM
#${AGENT4_SKILLSET_WC}      WC_SKILLSET_FOR_VOICE
#${AGENT4_MAIL}              WS_Voice3_Blended@acc7dc.com
#${AGENT4_SUP}               WS_Voice1
#
#############################     AGENT_5     ###############################
#${AGENT5_USERNAME}          ${DOMAIN}\\WS_Voice5_Blended
#${AGENT5_PASSWORD}          1_Abc_123
#${AGENT5_FIRSTNAME}         WS_Voice5_Blended
#${AGENT5_LASTNAME}          WS_Voice5_Blended
#${AGENT5_FULLNAME}          WS_Voice5_Blended
#${AGENT5_ID}                55555
#${AGENT5_PHONE_NUMBER}      6500715
#${AGENT5_VOICE_URI}         sip:${AGENT5_PHONE_NUMBER}@aoc.com  #auracc8.com
#${AGENT5_SKILLSET_VOICE1}      SKILLSET_FOR_Voice1
#${AGENT5_SKILLSET_VOICE2}      SKILLSET_FOR_Voice2
#${AGENT5_SKILLSET_EM}      EM_SKILLSET_FOR_EM
#${AGENT5_SKILLSET_WC}      WC_SKILLSET_FOR_VOICE
#${AGENT5_MAIL}              WS_Voice3_Blended@acc7dc.com
#${AGENT5_SUP}               WS_Voice1
#
#
####################################################################################
##############################    NOT READY CODE    ################################
####################################################################################
#${RRD_CODE1}    Not_Ready_Default_Reason_Code
#${RRD_CODE2}    NotRdy_Pull_Mode_Default_Code
#${RRD_CODE3}    CC1026_NRRC
#${RRD_CODE4}    ACC7_ForceNRRC_NR_161601
#${RRD_CODE5}    ACC7_ForceNRRC_NR_161602
#${RRD_CODE6}    ACC7_ForceNRRC_NR_161603
#${RRD_CODE7}    ACC7_ForceNRRC_NR_161604
#${RRD_CODE8}    ACC7_ForceNRRC_NR_161605
#${RRD_CODE9}    ACC7_ForceNRRC_NR_161606
#${RRD_CODE10}   ACC7_ForceNRRC_NR_161607
#
####################################################################################
#################################    ACW CODE    ###################################
####################################################################################
#${ACW_CODE1}    Default_ACW
#${ACW_CODE2}    ACC7_ForceNRRC_ACW_1616001
#${ACW_CODE3}    ACC7_ForceNRRC_ACW_1616002
#${ACW_CODE4}    ACC7_ForceNRRC_ACW_1616003
#
####################################################################################
###############################    ACTIVITY CODE    ################################
####################################################################################
#${ACTIVITY_CODE1}    CC1026_AC
#${ACTIVITY_CODE2}    Skillset_Default_Activity_Code
#${ACTIVITY_CODE3}    System_Default_Activity_Code
#${ACTIVITY_CODE4}    TeaNov2016_AC1
#${ACTIVITY_CODE5}    TeaNov2016_AC2
#
####################################################################################
############################    DISPOSITION CODE    ################################
####################################################################################
#${DISPOSITION_CODE1}    Completed
#${DISPOSITION_CODE2}    CRC_Completed
#${DISPOSITION_CODE3}    CRC_WebComms
#
####################################################################################
###################################    CDN    ######################################
####################################################################################
#${CDN1}     55087   #44196   #44193       #45459
#${CDN1_URI}     sip:${CDN1}@aoc.com     #sip:${CDN1}@auracc8.com
#${CDN2}     44197
#${CDN2_URI}     sip:${CDN2}@auracc8.com
#${CDN3}
#${CDN4}
#
####################################################################################
#############################    EMAIL SIGNATURE    ################################
####################################################################################
#${EMAIL_SIGNATURE}  THIS IS EMAIL SIGNATURE ROW
#${EMAIL_SIGNATURE2}  ********** TMA **********
#${EMAIL_SIGNATURE3_SPECIAL_CHARACTERS}  ~ ` ! @ # $ % ^ & * ( ) _ + { } [ ] | \ : " ; ' < > ? , . /
#
#
####################################################################################
############################    EMAIL INFORMATION    ###############################
####################################################################################
#${SUBJECT_EMAIL1}   This is Email from Agent
#${CONTENT_EMAIL1}   1234567890 1234567890 1234567890 1234567890 1234567890 qwertyuiop asdfghjkl;'xcvbnm,][poiuytdfvbnm
#${SUBJECT_MAIL1}        THIS IS MAIL FROM OANH_CUSTOMER
#${MESSAGE_EMAIL1}       One two three four five six seven eight nine ten
#${SUBJECT_MAIL2}        REQUEST CHANGE PASSWORD OF CUSTOMER
#${MESSAGE_EMAIL2}       I need to change my password to 123456789
####################################################################################
############################    EMAIL ATTACHMENTS    ###############################
####################################################################################
#${ATTACHMENT_NAME1}      1CLWujF.png
#${ATTACH_LINK_1}         C:\\Users\\Oceana\\Documents\\1CLWujF.png
#${ATTACHMENT_SAME_NAME1}      1CLWujF.png
#${ATTACH_SAME_LINK_1}         C:\\Users\\Oceana\\Pictures\\1CLWujF.png
#${ATTACHMENT_LONG_NAME2}      This is attachment with having a long name_1111111111111111112222222222222333333333334444444445555555555566666666666777777778888888888999999999999900000000001111122222222222223333333123456789123456789.png
#${ATTACH_LINK_2}         C:\\Users\\Oceana\\Documents\\This is attachment with having a long name_1111111111111111112222222222222333333333334444444445555555555566666666666777777778888888888999999999999900000000001111122222222222223333333123456789123456789.png
#${ATTACHMENT_NAME3}      CCMA_A_PM.ppt
#${ATTACH_LINK_3}         C:\\Users\\Oceana\\Documents\\CCMA_A_PM.ppt
#${ATTACHMENT_NAME4}      Consolidated_ConfigurationTool.xlsm
#${ATTACH_LINK_4}         C:\\Users\\Oceana\\Documents\\Consolidated_ConfigurationTool.xlsm
#${ATTACHMENT_NAME5}      week3_1.zip
#${ATTACH_LINK_5}         C:\\Users\\Oceana\\Documents\\week3_1.zip
#${ATTACH_LARGER_25MB}    Pics.zip
#${ATTACH_LARGER_25MB_LINK}    C:\\Users\\Oceana\\Documents\\Pics.zip
#${VALID_SPECIAL_NAME}    Valid Special Characters Name!@#$%^&().png
#${VALID_SPECIAL_NAME_LINK}     C:\\Users\\Oceana\\Documents\\Valid Special Characters Name!@#$%^&().png
#
#${INLINE_IMAGE_NO_EXTENTION}       IMAGE_NO_EXTENTION
#${INLINE_IMAGE_NO_EXTENTION_LINK}     C:\\Users\\Oceana\\Documents\\IMAGE_NO_EXTENTION
#${INLINE_IMAGE_INVALID_EXTENTION}       CCMA_A_PM.ppt
#${INLINE_IMAGE_INVALID_EXTENTION_LINK}     C:\\Users\\Oceana\\Documents\\CCMA_A_PM.ppt
#${INLINE_IMAGE_SPECIAL_FILE_TYPE}       sPECILA FILE tYPE.jpeg.PNG
#${INLINE_IMAGE_SPECIAL_FILE_TYPE_LINK}     C:\\Users\\Oceana\\Documents\\sPECILA FILE tYPE.jpeg.PNG
#${INLINE_IMAGE_SPECIAL_NAME}       Valid Special Characters Name!@#$%^&().png
#${INLINE_IMAGE_SPECIAL_NAME_LINK}     C:\\Users\\Oceana\\Documents\\Valid Special Characters Name!@#$%^&().png
#${INLINE_IMAGE_1}       abcdef.png
#${INLINE_IMAGE_LINK_1}       C:\\Users\\Oceana\\Documents\\abcdef.png
#${INLINE_IMAGE_2}       abcdef.jpg
#${INLINE_IMAGE_LINK_2}       C:\\Users\\Oceana\\Documents\\abcdef.jpg
#${INLINE_IMAGE_3}       abcdef.jpeg
#${INLINE_IMAGE_LINK_3}       C:\\Users\\Oceana\\Documents\\abcdef.jpeg
#${INLINE_IMAGE_GIF_4}       pusheen gif.gif
#${INLINE_IMAGE_GIF_LINK_4}       C:\\Users\\Oceana\\Documents\\pusheen gif.gif
####################################################################################
###############################    SUGGEST EMAIL    ################################
####################################################################################
#${SUGGEST_EMAIL_1}      This is auto-suggest oanh1
#${SUGGEST_EMAIL_CONTENT_1}      123 123 123
#${SUGGEST_EMAIL_2}      This is auto-suggest oanh2
#${SUGGEST_EMAIL_CONTENT_2}      hi hi hi hi hi
#${SUGGEST_EMAIL_3}      This is auto-suggest oanh3
#${SUGGEST_EMAIL_CONTENT_3}
####################################################################################
##################################    WEBCHAT    ###################################
####################################################################################
#
## IP =====> See [IP ADDRESS]
## Attributes =====> See [SERVICE INFO]
## Customer info =====> See [CUSTOMER INFO]
#${DEFAULT_CUSTOMER_LABEL}   CustomerLabel
#
###################    EMAIL CHAT SCRIPT CHECKBOX    ######################
#${EMAIL_CHATSCRIPT_NO}    no
#${EMAIL_CHATSCRIPT_YES}    yes
#
#############################    AUTO-PHRASE    #############################
#${AUTO_PHRASES1}    This is auto phrases 1 from Agent
#${AUTO_PHRASES2}    1234 1234 1234 1234 1234
#${AUTO_PHRASES3}    !@#$%^&*()_+{}:"?
#
#############################    PUSH-URLS    #############################
#${PUSH_URL1}    https://google.com
#${PUSH_URL2}    http://100.30.6.98/agentdesktop
#${PUSH_URL3}    https://autosrv98.automation.tma.com
#
###########################    WEB-ONHOLD MESSAGE    #######################
#${DEFAULT_WELCOME_MESSAGE}  WCCF_063_Default Welcome Message
#${ON_HOLD1}     Hi Customer, please wait a moment!
#${ON_HOLD2}     All agents are busy
#${ON_HOLD3}     ==========TMA==========
#
##########################    WEB-ONHOLD URLs    ############################
#
############################    COMFORT MESSAGE    #########################
#${COMFORT_MESSAGE1}     Sorry Customer, network connection is not stable
#${COMFORT_MESSAGE2}     Please wait a few minutes
#${COMFORT_MESSAGE3}     Agent will answer you now
#
####################################################################################
##############################    EMAIL TEMPLATES   ################################
####################################################################################
#${EMAIL_TEMPLATE1}    Ctrl - Help PyCharm
#${EMAIL_TEMPLATE2}    gif1
#${EMAIL_TEMPLATE3}    Learn English Online British Council
#${EMAIL_TEMPLATE4}    template2_pic_a71
#${EMAIL_TEMPLATE5}    Template include hyperlink
#${EMAIL_TEMPLATE6}    Learn English Online British Council - Learn English Online British Council (((^@__@^)))
#
#
####################################################################################
###############################    SCREEN-POP    ###################################
####################################################################################
#
#${SCREENPOP_NAME1}  AAAD
#${SCREENPOP_NAME1_URL}      http://autosrv98/agentdesktop
#${SCREENPOP_NAME2}  Google
#${SCREENPOP_NAME1_URL}      https://www.google.com/
#
#${MESSAGE_LESS_THAN_10000}    Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast
#${MESSAGE_EQUAL_10000}    Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast.
#${MESSAGE_MORE_THAN_10000}    Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you Doo doo, doo doo doo dooDoo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you There's a time that I remember when I never felt so lost When I felt all of the hatred was too powerful to stop (ooh, yeah) Now my heart feel like an ember and it's lighting up the dark I'll carry these torches for ya that you know I'll never drop, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got (oh) Cheers to the wish you were here, but you're not'Cause the drinks bring back all the memories Of everything we've been through (no, no) Toast to the ones here today (ayy) Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories (ayy) And the memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo Memories bring back, memories bring back you Doo doo, doo doo doo doo Doo doo doo doo, doo doo doo doo Doo doo doo doo, doo doo doo (ooh, yeah) Memories bring back, memories bring back you Yeah, yeah, yeah Yeah, yeah, yeah, yeah, yeah, doh, doh Memories bring back, memories bring back you Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast to the ones that we lost on the way 'Cause the drinks bring back all the memories And the memories bring back, memories bring back you There's a time that I remember, when I did not know no pain When I believed in forever, and everything would stay the same Now my heart feel like December when somebody say your name 'Cause I can't reach out to call you, but I know I will one day, yeah Everybody hurts sometimes Everybody hurts someday, ayy ayy But everything gon' be alright Go and raise a glass and say, ayy Here's to the ones that we got Cheers to the wish you were here, but you're not 'Cause the drinks bring back all the memories Of everything we've been through Toast to the ones here today Toast...
#
#
##=====================
##=====================
#${CCMA_URL}     https://autosrv98.automation.tma.com
#${CCMA_USER}    webadmin
#${CCMA_PASS}    webadmin
#
#
