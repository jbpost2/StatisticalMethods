library(scatterplot3d) 
library(rgl)

Data<-matrix(c(4 ,13, 61,18,21,175,14,24,111,18,23,124,26,64,130,26,38,173,21,33,169,30,61,169,28,39,160,36,71,244,
65,112,257,62,88,333,40,54,199),ncol=3,byrow=TRUE)

par(mfrow=c(1,2))
plot(y=Data[,1],x=Data[,2],xlab="Aluminum",ylab="Adsorption", main="Scatter Plot of Aluminum and Adsorption")
plot(y=Data[,1],x=Data[,3],xlab="Iron",ylab="Adsorption", main="Scatter Plot of Iron and Adsorption")

par(mfrow=c(1,1))
scatterplot3d(x=Data[,2],y=Data[,3],z=Data[,1], pch=16, highlight.3d=TRUE,box=FALSE,  type="h",
 main="Plot of Aluminum, Iron, and Adsorption",angle=70,xlab=c("Aluminum"),ylab=c("Iron"),zlab=c("Adsoprtion"))

plot3d(x=Data[,2],y=Data[,3],z=Data[,1], type="h",col="red",lwd=2, size=3,box=FALSE,
xlab=c("Aluminum"),ylab=c("Iron"),zlab=c("Adsoprtion"))

lm(Data[,1]~Data[,2]+Data[,3])

t(cbind(rep(1,13),Data[,2],Data[,3]))%*%cbind(rep(1,13),Data[,2],Data[,3])

solve(t(cbind(rep(1,13),Data[,2],Data[,3]))%*%cbind(rep(1,13),Data[,2],Data[,3]))

%*%t(cbind(rep(1,13),Data[,2],Data[,3]))%*%cbind(rep(1,13),Data[,2],Data[,3]))


cbind(rep(1,13),Data[,2],Data[,3])%*%c(-7.3507,0.3490,0.1127)


t(Data[,1]-cbind(rep(1,13),Data[,2],Data[,3])%*%c(-7.3507,0.3490,0.1127))%*%(Data[,1]-cbind(rep(1,13),Data[,2],Data[,3])%*%c(-7.3507,0.3490,0.1127))

as.numeric(t(Data[,1]-cbind(rep(1,13),Data[,2],Data[,3])%*%c(-7.3507,0.3490,0.1127))%*%(Data[,1]-cbind(rep(1,13),Data[,2],Data[,3])%*%c(-7.3507,0.3490,0.1127)))*solve(t(cbind(rep(1,13),Data[,2],Data[,3]))%*%cbind(rep(1,13),Data[,2],Data[,3]))/10

anova(lm(Data[,1]~Data[,2]+Data[,3]))
summary(lm(Data[,1]~Data[,2]+Data[,3]))
