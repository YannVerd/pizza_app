# pizza_app

profils d'essais : 
    - mika@email.fr ; 123456
    - yann.e.verdier@gmail.com ; 123456

## Difficultés rencontrées:

- La première difficulté a été de géré le thème choisi. JE n'arrivais pas a avoir la couleur souhaité.
    Puis je me suis rendu compte que d'avoir un theme permet d'automatisé les rendus de couleurs.

- Ma barre de Navigation, située en haut au début, chechauchait mmon titre.
    En discutant avec les autres et en regardant leur travail, je me suis rendu compte que pour l'UX ce n'était pas bonne stratégie.
    J'ai doncchangé mon design en adoptant une bottom TabBar, facilement accessible avec les pouces. 
    J'ai du revoir mon systeme, mais l'avantage, c'est que cela m'a fait économisé des pages.

- L'application est lié a une Firebase RealTime Database ( à la base c'était pour tester mais j'ai pas eu le temps de changé):
    * La connexion a été facile a établir mais la récupération de donnée c'est autres chose :
        - J'ai du refaire plusieurs fois ma bdd, mais j'avais anticipé les problèmes en ayant préparé un JSON au préalable (dossier data en root).
            L'importation de JSON avec FIrebase étant aisée, j'ai pu modifier à ma bdd à la volée. Après avoir apporté les modifications adéquates sur le-dit fichier.
        - J'avais, au début, l'intention d'utiliser un provider qui fait appel à une classe firebase (connexion). Cela a complexifié les choses lors de l'utilisation de Future.
            Je suis revenu a plus simple. (lié à la difficulté suivante)
        - Le plus gros problème que j'ai rencontré pour la récupération de données à été le changement de typage qui a lieu entre la propriété future du FutureBuilder, l'initialisation d'une varibale et l'utilisation.
            J'y ai passé beaucoup de temps mais j'ai fini par trouver: l'utilisation du mot clef : "as" pour forcer le typage d'une donnée. 

    *  Le typage et la gestion du null :
        - L'utilisation des futures widgets rend le typage plus complexes. J'ai perdu beaucoup de temps la dessus
        - La gestion du null est une notion complexe en flutter. J'ai réussi a comprendre ce probleme en utilisant "?" et "!" pour spécifié si une propriété peut être null et prendre l'opposé du null.

- Problèmes encore d'actualité à l'heure d'écriture de ces lignes (vendredi 02 Février 2024 9:32):
    * L'utilisation de firebase_ui pour le register et le forgot password fait que la navigation ne marche pas(alors que signin est fait à la main). 
        Je sais quoi faire : Modifier la structure de Navigation en implémentant Firebase UI dans le main.dart. 

    * Fixer la taille des cards dans le home

    * Dans le home: 
        - Problème sur les cards du carousel : Un titre est trop long et overflow l'espace a droite. ----- RESOLU : diminution taille du titre (un wrap serait plsu adapté mais fonnctionne pas)
    
    * Dans le panier: 
        - l'incrementation des suppléments marche mais pas la décrémentation: GROS PROBLEME de check box. Je bug dessus
        - il me manque l'affichage des suppléments et l'update des suppléments dans la bdd

    * Dans l'user page:
        - les boutons change de couleurs tout seuls quand je rajoute l'onglet gps. Solution provisoire, changer les couleurs à la main. --- RESOLU (suppresion d'une option récurrente)
        - le GPS ne marche pas du tout (google map module)
    
    * reste à faire (outre les problèmes ci-dessus à régler):
        - La partie Historique de l'user;
        
    * Au paiement, proposer un formulaire pour rentrer l'email et le téléphone, ou de se connecter

## Description

....