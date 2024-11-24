*** Settings ***
Library           SSHLibrary

*** Variables ***
*** Key words ***
SSH Hardware Device
    [Arguments]    ${ip_address}    ${user_name}    ${pass_word}
    
    Open Connection  ${ip_address}
    Login  ${user_name}    ${pass_word}
    Log  SSH Hardware Success
    #Run a example command
    ${os_check}=  Execute Command    cat /etc/os-release
    Log  ${os_check}

Execute Command With SSH
    [Arguments]    ${cmd}
    
    #Execute your command
    ${cmd}=  Evaluate  ${cmd}
    ${result}=  Execute Command  ${cmd}
    Close Connection
