## Introduction EHCVM data 
malidata <- '/Users/mouhamadoudiallo/Library/CloudStorage/OneDrive-AKADEMIYA2063/EHCVM UEMOA/EHCVM uemoa men/MLI2018_menage'
listfile <- list.files(malidata)
print(listfile)

## Open first section 
library(haven)
library(tidyverse)
s00_me_MLI2018 <- read_dta(paste0(malidata,"/s00_me_MLI2018.dta"))
glimpse(s00_me_MLI2018)
s00_me_MLI2018$hh_id <- paste0(10*s00_me_MLI2018$grappe,
                               s00_me_MLI2018$menage)
s00_me_MLI2018$hh_id2 <- paste0(s00_me_MLI2018$grappe,
                               s00_me_MLI2018$menage)

length(unique(s00_me_MLI2018$hh_id))
length(unique(s00_me_MLI2018$hh_id2))
hh_id2b <- unique(s00_me_MLI2018$hh_id2)


base_id1 <- s00_me_MLI2018 %>% 
  select(grappe, menage, hh_id,hh_id2)  %>% 
  mutate(t1 = 1)  %>% 
  group_by(hh_id2) %>% filter(n()>1)  %>%
  arrange(hh_id2,grappe, menage)

# base_id <- s00_me_MLI2018 %>% 
#   select(grappe, menage, hh_id,hh_id2)  %>% 
#   mutate(t1 = 1)  %>% 
#   group_by(hh_id2) %>% 
#   mutate(t2=1) 

glimpse(base_id)




tab <- s00_me_MLI2018 %>% 
  filter(!(hh_id %in% hh_id2) ) %>%
  select(grappe, menage, hh_id,hh_id2) 


## Homework 
# Taille et composition des ménages
# → Analyser la taille moyenne des ménages et la structure par âge/genre.
  ## Section_1 : s01_me_MLI2018.dta

# Taux d'alphabétisation
# → Calculer le pourcentage d’individus alphabétisés (3 ans et plus).
 ## s02_me_MLI2018.dta

# Niveau d'éducation atteint
# → Répartition des niveaux d'éducation par tranche d’âge ou par sexe.
# Accès aux soins de santé
# → Proportion de personnes ayant consulté un centre de santé en cas de maladie.

# Taux d'emploi
# → Calcul du taux d'emploi principal et secondaire chez les 15-64 ans.
# 
# Types d'activités génératrices de revenus hors emploi
# → Répartition des sources de revenus hors emploi (locations, transferts, etc.).
# 
# Accès au crédit
# → Part des ménages ayant eu un crédit dans les 12 derniers mois.
# 
# Consommation alimentaire
# → Nombre moyen de repas pris à l’extérieur par ménage au cours des 7 derniers jours.
# 
# Dépenses alimentaires
# → Montant moyen des dépenses alimentaires hebdomadaires.
# 



      # Indice de sécurité alimentaire
      # → Calcul de scores FIES (Food Insecurity Experience Scale).
      # 
      # Transferts reçus
      # → Pourcentage des ménages ayant reçu des aides sociales ou transferts privés.
# 
# Chocs économiques récents
# → Pourcentage de ménages ayant subi un choc économique au cours des 12 derniers mois.
# 
# Stratégies de survie post-COVID
# → Analyse des stratégies utilisées en réponse aux impacts de la COVID-19.
# 
# Existence d’entreprises non agricoles
# → Proportion de ménages ayant au moins une activité non agricole.
# 
# Équipements agricoles
# → Taux de possession d’équipements agricoles par ménage agricole.
# 
# Élevage
# → Types et nombre moyen d’animaux détenus par ménage.
# 
# Pauvreté subjective
# → Analyse de la perception de pauvreté selon les quintiles de dépenses.