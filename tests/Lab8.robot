*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Open Browser To Login Page
    # ===== Chrome options (headless สำหรับ Jenkins/Docker) =====
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --window-size=1920,1080


    Create Webdriver    Chrome
    ...    options=${chrome_options}
    ...    executable_path=/usr/bin/chromedriver

    Go To    https://computing.kku.ac.th


*** Test Cases ***
Test Open Browser Successfully
    Open Browser To Login Page
    Title Should Be    Computing KKU
    Close Browser


Test Browser Opens With Correct URL
    Open Browser To Login Page
    Location Should Be    https://computing.kku.ac.th
    Close Browser


Test Page Content Loads
    Open Browser To Login Page
    Page Should Contain Element    css=body
    Close Browser
