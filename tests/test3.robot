*** Settings ***
Library     ../resources/status.py


*** Test Cases ***
Get response status
    ${status}=    Get Status    https://www.google.com
    Should Be Equal    ${status}    ${200}
