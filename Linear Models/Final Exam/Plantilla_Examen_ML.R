#Regresión:

#Regresión multiple:

#Primero descargamos los datos:

nombre_modelo<-read.table("./datos/prater.dat",head=T)
colnames(nombre_modelo) #Vemos los nombres de las variables cuantitativas
summary(nombre_modelo)
str(nombre_modelo)

# Ajuste del modelo

ml1<-lm(y~x1+x2+x3+x4,data=prater)
summary(ml1) # el p-valor del contraste global aparece abajo, el resto son los contraster parciales
attributes(ml1) #partes del modelo
ml1$coefficients #coeficeintes del modelo ajustado
ml1$fitted.values #valores ajustados del modelo, son los Y_gorro= X*coeficientes_ajustados
ml1$residuals # residuos del modelo son e-Y_gorro-Y


#Diagnostico del modelo:

# gráficos de diagnóstico
layout(matrix(1:4,2))
plot(ml1)

#Residuals vs Fitted: Homocedasticidad: a medida que nos movemos a la derecha los valores estan más dispersos
# Linealidad: Los residuos se encuentran entorno al 0 y tienen una tendencia lineal.
# Grafica Q-Q: Normalidad: Los cuantiles muestrales se ajsutan a los teoricos

#linealidad
#con gráficos

# normalidad
shapiro.test(rstandard(ml1))

# homocedasticidad
library(lmtest)
bptest(ml1)

# errores incorrelados
library(lmtest)
dwtest(ml1)
bgtest(ml1,order=2)

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
ml0<-lm(y~1,data=prater)
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

#Regresión Polinómica: Buscamos un modelo: Y= beta_0 +Xbeta_1 + X^2*beta_2 + ... X^p*beta_p
#Para ello partimos del modelo Y= beta_0 +Xbeta_1  y vamos sumando grados a la ecuación hasta
#lograr un buen ajuste, es decir, que beta_i=0, para determinar si se ajusta bien podemos mirar
#Fitted vs Residuals y consideraremos que se ajusta bien cuando observemos una tendencia lineal.

datos<-read.table("./datos/company.dat",head=T)

res<-lm(unidades~dolares,data=datos)
summary(res)

layout(matrix(1:4,2))
plot(res)


res1<-lm(unidades~dolares+I(dolares^2),data=datos)
summary(res1)

plot(res1)


res2<-lm(unidades~dolares+I(dolares^2)+I(dolares^3),data=datos)
summary(res2)

plot(res2)

#Una vez obtengamos un coeficiente no significativo paramos y cogemos el modelo anterior.


attach(datos)

par(mfrow=c(1,1))

#Estudiamos las rectas de la regresión
plot(dolares,unidades)
abline(res)
z<-seq(min(dolares),max(dolares),len=1000) #Regresión simple
lines(z,1330.407-155.467*z+4.866*z^2,col=2) #Regresión polinomica 2º grado
lines(z,as.vector(res2$coefficients%*%rbind(1,z,z^2,z^3)),col=4) #Regresión polinomica 3º grado

#Vemos que el polinomio de 3º grado se ajusta meor, por tanto nos quedamos con el para hacer prediciones

a<-predict(res2,data.frame(dolares=z),interval="confidence")
lines(z,a[,3],col=4,lty=2)
lines(z,a[,2],col=4,lty=2)

b<-predict(res2,data.frame(dolares=z),interval="prediction")
lines(z,b[,3],col=4,lty=3)
lines(z,b[,2],col=4,lty=3)

plot(dolares,unidades,ylim=c(min(b[,2]),max(b[,3])))
















#Analisis de la covarianza: Cuando la VR es una variable cuantitativa y hay 2 variables explicativas,
#Una cuantitativa y otra cualitativa.
#v_exp_num= variable explicativa cuantitativa
#v_exp_cual= variable explicativa cualitativa
#v_res_num= variable respuesta cuantitativa


#Metemos los datos y fijamos la variable:

pieza<-read.table("./datos/pieza.dat",head=T)
attach(pieza)
ombre_modelo$var_exp_cual <- factor(nombre_modelo$var_exp_cual) 

