*** Settings ***
Library    SeleniumLibrary

Suite Setup     Set Headless Chrome Options
Suite Teardown  Close Browser

*** Variables ***
${URL}          https://www.tricentis.com/

*** Test Cases ***
Verify Tricentis Homepage
    [Documentation]    Open Tricentis homepage and validate core elements

    Step 1 - Open Homepage
        Go To    ${URL}
        Sleep    2s

    Step 2 - Verify Page Title
        Title Should Contain    Tricentis

    Step 3 - Verify Header Element Is Present
        Page Should Contain Element    tag:header

    Step 4 - Verify "Platform" Link Is Visible
        Page Should Contain Element    link:Platform

    # Step 5 - Optionally Click "Platform"
    # Click Link    Platform

*** Keywords ***
Set Headless Chrome Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --remote-debugging-port=9222
    Create WebDriver    Chrome    chrome_options=${options}
