* Settings *
Library    SeleniumLibrary

* Variables *
${LOGIN_URL}         https://www.saucedemo.com
${BROWSER}           chrome
${USERNAME}          standard_user
${PASSWORD}          secret_sauce

* Test Cases *
Checkout scenario
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window

    # Login
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button  id=login-button

    # Verify login success and navigate to inventory
    Location Should Be    ${LOGIN_URL}/inventory.html

   # Add product to cart
    Click Button    id=add-to-cart-sauce-labs-backpack

    # Click shopping cart icon
    Click Element    css=.shopping_cart_container
    Wait Until Page Contains Element    css=.cart_list

    # Click "Checkout" button
    Click Button    css=.checkout_button

    # Fill in payment details
    Input Text    id=first-name    John
    Input Text    id=last-name    Smith
    Input Text    id=postal-code    12345

    # Click "Continue" button
    Click Button    css=.cart_button

    # Click "Finish" button
    Click Button    css=.btn_action.btn_medium.cart_button[data-test="finish"]

    # Verify order confirmation page
    Wait Until Page Contains Element    css=.checkout_complete_container    timeout=10s
    Element Should Contain    css=.checkout_complete_container    Your order has been dispatched

    [Teardown]    Close Browser