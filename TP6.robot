
*** Settings ***
Library    SeleniumLibrary
Test Setup    ouvrir prestashop
Test Teardown    fermer prestashop

*** Variables ***
${URL}        https://www.qualifiez.fr/monPrestashop2/prestashop/index.php
${HOME_TITLE}        monPrestashop


*** Test Cases ***
test1
    Rechercher    mug
    Verifier recherche    Il y a 5 produits.    mug

test2
    [Template]    Rechercher et verifier
    mug    Il y a 5 produits.
    T-shirt    Il y a 1 produit.

test3
    Survoler Vetements
    Menu Homme Doit Etre Visible
   


*** Keywords ***
ouvrir prestashop
    Open Browser    ${URL}      chrome
    Title should be   ${HOME_TITLE}
    Maximize Browser Window

fermer prestashop
    close Browser

Rechercher
    [Arguments]    ${item}
    Input Text    xpath=//*[@id="search_widget"]/form/input[2]    ${item}
    Press Keys    xpath=//*[@id="search_widget"]/form/input[2]    RETURN

Verifier recherche
    [Arguments]    ${text}    ${item}
    Element Text Should Be    xpath=//*[@id="js-product-list-top"]/div[1]/p   ${text}
    @{listeMUG}    Get WebElements    xpath=//*[@id="js-product-list"]/div[1]/div/article/div/div[2]/h2/a    
    FOR    ${elt}    IN    @{listeMUG}
        Element Should Contain    ${elt}    ${item}    ignore_case=True
    END

Rechercher et verifier
     [Arguments]    ${item}    ${text}    
     Rechercher    ${item}   
     Verifier recherche    ${text}    ${item}

Survoler Vetements
    Mouse Over    xpath= //*[@id="category-3"]/a  

Menu Homme Doit Etre Visible
    Wait Until Element Is Visible    xpath=//*[@id="category-4"]/a    5s    
    Log    Le menu Homme est maintenant visible


