#Métodos de descomposición:

dat<-read.table("./datos/tendencia.txt",head=T)

#kMA

mak<-filter(dat$nombre,filter=rep(1/k,k)) #Método kMA

ma2xk<-filter(dat$tendencia,filter=c(1/2*k,rep(1/k,k-1),1/2*k)) #Método2xkMA

plot(ts(dat$nombre),ylab="nombre")

lines(mak,col="red")

#Loess

loess<-loess.smooth(1:length(dat$nombre),dat$nombre,span=0.) #Span indica la proporción de datos de la serie que tomaremos apara realizar la regresión lineal

lines(loess,col="green")

#STL

stl.casas<-stl(casas,s.window="period")

plot(stl.casas)


#Descomposición automática

casas<-ts(dat$nombre,start=año_inicio,freq=periodo) #Creamos la serie

plot(casas)

des.casas<-decompose(casas) #Descomponemos la serie en las 3 componentes a través del método de descomposición clásico

plot(des.casas)

#En el caso de que al representar la serie observemos una tendencia creciente de forma exponencial 
#o la estacionalidad va aumentando utilizamos una descomposición multiplicativa:

des.casas<-decompose(casas,type="multiplicative")

#En ese caso tambien podemos aplicar el método de descomposición STL, como este solo funciona para
#modelos aditivos aplicamos el logaritmo:

stl.casas<-stl(log(casas),s.window="period")

plot(stl.casas)

#Le aplicamos la función exponencial para revertir el logaritmo:

tendencia_exponencial <- exp(stl.nac$time.series[, "trend"])






#Métodos de suavizado:

#Método de suavizado simple: (en el caso de no tener ni tendencia ni estaiconalidad)

ses.cantidad<-HoltWinters(ts(dat$cantidad[1:length(dat$cantidad)]),beta=FALSE,gamma=FALSE)

plot(ts(dat$cantidad),ylab="cantidad")

plot(ses.cantidad) 

plot(fitted(ses.cantidad)) #Se muestra la serie y las estimaciones

ses.cantidad$alpha #Obtener el valor de alpha

#Metodo lineal de Holt: (en el caso de tener solo tendencia)

sholt.cantidad<-HoltWinters(ts(dat$cantidad[1:length(dat$cantidad)]),gamma=FALSE)

plot(sholt.cantidad)

plot(fitted(sholt.cantidad)) #Aquí tambien se muestra la tendencia estimada

sholt.cantidad$alpha #El alpha del modelo

sholt.cantidad$beta #El beta del modelo


#Método de Holt-Winters: (En el caso de tener tendencia y estacionalidad)


sholtw.cantidad<-HoltWinters(ts(dat$cantidad[1:16],start=c(2002,1),freq=4),seasonal="multiplicative" o "additive") #En función de lo que se vea en la representación de la serie

plot(sholtw.cantidad) 

plot(fitted(sholtw.cantidad)) #Tambien se muestra la estimación de la estacionalidad

sholtw.cantidad$alpha #Alpha del modelo

sholtw.cantidad$beta #Beta del modelo

sholtw.cantidad$gamma #Gamma del modelo


#Prediciones de los 3 métodos:

p.ses.cantidad<-predict(ses.cantidad, n.ahead= )

p.sholt.cantidad<-predict(sholt.cantidad, n.ahead=)

p.sholtw.cantidad<-predict(sholtw.cantidad, n.ahead=)


#Estimación de los errores:

#En el caso de que conozcamos los valores futuros de la serie podemos calcular el error de la estimación
#En este caso tomando en ses.cantidad ts(dat$cantidad[1:16]) y predecir los 8 valores siguientes en la serie:

#Error cuadr?tico medio (ECM) para suavizado exponencial simple
mean((dat$cantidad[17:24]-p.ses.cantidad)^2)

#Error cuadr?tico medio (ECM) para suavizado de Holt
mean((dat$cantidad[17:24]-p.sholt.cantidad)^2)

#Error cuadr?tico medio (ECM) para suavizado de Holt-Winters
mean((dat$cantidad[17:24]-p.sholtw.cantidad)^2)







