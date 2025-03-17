*** Settings ***

Documentation        Ações e elementos da página de cadastro 

Library        Browser

*** Variables ***
${CAMPO_NOME}        id=user
${CAMPO_EMAIL}       id=email
${CAMPO_SENHA}       id=password
${BOTAO_CADASTRAR}   id=btnRegister

@{CAMPOS}            nome    e-mail    senha
@{IDS_CAMPOS}        ${CAMPO_NOME}    ${CAMPO_EMAIL}    ${CAMPO_SENHA}
@{MENSAGENS}         O campo nome deve ser prenchido    O campo e-mail deve ser prenchido corretamente    O campo senha deve ter pelo menos 6 dígitos

${VALOR_NOME}        João Teste
${VALOR_EMAIL}       teste123@example.com
${VALOR_SENHA}       SenhaForte123


*** Keywords *** 

Quando ele preenche os campos obrigatórios com dados válidos e confirma o cadastro
    [Arguments]        ${account}   
    
    TRY
        Wait For Elements State                  //input[@id='user']                             visible
        Fill Text                                //input[@id='user']                             ${account}[name]
        Fill Text                                //input[@id='email']                            ${account}[email]    
        Fill Text                                //input[@id='password']                         ${account}[password] 
        Wait For Elements State                  //button[@id='btnRegister']             
        Click                                    //button[@id='btnRegister']  
    EXCEPT
        Fail    "Não foi possível prosseguir com o cadastro. Por favor, entre em contato com o suporte"
        Take Screenshot  
    END

Quando ele tenta finalizar o cadastro sem preencher todos os campos obrigatórios
        TRY
        Wait For Elements State                  //input[@id='user']                              visible
        Wait For Elements State                  //button[@id='btnRegister']             
        Click                                    //button[@id='btnRegister']  
        Wait For Elements State                  //*[text()="O campo nome deve ser prenchido"]    visible    timeout=3 
    EXCEPT
        Fail    "Não foi possível prosseguir com o cadastro. Por favor, entre em contato com o suporte"
        Take Screenshot  
    END

Então o sistema deve exibir mensagens de erro para cada campo faltante
    TRY
        FOR  ${i}  IN RANGE  3
            ${mensagem_esperada} =  Set Variable   ${MENSAGENS}[${i}] 
            ${campo} =  Set Variable  ${CAMPOS}[${i}]
            ${id_campo} =  Set Variable  ${IDS_CAMPOS}[${i}]

            Wait For Elements State     ${id_campo}      visible    timeout=3

            Fill Text  ${CAMPO_NOME}   ${VALOR_NOME}  
            Fill Text  ${CAMPO_EMAIL}  ${VALOR_EMAIL}
            Fill Text  ${CAMPO_SENHA}  ${VALOR_SENHA}

            Clear Text  ${id_campo}

            Click  ${BOTAO_CADASTRAR}

            Wait For Elements State         //*[contains(text(), '${campo}')]                  visible    timeout=3
            Get Text                //*[contains(text(), '${campo}')]                  equal      ${mensagem_esperada}
        END
    EXCEPT
        Fail    "Não foi possível validar mensagens de erro. Por favor, entre em contato com o suporte"
        Take Screenshot  
    END