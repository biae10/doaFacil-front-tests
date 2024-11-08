*** Settings ***
Library  SeleniumLibrary
Library  FakerLibrary  locale=pt_BR
Library  String

#Pages
Resource  general_keywords.robot
Resource  pages/login_page.robot
Resource  pages/home_page.robot
Resource  pages/advertising_page.robot

*** Variables ***
#Datas
${DONATOR_EMAIL}       biae10@live.com
${DONATOR_PASSWORD}    123456
${APPLICANT_EMAIL}     xbiancacampos10@gmail.com
${APPLICANT_PASSWORD}  brasil26