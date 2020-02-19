#Import packages

library(readr)
library(dplyr)

# Chargement des données
RPE <- read_csv("https://raw.githubusercontent.com/xavierbarbier/MMA/master/RPE.csv")
glimpse(RPE)

# Regroupement des données par jour

RPE<-RPE%>% group_by(Jour)%>% summarise_all(funs(sum))

# Définition factor pour  classement jour sur le graphique
RPE$Jour <- factor(RPE$Jour, levels = c("Lundi", "Mardi", "mercredi", "jeudi", "vendredi", "samedi", "Dimanche"))

# Graphique semaine type
ggplot(RPE, aes(x=as.factor(Jour), y = charge )) +
  geom_bar(color="black", fill="blue",stat = "identity" ) +
  xlab("Jour") + ylab("Chage d'entrainement quotidienne (UA)")
  
