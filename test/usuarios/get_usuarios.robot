*** Settings ***
Resource    ../base.robot
Force Tags    @regression


*** Test Cases ***

Listando todos os usuarios com sucesso
    ${response}    GET    ${baseURL}/usuarios    expected_status=200
    Set Test Variable    ${qtd}    ${response.json()['quantidade']}
    Should Be Equal As Strings    ${response.json()['quantidade']}    ${qtd}

Listando todos os usuarios com sucesso 2
    ${response}    GET    ${baseURL}/usuarios    expected_status=200
    Set Test Variable    ${qtd}    ${response.json()['quantidade']}
    Should Not Be Equal As Strings    ${response.json()['quantidade']}    10

Listando todos os usuarios com ID valido
    [Tags]    @test
    ${response}    GET    ${baseURL}/usuarios/9RTBq2Vg0p3tQzr5    expected_status=200
    Should Be Equal As Strings    ${response.json()['nome']}    Nathan Anderson DVM

Listando todos os usuarios com ID invalido
    [Tags]    @test
    ${response}    GET    ${baseURL}/usuarios/noID    expected_status=400
    Should Be Equal As Strings    ${response.json()['message']}    Usuário não encontrado

Listando todos os usuarios por ID via Query com sucesso
    [Tags]    @test
    ${response}    GET    ${baseURL}/usuarios    expected_status=200    
    ...    params=_id=9RTBq2Vg0p3tQzr5
    Should Be Equal As Strings    ${response.json()['usuarios'][0]['nome']}    Nathan Anderson DVM

Listando todos os usuarios por ID e nome via Query sem sucesso
    [Tags]    @test
    ${response}    GET    ${baseURL}/usuarios    expected_status=200    
    ...    params=_id=9RTBq2Vg0p3tQzr5    
    ...    params=nome=esse nome nao existe
    Should Be Equal As Strings    ${response.json()['quantidade']}    0