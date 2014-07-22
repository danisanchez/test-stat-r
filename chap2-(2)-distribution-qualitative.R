# Chapitre 2 distribution des valeurs d'une variable qualitative
# 2.4.5 variable qualitative page 103
# 2.4.6 Limite entre aspect quantitatif et qualitatif d'une variable page 105
# 2.5.3 Tableau de contingence pour une ou deux variables

setwd("./R/test-stat-r")
# import du fichier mais
mais <- read.table("./mais/mais.txt", header = TRUE)

plot(mais$Enracinement, ylab = "Nombre de pieds de maïs (effectif)",
        main = "Enracinement", cex.main = 2, cex.axis = 1.5, 
        cex.lab = 1.5, cex = 1.5)

# Ordonner les classes d'une variable ordinale
enracinement.5 <- ordered(mais$Enracinement, levels = c("Faible", "Moyen", "Fort", "Tres.fort"))
plot(enracinement.5, ylab = "Nombre de pieds de maïs (Effectifs)",
     main = "Enracinement", cex.main = 2, cex.axis = 1.5, cex.lab = 1.5, cex = 1.5)

# Représentation intervals
plot(c(150, 250, 400), c(10, 70, 17), type = "h",
     xlab = "Hauteur (cm)", ylab = "Nombre de pied de maïs (effectif)",
     lwd = 10, cex.axis = 1.5, cex.lab = 1.5, cex = 1.5, bty = "l")

# 2.5.3 Tableau de contingence pour une ou deux variables
table6 <- table(mais$Couleur, mais$Enracinement)
# Pour le tableau de contingence page 108
table6 <- table(ordered(mais$Couleur, levels = c("Jaune", "Rouge", "Jaune.rouge")),
                ordered(mais$Enracinement, levels = c("Faible", "Moyen", "Fort", "Tres.fort")))
addmargins(table6)

# Pour la somme totale
margin.table(table6)
# Pour la somme des lignes
margin.table(table6, 1)
# Pour la somme des colonnes
margin.table(table6, 2)