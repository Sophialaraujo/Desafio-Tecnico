* Settings *
Library    SeleniumLibrary

* Variables *
${LOGIN_URL}    https://www.saucedemo.com
${BROWSER}      chrome
${USERNAME}     standard_user
${PASSWORD}     secret_sauce

* Test Cases *
Exit the cart and continue shopping
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window

    # Login
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button  id=login-button

    # Verify login success and navigate to inventory
    Location Should Be    ${LOGIN_URL}/inventory.html

    # Click on the shopping cart icon
    Click Element    id=shopping_cart_container

    # Verify user is on the shopping cart page
    Location Should Be    ${LOGIN_URL}/cart.html

    # Click the "Continue Shopping" button
    Click Button    id=continue-shopping

    # Verify user is redirected to the products page
    Location Should Be    ${LOGIN_URL}/inventory.html

    # Verify list of available products is visible
    Element Should Be Visible    css=.inventory_list

    [Teardown]    Close Browser