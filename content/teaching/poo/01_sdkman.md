---
title: Installer Java avec SDKMAN
linktitle: Installer Java avec SDKMAN
summary: "Apprendre a utiliser l'outil SDKMAN pour télécharger, installer et utiliser en parallèle sur la même machine de multiples versions de Java."

toc: true
type: docs

date: "2020-08-02"

menu:
  poo:
    parent: POO
    weight: 1

weight: 1
---

Ce document explique comment installer un environnement de développement Java, grâce à l'utilitaire SDKMAN.
Cela sera utile aux étudiants qui s'intéressent au développement d'applications Java (au-delà du cadre du cours de POO).

SDKMAN est facile à installer sur Linux et Mac OSX, mais sur Windows il nécessite d'utiliser WSL ou Cygwin.

L'autre option est une installation "traditionnelle" en passant par le gestionnaire de paquets 
(`apt`, `pacman`, `rpm`, etc.) et sera suffisante dans le cadre de ce cours, mais n'est pas recommandée 
(voir la section "Qu'est-ce que SDKMAN ?").

## Qu'est-ce que SDKMAN ?

SDKMAN est un outil conçu pour faciliter l'installation d'une ou plusieurs versions de Java sous Linux. Il est 
particulièrement utile lorsque l'on a besoin de conserver sur son ordinateur différentes versions de Java (par exemple,
un projet peut avoir besoin du *JDK8* tandis qu'un autre utilisera le *JDK13*).

{{% alert note %}}
*JDK8* fait référence au *Java Development Kit* (c'est-à-dire l'ensemble des fichiers nécessaires pour exécuter et 
développer une application en langage Java), précisément avec la version 8. À ce jour, les versions de Java disponibles 
sont numerotées de 6 a 16. 

Remarque : les anciennes versions de Java étaient versionnées selon le format `1.x` (par exemple, `1.6`). 
`1.6` est donc équivalent à `JDK6`. Ce format a été abandonné depuis longtemps et il vaut mieux utiliser `JDKx`.
{{% /alert %}}

En résumé, SDKMAN permet de disposer de plusieurs versions du JDK (8, 9, 12, 13, ...), tandis que l'installation par
le gestionnaire de paquets ne permet d'installer qu'une seule version (tous les paquets sont mutuellement en conflit).

{{% alert note %}}
SDKMAN permet également de télécharger des outils qui font partie de l'écosystème Java (par exemple Maven ou Gradle),
ainsi que des environnements de développement pour les langages dits "de la JVM" (Scala, Ceylon, Kotlin, etc.), 
c'est-à-dire qui utilisent la *Java Virtual Machine*, et sont donc plus ou moins liés à Java.
L'écosystème Java ne sera pas abordé durant ce cours, mais est en vogue dans le monde de l'entreprise, il est donc
bon pour vous de pouvoir télécharger les outils facilement !
{{% /alert %}}

## Installation de SDKMAN

Les instructions pour l'installer de SDKMAN se trouvent sur le site officielle, à la page suivante : 
https://sdkman.io/install.

Un résumé simplifié de ces instructions :

```shell script
# Télécharger le script d'installation et l'exécuter immédiatement
$ curl -s "https://get.sdkman.io" | bash
# Une fois l'installation terminée, lancer le script d'initialisation
$ source "${HOME}/.sdkman/bin/sdkman-init.sh"
# Vous avez maintenant accès à sdkman ! Vérifions que cela fonctionne
$ sdk version
```

Ces étapes ne sont à effectuer qu'une seule fois (pour installer SDKMAN sur votre machine). Vous avez maintenant
accès à SDKMAN via la commande `sdk`. `sdk help` affichera la liste des sous-commandes disponibles.

## Installation de Java

Utilisez `sdk list java` pour afficher l'ensemble des versions de Java qui peuvent être téléchargées.
Voici ce que cela donne sur ma machine (affichage tronqué) :
```shell script
$ sdk list java
================================================================================
Available Java Versions
================================================================================
 Vendor        | Use | Version      | Dist    | Status     | Identifier
--------------------------------------------------------------------------------
 AdoptOpenJDK  |     | 14.0.2.j9    | adpt    |            | 14.0.2.j9-adpt
               |     | 14.0.2.hs    | adpt    |            | 14.0.2.hs-adpt
(...)
 BellSoft      |     | 14.0.2.fx    | librca  |            | 14.0.2.fx-librca
               |     | 14.0.2       | librca  |            | 14.0.2-librca
               |     | 13.0.2.fx    | librca  |            | 13.0.2.fx-librca
(...)
 Java.net      |     | 16.ea.8      | open    |            | 16.ea.8-open
               |     | 15.ea.34     | open    |            | 15.ea.34-open
               |     | 14.0.2       | open    |            | 14.0.2-open
(...)
```

