
library(readxl)

df <- read_excel("mli_ehcvm1_qnr_household_excel_vague1.xls")

install.packages("skimr")

library(readxl)
library(dplyr)
library(skimr)
library(ggplot2)

# Exploration de la base
head(df)

# Résumé rapide : types, valeurs manquantes, distribution
skim(df)


sheets <- excel_sheets("mli_ehcvm1_qnr_household_excel_vague1.xls")
print(sheets)

# Lire toutes les feuilles dans une liste nommée
data_list <- lapply(sheets, function(sheet) {
  read_excel("mli_ehcvm1_qnr_household_excel_vague1.xls", sheet = sheet)
})

# Nommer les éléments de la liste avec le nom des feuilles
names(data_list) <- sheets

