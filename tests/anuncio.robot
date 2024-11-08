*** Settings ***
Resource  ../main.robot
Test Teardown  Close Browser

*** Test Cases ***
TC09 - Cadastrar um novo anúncio
  [Tags]  TC09  Anuncios
  Realizar Login Completo  ${DONATOR_EMAIL}  ${DONATOR_PASSWORD}
  Clicar no botão “Doar”
  Preencher os campos obrigatórios com dados válidos
  Clicar no botão “Salvar”
  O anúncio é criado com sucesso

TC10 - Visualizar anúncio específico
  [Tags]  TC10  Anuncios
  Acessar o site do DoaFacil
  Selecionar um anúncio qualquer e clicar no botão “Quero”
  O anúncio é exibido com sucesso

TC13 - Visualizar todos os anúncios+
  [Tags]  TC13  Anuncios
  Acessar o site do DoaFacil
  Todos os anúncios são exibidos com sucesso