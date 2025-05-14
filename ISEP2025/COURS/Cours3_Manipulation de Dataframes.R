#Cours3 : Manipulation de Data frame

# Création du data frame
classe <- data.frame(
  ID = 1:10,  # Identifiant ( variable de type quantitatif discret)
  Nom = c("David", "Landry", "Isabelle", "Marianne", "Christ", "Lamerveille", "Dyvana", "Jason", "Josée", "Ivana"), # Variable de type qualitatif nominal
  Age = c(22, 22, 23, 20, 20, 21, 21, 26, 23, 22),  # Quantitatif discret
  Moyenne = c(16.5, 16.2, 15.8, 17.2, 11.5, 15.3, 13.4, 9.7, 14.8, 12.9),  # Quantitatif continu
  Sexe = factor(c("Homme", "Homme", "Femme", "Femme", "Homme", "Femme", "Femme", "Homme", "Femme", "Femme")),  # Facteur nominal
  Sport = factor(c("Basket", "Football", "Handball", "Basket", "Natation", "Football", "Tennis", "Natation", "Basket", "Football")), # Facteur nominal
  Niveau = factor(c("Intermédiaire", "Avancé", "Intermédiaire", "Avancé", "Débutant", "Intermédiaire", "Débutant", "Avancé", "Intermédiaire", "Débutant"), 
                  levels = c("Débutant", "Intermédiaire", "Avancé"), ordered = TRUE),  # Facteur ordinal
  Présences = c(90, 85, 95, 80, 88, 92, 87, 96, 84, 91),  # Variable de type quantitatif discret
  Redoublant = factor(c("Non", "Non", "Non", "Non", "Oui", "Non", "Non", "Non", "Oui", "Non")),  # Facteur nominal
  Note_Math = c(18, 20, 15, 16, 12, 15, 20, 8, 13, 14)  # Variable de type quantitatif discret
)

# Affichage du data frame
print(classe)
is.data.frame((classe))

#Opérations

moyenne_classe <- classe$Moyenne %>% mean() %>% round(2)
moyenne_classe <- classe$Moyenne |> mean() |> round(2)


moyenne_classe

if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
library(dplyr)


classe_seq <- classe$Nom[seq(1, 10, by = 2)]
classe_seq




# Créons la donnée.Un un data frame avec des listes comme colonnes
df <- data.frame(
  Nom = c("Alice", "Bob", "Charlie"),
  Notes = I(list(c(85, 90, 88), c(92, 95, 89), c(78, 82, 80)))
)

print(df)


mon_array <- array(1:24, dim = c(2, 3, 4)) 
print(mon_array)

is.data.frame((mon_array))

dim(classe)
classe$moyenne_classe <- moyenne_classe
classe$moyenne_classee <- NULL
table(classe$Sexe)


classe[classe$Moyenne < 17, ]

classe$Redoublant2 <- rep(c("O", "N"),10)


