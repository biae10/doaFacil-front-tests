*** Settings ***
Resource  ../main.robot
Test Teardown  Close Browser

*** Test Cases ***
TC08 - Logar
  [Tags]  TC08  Usuário
  Acessar o site do DoaFacil
  Clicar no ícone de login
  Preencher os campos de e-mail e senha com os dados ${DONATOR_EMAIL} e ${DONATOR_PASSWORD}
  Clicar no botão “Entrar”
  O login é realizado com sucesso

TC14 - Criar novo usuário
  [Tags]  TC14  Usuário
  Acessar o site do DoaFacil
  Clicar no ícone de login
  Clicar na opção “Criar nova conta”
  Preencher os campos com dados válidos
  Clicar no botão “Criar conta”
  A conta é criada com sucesso
  Fechar navegador
  Realizar Login Completo  ${email}  123456