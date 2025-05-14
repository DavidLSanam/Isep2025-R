# Liste des packages utiles pour R Markdown et ses extensions
packages <- c(
  "rmarkdown",    # Base pour rendre les documents
  "knitr",        # Exécution des chunks de code
  "tinytex",      # Pour générer des PDF via LaTeX
  "flexdashboard",# Pour créer des dashboards
  "bookdown",     # Pour rédiger des livres ou longs rapports
  "blogdown",     # Pour créer des sites web avec Hugo
  "xaringan",     # Pour faire des présentations style HTML
  "shiny",        # Pour ajouter de l'interactivité
  "tidyverse"     # Outils de manipulation et visualisation des données (souvent utilisés avec R Markdown)
)

# Installer les packages manquants
install_if_missing <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg)
  }
}

# Installation
invisible(lapply(packages, install_if_missing))

# Installer TinyTeX (nécessaire pour exporter en PDF)
if (!tinytex::is_tinytex()) {
  tinytex::install_tinytex()
}




# ==========================================================
# R Markdown – Propriétés des chunks (résumé dans un script)
# ==========================================================

# Chaque chunk R Markdown commence par :
# ```{r nom_du_chunk, option1=valeur1, option2=valeur2}
# ... code ...
# ```

# Ci-dessous, on illustre chaque option avec des exemples.

# ----------------------------
# Afficher ou masquer le code
# ----------------------------

# echo = FALSE : ne montre pas le code dans le document final
# ```{r, echo=FALSE}
# summary(cars)
# ```

# echo = TRUE : montre le code (valeur par défaut)
# ```{r, echo=TRUE}
# summary(cars)
# ```

# -------------------------
# Exécuter ou ignorer le code
# -------------------------

# eval = FALSE : le code ne sera pas exécuté
# ```{r, eval=FALSE}
# plot(1:10)
# ```

# -------------------------
# Affichage des messages et warnings
# -------------------------

# message = FALSE : supprime les messages (ex : message de chargement de package)
# ```{r, message=FALSE}
# library(ggplot2)
# ```

# warning = FALSE : supprime les avertissements
# ```{r, warning=FALSE}
# log(-1)
# ```

# -------------------------
# Affichage du chunk complet ou non
# -------------------------

# include = FALSE : ne montre ni le code ni les résultats (mais exécute le chunk)
# Utile pour charger des packages ou faire des calculs préparatoires
# ```{r, include=FALSE}
# library(dplyr)
# ```

# -------------------------
# Contrôle de la sortie
# -------------------------

# results = 'hide' : ne montre pas les résultats du chunk
# ```{r, results='hide'}
# summary(iris)
# ```

# results = 'asis' : interprète les résultats comme du texte brut Markdown
# ```{r, results='asis'}
# cat("### Résultat personnalisé\nVoici un tableau :\n")
# ```

# -------------------------
# Mise en forme des graphiques
# -------------------------

# fig.width et fig.height : dimensions de la figure (en pouces)
# ```{r, fig.width=6, fig.height=4}
# hist(rnorm(100))
# ```

# fig.align = 'center' : centre le graphique
# ```{r, fig.align='center'}
# plot(cars)
# ```

# out.width = '50%' : ajuste la largeur de l’image dans le document HTML/PDF
# ```{r, out.width='50%'}
# knitr::include_graphics("photo.jpg")
# ```

# -------------------------
# Mise en cache
# -------------------------

# cache = TRUE : mémorise les résultats du chunk pour accélérer les recompilations
# ```{r, cache=TRUE}
# Sys.sleep(2); mean(rnorm(1e6))
# ```

# -------------------------
# Tidy : indentation automatique du code
# -------------------------

# tidy = TRUE : améliore l’indentation automatique du code
# ```{r, tidy=TRUE}
# a<-function(x){x+1}
# ```

# -------------------------
# Chunk global d'initialisation (optionnel)
# -------------------------

# Ce chunk s'appelle généralement setup
# ```{r setup, include=FALSE}
# knitr::opts_chunk$set(
#   echo = TRUE,
#   message = FALSE,
#   warning = FALSE,
#   fig.align = "center"
# )
# ```

# ==========================
# Fin du résumé
# ==========================





Dans R Markdown, les variables définies dans un chunk peuvent être modifiées dans un chunk suivant. R garde en mémoire les objets créés tout au long de l’exécution du document.

Ce mini-cours présente comment :
  - définir une variable,
- modifier sa valeur,
- l’afficher après modification.

---
  
  ## 1. Définir une variable
  
  ```{r definition}
# Définition initiale de la variable x
x <- 10
# Affichage de sa valeur
cat("Valeur initiale de x :", x)


# Modification de la variable
x <- x + 5
# Affichage de la nouvelle valeur
cat("Nouvelle valeur de x après modification :", x)


# Utilisation de la valeur modifiée
resultat <- x * 2
cat("Le double de la nouvelle valeur de x est :", resultat)








