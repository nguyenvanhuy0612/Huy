*** Keywords ***
kw1
    [Arguments]    ${k1}   ${k2}
    Log To Console    ${\n}${k1}
    Log To Console    ${k2}
    [Return]    ${True}

kw2
    Log To Console    This is example
*** Test Cases ***
Test 5.1
    ${result}=  kw1    1    2
    Log To Console    ${result}
    Run Keyword If    ${result}     kw2