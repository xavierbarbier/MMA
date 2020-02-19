# Import package ggplot2
library(ggplot2)

#Import des données
cmj<-read.csv("https://raw.githubusercontent.com/xavierbarbier/MMA/master/MONITORINGCMJ.csv")

# Exploration données et recherche données manquantes ou abérantes
head(cmj)
table(cmj$ID)
table(cmj$Date)
names(cmj)

# Isoler les données sur sujet 8
Sujet8<-cmj[cmj$ID=='8',]

# Calcul de la moyenne pour chaque date
Sujet8$moyenne<-round(with(Sujet8,(Saut1+Saut2+Saut3)/3),2)

# Calcul de la moyenne et écart-type pour l'ensemble des observations 
Sujet8_sauts<-c(Sujet8$Saut1, Sujet8$Saut2 ,Sujet8$Saut3)
Sujet8_moyenne<-mean(Sujet8_sauts)
Sujet8_sd<-sd(Sujet8_sauts)

# Détermination des seuils haut et bas
sd1_haut<-Sujet8_moyenne+(1*Sujet8_sd)
sd1_bas<-Sujet8_moyenne-(1*Sujet8_sd)
sd2_haut<-Sujet8_moyenne+(2*Sujet8_sd)
sd2_bas<-Sujet8_moyenne-(2*Sujet8_sd)

# Graphique sujet 8
ggplot(Sujet8, aes(x = Date, y = moyenne, group = 1)) +
  geom_point(color = "blue") +
  theme_classic()+ geom_hline(aes(yintercept = mean(Sujet8_sauts)), color = "red")+
  geom_hline(aes(yintercept = sd1_haut), linetype = "dashed")+
  geom_hline(aes(yintercept = sd1_bas), linetype = "dashed")+geom_line()+
  geom_hline(aes(yintercept = sd2_haut), linetype = "dashed", color = "red")+
  geom_hline(aes(yintercept = sd2_bas), linetype = "dashed", color = "red")+
  ggtitle("Sujet 8 - Evolution Pic de vitesse lors d'un CMJ") + xlab("Date")+ylab("Vitesse (m/s)")

# Sujet 1
Sujet1<-cmj[cmj$ID=='1',]

Sujet1$moyenne<-round(with(Sujet1,(Saut1+Saut2+Saut3)/3),2)

Sujet1_saut<-c(Sujet1$Saut1, Sujet1$Saut2 ,Sujet1$Saut3  )
Sujet1_saut
mean(Sujet1_saut)
sd(Sujet1_saut)
sd1_haut<-mean(Sujet1_saut)+(1*sd(Sujet1_saut))
sd1_bas<-mean(Sujet1_saut)-(1*sd(Sujet1_saut))
sd2_haut<-mean(Sujet1_saut)+(2*sd(Sujet1_saut))
sd2_bas<-mean(Sujet1_saut)-(2*sd(Sujet1_saut))

ggplot(Sujet1, aes(x = Date, y = moyenne, group = 1)) +
  geom_point(color = "blue") +
  theme_classic()+ geom_hline(aes(yintercept = mean(Sujet1_saut)), color = "red")+
  geom_hline(aes(yintercept = sd1_haut), linetype = "dashed")+
  geom_hline(aes(yintercept = sd1_bas), linetype = "dashed")+
  geom_hline(aes(yintercept = sd2_haut), linetype = "dashed", color = "red")+
  geom_hline(aes(yintercept = sd2_bas), linetype = "dashed", color = "red")+
  ggtitle("Sujet 1 - Evolution Pic de vitesse lors d'un CMJ") + xlab("Date")+ylab("Vitesse (m/s)")+
  geom_line()



# Sujet 7
Sujet7<-cmj[cmj$ID=='7',]

Sujet7$moyenne<-round(with(Sujet7,(Saut1+Saut2+Saut3)/3),2)

Sujet7_saut<-c(Sujet7$Saut1, Sujet7$Saut2 ,Sujet7$Saut3  )
Sujet7_saut
mean(Sujet7_saut)
sd(Sujet7_saut)
sd1_haut<-mean(Sujet7_saut)+(1*sd(Sujet7_saut))
sd1_bas<-mean(Sujet7_saut)-(1*sd(Sujet7_saut))
sd2_haut<-mean(Sujet7_saut)+(2*sd(Sujet7_saut))
sd2_bas<-mean(Sujet7_saut)-(2*sd(Sujet7_saut))

ggplot(Sujet7, aes(x = Date, y = moyenne, group = 1)) +
  geom_point(color = "blue") +
  theme_classic()+ geom_hline(aes(yintercept = mean(Sujet7_saut)), color = "red")+
  geom_hline(aes(yintercept = sd1_haut), linetype = "dashed")+
  geom_hline(aes(yintercept = sd1_bas), linetype = "dashed")+
  geom_hline(aes(yintercept = sd2_haut), linetype = "dashed", color = "red")+
  geom_hline(aes(yintercept = sd2_bas), linetype = "dashed", color = "red")+geom_line()+
  ggtitle("Sujet 7 - Evolution Pic de vitesse lors d'un CMJ") + xlab("Date")+ylab("Vitesse (m/s)")
