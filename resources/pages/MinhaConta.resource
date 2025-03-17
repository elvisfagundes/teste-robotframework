*** Settings ***

Documentation        Ações e elementos da página de minha conta


Resource       ../Base.resource

*** Keywords *** 

Então o sistema deve criar a conta e redirecioná-lo para a página My account.

    TRY
        Get Url    equal   ${MYACCOUNT_URL}
        Wait For Elements State    //*[@id='swal2-title']    visible    timeout=2
    EXCEPT
        Fail    "O cadastro não foi concluído. Por favor, entre em contato com o suporte"
        Take Screenshot 
    END

Dado que o usuário está logado na loja
    
    TRY        
        Wait For Elements State    //*[text()='Dashboard']           visible     timeout=2
    EXCEPT
        Fail    "Não foi possível realizar o login. Por favor, entre em contato com o suporte" 
        Take Screenshot
    END

Quando ele clica no Logout
    TRY
        Wait For Elements State    //*[@id='userLogged']             attached    timeout=2
        Click                      //*[@id='userLogged']             
        Wait For Elements State    //*[text()=' Logout']             attached    timeout=2
        Click                      //*[text()=' Logout']             
        Wait For Elements State    //*[text()='Logout realizado']    visible     timeout=2
        Click                      //button[text()='OK']    
    EXCEPT
        Fail    "Não foi possível realizar o logout. Por favor, entre em contato com o suporte" 
        Take Screenshot  
    END
    