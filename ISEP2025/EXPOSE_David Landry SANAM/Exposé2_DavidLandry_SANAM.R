# Installer les packages si nécessaire
packages <- c("tidyverse", "haven", "labelled", "sjPlot", "psych", "GGally", "broom")
install_if_missing <- function(p) if (!require(p, character.only = TRUE)) install.packages(p)
lapply(packages, install_if_missing)

# Charger les bibliothèques
library(tidyverse)
library(haven)
library(labelled)
library(sjPlot)
library(psych)
library(GGally)
library(broom)


# Définir le répertoire
setwd("C:\\Users\\DAVID\\Desktop\\PARCOURS ISE\\ISEP\\ISEP2_2024_2025\\SEMESTRE 2\\INFORMATIQUE\\PROGRAMMATION AVEC R\\ISEP2025\\ISEP2025\\EXPOSE_David Landry SANAM")  # <-- à modifier selon ton répertoire

# Charger les données
section0 <- read_dta("s00_me_SEN2018.dta")  # Identification des ménages
section1 <- read_dta("s01_me_SEN2018.dta")  # Caractéristiques sociodémographiques
section2 <- read_dta("s02_me_SEN2018.dta")  # Éducation
section4 <- read_dta("s04_me_SEN2018.dta")  # Emploi


# Créer un identifiant unique par individu
section1 <- section1 %>%
  mutate(id_ind = paste(vague, grappe, menage, s01q00a, sep = "_"))

section2 <- section2 %>%
  mutate(id_ind = paste(vague, grappe, menage, s01q00a, sep = "_"))

section4 <- section4 %>%
  mutate(id_ind = paste(vague, grappe, menage, s01q00a, sep = "_"))

# Fusionner les sections individuelles (1, 2, 4)
individus <- section1 %>%
  left_join(section2, by = "id_ind") %>%
  left_join(section4, by = "id_ind")

# Ajouter les caractéristiques du ménage (section 0) en identifiant par ménage
section0 <- section0 %>%
  mutate(id_menage = paste(vague, grappe, menage, sep = "_"))

individus <- individus %>%
  mutate(id_menage = paste(vague.x, grappe.x, menage.x, sep = "_")) %>%
  left_join(section0, by = "id_menage")



# Recodage sexe
individus <- individus %>%
  mutate(sexe = factor(s01q01, levels = c(1, 2), labels = c("Homme", "Femme")))

# Recode du niveau d'éducation (s02q29)
individus <- individus %>%
  mutate(niv_instruction = case_when(
    is.na(s02q29) ~ "Non déclaré",
    s02q29 == 1 ~ "Maternelle",
    s02q29 == 2 ~ "Primaire",
    s02q29 %in% 3:6 ~ "Secondaire",
    s02q29 %in% 7:8 ~ "Supérieur"
  )) %>%
  mutate(niv_instruction = factor(niv_instruction,
                                  levels = c("Maternelle", "Primaire", "Secondaire", "Supérieur", "Non déclaré")))


# Recode statut d’emploi (actif occupé / chômeur / inactif)
individus <- individus %>%
  mutate(situation_emploi = case_when(
    s04q27 == 1 ~ "Actif occupé",
    s04q15 == 1 ~ "Chômeur",
    TRUE ~ "Inactif"
  )) %>%
  mutate(situation_emploi = factor(situation_emploi, levels = c("Actif occupé", "Chômeur", "Inactif")))



