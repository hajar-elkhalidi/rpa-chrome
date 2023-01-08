*** Settings ***
Library     RPA.Browser.Selenium


*** Test Cases ***
Search for "selenium" word
    Open Available Browser    https://www.google.com/
    Maximize Browser Window
    Input Text    name=q    selenium
    Submit Form
    Page Should Contain    selenium
    Close Browser