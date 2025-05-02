*** Settings ***
Variables            ../resources//variables/commons.py
Variables            ../resources/variables/page_login.py
Variables            ../resources/variables/page_inicial.py

*** Settings ***
Library     Browser
Library     String
Library     DateTime
Library     OperatingSystem

*** Keywords ***
SCJ interno está aberto
    New Page    ${URL_FRONTEND_INTERNO}
    Login
    Tela inicial está visivel

Login
    fill Text    ${INPUT_EMAIL}    ${USERNAME}
    Sleep    300ms
    Fill Secret    ${INPUT_SENHA}    $PASSWORD
    Click    ${BUTTON_CONECTAR}

Tela inicial está visivel
    Wait For Elements State    ${NAV_INICIAL}    visible

Verificar se o Arquivo foi baixado
    ${dl_promise}    Promise To Wait For Download
    ${file_obj}=    Wait For    ${dl_promise}
    File Should Exist    ${file_obj}[saveAs]