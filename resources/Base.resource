*** Settings ***

Documentation        Arquivo principal do projeto Robot

Library      Browser
Library      libs/Account.py


Variables    Env.py  

Resource    pages/Home.resource
Resource    pages/Login.resource
Resource    pages/Cadastro.resource
Resource    pages/MinhaConta.resource


*** Keywords ***

Página principal
    
    TRY
        New Browser    browser=${BROWSER}    headless=${HEADLESS}
        New Page       ${BASE_URL}
    EXCEPT
        Fail    "Não foi possível acessar a página inicial. Por favor, entre em contato com o suporte"
        Browser.Take Screenshot
    END