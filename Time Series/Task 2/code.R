library(foreign)
datos<-read.spss("./datos/ingresosturismo.sav",to.data.frame=T)

nac<-ts(datos$Ingresos_t,start=c(1990,1),freq=12)

descom <- decompose(nac , type="multiplicative")

plot(nac, ylab="Ingresos" , xlab=" Años")

plot(decompose(nac , type="multiplicative"))

# Suavizado Simple:

ses.nac<-HoltWinters(ts(datos$Ingresos_t[1:168],start=c(1990,1),freq=12),beta=FALSE,gamma=FALSE)

plot(ses.nac)

legend("topleft", legend = c("Serie", "Suavizado"), col = c("black", "red"), lty = 1)


# Suavizado de Holt Lineal:

holt.nac<-HoltWinters(ts(datos$Ingresos_t[1:168],start=c(1990,1),freq=12),gamma=FALSE)

plot(holt.nac)

legend("topleft", legend = c("Serie", "Suavizado"), col = c("black", "red"), lty =1)

# Suavizado Holt-Winters aditivo:

holtwa.nac<-HoltWinters(ts(datos$Ingresos_t[1:168],start=c(1990,1),freq=12))

plot(holtwa.nac)

legend("topleft", legend = c("Serie", "Suavizado"), col = c("black", "red"), lty =1)

# Suavizado Holt-Winters multiplicativo:

holtwm.nac<-HoltWinters(ts(datos$Ingresos_t[1:168],start=c(1990,1),freq=12),seasonal="multiplicative")

plot(holtwm.nac)

legend("topleft", legend = c("Serie", "Suavizado"), col = c("black", "red"), lty =1)

# Predicciones:

p.ses.nac<-predict(ses.nac, n.ahead=24) # Simple

p.holt.nac<-predict(holt.nac, n.ahead=24) # Holt Lineal

p.holtwa.nac<-predict(holtwa.nac, n.ahead=24) # Holt-Winters Aditivo

p.holtwm.nac<-predict(holtwm.nac, n.ahead=24) # Holt-Winters Multiplicativo

# ECM:

#Error cuadr?tico medio (ECM) para suavizado exponencial simple
mean((datos$Ingresos_t[169:192]-p.ses.nac)^2)

#Error cuadr?tico medio (ECM) para suavizado de Holt Lineal
mean((datos$Ingresos_t[169:192]-p.holt.nac)^2)

#Error cuadr?tico medio (ECM) para suavizado de Holt-Winters Aditivo
mean((datos$Ingresos_t[169:192]-p.holtwa.nac)^2)

#Error cuadr?tico medio (ECM) para suavizado de Holt-Winters Multiplicativo
mean((datos$Ingresos_t[169:192]-p.holtwm.nac)^2)

# Comparación gráfica de predicciones:

nar<-ts(datos$Ingresos_t[169:192],start=c(2004,1),freq=12)
plot(nar, ylim=c(1000000,5000000))
lines(p.ses.nac, col="red")
lines(p.holt.nac, col="blue")
lines(p.holtwa.nac, col="green")
lines(p.holtwm.nac, col="orange")

legend("topleft" , legend = c("Serie", "Simple", "H.Lineal") , col= c("black","red","blue"),lty=1)
legend("top" , legend = c( "H.W.Mult", "H.W.Adt") , col= c( "green", "orange"),lty=1)

# Suavizados con todos los datos:

# Suavizado Simple:

t.ses.nac<-HoltWinters(ts(datos$Ingresos_t,start=c(1990,1),freq=12),beta=FALSE,gamma=FALSE)

plot(t.ses.nac)

legend("topleft", legend = c("Serie", "Suavizado"), col = c("black", "red"), lty =1)

# Alpha beta y gamma:

vses <- c(t.ses.nac$alpha, t.ses.nac$beta,ses.nac$gamma)

print(vses)

# Suavizado de Holt Lineal:

t.holt.nac<-HoltWinters(ts(datos$Ingresos_t,start=c(1990,1),freq=12),gamma=FALSE)

plot(t.holt.nac)

legend("topleft", legend = c("Serie", "Suavizado"), col = c("black", "red"), lty =1)

# Alpha beta y gamma:

vholt <- c(t.holt.nac$alpha, t.holt.nac$beta,t.holt.nac$gamma)

print(vholt)

# Suavizado Holt-Winters aditivo:

t.holtwa.nac<-HoltWinters(ts(datos$Ingresos_t,start=c(1990,1),freq=12))

plot(t.holtwa.nac)

legend("topleft", legend = c("Serie", "Suavizado"), col = c("black", "red"), lty =1)

# Alpha, beta y gamma

vholtwa <- c(t.holtwa.nac$alpha, t.holtwa.nac$beta,t.holtwa.nac$gamma)

print(vholtwa)

# Suavizado Holt-Winters multiplicativo:

t.holtwm.nac<-HoltWinters(ts(datos$Ingresos_t,start=c(1990,1),freq=12),seasonal="multiplicative")

plot(t.holtwm.nac)

legend("topleft", legend = c("Serie", "Suavizado"), col = c("black", "red"), lty =1)

# Alpha beta y gamma:

vholtwm <- c(t.holtwm.nac$alpha, t.holtwm.nac$beta,t.holtwm.nac$gamma)

print(vholtwm)

# Predicciones hasta 2006 con todos los datos:

p.t.ses.nac<-predict(t.ses.nac, n.ahead=12) # Simple

print(p.t.ses.nac)

p.t.holt.nac<-predict(t.holt.nac, n.ahead=12) # Holt Lineal

print(p.t.holt.nac)

p.t.holtwa.nac<-predict(t.holtwa.nac, n.ahead=12) # Holt-Winters Aditivo

print(p.t.holtwa.nac)

p.t.holtwm.nac<-predict(t.holtwm.nac, n.ahead=12) # Holt-Winters Multiplicativo

print(p.t.holtwm.nac)

