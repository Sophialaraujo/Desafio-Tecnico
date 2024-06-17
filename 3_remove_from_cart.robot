* Settings *
Library    SeleniumLibrary

* Variables *
${LOGIN_URL}         https://www.saucedemo.com
${BROWSER}           chrome
${USERNAME}          standard_user
${PASSWORD}          secret_sauce

* Test Cases *
Remove product from cart
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

    # Remove product from cart
    Click Button    css=#cart_contents_container button.btn_secondary

    # Verify product is removed from cart
    Element Should Not Be Visible    xpath=//div[@class='inventory_item_name']
    
    [Teardown]    Close Browser