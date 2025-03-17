*** Settings ***

Documentation        Criar uma nova Conta com sucesso

Resource          ../resources/Base.resource

Test Setup        Página principal    

*** Test Cases ***

Cenário 1: Cadastro bem-sucedido
    ${account}    Get Fake Account
    
    Dado que o usuário acessa a página de cadastro 
    Quando ele preenche os campos obrigatórios com dados válidos e confirma o cadastro    ${account}
    Então o sistema deve criar a conta e redirecioná-lo para a página My account.