#Modelos AR,MA,ARMA,ARIMA:

#AR(1):

phi<-   #parámetro del modelo
m<-      #número de retardos que se quieren calcular

#Parte Teórica  
    
# fas teorica modelo autoregresivo de orden 1
ar1<-ARMAacf(ar=phi,lag.max=m)
# representacion grafica
plot(0:m,ar1,type="h", main = "AR(1) fas teorica")
abline(h=0)
#No es nunca nula, decrede a 0 de forma geométrica siguiendo la función f(t)=psi^t

# fap teorica modelo autoregresivo de orden 1
ar1.p<-ARMAacf(ar=phi,lag.max=m,pacf=T)
# representacion grafica
plot(ar1.p,type="h", main = "AR(1) fap teorica")
abline(h=0)
#Debe de anularse a partir del retardo 1

#Parte Muestral:

# serie temporal simulada correspondiente al AR(1)
sim.ar1<-arima.sim(list(ar=phi), n= ) #n indica el número de retardos que se quieren calcular
plot(sim.ar1, main = "ST sim de AR(1)") #representacion grafica
acf(sim.ar1,lag.max = m) # fas muestral (estimada); +- 1.96/sqrt(n) lineas azules
pacf(sim.ar1, lag.max = m) # fap muestral (estimada); +- 1.96/sqrt(n) lineas azules






#AR(p):

phi<-c(1,...,p)   #parámetros del modelo
m<-      #número de retardos que se quieren calcular

#Parte Teórica  
  
# fas teorica modelo autoregresivo de orden p
arp<-ARMAacf(ar=phi,lag.max=m)
# representacion grafica
plot(0:m,arp,type="h", main = "AR(p) fas teorica")
abline(h=0)
#No es nunca nula, decrede a 0 de forma geométrica siguiendo la función f(t)=psi^t

# fap teorica modelo autoregresivo de orden p
arp.p<-ARMAacf(ar=phi,lag.max=m,pacf=T)
# representacion grafica
plot(arp.p,type="h", main = "AR(p) fap teorica")
abline(h=0)
#Debe de anularse a partir del retardo p

#Parte Muestral:

# serie temporal simulada correspondiente al AR(p)
sim.arp<-arima.sim(list(ar=phi), n= ) #n indica el número de retardos que se quieren calcular
plot(sim.arp, main = "ST sim de AR(p)") #representacion grafica
acf(sim.arp,lag.max = m) # fas muestral (estimada); +- 1.96/sqrt(n) lineas azules
pacf(sim.arp, lag.max = m) # fap muestral (estimada); +- 1.96/sqrt(n) lineas azules






#MA(p):
# IMPORTANTE CAMBIAR EL SIGNO DE LOS PARAMETROS MA EN LAS FUNCIONES

teta<-c(1,...,p)   #parámetros del modelo
m<-      #número de retardos que se quieren calcular

#Parte teórica  
  
# fas teorica modelo media movil de orden p
map<-ARMAacf(ma=teta,lag.max=m) 
plot(0:m,map,type="h", main = "MA(p) fas teorica")
abline(h=0)
# se observa que la fas es nula para retardos superiores al orden de la MA

# fap teorica modelo media movil de orden 2
map.p<-ARMAacf(ma=teta,lag.max=m,pacf=T)
plot(map.p,type="h", main = "MA(p) fap teorica")
abline(h=0)
# se observa un decrecimiento sinusoidal amortiguado

#Parte muestral

# serie temporal simulada correspondiente al MA(p)
sim.map<-arima.sim(list(ma=teta), n= )
plot(sim.map, main = "ST sim de MA(p)")
acf(sim.map) # fas muestral (estimada); +- 1.96/sqrt(n) lineas azules
pacf(sim.map) # fap muestral (estimada); +- 1.96/sqrt(n) lineas azules






#ARMA(p,q):
# IMPORTANTE CAMBIAR EL SIGNO DE LOS PARAMETROS MA EN LAS FUNCIONES

