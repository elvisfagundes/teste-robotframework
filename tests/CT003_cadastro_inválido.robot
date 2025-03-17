*** Settings ***

Documentation        Realizar o logout com sucesso

Resource          ../resources/Base.resource

Test Setup         Página principal 



*** Test Cases ***
Cenário 3 - Tentativa de cadastro com campos obrigatórios vazios

    Dado que o usuário acessa a página de cadastro
    Quando ele tenta finalizar o cadastro sem preencher todos os campos obrigatórios
    Então o sistema deve exibir mensagens de erro para cada campo faltante