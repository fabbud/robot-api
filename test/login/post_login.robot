*** Settings ***
Resource    ../base.robot
Resource    ./keywords/loginKW.robot
Force Tags    @regression


*** Test Cases ***

Login com sucesso
    Login
    Should Be Equal As Strings    ${response.json()['message']}

Login sem sucesso
    Login
    Should Be Equal As Strings    ${response.json()['message']}
     