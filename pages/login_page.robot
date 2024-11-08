*** Settings ***
Resource  ../main.robot

*** Variables ***
&{login_page}
...  input_email=email
...  input_password=senha
...  input_cpf=cpf
...  input_nome=nome
...  button_login=login
...  button_new_account=//button[@class="NewUser_signInButton__KceC- btn btn-primary"]
...  banner_profile=//a[@href="/my-profile"]
...  link_create_new_account=//a[@href="/#"]

*** Keywords ***
Acessar o site do DoaFacil
  Set Selenium Speed  0.5
  Abrir navegador e acessar site
  Maximize Browser Window

Clicar no ícone de login
  Wait Until Element Is Visible  ${home_page.button_go_to_login}
  Click Element  ${home_page.button_go_to_login} 

Preencher os campos de e-mail e senha com os dados ${email} e ${senha}
  Wait Until Element Is Visible  ${login_page.input_email}
  Input Text  ${login_page.input_email}     ${email}
  Input Text  ${login_page.input_password}  ${senha}

Clicar no botão “Entrar”
  Click Element   ${login_page.button_login}

O login é realizado com sucesso
  Wait Until Element Is Visible  ${login_page.banner_profile}  30s  
  
Realizar Login Completo
  [Arguments]  ${email}  ${senha}
  Acessar o site do DoaFacil
  Clicar no ícone de login
  Preencher os campos de e-mail e senha com os dados ${email} e ${senha}
  Clicar no botão “Entrar”
  O login é realizado com sucesso

Fechar navegador
  Close Browser

Clicar na opção “Criar nova conta”
  Wait Until Element Is Visible  ${login_page.link_create_new_account}  
  Click Element  ${login_page.link_create_new_account}  

Preencher os campos com dados válidos
  Wait Until Element Is Visible  ${login_page.input_cpf} 

  ${cpf}                  FakerLibrary.cpf
  ${cpf}  Remove String  ${cpf}  .  - 
  ${nome}   FakerLibrary.Name
  ${email}  FakerLibrary.email

  Set Global Variable  ${email}

  Input Text  ${login_page.input_cpf}       ${cpf}
  Input Text  ${login_page.input_nome}      ${nome}
  Input Text  ${login_page.input_email}     ${email}
  Input Text  ${login_page.input_password}  123456

Clicar no botão “Criar conta”
  Click Element  ${login_page.button_new_account}

A conta é criada com sucesso
  Wait Until Page Contains  Usuário criado com sucesso!

