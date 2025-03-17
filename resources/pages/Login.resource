*** Settings ***

Documentation        Ações e elementos da página de login

Library        Browser

*** Keywords *** 

Realizar login
    [Arguments]    ${account}

    TRY
        Wait For Elements State    //a[@href="/login"]//i            attached    timeout=4
        Click                      //a[@href="/login"]//i
        Wait For Elements State    //h3[text()="Login"]              visible    timeout=4
        Fill Text                  //input[@id='user']               ${account}[email]    
        Fill Text                  //input[@id='password']           ${account}[password]  
        Wait For Elements State    //button[@id='btnLogin']          visible     timeout=4
        Click                      //button[@id='btnLogin']
        Wait For Elements State    //h2[text()='Login realizado']    visible     timeout=2
        Wait For Elements State    //button[text()='OK']             visible     timeout=2
        Click                      //button[text()='OK']
    EXCEPT
        Fail    "Não foi possível realizar o login. Por favor, entre em contato com o suporte"
        Take Screenshot  
    END

Então o sistema deve redireciona-lo para a tela de login
   TRY
       Wait For Elements State    //h3[text()="Login"]           visible    timeout=4
    EXCEPT
       Fail    "Não foi possível redirecionar pra a tela de login. Por favor, entre em contato com o suporte"
       Take Screenshot 
    END
