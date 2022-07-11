*** Variables ***
&{dict}     &{EMPTY}

*** Test Cases ***
Var
    Set Local Variable    &{dict}       huy=huy1    name=123
    log to console    ${dict.huy}:${dict.name}

One space
    Should Be Equal    ${SPACE}          \ \

Four spaces
    Should Be Equal    ${SPACE * 4}      \ \ \ \ \

Ten spaces
    Should Be Equal    ${SPACE * 10}     \ \ \ \ \ \ \ \ \ \ \

Quoted space
    Should Be Equal    "${SPACE}"        " "

Quoted spaces
    Should Be Equal    "${SPACE * 2}"    " \ "

Empty
    Should Be Equal    ${EMPTY}          \