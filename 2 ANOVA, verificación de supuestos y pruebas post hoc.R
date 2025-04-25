
library(lmtest)


library(nortest)


library(readxl)


# Crear el dataframe con los datos proporcionados
datos <- data.frame(
  Marca = factor(c("A", "A", "D", "D", "A", "A", "B", "C", "D", "C", "B", "B", "A", "D", "B", "C")),
  Carros = factor(c("I", "I", "I", "I", "II", "II", "II", "II", "III", "III", "III", "III", "IV", "IV", "IV", "IV")),
  Desgaste = c(12, 17, 13, 11, 14, 13, 14, 12, 10, 11, 14, 13, 13, 9, 8, 9)
)

# Ajustar el modelo ANOVA con dos factores y su interacción
modelAnova1 <- aov(Desgaste ~ Carros, data = datos)

# Ver los resultados del ANOVA
summary(modelAnova1)

# Ajustar el modelo ANOVA con dos factores y su interacción
modelAnova2 <- aov(Desgaste ~ Marca, data = datos)

# Ver los resultados del ANOVA
summary(modelAnova2)



# Ajustar el modelo ANOVA con dos factores y su interacción
modelAnova3 <- aov(Desgaste ~ Marca+Carros, data=datos) 

# Ver los resultados del ANOVA
summary(modelAnova3)

