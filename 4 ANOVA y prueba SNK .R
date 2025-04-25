
  library(agricolae)
  library(car)
  
  datos <- data.frame(
    Maquina = rep(1:4, each = 6),
    Operador = rep(1:6, times = 4),
    Tiempo = c(42.5, 39.3, 39.6, 39.9, 42.9, 43.6, 
               39.8, 40.1, 40.5, 42.3, 42.5, 43.1, 
               40.2, 40.5, 41.3, 43.4, 44.9, 45.1, 
               41.3, 42.2, 43.5, 44.2, 45.9, 42.3)
  )
  
  # Realizar el ANOVA
  modelAnova <- aov(Tiempo ~ Maquina + Operador, data = datos)
  summary(modelAnova)
  
 
  
  # Realizar el test SNK
  resultados_SNK <- SNK.test(modelAnova, "Maquina", group = TRUE)
  print(resultados_SNK)
  
  # Graficar los resultados del test SNK
  plot(resultados_SNK, main = "Resultados del Test SNK para Maquinas")
  
  
  # Supuesto de homogeneidad de varianza
#  leveneTest(Valor ~ Operador + Tiempo, data = datos)