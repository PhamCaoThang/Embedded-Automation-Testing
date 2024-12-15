*** Settings ***
Library           SSHLibrary
Resource          ../lib/common.robot
*** Variables ***
${HOST}           192.168.2.122
${USERNAME}       betram
${PASSWORD}       beaker

*** Test Cases ***
Platform Check For Raspberry Board
    [Documentation]  This test case gives some examples about Platform check

    ###    Check Numbers Of Activate Cores Of Board
    ${nproc_cmd}  Set Variable  nproc
    Check Core Active Numbers   ${HOST}   ${USERNAME}    ${PASSWORD}   ${nproc_cmd}

    ###    Check OS Version
    ${cat_os_cmd}  Set Variable  cat /etc/os-release
    Check OS Version  ${HOST}   ${USERNAME}    ${PASSWORD}   ${cat_os_cmd}


*** Keywords ***
Check Core Active Numbers
    [Documentation]  This keywords check Number of active cores with nproc command

    [Arguments]    ${ip_address}    ${user_name}    ${pass_word}  ${cmd}

    #Execute nproc command to get the number of core activate
    ${number_core_activate}=  Execute Command With SSH  ${ip_address}  ${user_name}  ${pass_word}  ${cmd}
    ${number_core_activate}=  Convert To Number  ${number_core_activate}
    
    #Compare result with expectation
    ${check}=   Run Keyword And Return Status   Should Be Equal As Numbers   ${number_core_activate}  4
    Run Keyword And Continue On Failure  Run Keyword If  ${check}  
    ...          Log  The nummber of core active is as expected!
    ...  ELSE    Log  The nummber of core active is not as expected!

Check OS Version
    [Documentation]  This keywords check OS version

    [Arguments]    ${ip_address}    ${user_name}    ${pass_word}  ${cmd}
    
    #Execute cat /etc/os-release to get the OS version
    ${os_version}=  Execute Command With SSH  ${ip_address}  ${user_name}  ${pass_word}  ${cmd}
    Log  ${os_version}

    #Regex to take only the necessary result, for example : get NAME value
    ${regex_pattern}=  Catenate  (?m)^NAME="([^"]+)"
    ${os_name}=  Regexp Output  ${os_version}  ${regex_pattern}  1
    
    #Compare result with expectation
    ${check}=   Run Keyword And Return Status   Should Be Equal As Strings  ${os_name}[0]  Raspbian GNU/Linux
    Run Keyword And Continue On Failure  Run Keyword If  ${check}  
    ...          Log  The Os version is as expected!
    ...  ELSE    Log  The Os version is not as expected!