#Regresión multiple:

#Primero descargamos los datos:

nombre_modelo<-read.table("./datos/datos_examen.dat",head=T)
colnames(nombre_modelo) #Vemos los nombres de las variables cuantitativas
summary(nombre_modelo)
str(nombre_modelo)

# Ajuste del modelo

ml1<-lm(NH4~As+Hg+Zn+Cd+Pb+Cu,data=nombre_modelo)
summary(ml1) # el p-valor del contraste global aparece abajo, el resto son los contraster parciales
confint(ml1,level=0.99)



ml2<-lm(NH4~As+Zn+Pb+Cu,data=nombre_modelo)

summary(ml2)

attributes(ml1) #partes del modelo
ml1$coefficients #coeficeintes del modelo ajustado
ml1$fitted.values #valores ajustados del modelo, son los Y_gorro= X*coeficientes_ajustados
ml1$residuals # residuos del modelo son e-Y_gorro-Y


#Diagnostico del modelo:

# gráficos de diagnóstico
layout(matrix(1:4,2))
plot(ml2)

#Residuals vs Fitted: Homocedasticidad: a medida que nos movemos a la derecha los valores estan más dispersos
# Linealidad: Los residuos se encuentran entorno al 0 y tienen una tendencia lineal.
# Grafica Q-Q: Normalidad: Los cuantiles muestrales se ajsutan a los teoricos

#linealidad
#con gráficos

# normalidad
shapiro.test(rstandard(ml2))

# homocedasticidad
library(lmtest)
bptest(ml2)

# errores incorrelados
library(lmtest)
dwtest(ml2)
bgtest(ml2,order=2)

# multicolinealidad
library(car)
vif(ml1)

#si todo ha funcionado, interpretamos los resultados del modelo
summary(ml1)
# Intervalos de confianza
confint(ml1,level=0.99)

#Recordar nombrar el R^2 y el R^2 ajustado y escribir el modelo ajustado.

#Depuramos el modelo quedandonos solo con los coeficientes significativos:
# Selección de variables

# basándonos en AIC
library(MASS)
ml0<-lm(NH4~1,data=nombre_modelo)
stepAIC(ml0,scope=list(upper=ml1,lower=ml0),direction="forward")
stepAIC(ml1,scope=list(upper=ml1,lower=ml0),direction="backward")




# basándonos en p-valor
library(olsrr)
ols_step_backward_p(ml1, prem=0.1)
ols_step_forward_p(ml1, penter = 0.1)
ols_step_forward_p(ml1, penter = 0.1,details=T)

#Volver a escribir el modelo indicando la influencia de cada variable y dando los R^2

#Predicciones (con el modelo depurado, en este caso no quitamos ninguna variable):
ml2<-lm(y~x1+x2+x4,data=prater)
predict(ml2,data.frame(x1=  , x2= , x3=  ,  x4=  ), interval="confidence")
predict(ml2,data.frame(x1=  , x2= , x3=  ,  x4=  ), interval="prediction")