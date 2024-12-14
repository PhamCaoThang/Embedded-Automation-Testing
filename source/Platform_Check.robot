*** Settings ***
Library           SSHLibrary
Resource          ../lib/common.robot
*** Variables ***
${HOST}           192.168.2.122
${USERNAME}       betram
${PASSWORD}       beaker

*** Test Cases ***
Platform Check For Raspberry Board
    ${nproc_cmd}  Set Variable  nproc
    Check Core Active Numbers   ${HOST}   ${USERNAME}    ${PASSWORD}   ${nproc_cmd}


*** Keywords ***
Check Core Active Numbers
    [Documentation]  This is keywords to check Number of active cores with nproc command

    [Arguments]    ${ip_address}    ${user_name}    ${pass_word}  ${cmd}
    #${cmd}  Set Variable  nproc
    Execute Command With SSH  ${ip_address}  ${user_name}  ${pass_word}  ${cmd}