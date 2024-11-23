*** Settings ***
Library           BuiltIn

*** Test Cases ***
Log Hello World
    [Documentation]    This test case logs 'Hello, World!' to the console.
    Log    Hello, World!
