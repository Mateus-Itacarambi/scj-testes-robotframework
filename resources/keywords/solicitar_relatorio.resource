*** Settings ***
Library              ../variables/page_solicitar_relatorio.py
Resource             ../common.resource
Variables            ../variables/page_solicitar_relatorio.py
Variables            ../variables/page_relatorios_disponiveis.py

*** Keywords ***
Tela de Solicitar Relatório está aberta
    SCJ interno está aberto
    Menu Solicitar Relatório foi clicado

Menu Solicitar Relatório foi clicado
    Click    ${A_SOLICITAR_RELATORIO}
    
Tela de Relatórios Disponéveis está aberta
    SCJ interno está aberto
    Menu Relatórios Disponéveis foi clicado
    
Tela de Relatórios Disponéveis está aberta - Processando
    ${ELEMENT}=    Selecionar linha Status
    Set Global Variable    $LINHA_STATUS    ${ELEMENT}
    
Menu Relatórios Disponéveis foi clicado
    Click    ${A_RELATORIOS_DISPONIVEIS}

Selecionar Tipo de Relatório
    [Arguments]    ${TEXTO}=
    Click    ${DIV_TIPO_RELATORIO}
    IF    "${TEXTO}" != "${EMPTY}"
        ${ELEMENT}=    LI TIPO RELATORIO    ${TEXTO}
        Click    ${ELEMENT}
    END

Selecionar Período
    [Arguments]    ${VALOR}=
    IF    "${VALOR}" != "${EMPTY}"
        ${ELEMENT}=    INPUT TIPO EXTRATO    ${VALOR}
        Click    ${ELEMENT}
    END

Selecionar Mês
    [Arguments]    ${VALOR}=
    Click    ${DIV_MES}
    IF    "${VALOR}" != "${EMPTY}"
        ${ELEMENT}=    LI MES    ${VALOR}
        Click    ${ELEMENT}
    END

Preencher Data inicial
    [Arguments]    ${DATA}=
    Type Text    ${INPUT_DATA_INICIAL}    ${DATA}

Preencher Data Final
    [Arguments]    ${DATA}=
    ${DATE}=    Get Current Date
    ${ANO}=    Convert Date    ${DATE}    result_format=%Y
    ${RESULT}=    VERIFICAR DATA FINAL    ${ANO}    ${DATA}
    IF    $RESULT == True
        ${TEXTO}=    Remove String    ${DATA}    ${ANO}
        Type Text    ${INPUT_DATA_FINAL}    ${TEXTO}
    ELSE
        Type Text    ${INPUT_DATA_FINAL}    ${DATA}
    END

Clicar em Solicitar
    Click    ${BUTTON_SOLICITAR}

Clicar em Confirmar
    Click    ${BUTTON_CONFIRMAR}
    ${CUSTOM_DATA}=    GET CUSTOM DATE
    Set Global Variable    $DATA    ${CUSTOM_DATA}

Deve aparecer a mensagem "Solicitação cadastrada com sucesso."
    Wait For Elements State    ${DIV_MENSAGEM}    visible
    Tela de Relatórios Disponéveis está aberta - Processando

Selecionar linha Data Solicitação
    ${ELEMENT}=    Get Table Cell Element    ${TABLE}    "Data Solicitação"    "${DATA}"
    ${ELEMENT}=    Replace String    ${ELEMENT}    > * >> nth=0    ${EMPTY}	
    RETURN    ${ELEMENT}

Selecionar linha Status
    ${RESULT}=    Run Keyword And Ignore Error    Get Table Cell Element    ${TABLE}    "Status"    "Processando"
    Run Keyword If    '${RESULT}[0]' == 'PASS'    Return From Keyword    ${RESULT}[1]
    RETURN    ${RESULT}

Verificar Status
    IF    '${LINHA_STATUS}' != 'None'
        ${STATUS}=    Get Text    ${LINHA_STATUS}
        WHILE    $STATUS == 'Processando'
            Reload
            Menu Relatórios Disponéveis foi clicado
            ${STATUS}=    Get Text    ${LINHA_STATUS}
        END
    END

Clicar no ícone de Download CSV
    ${LINHA}=    Selecionar linha Data Solicitação
    Click    ${LINHA}${BUTTON_CSV}

Clicar no ícone de Download JSON
    ${LINHA}=    Selecionar linha Data Solicitação
    Click    ${LINHA}${BUTTON_JSON}
