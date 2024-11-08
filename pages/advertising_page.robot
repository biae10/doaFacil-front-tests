*** Settings ***
Resource  ../main.robot

*** Variables ***
&{advertising_page}
...  input_title=titulo
...  textarea_description=descricao
...  select_category=categoria
...  input_phone=telefone
...  checkbox_whatsapp=whatsapp
...  select_status=status
...  input_city=cidade
...  input_neighboor=bairro
...  input_state=estado
...  input_zipCode=cep
...  input_file=btnAdd
...  button_add_file=inputGroupFileAddon03
...  button_save=buttonSave
...  h2_ad_title=advertisingTitle
...  textArea_request_message=requestMessage
...  button_send_request=sendRequest
...  button_request_details=(//button[@class="simpleList_buttonRequest__xuM95 btn btn-primary"])[1]
...  button_approve_request=buttonApproveRequest
*** Keywords ***
Preencher os campos obrigatórios com dados válidos

  ${title}  FakerLibrary.Word    
  Set Test Variable  ${title}  
  ${description}  FakerLibrary.Words
  ${city}   FakerLibrary.City
  ${neighborhood}  FakerLibrary.Word
  ${state}         FakerLibrary.State
  ${zipCode}       FakerLibrary.Zipcode

  Wait Until Element Is Visible  ${advertising_page.input_title}
  Input Text  ${advertising_page.input_title}  ${title}
  Input Text  ${advertising_page.textarea_description}  ${description}
  Select From List By Label  ${advertising_page.select_category}  Alimentos
  Input Text  ${advertising_page.input_phone}  71999998999
  Click Element  ${advertising_page.checkbox_whatsapp}  
  Select From List By Label  ${advertising_page.select_status}  USADO
  Input Text     ${advertising_page.input_city}  ${city}
  Input Text     ${advertising_page.input_neighboor}  ${neighborhood}
  Input Text     ${advertising_page.input_state}    ${state}
  Input Text     ${advertising_page.input_zipCode}  ${zipCode}
  Choose File    ${advertising_page.input_file}  ${CURDIR}${/}files${/}picture.webp 
  Click Element  ${advertising_page.button_add_file}

Clicar no botão “Salvar”
  Scroll Element Into View  ${advertising_page.button_save}
  Wait Until Element Is Visible  ${advertising_page.button_save}  10s  
  Click Element  ${advertising_page.button_save}  
 
O anúncio é criado com sucesso
  Wait Until Element Is Visible  ${advertising_page.h2_ad_title}  
  Sleep  5s

O anúncio é exibido com sucesso
  O anúncio é criado com sucesso

Gerar um novo anúncio
  Clicar no botão “Doar”
  Preencher os campos obrigatórios com dados válidos
  Clicar no botão “Salvar”
  O anúncio é criado com sucesso

Preencher o campo mensagem e clicar em “Enviar”
  Wait Until Element Is Visible  ${advertising_page.textArea_request_message}
  Input Text  ${advertising_page.textArea_request_message}  QUERO
  Click Element  ${advertising_page.button_send_request}

A solicitação é feita com sucesso
  Wait Until Page Contains  Tudo certo! A sua solicitação foi enviada e avisaremos quando o doador aceitar.
   
Gerar um anúncio com uma solicitação
  Realizar Login Completo  ${DONATOR_EMAIL}  ${DONATOR_PASSWORD}
  Gerar um novo anúncio
  Fechar navegador
  Realizar Login Completo  ${APPLICANT_EMAIL}  ${APPLICANT_PASSWORD}
  Selecionar um anúncio qualquer e clicar no botão “Quero”
  Preencher o campo mensagem e clicar em “Enviar”
  A solicitação é feita com sucesso

Aprovar primeira solicitação da lista
  Wait Until Element Is Visible  ${advertising_page.button_request_details}  30s
  Click Element  ${advertising_page.button_request_details} 
  Wait Until Element Is Visible  ${advertising_page.button_approve_request}  10s   
  Click Element  ${advertising_page.button_approve_request}  

A solicitação é aprovada com sucesso
  Wait Until Page Contains  Não há solicitações pendentes por enquanto.  10s  