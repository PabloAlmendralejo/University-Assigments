library(foreign)
datos<-read.spss("./datos/ingresosturismo.sav",to.data.frame=T)

nac<-ts(datos$Ingresos_t,start=c(1990,1),freq=12)

descom <- decompose(nac , type="multiplicative")

plot(nac, ylab="Ingresos" , xlab=" Años")

lines(descom$trend , col = "grey")

legend("topleft", legend = c("Serie", "Tendencia"), col = c("black", "grey"), lty =1)

plot(decompose(nac , type="multiplicative"))

#Metodo Medias móviles

ma3<-filter(nac,filter=rep(1/3,3))

ma7<-filter(nac,filter=rep(1/10,10))

ma2x12<-filter(nac,filter=c(1/24,rep(1/12,11),1/24))

#Pintar Medias móviles

lines(ma3,col="red")

legend("topleft", legend = c("Tendencia Real", "Aproximación 3MA"), col = c("black", "red"), lty =1)

lines(ma7,col="red")

legend("topleft", legend = c("Tendencia Real", "Aproximación 7MA"), col = c("black", "red"), lty =1)

lines(ma2x12,col="red")

legend("topleft", legend = c("Tendencia Real", "Aproximación 2x12MA"), col = c("black", "red"), lty =1)


#Metodo Loess

ajuste_loess <- loess(nac ~ time(nac), data = window(nac, end = c(2005, 12)), span = 0.3)
años <- time(window(nac, end = c(2005, 12)))

# Pintar Loess

plot(años,predict(ajuste_loess) , type ="l" , ylim= c(750000,5000000), col= "red", ylab= "Ingresos")

lines(nac, ylab="Ingresos" , xlab=" Años",type = "l")

lines(descom$trend , col = "black")

legend("topleft", legend = c("Tendencia Real", "Aproximación Loess"), col = c("black", "red"), lty =1)

# Metodo STL

stl.nac<-stl(log(nac),s.window="period")

tendencia_exponencial <- exp(stl.nac$time.series[, "trend"])

#Pintar STL tanto como log como exp

#Normal

plot(time(nac), tendencia_exponencial, type = "l", col = "red",
     ylab = "Ingresos", xlab = "Años",  ylim = c(750000,5000000))
lines(descom$trend)

legend("topleft", legend = c("Tendencia Real", "Aproximación STL Normal"), col = c("black", "red"), lty =1)

#Log

plot(time(nac), stl.nac$time.series[, "trend"], type = "l", col = "red",
     ylab = "Log(Ingresos)", xlab = "Años", ylim = c(log(750000), log(5*10^6)))
lines(log(descom$trend))

legend("topleft", legend = c("Tendencia Real", "Aproximación STL Log"), col = c("black", "red"), lty =1)


#Creando Indices:

indice <- rep(descom$seasonal)
indice_stl<- exp(stl.nac$time.series[, "seasonal"])

#Serie real

sumas <- numeric(12)

for (i in 0:11) {
  # Calcular la suma de los elementos en posiciones múltiplo de 12
  sumas[i + 1] <- (sum(indice[seq(i + 1, length(indice), by = 12)]))/16
}

#STL

sumas_stl <-numeric(12)


for (i in 0:11) {
  # Calcular la suma de los elementos en posiciones múltiplo de 12
  sumas_stl[i + 1] <- (sum(indice_stl[seq(i + 1, length(indice_stl), by = 12)]))/16
}

cat("Indices estacionales reales" , sumas ,"\n","Indices estacionales aproximados a traves de STL", sumas_stl, "\n")

#Comparación

#Loess
plot(años,predict(ajuste_loess) , type ="l" , ylim= c(750000,5000000), col= "blue", ylab= "Ingresos")

lines(descom$trend , col = "black")

par(new=TRUE)

#STL
plot(time(nac), tendencia_exponencial, type = "l", col = "green",
     ylab = "Ingresos", xlab = "Años",  ylim = c(750000,5000000))

#Medias
lines(ma2x12,col="red")

legend("topleft", legend = c("Tendencia Real", "Aproximación 2x12MA", "Aproximación STL Normal","Aproximación Loess"), col = c("black", "red","green","blue"), lty =1)
