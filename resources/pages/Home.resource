*** Settings ***

Documentation        Ações e elementos da página inicial

Library        Browser

*** Keywords *** 

Dado que o usuário acessa a página de cadastro 

    TRY
        Wait For Elements State    //*[text()=" Cadastro"]    visible    timeout=4
        Click                      //*[text()=" Cadastro"]
        Wait For Elements State    //*[contains(text(), "Cadastro de usuário")]    visible
    EXCEPT
        Fail    "Não foi possível acessar a página de cadastro. Por favor, entre em contato com o suporte"
        Take Screenshot  
    END