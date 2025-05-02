import datetime

def LI_TIPO_RELATORIO(texto):
    return f"//li[contains(text(), '{texto}')]"
def INPUT_TIPO_EXTRATO(valor):
    return f"//input[@name='tipoExtrato' and @value='{valor}']"
def LI_MES(mes):
    return f"//li[contains(text(), '{mes}')]"
def VERIFICAR_DATA_FINAL(ano, data):
    data = data.split("/")
    if data[2] == ano:
        return True
def GET_CUSTOM_DATE():
    data = datetime.datetime.now()
    data = data.strftime("%d/%m/%Y %H:%M:%S")
    return data

H1_SOLICITAR_RELATORIO="//h1[contains(text(), 'Solicitar Relatório')]"
DIV_TIPO_RELATORIO="//div[@id='tipoRelatorio']"
DIV_MES="//div[@id='mesRelatorio']"
INPUT_DATA_INICIAL="//input[@id='inputDataInicio']"
INPUT_DATA_FINAL="//input[@id='inputDataFinal']"
BUTTON_SOLICITAR="//button[@type='submit' and contains(text(), 'Solicitar')]"
DIV_MENSAGEM="//div[@id='notistack-snackbar' and contains(text(), 'Solicitação cadastrada com sucesso.')]"
