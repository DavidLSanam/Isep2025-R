#Il s'agit de mon premier script R


library(dplyr)  # ou library(magrittr)


#Creation de vecteurs
x <- c(1:7)
typeof(x)
y = as.character(x)
typeof(y)

#Calculatrice

1 + 1
sum(x)
sum(y)

x1 <- c(x, NA,9)
x1
sum(x1, na.rm = TRUE)





# 1. Jeu de données
# Un jeu de données en R est souvent assimilé à un data frame, bien que le terme puisse être plus large et inclure d'autres structures comme les matrices ou les listes. Un jeu de données typique est un ensemble organisé de données, généralement sous forme de tableau avec des lignes représentant des observations et des colonnes représentant des variables.

# Exemple d'application : Analyse statistique, visualisation de données.
# Métaphore : Un tableau Excel où chaque ligne est une observation et chaque colonne une variable.
# Relation avec d'autres concepts : Un jeu de données peut être représenté par un data frame, qui est une structure de données spécifique en R.

# 2. Objets
# En R, un objet est une entité qui stocke des données. Les objets peuvent être des scalaires, des vecteurs, des matrices, des listes, des data frames, etc. Chaque objet a un type (par exemple, numérique, caractère) et peut avoir des attributs supplémentaires5.

# Exemple d'application : Stockage et manipulation de données.
# Métaphore : Un conteneur qui peut stocker différents types d'objets.
# Relation avec d'autres concepts : Les objets sont la base de toutes les structures de données en R.

# 3. Vecteurs
# Un vecteur est une liste ordonnée de valeurs du même type (numériques, logiques, caractères)3. Les vecteurs sont les structures de données les plus simples en R.

# Exemple d'application : Représentation de séries de données.
# Métaphore : Une liste ordonnée de valeurs similaires, comme une série de nombres ou de mots.
# Relation avec d'autres concepts : Les vecteurs sont utilisés pour construire des matrices et des data frames.
# Transformation courante : Utilisation de c() pour créer un vecteur.

r
# Création d'un vecteur numérique
x <- c(1, 2, 3, 4, 5)
# 4. Facteurs
# Un facteur est un type spécial de vecteur utilisé pour stocker des données catégorielles. Les facteurs sont utiles pour indiquer que certaines variables ne sont pas numériques mais plutôt catégorielles2.

# Exemple d'application : Analyse statistique de données catégorielles.
# Métaphore : Un ensemble de catégories distinctes, comme les couleurs ou les genres.
# Relation avec d'autres concepts : Les facteurs sont souvent utilisés dans les data frames pour représenter des variables catégorielles.
# Transformation courante : Utilisation de factor() pour convertir un vecteur en facteur.

r
# Création d'un facteur
couleurs <- factor(c("Rouge", "Bleu", "Vert"))
# 5. Matrices
# Une matrice est une structure de données à deux dimensions où toutes les entrées sont du même type. Les matrices sont similaires aux vecteurs mais avec deux dimensions3.

# Exemple d'application : Calculs linéaires, statistiques multivariées.
# Métaphore : Un tableau avec des lignes et des colonnes où chaque cellule contient une valeur.
# Relation avec d'autres concepts : Les matrices sont utilisées pour des opérations mathématiques avancées et peuvent être converties en data frames.
# Transformation courante : Utilisation de matrix() pour créer une matrice.

r
# Création d'une matrice
mat <- matrix(c(1, 2, 3, 4), nrow = 2)
# 6. Listes
# Une liste est une structure de données récursive qui peut contenir des objets de différents types, y compris d'autres listes2. Les listes sont très flexibles et peuvent stocker presque n'importe quel type d'objet R.

# Exemple d'application : Stockage de données complexes, modélisation d'objets réels.
# Métaphore : Un conteneur qui peut stocker différents types d'objets, comme un sac à dos.
# Relation avec d'autres concepts : Les listes sont la base des data frames et peuvent contenir des vecteurs, matrices, etc.
# Transformation courante : Utilisation de list() pour créer une liste.

r
# Création d'une liste
ma_liste <- list(a = 1, b = "deux", c = TRUE)
# 7. Data Frame
# Un data frame est une structure de données à deux dimensions, similaire à une matrice mais avec des colonnes pouvant être de différents types (numériques, caractères, facteurs)2. Les data frames sont très utilisés pour l'analyse statistique.

# Exemple d'application : Analyse de données, visualisation.
# Métaphore : Un tableau Excel où chaque colonne peut avoir un type différent.
# Relation avec d'autres concepts : Les data frames sont construits à partir de vecteurs et de facteurs.
# Transformation courante : Utilisation de data.frame() pour créer un data frame.




x <- 10L
x
typeof(x)
nom <- "Ali ce"
nchar(nom)
v <- c(1, 2, 3, 4, 5)
m <- matrix(1:9, nrow=3, ncol=3)
n <- matrix(c(1, 2, 3), c(4, 8, 4), c(9, 0, 7), nrow=3, ncol=3)
P <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow=3, ncol=3, byrow=TRUE)


print(m)
print(n)
print(P)

ma_liste <- list(42, "Bonjour", TRUE, c(1,2,3))
print(ma_liste)
ma_liste[[2]]





#Vecteur logique(logical)
x_log <- c(TRUE, FALSE, TRUE, FALSE)
print(x_log)
print(sum(x_log))

#Vecteur complexe (complex)
x_complex <-  c(1 + i2)


#Facteur (factor)

sexe <- rep(c("homme","femme"), 7)
length(sexe)
sexe1  <- factor(sexe, ) 


list1 <- list(42, "Bonjour", TRUE, c(1,2,3))
print(list1)

list2 <- list(nombre = 42, texte = "Bonjour", logique = TRUE, vecteur = c(1,2,3))
print(list2)


#Data frame

nom_df <-  data.frame(id = 1:3, nom = c("Alice", "David", "Julia"), age = c(20, 22, 30), actif = c(TRUE, FALSE, TRUE))
print(nom_df)

print(indice <- 1 : nrow(nom_df))

#Home work
# Creer un data frame de 10 variables, en y ajoutant des facteurs (imaginer un tableau de données intéréssant, peut-être dans une classe avec des variables intéréssante)

# Création du data frame
classe <- data.frame(
  ID = 1:10,  # Identifiant ( variable de type quantitatif discret)
  Nom = c("David", "Landry", "Josée", "Marianne", "Christ", "Lamerveille", "Dyvana", "Jason", "Isabelle", "Ivana"), # Variable de type qualitatif nominal
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
is.data.frame((df))

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








