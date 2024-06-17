* Settings *
Library    SeleniumLibrary

* Variables *
${LOGIN_URL}   https://www.saucedemo.com/
${BROWSER}     chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

* Test Cases *
Logout Scenario
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window

    # Login
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button  id=login-button

    # Verify login success and navigate to inventory
    Wait Until Page Contains Element    css=.inventory_list
    Location Should Be    ${LOGIN_URL}inventory.html

    # Click profile icon
    Wait Until Element Is Visible    css=.bm-burger-button
    Click Element    css=.bm-burger-button

    # Click "Logout" option
    Wait Until Element Is Visible    css=#logout_sidebar_link
    Click Element    css=#logout_sidebar_link

    # Verify logout
    Wait Until Page Contains Element    id=user-name
    Location Should Be    ${LOGIN_URL}

    [Teardown]    Close Browser