# Instalar el paquete rstatix si no está instalado
install.packages("rstatix")

# Cargar el paquete rstatix
library(rstatix)

datos <- data.frame(
  conductividad = c(56, 55, 62, 59, 60, 64, 61, 50, 55, 56, 45, 46, 45, 39, 43, 42, 39, 45, 43, 41),
  recubrimiento = factor(c("I", "I", "I", "I", "I", "II", "II", "II", "II", "II", "III", "III", "III", "III", "III", "IV", "IV", "IV", "IV", "IV"))
)


# Realizar el test de Games-Howell
games_howell_results <- datos %>%
  games_howell_test(conductividad ~ recubrimiento)

# Imprimir los resultados del test de Games-Howell
print(games_howell_results)
