######################################################
###                Author : WinPi                  ###
###              Release day : 12/21/2024          ###
######################################################

*** Settings ***
Library           SSHLibrary

*** Variables ***
${HOST}           your_ip
${USERNAME}       your_name
${PASSWORD}       your_password

*** Test Cases ***
SSH and Echo Command
    [Documentation]    This test case SSHs into the host and runs example commands.
    ...                You need install SSHLibrary with command pip install robotframework-sshlibrary

    Open Connection    ${HOST}
    Login              ${USERNAME}    ${PASSWORD}
    ${output}=         Execute Command    echo 123
    ${os_check}=         Execute Command    cat /etc/os-release
    Log                ${output}
    Log                ${os_check}
    Close Connection