#Illustration of type I and type II errors
#Distribution under null is N(mu=75,sd=9/5)
mu0<-75
sd<-9/5
x<-seq(from=-10,to=10,by=0.01)

#First distribution under H0 with RR
plot(x=mu0+sd*x,y=dnorm(x),type='l',xlim=c(63,82),col="blue",xaxt="n",ylab="f(y)",xlab="Y-bar values",main="Gray = P(Type I Error), Yellow = P(Type II Error)")
axis(side=1,at=round((-1:4)*sd+mu0,2))
text("---Distribution under H0, mu=75, n = 25",x=mu0+9/5+0.25,y=dnorm(1),adj=0)

#add in rejection region, reject for y-bar < 70.81
mtext("<-- rejection region |",side=1,at=70.81,adj=1)
axis(side=1,at=70.81)
#Shade in RR
shortseq<-seq(from=-10,to=-2.33,by=0.01)
shorty<-shortseq*sd+mu0
polygon(c(shorty,rev(shorty)),c(rep(0,length(shorty)),rev(dnorm(shortseq))),col="gray")

#under HA part d, muA=72
muA<-72
lines(x=muA+sd*x,y=dnorm(x),type='l',col="red")
text("---Distribution under HA, mu=72, n = 25",x=muA+9/5*0.5+0.25,y=dnorm(0.5),adj=0)
#put in probability of a type II error
shortseqHA<-seq(from=-1.19/1.8,to=5,by=0.01)
shortyHA<-shortseqHA*sd+muA
polygon(c(shortyHA,rev(shortyHA)),c(rep(0,length(shortyHA)),rev(dnorm(shortseqHA))),col="yellow")
lines(x=mu0+sd*x,y=dnorm(x),type='l',col="blue")


par(ask=TRUE)
#First distribution under H0 with RR
plot(x=mu0+sd*x,y=dnorm(x),type='l',xlim=c(63,82),col="blue",xaxt="n",ylab="f(y)",xlab="Y-bar values",main="Gray = P(Type I Error), Yellow = P(Type II Error)")
axis(side=1,at=round((-1:4)*sd+mu0,2))
text("---Distribution under H0, mu=75, n = 25",x=mu0+9/5+0.25,y=dnorm(1),adj=0)

par(ask=FALSE)

#add in rejection region, reject for y-bar < 70.81
mtext("<-- rejection region |",side=1,at=70.81,adj=1)
axis(side=1,at=70.81)
#Shade in RR
shortseq<-seq(from=-10,to=-2.33,by=0.01)
shorty<-shortseq*sd+mu0
polygon(c(shorty,rev(shorty)),c(rep(0,length(shorty)),rev(dnorm(shortseq))),col="gray")

#under HA part e, muA=70
muA<-70
lines(x=muA+sd*x,y=dnorm(x),type='l',col="red")
text("---Distribution under HA, mu=70, n = 25",x=muA+9/5*0.5+0.25,y=dnorm(0.5),adj=0)
#put in probability of a type II error
shortseqHA<-seq(from=0.81/1.8,to=5,by=0.01)
shortyHA<-shortseqHA*sd+muA
polygon(c(shortyHA,rev(shortyHA)),c(rep(0,length(shortyHA)),rev(dnorm(shortseqHA))),col="yellow")
lines(x=mu0+sd*x,y=dnorm(x),type='l',col="blue")
#Shade in RR
shortseq<-seq(from=-10,to=-2.33,by=0.01)
shorty<-shortseq*sd+mu0
polygon(c(shorty,rev(shorty)),c(rep(0,length(shorty)),rev(dnorm(shortseq))),col="gray")




sd<-9/7

par(ask=TRUE)
#First distribution under H0 with RR
plot(x=mu0+sd*x,y=dnorm(x),type='l',xlim=c(63,82),col="blue",xaxt="n",ylab="f(y)",xlab="Y-bar values",main="Gray = P(Type I Error), Yellow = P(Type II Error)")
axis(side=1,at=round((-1:4)*sd+mu0,2))
text("---Distribution under H0, mu=75, n = 49",x=mu0+9/7+0.25,y=dnorm(1),adj=0)

par(ask=FALSE)

#add in rejection region, reject for y-bar < 70.81
mtext("<-- rejection region |",side=1,at=72.00429,adj=1)
axis(side=1,at=72.00)
#Shade in RR
shortseq<-seq(from=-10,to=-2.33,by=0.01)
shorty<-shortseq*sd+mu0
polygon(c(shorty,rev(shorty)),c(rep(0,length(shorty)),rev(dnorm(shortseq))),col="gray")

#under HA part e, muA=70
muA<-70
lines(x=muA+sd*x,y=dnorm(x),type='l',col="red")
text("---Distribution under HA, mu=70, n = 49",x=muA+9/7*0.5+0.25,y=dnorm(0.5),adj=0)
#put in probability of a type II error
shortseqHA<-seq(from=(72-70)/(9/7),to=5,by=0.01)
shortyHA<-shortseqHA*sd+muA
polygon(c(shortyHA,rev(shortyHA)),c(rep(0,length(shortyHA)),rev(dnorm(shortseqHA))),col="yellow")
lines(x=mu0+sd*x,y=dnorm(x),type='l',col="blue")
#Shade in RR
shortseq<-seq(from=-10,to=-2.33,by=0.01)
shorty<-shortseq*sd+mu0
polygon(c(shorty,rev(shorty)),c(rep(0,length(shorty)),rev(dnorm(shortseq))),col="gray")



####Power function
muAs<-seq(from=65,to=75,by=0.01)
typeIIErrors<-pnorm(qnorm(0.99)-abs(75-muAs)/(9/5))
par(mfrow=c(1,2))
plot(x=muAs,y=typeIIErrors,type="l",xlab="True Mu",ylab="Type II Error Rate",main="Type II Error Plot, n=25")
typeIIErrors2<-pnorm(qnorm(0.99)-abs(75-muAs)/(9/7))
plot(x=muAs,y=typeIIErrors2,type="l",xlab="True Mu",ylab="Type II Error Rate",main="Type II Error Plot, n=49")


typeIIErrors<-pnorm(qnorm(0.99)-abs(75-muAs)/(9/5))
par(mfrow=c(1,2))
plot(x=muAs,y=1-typeIIErrors,type="l",xlab="True Mu",ylab="Power",main="Power Plot, n=25")
typeIIErrors2<-pnorm(qnorm(0.99)-abs(75-muAs)/(9/7))
plot(x=muAs,y=1-typeIIErrors2,type="l",xlab="True Mu",ylab="Power",main="Power Plot, n=49")




############## 2 sided
par(mfrow=c(1,1))
muAs<-seq(from=16.5,to=22.5,by=0.01)
typeIIErrors<-pnorm(qnorm(0.975)-abs(19.34-muAs)/(8.2/sqrt(150)))
plot(x=muAs,y=1-typeIIErrors,type="l",xlab="True Mu",ylab="Power",main="Power Plot, n=150")


#as a function of n
muA<-72
n<-seq(from=1,to=150,by=1)
typeIIErrors<-pnorm(qnorm(0.99)-abs(75-muA)/(9/sqrt(n)))
plot(x=n,y=1-typeIIErrors,type="l",xlab="n",ylab="Power",main="Power Plot, muA=72")

muA<-18
n<-seq(from=1,to=350,by=1)
typeIIErrors<-pnorm(qnorm(0.975)-abs(19.34-muA)/(8.2/sqrt(n)))
plot(x=n,y=1-typeIIErrors,type="l",xlab="n",ylab="Power",main="Power Plot, muA=18")



