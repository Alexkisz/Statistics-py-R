# Instalar y cargar la librería agricolae


##Librerías para post hoc#####
install.packages("multcomp")
install.packages("agricolae")
install.packages("DescTools")
#######


library(multcomp)
library(agricolae)
library(DescTools)


# Crear el dataframe con los datos proporcionados
datos <- data.frame(
  conductividad = c(56, 55, 62, 59, 60, 64, 61, 50, 55, 56, 45, 46, 45, 39, 43, 42, 39, 45, 43, 41),
  recubrimiento = factor(c("I", "I", "I", "I", "I", "II", "II", "II", "II", "II", "III", "III", "III", "III", "III", "IV", "IV", "IV", "IV", "IV"))
)

# Ajustar el modelo ANOVA
modelAnova <- aov(conductividad ~ recubrimiento, data = datos)


# Aplicar el test LSD
lsd <- LSD.test(modelAnova, "recubrimiento", p.adj = "none")

print(lsd)

# Duncan test
duncan <- duncan.test(modelAnova, "recubrimiento")
print(duncan)


# Scheffé test
scheffe <- ScheffeTest(modelAnova, "recubrimiento")
print(scheffe)


# Bonferroni test
bonferroni <- pairwise.t.test(datos$conductividad, datos$recubrimiento, p.adjust.method = "bonferroni")
print(bonferroni)

# Games-Howell test
games_howell <- PostHocTest(modelAnova, method = "games-howell")
print(games_howell)

