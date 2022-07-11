*** Settings ***
#Library     Selenium2Library
Resource  ../../resources/SystemResources.robot
Library    ../../keywords/outlook/outlookLib.py    


*** Variables ***
${mail_box}     nvhuy@acc.com
${subject}      test1
${message_mail}     test mes
${attach_file}      file111.txt
${customer_email}   nvhuy1@acc.com


*** Test Case ***
Outlook lib test 1
    customer_sent_an_email    ${mail_box}    ${subject}     ${message_mail}    ${attach_file}   ${customer_email}


# Test hub
    # Log to console    log1
    # Open Browser	http://google.com	chrome	remote_url=http://10.30.1.154:4444/wd/hub

