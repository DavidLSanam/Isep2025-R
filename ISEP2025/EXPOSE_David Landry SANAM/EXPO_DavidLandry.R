library(tidyverse)
library(haven)
library(labelled)

# Chargement des données
s01 <- read_dta("s01_me_SEN2018.dta")  # Caractéristiques sociodémographiques
s02 <- read_dta("s02_me_SEN2018.dta")  # Éducation
s04 <- read_dta("s04_me_SEN2018.dta")  # Emploi

# Création de l'identifiant unique dans chaque base
s01 <- s01 %>% mutate(id_ind = paste(vague, grappe, menage, s01q00a, sep = "_"))
s02 <- s02 %>% mutate(id_ind = paste(vague, grappe, menage, s01q00a, sep = "_"))
s04 <- s04 %>% mutate(id_ind = paste(vague, grappe, menage, s01q00a, sep = "_"))

# Création de la variable âge dans s01
s01 <- s01 %>%
  mutate(age = case_when(
    !is.na(s01q03c) & s01q03c < 9999 ~ 2019 - s01q03c,                # Année de naissance valide
    (is.na(s01q03c) | s01q03c == 9999) & !is.na(s01q04a) ~ s01q04a,  # Sinon utiliser s01q04a
    (is.na(s01q03c) | s01q03c == 9999) & is.na(s01q04a) & !is.na(s01q04b) ~ s01q04b,
    TRUE ~ NA_real_                                                  # Sinon NA
  ))

# Vérification rapide
summary(s01$age)

# Fusion des bases de données
individus <- s01 %>%
  left_join(s02, by = "id_ind") %>%
  left_join(s04, by = "id_ind")

# Filtrage des individus âgés de plus de 5 ans
individus <- individus %>%
  filter(age > 5)

sum(is.na(individus$s02q29))
sum(is.na(individus$s02q03 == "Oui"))


table(individus$s02q03, useNA = "ifany")
table(individus$s02q03, is.na(individus$s02q29))


# Remplacement des valeurs spécifiques (9999 et "Aucun")
individus <- individus %>%
  mutate(
    annee_derniere_scolarisation = ifelse(s02q32 == 9999, NA, s02q32),
    diplome_obtenu = ifelse(s02q33 == 0, NA, s02q33)
  )

# On regroupe ceux ayant été scolarisés
scolarises <- individus %>%
  filter(s02q03 == 1)

# Apperçu rapide

summary(scolarises$s02q30)  # Filière
summary(scolarises$s02q31)  # Dernière classe
summary(scolarises$annee_derniere_scolarisation)
table(scolarises$s02q33, useNA = "ifany")  # Diplôme brut
table(scolarises$diplome_obtenu, useNA = "ifany")  # Diplôme filtré


# Création de l'indicateur synthétique "diplômé"

individus <- individus %>%
  mutate(est_diplome = case_when(
    s02q03 == 2 ~ "Jamais scolarisé",
    is.na(s02q33) | s02q33 == 0 ~ "Sans diplôme",
    TRUE ~ "Avec diplôme"
  ))

# Niveau d'éducation

individus <- individus %>%
  mutate(niveau_educatif_diplome = case_when(
    s02q03 == 2 ~ "Jamais scolarisé",
    s02q03 == 1 & is.na(s02q29) ~ "Scolarisé non renseigné",
    s02q29 %in% c(1, 2) & s02q33 != 0 ~ "Primaire diplômé",
    s02q29 %in% c(1, 2) & s02q33 == 0 ~ "Primaire sans diplôme",
    s02q29 %in% 3:6 & s02q33 != 0 ~ "Secondaire diplômé",
    s02q29 %in% 3:6 & s02q33 == 0 ~ "Secondaire sans diplôme",
    s02q29 %in% 7:8 & s02q33 != 0 ~ "Supérieur diplômé",
    s02q29 %in% 7:8 & s02q33 == 0 ~ "Supérieur sans diplôme",
    TRUE ~ NA_character_
  ))

table(individus$niveau_educatif_diplome, useNA = "ifany")



