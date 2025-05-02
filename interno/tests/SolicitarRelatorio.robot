*** Settings ***
Documentation       Essa suite testa o menu Solicitar Relatório e Relatórios Disponíveis do SCJ.

Resource            ../../resources/keywords/solicitar_relatorio.resource

Suite Setup         New Browser    browser=${BROWSER}    headless=${HEADLESS}  
Suite Teardown      Close Browser
Test Setup          New Context    viewport={'width': 1600, 'height': 900}
Test Teardown       Close Context

*** Test Cases ***
Solicitar Relatório Mensal
    Given Tela de Solicitar Relatório está aberta
    When Selecionar Tipo de Relatório    Saldo de Contas Judiciais
    And Selecionar Período    MENSAL
    And Selecionar Mês    Janeiro/2025
    And Clicar em Solicitar
    And Clicar em Confirmar
    Then Deve aparecer a mensagem "Solicitação cadastrada com sucesso."

Realizar o download do Relatório Mensal .CSV
    Given Tela de Relatórios Disponéveis está aberta 
    When Verificar Status
    And Clicar no ícone de Download CSV
    Then Verificar se o Arquivo foi baixado

Realizar o download do Relatório Mensal .JSON
    Given Tela de Relatórios Disponéveis está aberta 
    When Verificar Status
    And Clicar no ícone de Download JSON
    Then Verificar se o Arquivo foi baixado

Solicitar Relatório Personalizado
    Given Tela de Solicitar Relatório está aberta
    When Selecionar Tipo de Relatório    Saldo de Contas Judiciais
    And Selecionar Período    PERIODO
    And Preencher Data inicial    01/01/2025
    And Preencher Data Final    31/01/2025
    And Clicar em Solicitar
    And Clicar em Confirmar
    Then Deve aparecer a mensagem "Solicitação cadastrada com sucesso."

Realizar o download do Relatório Personalizado .CSV
    Given Tela de Relatórios Disponéveis está aberta 
    When Verificar Status
    And Clicar no ícone de Download CSV
    Then Verificar se o Arquivo foi baixado

Realizar o download do Relatório Personalizado .JSON
    Given Tela de Relatórios Disponéveis está aberta 
    When Verificar Status
    And Clicar no ícone de Download JSON
    Then Verificar se o Arquivo foi baixado