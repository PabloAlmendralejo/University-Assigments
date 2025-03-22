train <- read.csv("train.csv",stringsAsFactors = TRUE)
test <- read.csv("test.csv",stringsAsFactors = TRUE)


# 1º

# a)

# Ajuste de modelo de regresion lineal multiple:
set.seed(5)
modelo<-lm(FTHG~.,data=train[,3:20])
summary(modelo)

library(MASS)

null<-lm(FTHG~1,data=train[,3:20])
full<-lm(FTHG~.,data=train[,3:20])

#forward

modelo.forw <-step(null, scope=list(lower=null, upper=full),
                  direction="forward" , k = log(nrow(train[,3:20])))

summary(modelo.forw)
#backward

modelo.back <- step(full, k = log(nrow(train[,3:20])))

summary(modelo.back)

# Como el modelo resultante del método backward tiene mayor R cuadrado ajustado me quedo
# con esta selección de variables, las cuales son: FTRD,FTRH, FTAG, WHD.

# Lasso
install.packages("glmnet")
library(glmnet)
x<-model.matrix(FTHG~.,data=train[,3:20])[,-1]
y<-train$FTHG


lambdas<-10^seq(10,-2,length =100)
set.seed(5)
modelo.lasso<-glmnet(x,y,alpha=1,lambda=lambdas)
set.seed(5)
mejor.lambda<-cv.glmnet(x,y,nfolds=length(y),
                        alpha=1)

#El mejor parámetro lambda es:

mejor.lambda$lambda.min

modelo.lasso<-glmnet(x,y,alpha=1,lambda=mejor.lambda$lambda.min)
modelo.lasso$beta

#Podemos observar que el modelo lasso sugiere tomar las variables WHH, WHD, FTAG, FTRD, 
# FTRH, 
  
xpred <- model.matrix(FTHG~.,data=test[,3:20])[,-1]

ypred.mult <- predict(modelo.back, newx= xpred)
ypred.lasso<- predict(modelo.lasso, s=mejor.lambda, newx= xpred)
ypred.mult
ypred.lasso

mean((ypred.lasso - test$FTHG)^2)
mean((ypred.mult - test$FTHG)^2)

# Estamos intentando estimar una variable categórica a través de un modelo de regresión.
# Creo que sería más adecuado utilizar un método de clasificación pues como mucho.
# un equipo marcará 10 goles en un partido, tambien podríamos aproximar las estimaciones 
# de los métodos de regresión a su valor entero más proximo.
# Comparando los dos modelos podemos observar que el modelo lasso tiene un menor error
# cuadratico medio sobre el conjunto de entrenamiento.



# b)


install.packages("nnet")
library(nnet)


install.packages("caret")
library(caret)

nnetGrid <- expand.grid(decay=c(0.01, 0.1, 0.5, 1),
                        size=c(5,10))

set.seed(5)
nnetTune <- train(FTHG~., data= train[,3:20],
                  method = "nnet",
                  metric = "RMSE",
                  tuneGrid = nnetGrid,
                  trControl = trainControl(method = "cv", number = 10),
                  linout = TRUE,
                  maxit = 1000)


# Sugiere utilizar los parámetros: 
nnetTune$results
nnetTune$bestTune

# El ECM estimado por VC es: 0.8885211 
set.seed(5)
medv.fit.nnet<-nnet(FTHG~., data= train[,3:20], linout=TRUE,
                    maxit=2000, size=5, decay=1)

medv.pred.nnet<-predict(medv.fit.nnet, data = xpred)
mean((test$FTHG-medv.pred.nnet)^2)
length(test$FTHG)
length(medv.pred.nnet)

# c)

# Comparamos los métodos de regresión lineal múltiple, regresión lasso y regresión por redes

mean((ypred.lasso - test$FTHG)^2)
mean((ypred.mult - test$FTHG)^2)
mean((test$FTHG - medv.pred.nnet)^2)





# 2º

set.seed(5)

#a)

x2<-model.matrix(FTR~.,data=train[,3:20])[,-1]
y2<-train$FTR

set.seed(5)
knnTune<-train(FTR~., data=train[,3:20],
               preProcess=c("center","scale"),
               method="knn",
               tuneGrid=expand.grid(k=c(7,9,11,13,15,17)),
               trControl=trainControl(method="cv",number = 5)
)
windows()
plot(knnTune)

# El número de vecinos que sugiere es: 7
knnTune$bestTune

# Predicciones:

knnPredict <- predict(knnTune,newdata = test[,3:20])

# Matriz de confusión:

table(predichos=knnPredict,verdaderos=test$FTR)
# Ó
confusionMatrix(knnPredict,test$FTR)$byClass

# La mayoría de erorres se producen al predecir A o D, es decir, cuando gana o empata el
# equipo visitante, 9 veces se ha clasificado un partido como empatado cuando en verdad
# había ganado el equipo visitante y 7 veces se ha marcado el partido como ganado por
# el equipo visitante cuando en verdad ha sido un empate. tambien se estima incorrectamente
# 6 veces los partidos empatados, que se clasifican como partidos ganados por el 
# equipo local.

# Para el primer partido: 
knnPredict.primer <- predict(knnTune,newdata = test[1,3:20], prob = TRUE)
knnPredict.primer


# b)
install.packages("randomForest")
library(randomForest)

set.seed(5)

rfTune<-train(FTR~.,data=train[,3:20],
              method="rf",
              trControl=trainControl(method="cv",number = 5),
              tuneGrid=expand.grid(mtry=c(5,6,7,8,9,10,11,12,13,14,15)))


# El mejor número de predictores que minimiza el error medido por VC es: 15, 
# basicamente estamos haciendo bagging, debo de haber hecho algo mal, para poder
# continuar con el ejercicio y poder calcular el erorr OOB que se pide
# supondré que mtry = 10

rfTune$bestTune
rfTune$results

# Ajustamos el modelo de rf haciendo que cada arbol tome 10 de las 15 variables.
set.seed(5)
rf15<-randomForest(FTR~.,data=train[,3:15],ntree = 500, mtry = 10, importance =TRUE)
rf15$confusion
plot(rf15)

# El número de arboles que minimiza la estimación de OOB es: 271

which.min(rf15$err.rate[,"OOB"])

# Veamos que predictores destacan como más importantes: el FTHG y FTAG son los que
# producen un mayor descenso en el MCE al ser añadidos al modelo.

varImpPlot(rf15)


# c)

# K vecinos:

knnPredict <- predict(knnTune,newdata = test[,3:20])

mean(knnPredict!=test$FTR)

# RF:
set.seed(5)

rfPredict <- predict(rf15,newdata = test[,3:20])

mean(rfPredict != test$FTR)

# En vista del valor del error de rfsospechamos que se está produciendo 
# sobre ajuste al modelar a partir del rf, en cambio el método knn da
# valores de error aceptables, podríamos intentar reducir el sobreajuste reduciendo
# el número de variables pues es muy posiuble que siga existinendo correlación.
# podríamos utilizar el método de PCA.