Il existe de *nombreux* "candidats" (dans le langage de SDKMAN) pour Java ; ils se répartissent selon le *distributeur*
(*Vendor*) et la *version*.

### Quel *Vendor* choisir ?

Il existe plusieurs implémentations du JDK (voir https://sdkman.io/jdks pour leurs différences) ; j'en recommande
deux en particulier :
* **Java.net** est l'implémentation officielle du JDK ;
* **Bellsoft** (Liberica) est issue d'une initiative 100% Open-Source et qui a la bonne idée d'intégrer JavaFX (une
bibliothèque graphique pour concevoir des applications avec *GUI*). Sans cela, il faut installer JavaFX à part.

### Quelle *Version* choisir ?

De manière générale, il est préférable d'utiliser une version récente pour tout outil, bibliothèque, etc.
Attention toutefois, les versions 15 et 16 sont (au moment de la rédaction) en *Early Access*, c'est-à-dire que le
standard n'est pas fixé et est susceptible de changer (il n'est pas stable).

Je conseille donc de choisir le JDK13 ou 14.

{{% alert note %}}
le JDK9 a introduit un changement majeur (les modules) qui font que beaucoup d'applications conçues avec Java 8 
(ou inférieur) ne fonctionnent plus sous Java 9 ! Je recommande donc d'installer également un JDK8, cela vous sera
utile pour certains "vieux" programmes. L'avantage de SDKMAN est que vous pouvez définir le JDK13 en version par
défaut, et utiliser avec `sdk use` le JDK8 quand vous en aurez besoin.
{{% /alert %}}

### Résumé : quel candidat choisir ?

Je choisis d'installer le JDK13, avec JavaFX intégré ; le candidat correspondant (selon le tableau) est donc 
`13.0.2.fx-librca` (notez le `13` en début, le `.fx` qui indique JavaFX et `-librca` pour l'implémentation de Bellsoft).
La commande pour installer ce candidat est `sdk install java 13.0.2.fx-librca`.

{{% alert note %}}
S'il s'agit de votre premier JDK installé, SDKMAN le définit comme JDK par défaut (c'est-à-dire que les variables
d'environnement `JAVA_HOME` et `PATH` pointent sur le dossier de ce JDK). Toutes les applications Java utiliseront 
ce JDK (à moins que vous n'indiquiez manuellement un autre JDK). De plus, la commande `java` (ainsi que `javac`, etc.) 
seront celles fournies par ce JDK.

En revanche, si vous téléchargez plus d'un JDK, SDKMAN vous demandera si vous souhaitez le mettre en JDK par défaut. Je
vous conseille de garder le JDK13 en version par défaut (il est suffisamment récent pour faire tourner la majorité
des programmes).
{{% /alert %}}

### Où est mon JDK ?

Il peut vous être nécessaire de connaître l'emplacement où est installé le JDK, notamment lors du paramétrage de votre
*IDE* (car celui-ci vous demandera très certainement d'indiquer quel JDK utiliser).

Heureusement, SDKMAN rend cela très facile (plus que de dézipper une archive et d'oublier dans quel dossier) : tout
est situé dans le dossier `${HOME}/.sdkman` (c'est-à-dire le dossier caché `.sdkman` dans votre répertoire personnel).
En particulier, les candidats sont installés dans `${HOME}/.sdkman/candidates/`. Votre version par défaut du JDK se
trouve donc à l'emplacement suivant : `${HOME}/.sdkman/candidates/java/current/bin`.

{{% alert note %}}
La commande `which java` permet de connaître l'emplacement de l'exécutable `java` ; elle devrait retourner le même
chemin (cela montre que votre JDK est bien configuré).
{{% /alert %}}

## Paramétrage de l'*IDE*

### Avec IntelliJ IDEA

Lors de la création d'un projet, IntelliJ demande quel SDK utiliser ; en déroulant la liste, sélectionner *Add JDK...*.

Sinon, cliquer sur *File* > *Project Structure* (ou *Ctrl+Alt+Shift+S*), puis dans l'onglet *SDKs* cliquer sur 
l'icône *+*, *Add JDK...*.
