install.packages("readxl")

install.packages("nortest")

install.packages("lmtest")



##Librerías para post hoc#####
install.packages("multcomp")
install.packages("agricolae")
install.packages("DescTools")
#######


library(multcomp)
library(agricolae)
library(DescTools)



library(lmtest)


library(nortest)


library(readxl)


datos <- read_excel("C:\\Users\\Alexis\\Downloads\\Recubrimiento.xlsx", sheet = "Hoja 1")

modelAnova<- aov(datos$conductividad~datos$recubrimiento)

summary(modelAnova)


residuos <- residuals(modelAnova)




##Media distinta de cero

plot(residuos)
abline(h=0,lty=2,col="red")

t.test(residuos,alternative=c("two.sided"), conf.level = 0.95, mu = 0)

##Comprobación de homostacidad
bptest(modelAnova)


#Comprobación de no correlación

acf(residuos)

dwtest(modelAnova)


#Comprobación de distribución normal

plot(modelAnova,2)

ad.test(residuos)


# Tukey HSD
tukey <- TukeyHSD(modelAnova)
print(tukey)


# LSD test
#lsd <- LSD.test(modelAnova, "recubrimiento")

#print(lsd)

# Duncan test
duncan <- duncan.test(modelAnova, "recubrimiento")
print(duncan)


games_howell_test(data, formula, conf.level = 0.95, detailed = FALSE)


