# IN210-Selenium
 Test d'IHM

## Question 1 :

Le **Test Setup** et le **Test Teardown** sont des directives qui définissent des actions à exécuter respectivement avant et après chaque cas de test. Voici leurs intérêts principaux :

+ **Test Setup** : Son objectif est de préparer l'environnement de test avant l'exécution de chaque cas de test. Ici, le Test Setup  *ouvrir prestashop* ouvre le navigateur et navigue vers une URL spécifique, vérifie le titre de la page pour confirmer que la page attendue est chargée et maximise la taille de la  fenêtre du navigateur. Cela assure que chaque test commence dans un environnement contrôlé et prédéterminé, ce qui est crucial pour la fiabilité des tests.

+ **Test Teardown** : Il est utilisé pour nettoyer après l'exécution de chaque test. L'idée est de remettre l'environnement dans un état neutre pour éviter que l'exécution d'un test n'affecte les suivants. Dans notre cas, le Test Teardown *fermer prestashop* assure la fermeture du navigateur.

## Question 2 :

Si on place  *close browser* directement à la fin d'un cas de test sans l'utiliser dans le Test Teardown, et qu'une des commandes précédentes dans le test échoue ,alors il est possible que close browser ne soit jamais atteint et donc jamais exécuté. Cela signifie que le navigateur resterait ouvert après l'échec du test.


## Question 3 : 

Nous avons choisi d'utiliser des locators **relatifs** car : 

 + Les locators relatifs sont moins susceptibles d'être affectés par des changements dans la structure générale de la page web. Si la page est mise à jour et que des éléments sont ajoutés ou retirés, un locator relatif a plus de chances de rester valide, car il ne dépend pas d'un chemin complet depuis la racine de la page.
+ les locators relatifs sont généralement plus courts et plus lisibles, ce qui facilite la maintenance des scripts de test. Ils permettent de cibler directement l'élément sans avoir besoin de parcourir toute la structure du document depuis la racine.

## Question 4 :

L'utilisation des keywords présente plusieurs avantages significatifs pour l'automatisation des tests. Voici les principaux intérêts de ces mots-clés :

+ **Réutilisabilité** : Ils permettent de regrouper des actions qui peuvent être réutilisé dans différents tests.

+ **Lisibilité et Clarté** : En encapsulant des séquences d'actions complexes ou des vérifications dans des mots-clés avec des noms descriptifs, les scripts sont beaucoup plus  lisibles et compréhensibles.

+ **Facilité de Maintenance** : Lorsque des modifications sont nécessaires, , on peut les effectuer uniquement au niveau du mot clé.

## Question 5 :

 L'approche de test utilisé est data-driven et aussi orientée par Keywords. 
 
 La première car les cas de test sont exécutés en utilisant un ensemble de données d'entrée.L'idée est de séparer la logique du test des données avec lesquelles il est exécuté, permettant ainsi d'exécuter le même test avec de nombreuses variations de données sans réécrire le code du test pour chaque nouvelle entrée. Cette approche augmente la couverture de test et l'efficacité en permettant de tester rapidement plusieurs scénarios avec un minimum de code répété. (utilisation de template)
 
 La deuxième car les actions sont encapsulées à la fois dans des mots-clés fournis par la bibliothèque SeleniumLibrary et dans des mots-clés personnalisés. Cette approche où les tests sont écrits en utilisant des mots-clés significatifs qui décrivent l'action en cours d'exécution.
