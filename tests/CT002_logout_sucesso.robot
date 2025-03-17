*** Settings ***

Documentation        Realizar o logout com sucesso

Resource          ../resources/Base.resource


Test Setup         Página principal    


*** Test Cases ***

Cenário 2 - Logout da conta na loja
    ${account}    Get Fake Account

    Realizar login    ${account}   
    
    Dado que o usuário está logado na loja
    Quando ele clica no Logout
    Então o sistema deve redireciona-lo para a tela de login