* Settings *
Library    SeleniumLibrary

* Variables *
${LOGIN_URL}         https://www.saucedemo.com
${BROWSER}           chrome
${USERNAME}          standard_user
${PASSWORD}          secret_sauce

* Test Cases *
Add a product to the cart and confirm it is there
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window

    # Login
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button  id=login-button

    # Verify login success and navigate to inventory
    Location Should Be    ${LOGIN_URL}/inventory.html

    # Add product to cart
    Click Button     id=add-to-cart-sauce-labs-backpack
    Click Element    id=shopping_cart_container

    # Verify product in cart
    Element Should Be Visible    xpath=//div[@class='inventory_item_name']

    [Teardown]    Close Browser