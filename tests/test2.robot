*** Settings ***
Library     RPA.Browser.Selenium


*** Test Cases ***
Search for "robot" word
    Open Available Browser    https://www.google.com/
    Maximize Browser Window
    Input Text    name=q    robot
    Submit Form
    Page Should Contain    robot
    Close Browser