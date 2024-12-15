*** Settings ***
Library           SSHLibrary
Library           String

*** Variables ***
*** Keywords ***
SSH Hardware Device
    [Arguments]    ${ip_address}    ${user_name}    ${pass_word}
    
    Open Connection  ${ip_address}
    Login  ${user_name}    ${pass_word}
    Log  SSH Hardware Success

Execute Command With SSH
    [Arguments]    ${ip_address}    ${user_name}    ${pass_word}  ${cmd}
    SSH Hardware Device  ${ip_address}    ${user_name}    ${pass_word}
    #Execute your command
    #${cmd}=  Evaluate  ${cmd}
    ${result}=  Execute Command  ${cmd}
    Close Connection

    [Return]  ${result}

Regexp Output
    [Arguments]    ${output}    ${regex_pattern}    ${group}
    
    ${result}=  Get Regexp Matches  ${output}    ${regex_pattern}    ${group}
    
    [Return]  ${result}

Check Host Alive 
    [Arguments]  ${host}
    ${ping_result}=  Run Process  ping -c 1 ${host}  stderr=False  shell=True
    ${rc}=  Set Variable  ${ping_result.rc} 
    Run Keyword If '${rc}' == '0' Log  Host still alive 
    ...  ELSE  Log   Host die