#Dibujamos el grafico de dispersión distinguiendo por categorias:

plot(v_exp_num,v_res_num,type="n", xlab="profundidad", ylab="tiempo")
text(v_exp_num,v_res_num,as.character(v_exp_cual))

#Creamos el modelo:

res<-lm(v_res_num~v_exp_num+v_exp_cual+v_exp_num:v_exp_cual) #lm(v_res_num~v_exp_num+v_exp_cual) (en el caso de que el primer contraste no sea signif)

#La matriz del modelo (modelo lineal Y=X*beta +e):

model.matrix(res)

#Contraste de hipótesis,en la tercera fila vemos si el factor tiene algun efecto sobre la pendiente
#de la recta de regresión, en la segunda si tiene algun efecto, primero miramos la última fila, si
#el resultado es no significativo miramos la segunda fila, si es significativo realizamos contrastes
#parciales y terminamos:

anova(res)

#En la última fila del anova se plantea el contraste H_0: delta_2 = ....=delta_k=0 , h_1 LANC, en la penultima se plantea:
# H_0: tau_2= .... =tau_k=0 , H_1: LANC

# SI EL CONTRASTE GLOBAL DE LOS Delta ES SIGNIFICATIVO:

#Los contraster parciales , se contrasta delta_i-delta_1=0
#Crear una recta de regresión por factor, recordar que Y_Fi=0betaF1+(0betaFi-0betaF1) + 1betaF1+(1betaFi-1betaF1)X

summary(res)

#Solo se muestran los contrastes delta_i-delta_1=0 por tanto para hacer delta_i - delta_j escribir:
#Poner las posicions de las variables que queremos contrastar (las posiciones se pueden ver en la matriz):
#el -1 en la variable j y el 1 en la varaible i

linearHypothesis(res,c(0,0,0,0,1,-1))

#Descrirbir que ocurre en las restas en las que obtenemos contrastes significativos, posteriormente,
#Indicar el R^2 del test (en summary aparece) y dar intervalos de predicción:

new_data <- data.frame(x = , zona = factor("", levels = levels(nombre_modelo$var_exp_cua)))
pred_conf <- predict(res, new_data, interval = "prediction")
print(pred_conf) #quizasale NA, poner arriba nombre_modelo$var_exp_cual <- factor(nombre_modelo$var_exp_cual) 

# SI EL CONTRASTE GLOBAL DE LOS Delta NO ES SIGNIFICATIVO:
#Cambiamos al modelo:

new_res<-lm(v_res_num~v_exp_num+v_exp_cual)

#Para plantear el contraste grlobal escribirmos:

anova(new_res)

#Si sale no significativo pasamoa a regresión lineal. Si sale significativo hacemos los parciales:

summary(new_res)

#En este caso solo se hacen los tau_i-tau_1=0 para hacer el resto primero escribimos la matriz:

model.matrix(new_res)

#Buscamos las posiviones de las varibales tau que quereoms contrastar, tau_i-tau_j=0 y hacemos los test
#Con 1 en el tau_i y -1 en tau_j:

linearHypothesis(new_res,c(0,0,0,0,1,-1))

#Terminamos escribiendo el modelo tras los test significativos y damos el R^2 (el obtenido en el summary)
#antes de quitar las variables no significativas.















#Experimento con 1 Factor: Una VR cuantitativa y una única Vexp cualitativa:
#Hay veces que nos dan más de 1 factor pero nos piden estudiar la influencia individual.

#Análisis del modelo:

#Creamos el modelo
nombre_modelo<-read.table("./datos/pieza.dat",head=T)
attach(nombre_modelo)
colnames(nombre_modelo)

ml1<-aov(var_res_num~var_exp_cual,data=nombre_modelo)

#Realizamos el contraste global, si es no significativo hemos terminado, el factor no tiene efecto,

summary(ml1)

#Si es significativo haemos las comparaciones múltiples:
#Obtenemos las estiamciones puntuales de las diferencias, tambien podemos obtener las estimaciones
#puntuales de los valores.

