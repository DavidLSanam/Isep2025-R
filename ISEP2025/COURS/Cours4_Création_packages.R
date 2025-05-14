# Packages

base <- data("CO2")
View("CO2")
head("CO2")


# Importer une base de données

#install.packages("readxl")
#install.packages("readr")
library(readr)
library(readxl)
library(haven)
library(dplyr)
data <- read_excel("regime.xlsx")

write_dta(data, "regime.dta")
write_dta(CO2, "CO2_export.dta")
install.packages("foreign")


#Renommer des variables dans un data frame
library(dplyr)

df <- df %>%
  rename(
    nouveau_nom1 = ancien_nom1,
    nouveau_nom2 = ancien_nom2
  )



prime_number <- function(n) {
  if (n <= 1) return(FALSE)
  if (n == 2) return(TRUE)
  for (i in 2:floor(sqrt(n))) {
    if (n %% i == 0) return(FALSE)
  }
  return(TRUE)
}










CO2 %>%
  filter(Treatment == "chilled") %>%
  group_by(Type) %>%
  summarise(mean_uptake = mean(uptake))

library(dplyr)

CO2 %>%
  filter(Type == "Quebec") %>%
  group_by(Treatment, conc) %>%
  summarise(mean_uptake = mean(uptake)) %>%
  arrange(desc(mean_uptake))




