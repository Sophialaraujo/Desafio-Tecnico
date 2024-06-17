* Settings *
Library    SeleniumLibrary
Library    Collections

* Variables *
${LOGIN_URL}    https://www.saucedemo.com
${BROWSER}      chrome
${USERNAME}     standard_user
${PASSWORD}     secret_sauce

* Test Cases *
Filter from cheapest to most expensive 
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window

    # Login
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button  id=login-button

    # Verify login success and navigate to inventory
    Location Should Be    ${LOGIN_URL}/inventory.html
    
    # Select "From cheapest to most expensive" filter
    Click Element    css=.product_sort_container
    Click Element    xpath=//option[text()='Price (low to high)']

    # Verify products are displayed in ascending price order
    @{product_prices}    Get WebElements    css=.inventory_item_price

    # Get text values of product prices
    @{prices}    Create List
    FOR    ${element}    IN    @{product_prices}
        ${text}    Get Text    ${element}
        ${price}    Evaluate    round(float("${text}".replace('$', '')), 2)
        Append To List    ${prices}    ${price}
    END

    # Verify if prices are sorted in ascending order
    ${sorted_prices}    Copy List    ${prices}
    Sort List    ${sorted_prices}
    Lists Should Be Equal    ${prices}    ${sorted_prices}

    [Teardown]    Close Browser