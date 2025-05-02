def LI_NOME_SOLICITANTE(texto):
    return f"//li[contains(text(), '{texto}')]"

H1_RELATORIOS_DISPONIVEIS="//h1[contains(text(), 'Relatórios Disponíveis')]"
BUTTON_PESQUISAR="//button[@aria-label='Mostrar/Ocultar barra de pesquisa')]"
INPUT_PESQUISA="//input[@id='mui-68']"
BUTTON_LIMPAR_PESQUISA="//button[@aria-label='Limpar pesquisa']"
BUTTON_FILTRO="//button[@aria-label='Mostrar/Ocultar filtro']"
DIV_FILTRO_SOLICITANTE="//div[@id='mui-78']"
DIV_FILTRO_TIPO_RELATORIO="//div[@id='mui-80']"
TABLE="//table"
BUTTON_CSV='//button[@aria-label="CSV"]'
BUTTON_JSON='//button[@aria-label="JSON"]'