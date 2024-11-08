*** Settings ***
Resource  ../main.robot
Test Teardown  Close Browser

*** Test Cases ***
TC11 - Solicitar um item
  [Tags]  TC11  Solicitacoes
  Realizar Login Completo  ${DONATOR_EMAIL}  ${DONATOR_PASSWORD}
  Gerar um novo anúncio
  Fechar navegador
  Realizar Login Completo  ${APPLICANT_EMAIL}  ${APPLICANT_PASSWORD}
  Selecionar um anúncio qualquer e clicar no botão “Quero”
  Preencher o campo mensagem e clicar em “Enviar”
  A solicitação é feita com sucesso

TC12 - Aprovar solicitação de um anúncio
  [Tags]  TC11  Solicitacoes
  Gerar um anúncio com uma solicitação
  Fechar navegador
  Realizar Login Completo  ${DONATOR_EMAIL}  ${DONATOR_PASSWORD}
  Selecionar um anúncio qualquer e clicar no botão “Quero”
  Aprovar primeira solicitação da lista
  A solicitação é aprovada com sucesso