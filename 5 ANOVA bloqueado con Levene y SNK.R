

library(car)

# Crear los datos en R
datos <- data.frame(
  Bloque = rep(c("I", "II", "III", "IV"), each = 3),
  Posicion = rep(c("1", "2", "3"), 4),
  Tratamiento = c("A", "B", "C", "D", "A", "B", "B", "C", "D", "C", "D", "A"),
  Valor = c(2, 1, 0, -2, 2, 2, 1, -1, -3, 0, -4, 2)
)

# Mostrar los datos
print(datos)


# Ajustar el modelo ANOVA
model <- aov(Valor ~ Tratamiento + Bloque, data = datos)

# Mostrar el resumen del ANOVA
summary(model)


# Realizar el test SNK
resultados_SNK <- SNK.test(model, "Tratamiento", group = TRUE)
print(resultados_SNK)



# Supuesto de homogeneidad de varianza
leveneTest(Valor ~ Tratamiento + Bloque, data = datos)