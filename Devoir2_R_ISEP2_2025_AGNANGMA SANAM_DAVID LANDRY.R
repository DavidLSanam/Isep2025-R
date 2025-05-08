# HOMEWORK

# 1. Créer des fonctions avec if, ifelse, for, foreach, which, while

# Fonction qui dit si un nombre est pair ou impair
pair_ou_impair <- function(x) {
  if (x %% 2 == 0) {
    return("Pair")
  } else {
    return("Impair")
  }
}

# Utilisation de ifelse
valeurs <- 1:10
ifelse(valeurs %% 2 == 0, "Pair", "Impair")

# Boucle for
for (i in 1:5) {
  print(i^2)
}

# Boucle while
i <- 1
while (i <= 5) {
  print(i)
  i <- i + 1
}

# which
vec <- c(3, 7, 1, 9)
which(vec > 5)  # retourne les positions


# 2. Recherche de nombres premiers
est_premier <- function(n) {
  if (n <= 1) return(FALSE)
  for (i in 2:sqrt(n)) {
    if (n %% i == 0) return(FALSE)
  }
  return(TRUE)
}

# Afficher les nombres premiers de 1 à 100
nombres_premiers <- function(limite) {
  for (i in 1:limite) {
    if (est_premier(i)) {
      print(i)
    }
  }
}
nombres_premiers(100)


# 3. Résoudre une équation simple : ax + b = 0

resoudre_equation_simple <- function(a, b) {
  if (a == 0) {
    if (b == 0) return("Infinité de solutions")
    else return("Aucune solution")
  }
  return(-b/a)
}

resoudre_equation_simple(2, -4)

# 4. Résoudre un système d’équations

resoudreSysteme <- function() {
  A <- matrix(c(2, 3, 1, -1), nrow=2)
  B <- c(5, -1)
  sol <- solve(A, B)
  return(sol)
}

# 5. Problème d’optimisation (gradient, hessien)

optimisation <- function() {
  f <- function(x) x[1]^2 + x[2]^2 + x[1]*x[2]
  
  gradient <- function(x) {
    c(2 * x[1] + x[2], 2 * x[2] + x[1])
  }
  
  result <- optim(
    par = c(2, 2), 
    fn = f, 
    gr = gradient,
    method = "BFGS"
  )
  
  return(result$par)
}

# Lancer l'optimisation
minimum <- optimisation()
cat("Le point où le minimum est atteint :\n")
print(minimum)


# 6. Inverser une matrice

M <- matrix(c(2, 1, 1, 3), nrow = 2)
inverse_M <- solve(M)
inverse_M

# 7. Étude de cas - opérations de base (primaire)

addition <- function(a, b) a + b
soustraction <- function(a, b) a - b
multiplication <- function(a, b) a * b
division <- function(a, b) if (b != 0) a / b else "Division par zéro"

# Exemple d'utilisation :
addition(5, 3)
soustraction(10, 4)
multiplication(6, 7)
division(20, 4)







