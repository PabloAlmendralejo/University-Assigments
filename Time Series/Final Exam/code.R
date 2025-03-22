library(foreign)
dat<-read.spss("./datos/turismo_rural.sav",to.data.frame=T) 

nac<-ts(dat$viajeros[1:205],freq=12) 

plot(nac) 

des<- decompose(nac,type="multiplicative")
des$seasonal
plot(des)


ses.cantidad<-HoltWinters(ts(dat$viajeros[1:204]),beta=FALSE,gamma=FALSE)

plot(ts(dat$viajeros),ylab="cantidad")

plot(ses.cantidad) 
dat$viajeros[205]
p.ses.cantidad<-predict(ses.cantidad, n.ahead= 24)
p.ses.cantidad
dat$viajeros[205:228]
mean((dat$viajeros[205:228]-p.ses.cantidad)^2)
lines(p.ses.cantidad , col="green")
