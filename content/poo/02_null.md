+++
title = "Le problème du null et les Optional"
linktitle = "Les null et les Optional"
summary = ""

toc = true
type = "book"

date = "2020-08-21"
weight = 2

[menu]
  [menu.poo]
    parent = "POO"
    weight = 2
+++

Ce document explique le problème du `null` en Java ainsi que quelques solutions pour pallier à ce problème, telle que
l'utilisation des `Optional`.

## Null et les NullPointerException

En langage Java, toute référence (des variables, des attributs de classe, des paramètres de méthode) de type objet 
(donc une classe) peut valoir `null` : Cette valeur spéciale signifie qu'il n'y a pas de valeur (c'est l'équivalent du 
pointeur nul ou 0 en langage C / C++).

Si vous essayez d'accéder quand même à cette référence (par appel de méthode dessus, ou en accédant à un attribut de 
la classe), Java ne pourra pas effectuer ce qui est demandé (car l'objet n'existe pas !) et vous enverra une erreur 
(ce qu'on appelle "lever une exception"). Cette exception, dans ce cas, est toujours une instance de 
`NullPointerException` (abrégée `NPE`).
Voir par exemple le code suivant :
```java
String username = null;
System.out.println(String.valueOf(username.length));
```

La ligne 2 lève une exception, car `username` est `null`, on ne peut donc pas accéder à `username.length`.
Une meilleure façon de faire serait :
```java
String username = null;
if (username != null) {
    System.out.println(String.valueOf(username.length));
}
```

Le problème est qu'il faut se souvenir de **toujours** vérifier que la référence ne soit pas `null` ! En pratique,
les développeurs oublient souvent. De plus, la situation se complexifie lorsqu'on utilise des bibliothèques tierces
(on ne sait pas très bien si le retour d'une méthode peut renvoyer `null` ou pas...).

{{% callout note %}}
La personne ayant "inventé" le concept de `null` affirme aujourd'hui qu'il s'agit d'une erreur, qu'il a nommé
"The Billion Dollar Mistake" (l'erreur à un milliard de dollars) !
Ce milliard aurait été perdu par le nombre de plantages produits par un oubli de `null-check` dans des applications
industrielles.
Je vous recommande de voir sa présentation (ou de lire ses notes) à ce sujet :
https://www.infoq.com/presentations/Null-References-The-Billion-Dollar-Mistake-Tony-Hoare/
{{% /callout %}}


## Un (rapide) aparté sur le problème de l'égalité

On retrouve beaucoup de *NPE* à l'intérieur des tests d'égalité. En effet, en Java, l'opérateur `==` ne compare que
l'égalité des références et on lui préfère donc la méthode `equals`. Or, `equals` étant une méthode, il arrive
(très souvent) qu'on essaie de l'appliquer à une référence `null` !
Voir le code suivant pour un exemple :
```java
String username = null;
if (username.equals("Smith") {
    System.out.println("Welcome home");
}
```

Comme précédemment, la ligne 2 provoque une *NPE*, car `username` est `null`, je ne peux donc pas appeler la méthode
`equals` dessus.

Une façon très simple de corriger le problème, dans ce cas, est d'inverser l'ordre des variables :
```java
String username = null;
if ("Smith".equals(username)) {
    System.out.println("Welcome home");
}
```

Ici, pas de problème, car `"Smith"` n'est pas `null`, et j'ai donc tout à fait le droit d'appeler la méthode `equals`
dessus. En revanche, la méthode `equals` de la classe `String` **doit** effectuer un `null-check` sur l'argument qu'elle
reçoit (fort heureusement pour nous, elle le fait).

{{% callout warning %}}
**À retenir !** <br />
Quand on crée une nouvelle classe et que l'on surcharge la méthode `equals`, il **faut** penser au `null-check` !
{{% /callout %}}

Cette technique ne fonctionne que dans le cas où l'un des deux objets est un *littéral* (c'est-à-dire, pour simplifier,
qu'il a une valeur immédiate, à l'inverse d'une variable qui *peut* avoir une valeur ou non). Ici, `"Smith"` est un
littéral. En revanche, si je veux comparer `String user1` et `String user2`, je n'ai pas de littéral.

Heureusement, cette situation est si fréquente que le langage Java nous propose une méthode toute prête : 
`Objects.equals(Object a, Object b)` ([voir la doc][ObjectsEquals])).
La classe `Objects` consiste en un ensemble de méthodes "utilitaires" telle que celle-ci. `Objects.equals` est statique
et il suffit donc de l'appeler sur 2 objets pour savoir s'ils sont égaux. En interne, elle vérifiera si les objets
sont `null`s, comparables, et appellera éventuellement la méthode `equals` de la bonne classe.
Par exemple :
```java
String user1 = null, user2 = null
if (Objects.equals(user1, user2)) {
    System.out.println("Equals!");
}
```

{{% callout warning %}}
**À retenir !** <br />
Favorisez l'utilisation de `Objects.equals(a, b)` dans votre code aussi souvent que possible.
{{% /callout %}}


## Une solution plus élégante : les Optional

Comme je l'ai dit précédemment, le problème principal est qu'il faut se souvenir de **toujours** faire un `null-check`.
Or, on ne s'en souvient pas toujours ; parfois, on utilise une bibliothèque tierce (par exemple pour faire une
application communiquant en réseau) qui, lors des tests, nous renvoie toujours un objet non-`null`, sauf un jour, en
production, dans un contexte particulier où notre application reçoit un objet `null` et crashe complètement...

Depuis sa version 8, le langage Java propose une classe qui a pour but de supprimer le problème du `null` : la classe
`Optional<T>` (que j'appellerais `Optional` pour faire plus simple ; [voir la doc][Optional]).

`Optional` est une classe générique qui peut contenir, ou non, une valeur (de type `T`) ; elle propose également des
méthodes permettant de simplifier sa manipulation, en particulier de vérifier qu'une valeur soit présente (`isPresent`),
de fournir une valeur par défaut (`orElse`), de récupérer la valeur (`get`), etc.

### Un exemple simple

Voir le code ci-dessous pour un exemple simple :
```java
String username = null;
Optional<String> optString = Optional.ofNullable(username);
if (optString.isPresent()) {
    System.out.println(String.valueOf(optString.get().length));
}
```

Comme vous pouvez le voir, l'utilisation des Optional ressemble fortement à celle des références "simples" :
on utilise un `null-check` (ici, `isPresent` au lieu de `!= null`), puis on manipule la valeur (ici, on rajoute `get`).
L'avantage est que l'utilisation d'une classe spécifique, `Optional`, permet aux développeurs de se dire 
> Ah, cette valeur peut être `null` ! Je dois d'abord vérifier si elle est présente.

### Le cas des retours de méthode

La classe `Optional` révèle toute son utilité en tout que retour de méthode. En effet, à l'intérieur du corps d'une
même méthode, nous savons (normalement) quelle variable peut être `null` ou non, l'utilité est donc limitée. En revanche,
lorsqu'on reçoit un objet d'une autre méthode (potentiellement une méthode provenant d'une bibliothèque tierce),
difficile de savoir si l'objet peut être `null` ou s'il est garanti d'être non-`null`. Renvoyer un `Optional<T>`
plutôt qu'un `T` permet d'indiquer au développeur qui utilisera votre méthode que oui, il peut ne pas y avoir de valeur,
et oui, il faut faire un `null-check`.

Imaginons que l'on conçoive une méthode pour authentifier un utilisateur :
```java
public class User { ... }

public Optional<User> authenticate(String username, String password) {
    if (Objects.equals(username, "Smith") && Objects.equals(password, "supersecret")) {
        User u = new User();
        return Optional.of(u);
    } else {
        return Optional.empty();
    }
}

public void receiveRequest(String username, String password) {
    Optional<User> user = authenticate(username, password);
    if (user.isPresent()) {
       user.get().sendTopSecretPlans();
    } else {
        System.out.println("Bad credentials! Intruder alert!");
    }
}
```

{{% callout note %}}
La classe `Optional` permet également une approche plus "fonctionnelle", avec par exemple les méthodes `map`, 
`ifPresent`, `orElseGet` qui prennent en paramètre des `Function`, `Consumer` ou `Supplier` (c'est-à-dire des méthodes
ou des `lambda-expressions`).
Il s'agit là de concepts plus avancés qui ne seront pas abordés dans le cadre de ce cours.
{{% /callout %}}

Il existe toutefois un piège si vous ne respectez pas une règle implicite... ne **jamais** renvoyer `null` lorsque le 
type est `Optional<T>` ! Cela supprimerait complètement les avantages de la classe `Optional` et pousserait la 
quasi-totalité des applications/bibliothèques à crasher (celles-ci s'attendant à pouvoir appeler `Optional::isPresent`).
Lorsqu'on ne veut pas renvoyer de valeur, il **faut** utiliser `Optional.empty()`. Un IDE intelligent devrait vous
indiquer que vous prenez des risques si vous essayez de renvoyer un `null` à la place d'un `Optional.empty()`.


## Résumé

Nous avons vu que chaque référence en Java peut valoir `null` ; si on ne vérifie pas à chaque fois que la référence n'est
pas `null`, on risque de se prendre une `NullPointerException` (*NPE*). Celle-ci, si elle n'est pas "attrapée", peut 
faire crasher notre application. 

Nous avons également vu que ce problème était particulièrement présent lorsque l'on souhaite tester l'égalité de deux
objets ; dans ce cas, la méthode statique `Objects.equals(a, b)` peut nous aider.

À partir de Java 8, l'on peut utiliser la classe `Optional<T>` pour se simplifier la vie : on s'interdit de renvoyer
`null` et on remplace cela par `Optional.empty()`. On se force également à utiliser `Optional.isPresent()` pour
vérifier la présence (ou non) d'une valeur, et dans le cas où elle est présente, on la récupère via `Optional.get()`.

L'utilisation de la classe `Optional` permet d'envoyer un message (implicite) au développeur qui utiliserait votre
code : le retour de cette méthode peut ne pas avoir de valeur ! Ainsi, lorsque votre méthode renvoie *forcément* une
valeur non-`null`, il n'est pas nécessaire d'utiliser `Optional`.

[ObjectsEquals]: https://docs.oracle.com/javase/7/docs/api/java/util/Objects.html#equals(java.lang.Object,%20java.lang.Object
[Optional]: https://docs.oracle.com/javase/8/docs/api/java/util/Optional.html
