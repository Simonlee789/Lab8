*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Open Login page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --window-size=1920,1080

    Open Browser
    ...    https://computing.kku.ac.th
    ...    chrome
    ...    options=${options}
    ...    executable_path=/usr/bin/chromedriver

    Title Should Be    KKU Computing
    Close Browser