TukeyHSD(ml1)
attach(nombre_modelo)
tapply(var_res_num,var_exp_cual,mean)
detach(nombre_modelo)


#Diagnóstico del modelo:

#Diagnóstico del modelo
par(mfrow=c(2,2))
plot(ml1)
par(mfrow=c(1,1))

#En el residuals vs fitted podemos ver la homocedasticidad (a medida q nos movemos a la derecha los
#ptos estan más dispersons) y la normalidad en el Q-Q plot.
#Recordar escirbir los contrastes teóricos.

#Normalidad:
shapiro.test(rstandard(ml1))

#homocedasticidad
library(lmtest)
bptest(ml1)

#errores incorrelados
library(lmtest)
dwtest(ml1)














#Diseño de Bloques al azar: Una VR cuantitativa y 2 variables cualitativas, 1 única observación por celda:

#Analisis del modelo:

#Similar al anterior, pero debemos de crear la variable del factor

nombre_modelo<-read.table("datos/filtros.dat", head=T, sep="\t")

#Creamos la variable factor, donde el 2 indica la columna en la que se encuentra dicha var, empezando por 1

nombre_modelo<-data.frame(nombre_modelo,var_exp_cual=factor(nombre_modelo[,2]))
nombre_modelo


#ajustamos el modelo
ml1<-lm(var_res_cuan~var_exp_bloq + var_exp_cual,data=nombre_modelo)

#A pesar de tener 2 factores solo nos interesa el contraste global de la variable que no es el bloque,
#Si no es significativo hemos terminado:

anova(ml1)

#Si es significativo hacemos las comparaciones múltiples de Tukey:

TukeyHSD(aov(ml1))
attach(nombre_modelo)
tapply(var_res,var_exp_cual,mean)
detach(nombre_modelo)

#Diagnóstico del modelo:

#Normalidad:
shapiro.test(rstandard(ml1))

#homocedasticidad
library(lmtest)
bptest(ml1)

#errores incorrelados
library(lmtest)
dwtest(ml1)

#En el caso de que no se cumplan las hipótesis de validez:

clorofila<-read.table("clorofila.dat", head=T, sep="\t")
clorofila

#ajustamos el modelo
ml4<-lm(Clorofila~Distancia+Mes,data=clorofila)

#Diagnóstico del modelo
#normalidad
shapiro.test(rstandard(ml4))

#homocedasticidad
library(lmtest)
bptest(ml4)

#errores incorrelados
library(lmtest)
dwtest(ml4)

#test no paramétrico de Friedman
friedman.test(Clorofila~Distancia | Mes, data=clorofila)




#Clasificación cruzada con 2 Factores:

#Primero vemos si hay interacción:

#importamos los datos
nombre_modelo<-read.table("datos/coagulacion.txt",head=T)
nombre_modelo

#convertimos las variables tratamiento y concentracion en factores
nombre_modelo$var_exp_cual1<-as.factor(nombre_modelo$var_exp_cual1)
nombre_modelo$var_exp_cual2<-as.factor(nombre_modelo$var_exp_cual2)

#dibujamos el gráfico de interacción
attach(nombre_modelo)
interaction.plot(var_exp_cual1,var_exp_cual2,var_res_num)
detach(nombre_modelo)

#ajustamos el modelo con interacción
ml1<-lm(var_res_num~var_exp_cual1+var_exp_cual2+tvar_exp_cual1:var_exp_cual2,data=nombre_modelo)

#tabla anova, en ella estudiamos si los factores tienen un efecto significativo sobre la poblacion:

anova(ml1)

# SI existe interacción: Tomamos el factor con menos categorias y separamos los datos por ese factor, si es 1:

#Si son significativos los 2 hacemos las comparaciones múltiples de Tukey para ver entre cuales hay
#diferencias, notar que si solo hay 2 categorias no hace falta.

ml11 <- lm(v_res_cuan ~ v_exp_cual1 , data = bombre_modelo)
tukey_tratamiento <- TukeyHSD(aov(ml11))

ml12 <- lm(v_res_cuan ~ v_exp_cual2 , data = bombre_modelo)
tukey_tratamiento <- TukeyHSD(aov(ml12))

