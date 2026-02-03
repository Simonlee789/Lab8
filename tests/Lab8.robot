*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Open Login page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage

    Open Browser
    ...    https://computing.kku.ac.th
    ...    chrome
    ...    options=${options}
    ...    executable_path=/usr/bin/chromedriver

    ${title}=    Get Title
    Should Contain    ${title}    Computing

    Close Browser
