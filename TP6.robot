*** Settings ***
Library    SeleniumLibrary
Test Setup    ouvrir prestashop
Test Teardown    fermer prestashop

*** Variables ***
${URL}        https://www.qualifiez.fr/monPrestashop2/prestashop/index.php
${HOME_TITLE}        monPrestashop
${menuxPath}    //*[starts-with(@id, "category-")]/
${logoPath}    //*[@id="_desktop_logo"]/*

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

test4
    ${elem}     Find element in menu    ${menuxPath}    VÊTEMENTS
    Element Text Should Be    ${elem}    VÊTEMENTS    ignore_case=True
    Mouse hover    ${elem}    HOMMES    ${menuxPath}

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

# 7/ Essaie de rendre plus generaliste
Find element in menu
    [Arguments]    ${path}    ${elem_name}
    ${menu_items}    Get WebElements    xpath=${path}a
    FOR    ${item}    IN    @{menu_items}
        ${item_name}    Get Text    ${item}
        IF    '${item_name}' == '${elem_name}' 
            RETURN    ${item}
        END
    END
    RETURN    ${EMPTY}

Mouse hover
    [Arguments]    ${elem}    ${subcategory}    ${path}
    Mouse Over    ${elem}
    ${subelem}    Find element in menu    ${path}/descendant::    ${subcategory}
    Element Should Be Visible    ${subelem}
    Mouse Out    ${elem}
    # Positionne le souris loin du menu et du sousmenu
    Mouse Over    ${logoPath} 
    Wait Until Element Is Not Visible    ${subelem}    5s
    
