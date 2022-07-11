*** Settings ***
Documentation    Resources_CC_19969_Workspaces_Client_support_for_Closing_Contacts.robot

Library    ../keywords/avayaIXworkplace/AvayaIXworkplaceLib.py
Library    ../keywords/outlook/outlookLib.py
Library    ../keywords/data_management/data_managementLib.py


# System data
Resource    SystemVariables.robot
Resource    TestDataVariables.robot
Resource    SystemLibraries.robot
Resource    TestDataLab78_185Variables.robot

# Keyword data
#Resource    ../keywords/one_x_communicator/OneXCommunicator.robot       # will replace soon with lib
Resource    ../keywords/workspace/login/Login.robot
Resource    ../keywords/workspace/agent_toolbar/AgentToolbar.robot
Resource    ../keywords/workspace/interaction_area/WorkCard.robot
Resource    ../keywords/workspace/navigation_menu/NavigationMenu.robot
#Resource    ../keywords/workspace/email/WidgetEmail.robot
#Resource    ../keywords/workspace/my_agent/WidgetMyAgent.robot
#Resource    ../keywords/workspace/settings/WidgetSettings.robot
#Resource    ../keywords/workspace/welcome_page/WidgetWelcomePage.robot
#Resource    ../keywords/workspace/customer_search/customer_history_search/CustomerHistorySearch.robot
#Resource    ../keywords/workspace/customer_search/CustomerSearch.robot
#Resource    ../keywords/workspace/interaction_log/InteractionLog.robot
#Resource    ../keywords/workspace/customer_details/CustomerDetails.robot
Resource    ../keywords/workspace/multimedia_contact_search/MultimediaContactSearch.robot
#Resource    ../keywords/workspace/screenpop/Screenpop.robot
#Resource    ../keywords/workspace/phonebook/Phonebook.robot
#Resource    ../keywords/workspace/web_statistic/WebStatistic.robot


Resource    ../keywords/data_management/DataManagement.robot
Resource    ../keywords/base_module/Utils.robot
Resource    ../keywords/web_chat/WebChat.robot



