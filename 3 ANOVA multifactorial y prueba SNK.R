

library(multcomp)
library(agricolae)
library(DescTools)



library(lmtest)


library(nortest)


library(readxl)


library(ggplot2)


datos <- data.frame(
  Marca = factor(c("B", "c", "A", "D", "D", "C", "B", "A", "A", "B", "D", "C", "C", "D", "B", "A")),
  Carros = factor(c("I", "I", "I", "I", "II", "II", "II", "II", "III", "III", "III", "III", "IV", "IV", "IV", "IV")),
  Desgaste = c(14, 12, 17, 13, 11, 12, 14, 14, 13, 13, 11, 10, 9, 9, 8, 13)
)



# Ajustar el modelo ANOVA con dos factores y su interacción
modelAnova1 <- aov(Desgaste ~ Carros, data = datos)

# Ver los resultados del ANOVA
summary(modelAnova1)

# Ajustar el modelo ANOVA con dos factores y su interacción
modelAnova2 <- aov(Desgaste ~ Marca, data = datos)

# Ver los resultados del ANOVA
summary(modelAnova2)


modelAnova3 <- aov(Desgaste ~ Marca+Carros, data = datos)

summary(modelAnova3)



modelAnova4 <- aov(Desgaste ~ Carros+Marca, data = datos)

summary(modelAnova4)


##Test SNK

resultados_SNK <- SNK.test(modelAnova3, "Marca", group=TRUE)
print(resultados_SNK)


#Comprobación de homostacidad
bptest(modelAnova3)


#Comprobación de distribución normal

residuos <- residuals(modelAnova3)

ad.test(residuos)






modelAnova4 <- aov(Desgaste ~ (Marca*Carros), data = datos)

summary(modelAnova4)



