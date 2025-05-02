# Testes do SCJ com RobotFramework

Projeto de testes do SCJ utilizando [RobotFramework](https://robotframework.org/).

## Procedimento para instalação
1. Pré-requisito
  *  Python 3 (caso necessário, isole o ambiente do projeto com [venv](https://docs.python.org/pt-br/3/library/venv.html))
  * Node.js 18

2. Instale as dependências

    `pip install -r requirements.txt`

3. Verifique a instalação

    `robot --version`

4. Este projeto utiliza a biblioteca Browser Library. Caso seja o primeiro uso, [verifique o passo 4 nas instruções de instalação](https://github.com/MarketSquare/robotframework-browser?tab=readme-ov-file#installation-instructions)

## Configuração da IDE

Recomenda-se utilizar o VS Code e instalar a extensão **Robot Framework Language Server**

## Executando o projeto

Antes de executar os testes é necessário configurar as credencias de acesso ao SDJ. Crie o arquivo `credentials.py` na pasta `resources` definindo estas variáveis. Substitua os valores pelas suas credenciais.
```python
USERNAME='u*******'
PASSWORD='*******'
```
>OBS: O arquivo `resources/credentials.py` não deve ser commitado. Ele já está adicionado ao `.gitignore`

## Troubleshooting
### Os comando 2 ou 4 da instalação falham com mensagem de proxy/timeout
Há duas opções para resolver esse problema.

1. Configurar o arquivo `pip.ini` na pasta `C:\Users\u******\AppData\Roaming\pip` para que o pip utilize o nexus.
```ini
[global]
index=https://nexus.brb.com.br/repository/pypi-group/pypi
index-url=https://nexus.brb.com.br/repository/pypi-group/simple
trusted-host=nexus.brb.com.br
```

2. Configurar o proxy no terminal antes de executar os comandos. A configurações abaixo utilizam Powershell.
```powershell
$Env:HTTP_PROXY = "http://hwi340244.brb.com.br:1234"
$Env:HTTPS_PROXY = "http://hwi340244.brb.com.br:1234"
```
Após o sucesso na execução dos comandos deve-se remover as cofigurações de proxy.
```powershell
$Env:HTTP_PROXY = ""
$Env:HTTPS_PROXY = ""
```
