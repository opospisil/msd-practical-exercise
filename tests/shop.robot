*** Settings ***
Documentation     A test suite with a single test for sort by price and add to cart
...
Library           SeleniumLibrary
Library           Collections
Library           utils.py


*** Test Cases ***
Add to basket by price
    Open browser on page    /cepiny/?order=-3
    Title Should Be         Cepíny - Hanibal
    Accept cookies
    Check sorting
    Add item from catalog to basket    0
    Go Back
    Add item from catalog to basket    1
    Open basket
    Verify number of items in basket    2
    [Teardown]    Close Browser


*** Variables ***
${BROWSER}        Chrome
${DELAY}          0
${URL}            https://www.hanibal.cz
${BASKET URL}    ${URL}/kosik/


*** Keywords ***
Open browser on page
    [Arguments]     ${section}
    Open Browser    ${URL}/${section}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Accept cookies
    Click Button    //button[@data-cookie-bar='simpleAccept']
    Element Attribute Value Should Be    id:cookieBar    style    display: none;
    
Check sorting
    ${prices}    Get WebElements    //div[@class='row catalog-row']//p[@class='price']//strong
    ${lst}=    Create List  
    FOR     ${el}    IN    @{prices}
            ${text}    Get Text    ${el}
            ${pr}    Convert to Integer    ${text.rstrip(' Kč')}
            Append To List    ${lst}     ${pr}
    END
    Is Desc    ${lst}

Add item from catalog to basket
    [Arguments]    ${position}
    @{items}    Get WebElements    //div[@class='row catalog-row']/div[@class='col-xl-4 col-xxs-6']//p[@class='title']
    Scroll Element Into View   ${items[${position}]}
    Click Element    ${items[${position}]}
    Click Button    //*[@class='btn btn-insert']

Open basket
    Go To    ${BASKET URL}
    Title Should Be    Košík - Hanibal

Verify number of items in basket
    [Arguments]    ${count}
    ${basket_items}    Get WebElements    //*[@data-cart='row']
    Capture Page Screenshot    filename=selenium-screenshot-index.png
    Length Should Be   ${basket_items}    ${count} 

    