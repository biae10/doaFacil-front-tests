*** Settings ***
Resource  ../main.robot

*** Variables ***
&{home_page}
...  button_go_to_login=//a[@href="/login"]
...  button_donate=buttonDonate
...  first_card_advertising=//div[@class="AdvertisingCard_AdCard__Odp3T card text-center me-4 mt-3"][1]
...  first_card_advertising_button=//div[@class="AdvertisingCard_AdCard__Odp3T card text-center me-4 mt-3"][1]/div/button
...  card_all_ads=//div[@class="d-flex justify-content-center align-items-center mt-2"]
*** Keywords ***
Clicar no botão “Doar” 
  Wait Until Element Is Visible  ${home_page.button_donate}
  Click Element  ${home_page.button_donate}

Selecionar um anúncio qualquer e clicar no botão “Quero”
  Wait Until Element Is Visible  ${home_page.first_card_advertising}  30s
  Scroll Element Into View       ${home_page.first_card_advertising_button}    
  Click Element  ${home_page.first_card_advertising_button}  

Todos os anúncios são exibidos com sucesso
  Wait Until Element Is Visible  ${home_page.card_all_ads}  30s