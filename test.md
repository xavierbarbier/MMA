Durée du combat au MMA
================

## Installation

Exemple avec l’European Beatdown

Xavier Barbier - Twitter : @xavbarbier

Février 2020

``` r
# import des packages
install.packages("ggplot2")
```

    ## Installing package into '/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6'
    ## (as 'lib' is unspecified)

``` r
install.packages("readr")
```

    ## Installing package into '/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6'
    ## (as 'lib' is unspecified)

``` r
install.packages("ggpubr")
```

    ## Installing package into '/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6'
    ## (as 'lib' is unspecified)

``` r
install.packages("lubridate")
```

    ## Installing package into '/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6'
    ## (as 'lib' is unspecified)

``` r
install.packages("rmarkdown")
```

    ## Installing package into '/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6'
    ## (as 'lib' is unspecified)

``` r
library(ggplot2)
library(readr)
library(ggpubr)
```

    ## Loading required package: magrittr

``` r
library(lubridate)
```

    ## 
    ## Attaching package: 'lubridate'

    ## The following object is masked from 'package:base':
    ## 
    ##     date

``` r
library(rmarkdown)
```

## 1\) Question d’intérêt / énoncé du problème

1)  Quelle est la durée du combat en MMA ?

NOTES :

A l’UFC il semble la durée effective de combat ne soit pas la même selon
la catégorie Les catégories de poids légères semblent avoir une durée de
combat plus longue que les catégories de poids plus lourdes

## 2\) Les données

Les données ont été obtenues grâce au site Tapology.

### Visualisation du data frame

``` r
# import des données
EBD <- read_csv("https://raw.githubusercontent.com/xavierbarbier/MMA/master/EBD.csv", 
    col_types = cols(duree = col_time(format = "%H:%M:%S")))
ggtexttable(head(EBD,10),rows = NULL)
```

![](test_files/figure-gfm/unnamed-chunk-2-1.png)<!-- --> \* Ils y a 83
observations pour lesquelles nous avons les variables suivantes : EDB,
durée, résultat et catégorie.

### Recherche des données manquantes

``` r
# Recherche des NA
sum(is.na(EBD$ebd))
```

    ## [1] 0

``` r
sum(is.na(EBD$duree))
```

    ## [1] 0

``` r
sum(is.na(EBD$resultat))
```

    ## [1] 0

``` r
sum(is.na(EBD$categorie))
```

    ## [1] 0

  - Il n’y pas de besoins de nettoyage ou de correction des données

## 3\) Visualisation et résumé des données

### Analyse de l’ensemble des combats

#### Durée moyenne (min)

``` r
mean(as.duration(EBD$duree))/60
```

    ## [1] 8.180321

#### Distribution durée du combat

``` r
# Histogramme distribution durée du combat EBD

ggplot(EBD, aes(x=duree)) + geom_histogram(binwidth = 100) + theme_classic() + ggtitle ("EBD - Fin du combat")
```

![](test_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

#### Durée du combat

``` r
# graphique en boite durée du combat EBD
ggplot(data=EBD, aes( y = duree)) +  geom_boxplot()+ theme_classic() + ggtitle("EBD - Durée du combat")+ coord_flip()
```

![](test_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

### Analyse par catégorie

### Durée du combat selon catégorie

``` r
ggplot(data=EBD, aes(x = categorie, y = duree)) +  geom_boxplot(aes(fill=categorie))+ theme_classic() + ggtitle("Durée du combat selon catégorie")+coord_flip()  +
  xlab("M/F:Catégorie(lbs)") + ylab("Durée (min:sec)") + geom_jitter(shape=2, position=position_jitter(0.2)) + theme(legend.text = element_text(size = 13),
                                                                                                                     strip.text.x = element_text(size = 15, face = "bold"),
                                                                                                                     axis.title.y = element_text(color="black", size = 15, vjust=1.5),
                                                                                                                     axis.title.x = element_text(color="black", size = 15),
                                                                                                                     axis.line.y = element_line(colour = "black")) 
```

![](test_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

## 4\) Interpretation des résultats

  - Durée moyenne de 8 min et 20 sec
  - La moyenne n’est pas une valeur de tendance centrale au regard de la
    distribution non symétrique.
  - L’espace interquartile est trop important au regard de la durée du
    combat pour renseigner entraineurs et combattants sur la durée réél
    du combat pour leurs catégories.
  - Une analyse par catégorie semble plus précise.
  - Même si l’espace interquartile reste important, la médiane par
    catégorie semble plus indicative de la durée réel du combat.

## 5\) Conclusion

  - L’objectif de cette analyse était de déterminer sur les informations
    de l’UFC sur la durée du combat étaient utilisable pour d’autre
    niveau de compétition. Pour la durée moyenne, la réponse est non
    (sous réserve que l’UFC ait utilisée la médiane et non la moyenne).
    Les combats semblent plus long à l’UFC.

  - Concernant la tendance à une relation entre la catégorie de poids et
    la durée du combat, la réponse est plutôt oui. Les observations des
    données de l’EBD semblent confirmer les tendances observées à l’UFC.
    Les catégories de poids plus légères semblent avoir des durées de
    combat plus importantes.

  - es entraîneurs seraient avisés de prendre en compte la durée type
    selon la catégorie de poids pour construire une stratégie. Celles-ci
    étant particulièrement grande en relation avec la durée maximale du
    combat ( 3 x 5 min).
