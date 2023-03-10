*** Settings ***
Resource    ../../base.robot

*** Keywords ***

login
    [Documentation]    KW utilizada para realizar login

    ${Header}        Create Dictionary
    ...              Content-Type=application/json

    ${Body}          Create Dictionary
    ...              email=beltrano@qa.com.br
    ...              password=teste

    Create Session    serverest    ${baseURL}
    ${response}        Post on session    serverest    /login
    ...                headers=${Header}
    ...                json=${Body}