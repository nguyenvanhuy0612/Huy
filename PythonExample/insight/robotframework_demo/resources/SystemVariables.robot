*** Settings ***
Documentation    This is system variable data for test, WS sanity resource clone
#This is a clone of variables in WS sanity
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

${BROWSER_EDGE}             edge
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
#${WORKSPACE_URL}     https://workspace108.aoc.com:31390/Login/?returnpage=../services/UnifiedAgentController/workspaces/
${WORKSPACE_URL}    https://100.30.7.108:31380/Login/?returnpage=../services/UnifiedAgentController/workspaces/
#${WORKSPACE_URL}    https://workspace108.aaccaccs.tma.com:31390/Login/?returnpage=../services/UnifiedAgentController/workspaces/
#${WORKSPACE_URL}    https://workspace108.aoc.com:31390/Login/?returnpage=../services/UnifiedAgentController/workspaces/
#${WEB_CHAT_URL}     http://100.30.7.241:8080/ewcsite/   #http://10.30.1.210:81/EWC_newSDK_AACC185_hostname/      #http://100.30.7.241:8080/ewcsite/       #http://10.30.1.210:81/EWC_newSDK_AACC185_hostname/    #http://localhost:8080/ewcsite/
#${WEB_CHAT_URL}     http://100.30.7.241:8080/ewcsite/
#${WEB_CHAT_URL}     http://10.30.3.211/EWC_newSDK_7185/
${WEB_CHAT_URL}     http://100.30.6.88/EWC_78185_ip/
${web chat trust Link https}     https://100.30.7.185:8445/CustomerControllerWeb/

${HELP_URL}         http://100.30.6.137:31380/services/UnifiedAgentController/workspaces/assets/help/aacc/en-us/index.html
${SERVER_H323}      100.30.6.150
${CM_IP}            100.30.5.32
${SM_IP}            100.30.5.51,5061,aoc.com
${SM_PORT_TLS}      5061
${SERVER_SM}        100.30.6.226
${PORT}     5060
${DOMAIN}   aaccacccs   #aoc     #automation     #auracc8.com
###################################################################################
###############################    SYSTEM VARIABLE    #############################
###################################################################################
${WAIT_TIME_SHORT}    3
${WAIT_TIME_MEDIUM}   10
${WAIT_TIME_LONG}     30
${ACW_TIME}           30
${RONA_TIME}          30

${CONTACT_ROUTING_TIMEOUT}    60            #180
${TIMEOUT_EXTRA_SHORT}    2
${TIMEOUT_SHORT}    5
${TIMEOUT_MEDIUM}   30
${TIMEOUT_LONG}     60
${TIMEOUT_EXTRA_LONG}     90


########################    WEB-ONHOLD URLs    ############################
${ON_HOLD_URL_EXTEND_TIME}    4                #### as an issue of web-chat