#Posteriormente desglosamos el análisis por las categorias de 1 factor:

attach(nombre_modelo)
c1<-nombre_modelo[var_exp_cual1=="",]
c2<-nombre_modelo[var_exp_cual1=="",]
c3<-nombre_modelo[var_exp_cual1=="",]
detach(nombre_modelo)

#Para cada categoria del 1º factor estudiamos si para dicha categoria existen diferencias significativas
#entre las categorias del otro factor

#ajustamos los modelos de un factor

ml2<-lm(tiempo~tratamiento,data=c1)
anova(ml2)
ml3<-lm(tiempo~tratamiento,data=c2)
anova(ml3)
ml4<-lm(tiempo~tratamiento,data=c3)
anova(ml4)

#Si los resultados son significativos realizamos las comparaciones múltiples de Tukey:
TukeyHSD(aov(ml2))
TukeyHSD(aov(ml3))
TukeyHSD(aov(ml4))

#Si alguno de los dos cotrastes globales no es significativo: Entonces no hacemos las comparaciones
#Multiples individuales del factor no significativo pero desglosamos factor no significativo y
#hacemos las comparaciones en función del factor significativo.


#No hay interacción: Creamos el nuevo modelo:

ml5<-lm(var_res_num~var_exp_cual1+var_exp_cual2,data=nombre_modelo)

#Y planteamos tanto el ANOVA como las comparaciones múltiples sobre los factores significativos:

anova(ml5)
TukeyHSD(aov(ml5))



# Modelo anidado o Gerarquizado:

#importamos los datos
nombre_modelo<-read.table("datos/remate.dat",head=T)
nombre_modelo

#convertimos las variables tratamiento y concentracion en factores
nombre_modelo$var_exp_cualp<-as.factor(nombre_modelo$var_exp_cualp)
nombre_modelo$var_exp_cuala<-as.factor(nombre_modelo$var_exp_cuala)

#Si obtenemos un resultado no significativo en la interacción pasamos al diseño de un factor.
#Si obtenemos un resultado significativo realizamos comparaciones múltiples para ver que categorias 
#del factor principal difieren.

ml6<-lm(var_res_cuan~var_exp_cualp+var_exp_cualp:var_exp_cuala,data=nombre_modelo)
anova(ml6)
TukeyHSD(aov(ml6))

#En las categorias del factor principal significativas queremos estudiar que categorias del factor 
#anidado generan dicha diferencia, para ello separamos los datos enunfción del factor principal
#Y en las categorais significativas creamos modelos de un factor con el factor anidado
# En dicho modelos estudiamos que categorias del factor anidado difieren a traves de comparaciones
#multiples de Tukey:

#Tras realizar las comparaciones múltiples del factor anidado pasamos a ver que categorias del factor principal tienen un efecto significativo

attach(nombre_modelo)
m1<-nombre_modelo[var_exp_cualp=="",]
m2<-nombre_modelo[var_exp_cualp=="",]
m3<-nombre_modelo[var_exp_cualp=="",]
m4<-nombre_modelo[var_exp_cualp=="",]
detach(nombre_modelo)



ml7<-lm(var_res_cuan~var_exp_cuala,data=m1)
anova(ml7)

ml8<-lm(var_res_cuan~var_exp_cuala,data=m2)
anova(ml8)

ml9<-lm(var_res_cuan~var_exp_cuala,data=m3)
anova(ml9)

ml10<-lm(var_res_cuan~var_exp_cuala,data=m4)
anova(ml10)

#Realizar solo sobre las categorias del factor principal significativas!

TukeyHSD(aov(ml7))
TukeyHSD(aov(ml8))
TukeyHSD(aov(ml9))
TukeyHSD(aov(ml10))

#Diagnóstico del modelo
#normalidad
shapiro.test(rstandard(ml1))

#homocedasticidad
library(lmtest)
bptest(ml1)

#errores incorrelados
library(lmtest)
dwtest(ml1)


#Regresión Logística:

