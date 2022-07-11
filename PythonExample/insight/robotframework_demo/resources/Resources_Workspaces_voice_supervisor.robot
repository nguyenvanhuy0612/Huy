*** Settings ***
Documentation    Resource for Workspaces_voice_supervisor.robot
# System data
Library     Selenium2Library    implicit_wait=30s    run_on_failure=Capture Page Screenshot      screenshot_root_directory=Results
Library    ../keywords/avayaIXworkplace/AvayaIXworkplaceLib.py
Library    ../keywords/outlook/outlookLib.py

Resource    SystemVariables.robot
Resource    TestDataVariables.robot



# Keyword Test Data
Resource    ../keywords/workspace/login/Login.robot
Resource    ../keywords/workspace/agent_toolbar/AgentToolbar.robot
#Resource    ../keywords/workspace/chat/widget_chat/WidgetChat.robot
Resource    ../keywords/workspace/interaction_area/WorkCard.robot
#Resource    ../keywords/workspace/agent_state_summary/AgentStateSummary.robot
Resource    ../keywords/workspace/navigation_menu/NavigationMenu.robot
Resource    ../keywords/workspace/email/WidgetEmail.robot
Resource    ../keywords/workspace/my_agent/WidgetMyAgent.robot
Resource    ../keywords/workspace/settings/WidgetSettings.robot
Resource    ../keywords/workspace/welcome_page/WidgetWelcomePage.robot
Resource    ../keywords/workspace/customer_search/customer_history_search/CustomerHistorySearch.robot
Resource    ../keywords/workspace/customer_search/CustomerSearch.robot
Resource    ../keywords/workspace/interaction_log/InteractionLog.robot
Resource    ../keywords/workspace/customer_details/CustomerDetails.robot
Resource    ../keywords/workspace/screenpop/Screenpop.robot
Resource    ../keywords/workspace/phonebook/Phonebook.robot
Resource    ../keywords/workspace/web_statistic/WebStatistic.robot
Resource    ../keywords/base_module/Utils.robot
#Resource    ../keywords/avaya_communicator/AvayaCommunicator.robot
Resource    ../keywords/one_x_communicator/OneXCommunicator.robot
Resource    ../keywords/avaya_ix/AvayaIX.robot
Resource    ../keywords/outlook/Outlook.robot
Resource    ../keywords/web_chat/WebChat.robot