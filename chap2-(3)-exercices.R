# Chapitre 2 Série d'exercices
# chargement du fichier
setwd("./R/test-stat-r")
mais <- read.table("./mais/mais.txt", header = TRUE)

# Exercices 1 - Reproduire la figure 3 page 105
hist(mais$Hauteur, freq = TRUE, breaks = c(100,200,300,400,500), main = NULL,
     xlab = "Hauteur (cm)", ylab = "Nombre de pieds",
     cex.lab = 1.5, cex.axis = 1.5)

# Exercice 2 - Reproduire la figure 4 page 110
# Graphique de la variable "Hauteur" avec stripchart()
par(cex.axis = 1.5, cex.lab = 1.5, bty = "n")
stripchart(na.omit(mais$Hauteur), pch = 16, at = 0.65, xlab = "Hauteur (cm)")
stripchart(mean(mais$Hauteur, na.rm = TRUE), add = TRUE, pch = "x", cex = 2.5, at = 0.65)
abline(v = median(mais$Hauteur, na.rm = TRUE), lty = "89", lwd = 2)
abline(v = quantile(mais$Hauteur, probs = 0.25, na.rm = TRUE), lty ="44", lwd = 2)

# Même graphique avec la variable "Nombre de grains" sur la parcelle Nord
Obs1 <- mais$Nb.grains[which(mais$Parcelle == "Nord")] # which() permet de choisir les individus dans la parcelle nord
par(cax.axis = 1.5, cex.lab = 1.5, bty = "n")
stripchart(na.omit(Obs1), pch = 16, at = 0.65, xlab = "Nombre de grains sur Nord")
stripchart(mean(Obs1, na.rm = TRUE), add = TRUE, pch = "x", cex = 2.5, at = 0.65)
abline(v = median(Obs1, na.rm = TRUE), lty = "89", lwd = 2)

# description statistique des 10 première variable
summary(mais[,2:11])
# variances pour les variable quantitatives
sapply(mais[,2:5], sd, na.rm = TRUE)^2
# ecarts types pour les variables quantitatives
sapply(mais[,2:5], sd, na.rm = TRUE)
# coefficient de corrélation de Pearson
# on peut remplacer method par spearman ou kendall
cor(mais[,2:5], use = "pairwise.complete.obs", method = "pearson")  

# graph de distribution des individus
par(mfrow = c(4,3)) # permet d'avoir 4x3 graphiques sur la même fenêtre
for (i in 2:5){hist(mais[,i], xlab = "", ylab = "Effectifs", 
                    main= names(mais)[i], cex.axis = 1.5, cex.lab = 1.5)}
for (i in 6:11){plot(mais[,i], ylab = "Effectifs", main = names(mais)[i],
                        cex.axis = 1.5, cex.lab = 1.5, cex = 1.5)}