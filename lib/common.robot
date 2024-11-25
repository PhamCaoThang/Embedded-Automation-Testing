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

Regexp Output
    [Arguments]    ${output}    ${regex_pattern}    ${group}
    
    ${result}=  Get Regexp Matches  ${output}    ${regex_pattern}    ${group}
    Log  ${result}

Check Host Alive
    [Arguments]    ${host_ip}

Check Host Alive 
    [Arguments]  ${host}
    ${ping_result}=  Run Process  ping -c 1 ${host}  stderr=False  shell=True
    ${rc}=  Set Variable  ${ping_result.rc} 
    Run Keyword If '${rc}' == '0' Log  Host still alive 
    ...  ELSE  Log   Host die