* Settings *
Library    SeleniumLibrary

* Variables *
${LOGIN_URL}    https://www.saucedemo.com
${BROWSER}      chrome
${USERNAME}     standard_user
${PASSWORD}     secret_sauce

* Test Cases *
Successful Login
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window

    # Enter valid username and password
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}

    # Click login button
    Click Button    id=login-button

    # Verify successful login
    Location Should Be    ${LOGIN_URL}/inventory.html

    [Teardown]    Close Browser
