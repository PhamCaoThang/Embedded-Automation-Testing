######################################################
###                Author : WinPi                  ###
###              Release day : 12/21/2024          ###
######################################################

*** Settings ***
Library           BuiltIn

*** Test Cases ***
Log Hello World
    [Documentation]    This test case logs 'Hello, World!' to the console.
    Log    Hello, World!