#Cuando queremos estudiar una VR cualitativa en función de una VExp cuantitativa:

nombre_modelo<-read.table("datos/chdage.dat",head=T)
nombre_modelo
ml1<-glm(v_res~v_exp, family=binomial(link="logit"),data=nombre_modelo)
summary(ml1)

#Del summary anterior tomamos el valor del estadistico de contraste de los residuos y los g.l
#Y los ponemos en la siguiente gunción:

1-pchisq(valor_exp,g.l)

#Dicha función representa la probabilidad de que una v.a que sigue una chi cuadrado de n g.l valga
#más que valor_exp, es decir, la probablidad de que la muestra se ajuste al modelo

#Para predecir la probabilidad de la var_res tome el valor 1 cuando la var_exp vale:

predict(ml1,data.frame(v_exp= ),type="response")

#Regresión Logística sobre más de una variable explicativa:

#Variables cualitaticas y cuantitativas pero las cualitativas son no significativas en el modelo inecial:

icu<-read.table("datos/icu.dat",head=T)
icu$race<-as.factor(icu$race)
colnames(icu)
ml3<-glm(sta~age+can+cpr+inf+race, family=binomial(link="logit"),data=icu)
ml3
summary(ml3)

#vemos que la variable cualitativa es no significativa en las  comparaciones de categorias y
#la quitamos:

ml4<-glm(sta~age+can+cpr+inf, family=binomial(link="logit"),data=icu)

#volvemos a plantear el modelo para calcular el p valor del nuevo modelo:

anova(ml4,test="Chisq")
pvalor=1-pchisq(valor_exp,g.l)
pvalor

#Si nos piden intervalos de confianza de los coef del modelo:

coefci(ml4)

#Si el modelo sigue presentando var no signif lo depuramos con los metodos back y forward

step(ml3, direction='backward', criterion='AIC')
ml0<-glm(sta~1, family=binomial(link="logit"),data=icu)
step(ml0,scope=list(upper=ml3,lower=ml0), direction='forward', criterion='AIC')
ml4b<-glm(sta~age+cpr+inf, family=binomial(link="logit"),data=icu)
summary(ml4b)

#por último predecimos:

predict(ml3,data.frame(age=47,race="1",can=0,cpr=1,inf=1),type="response")
predict(ml4b,data.frame(age=47,cpr=1,inf=1),type="response")

#Regresión de Poisson: Básicamente los mismo que la anterior pero la VR es cuantitativa:

sida<-read.table("sida.dat",head=T)
colnames(sida)
ml5<-glm(muertos~periodo,family=poisson(link="log"),data=sida)
summary(ml5)
predict(ml5,data.frame(periodo=15),type="response")
1-pchisq(29.654,12)
ml5c<-glm(muertos~periodo,family=poisson(link="sqrt"),data=sida)
summary(ml5c)
1-pchisq(16.905,12)



'''
Analisis de la covarianza:

Si el factor tiene k categorias creamos k-1 variables dummys que las llamamos dummy_i con i=2,...k
Para el conjunto de individuos que se encuentran en la primera categoria tenemos la recta de regresión
Y= beta_0 +beta_1*X + e, por tanto el modelo anterior para los individuos que se encuentran en la catego
ria i seria Y= beta_0 + tau_i + (beta_1 + delta_i)*X +e, donde tau_i es el efecto
de la categoria i en la ordenada en el origen y delta_i lo mismo pero en la pendiente
en la recta de regresion Y= beta_0 +beta_1*X + e. Por tanto concluimos que para 
cada observación Y_i,j con i variando entre 1 y k y j entre 1 y n_i tenemos:
Y_i,j=beta_0 + beta_1*x_i,j + tau_i*dummy_i + .. + delta_i*(x_i,j*dummy_i)+....+e_i,j

Por tanto tenemos un ML Y = X*beta +e donde beta=(beta_0,beta_1,tau_1,...,tau_k,deta_1,..,delta:k)
el modelo será de rango completo suempre que en todas las categorias los individuos
sean independientes, el contraste de interes es H_0=delta_2= .. =delta_k=0 y luego los mismo con los tau

'''



