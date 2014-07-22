# Chapitre 2 exemple fonction R hist()
# 2.4.4.4 fonction hist() page 102

setwd("./R/test-stat-r")
# import du fichier mais
mais <- read.table("./mais/mais.txt", header = TRUE)

par(mfrow=c(1,2)) # Affiche deux paragraphe sur la même fenêtre graphique
hist(mais$Hauteur, freq = TRUE, main = NULL, 
     xlab = "Hauteur (cm)", ylab = "Nombre de pieds de maïs (effectifs)",
     cex.lab = 1.5, cex.axis = 1.5)
hist(mais$Hauteur, freq = FALSE, main = NULL,
     xlab = "Hauteur (cm)", ylab = "Nombre de pieds de maïs (effectifs)",
     cex.lab = 1.5, cex.axis = 1.5)[]
# Ajouter [] après la parenthèse pour obtenir les informations sur l'histogramme


# L'argument plot=FALSE évite de tracer l'histogramme. L'argument freq n'est alors
# plus nécessaire puisque les effectifs sont données par $count et densité par $density
n <- sum(hist(mais$Hauteur, plot = FALSE)$count)
frequences1 <- hist(mais$Hauteur, plot = FALSE)$count / n
frequences1

# Diff() réalise la différence entre les valeurs de $breaks, qu'on multiplie par les densités
frequences2 <- diff(hist(mais$Hauteur, plot = FALSE)$breaks) * hist(mais$Hauteur, plot = FALSE)$density
frequences2

# Attention ce code ne peut être utilisé que si les classes de l'histogramme sont
# équivalentes. Dans d'autre cas, employer l'argument width de barplot() pour définir
# la largeur de chaque barre
barplot(frequences2, space = 0, col = "white", 
        xlab = "Hauteur (cm)", ylab = "Propostion de pieds de maïs",
        cex.lab = 1.5, cex.axis = 1.5, bty = "l")
axis(side = 1, at = 0.5 : (length(frequences2)-0.5), 
     labels = hist(mais$Hauteur, plot = FALSE)$mids, cex.axis = 1.5)