phi<-c(1,...,p)   #parámetros del modelo
teta<-c(1,...,q)   #parámetros del modelo
m<-      #número de retardos que se quieren calcular

#Parte teórica  
  
# fas teorica modelo mixto autoregresivo - media movil de orden (p,q)
arma1.2<-ARMAacf(ar=phi, ma=teta,lag.max=m)
plot(0:m,arma1.2,type="h", main = "ARMA(p,q) fas teorica")
abline(h=0)

# fap teorica modelo mixto autoregresivo - media movil de orden (p,q)
arma1.2.p<-ARMAacf(ar=phi, ma=teta,lag.max=m,pacf=T)
plot(1:m,arma1.2.p,type="h", main = "ARMA(p,q) fap teorica")
abline(h=0)

# tanto fas como fap toman valores distintos de cero y decrecen a cero de
# de acuerdo con una mezcla de exponenciales y sinusoidales amortiguadas

#Parte muestral

# serie temporal simulada correspondiente al ARMA(p,q)
sim.arma1.2<-arima.sim(list(ar=phi,ma=teta), n= )
plot(sim.arma1.2, main = "ST sim de ARMA(p,q)")
acf(sim.arma1.2, lag.max = m) # fas muestral (estimada); +- 1.96/sqrt(n) lineas azules
pacf(sim.arma1.2,lag.max = m) # faP muestral (estimada); +- 1.96/sqrt(n) lineas azules




#ARIMA(p,d,q):

#Lo convertimos en un ARMA(p*d,q):

phi<-c(1,...,p*d)   #parámetros del modelo
teta<-c(1,...,q)   #parámetros del modelo
m<-      #número de retardos que se quieren calcular

#Parte teórica (identica al modelo ARMA)

# fas teorica modelo mixto autoregresivo - media movil de orden (p,q)
arma1.2<-ARMAacf(ar=phi, ma=teta,lag.max=m)
plot(0:m,arma1.2,type="h", main = "ARMA(p,q) fas teorica")
abline(h=0)

# fap teorica modelo mixto autoregresivo - media movil de orden (p,q)
arma1.2.p<-ARMAacf(ar=phi, ma=teta,lag.max=m,pacf=T)
plot(1:m,arma1.2.p,type="h", main = "ARMA(p,q) fap teorica")
abline(h=0)

#Parte muestral (distinta al modelo ARMA)

# serie temporal simulada correspondiente al ARIMA(p,d,q)

sim.arima11<-arima.sim(list(order=c(p,d,q), ar=phi, ma=teta), n= )
plot(sim.arima11)
# para n grande se espera que las fas y fap muestrales que vamos a calcular
# converjan a las fas y fap teoricas anteriores
acf(sim.arima11,lag.max=m)
pacf(sim.arima11,lag.max=m)






#AR(p)_s:

#Se puede ver como un AR(p*s) donde los únicos parámetros no nulos son los múltiplos de s:

#Un AR(1)_s:

phi<-    #parámetros del modelo
m<-      #número de retardos que se quieren calcular
s<-       #periodo de la serie

#Parte teórica  

# fas teorica
ar12<-ARMAacf(ar=c(rep(0,s-1),phi),lag.max=m)
plot(0:m,ar12,type="h")
abline(h=0)
# esperamos un decrecimiento geometrico o sinusoidal en los multiplos de la 
# estacionalidad

# fap teorica
ar12.p<-ARMAacf(ar=c(rep(0,s-1),phi),lag.max=m,pacf=T)
plot(1:m,ar12.p,type="h")
abline(h=0)
# esperamos valores nulos a partir del retardo 1 x 12 y valores no nulos
# para retardos menores siempre que sean multiplos de la estacionalidad (s)

#Parte muestral

# serie temporal simulada correspondiente al AR(1)_s
sim.ar12<-arima.sim(list(order = c(s,0,0), ar =c(rep(0,s-1), phi)), n=  )  
acf(sim.ar12, lag.max=m)
# esperamos decaimineto hacia cero en los multiplos de la estacionalidad
pacf(sim.ar12,lag.max=m)

