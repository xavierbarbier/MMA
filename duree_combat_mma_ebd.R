# import des packages
install.packages("ggplot2")
install.packages("readr")
install.packages("ggpubr")
install.packages("lubridate")
library(ggplot2)
library(readr)
library(ggpubr)
library(lubridate)


# import des données
EBD <- read_csv("https://raw.githubusercontent.com/xavierbarbier/MMA/master/EBD.csv", 
                col_types = cols(duree = col_time(format = "%H:%M:%S")))
ggtexttable(head(EBD,10),rows = NULL)

# Recherche des NA
sum(is.na(EBD$ebd))
sum(is.na(EBD$duree))
sum(is.na(EBD$resultat))
sum(is.na(EBD$categorie))

# Calcul moyenne, mediane, quartiles et espace interquatiles.
mean(EBD$duree)/60 # 8 min 
median(EBD$duree)/60 # 7 min 
quantile(EBD$duree) 
IQR(EBD$duree)/60 # 11 min 

# Histogramme distribution durée du combat toutes catégories EBD
ggplot(EBD, aes(x=duree)) + geom_histogram(binwidth = 100) + theme_classic() + ggtitle ("EBD - Fin du combat")

# graphique en boite durée du combat toutes catégories EBD
ggplot(data=EBD, aes( y = duree)) +  geom_boxplot()+ theme_classic() + ggtitle("EBD - Durée du combat")+ coord_flip()

# Histogramme distribution durée du combat selon catégories EBD
ggplot(EBD, aes(x=duree)) + facet_wrap(~categorie)+ geom_histogram(binwidth = 100) + theme_classic() + ggtitle ("EBD - Fin du combat")

# Durée du combat selon catégorie

ggplot(data=EBD, aes(x = categorie, y = duree)) +  geom_boxplot(aes(fill=categorie))+ theme_classic() + ggtitle("Durée du combat selon catégorie")+coord_flip()  +
  xlab("M/F:Catégorie(lbs)") + ylab("Durée (min:sec)") + geom_jitter(shape=2, position=position_jitter(0.2)) + theme(legend.text = element_text(size = 13),
                                                                                                                     strip.text.x = element_text(size = 15, face = "bold"),
                                                                                                                     axis.title.y = element_text(color="black", size = 15, vjust=1.5),
                                                                                                                     axis.title.x = element_text(color="black", size = 15),
                                                                                                                     axis.line.y = element_line(colour = "black")) 