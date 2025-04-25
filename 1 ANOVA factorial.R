
##Librerías para post hoc#####
library(multcomp)
library(agricolae)
library(DescTools)



library(lmtest)


library(nortest)


library(readxl)


datos <- read_excel("C:\\Users\\Alexis\\Downloads\\IMC sujetos.xlsx")



modelAnova1<- aov(datos$Saltos~datos$Ejercicio*datos$Comer)

summary(modelAnova1)

modelAnova2<- aov(datos$Saltos~datos$Ejercicio*datos$IMC)

summary(modelAnova2)



