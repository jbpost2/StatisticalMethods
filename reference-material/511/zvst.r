#R sim to compare using sigma vs s in the standardized statistic


par(ask=TRUE)
par(mfrow=c(1,3))

#Simulate 10000 samples of size 10 from N(mu,sigma) distribution
n<-3
N<-50000
mu<-10
sigma<-3

data<-matrix(0,nrow=N,ncol=n)

#Create the data
for (i in 1:N){
data[i,]<-rnorm(n=n,mean=mu,sd=sigma)
}

#calculate the means for each sample
means<-apply(X=data,FUN=mean,MARGIN=1)

#calculate the sd for each sample
sds<-apply(X=data,FUN=sd,MARGIN=1)

#Calculate the N values of z=(y-bar-mu)/(sigma/sqrt(n))
Zs<-(means-mu)/(sigma/sqrt(n))
#Calculate the N values of t=(y-bar-mu)/(s/sqrt(n))
Ts<-(means-mu)/(sds/sqrt(n))

z1<-hist(Zs,plot=FALSE,breaks=seq(from=min(Zs)-1,to=max(Zs)+1,by=0.25))
t1<-hist(Ts,plot=FALSE,breaks=seq(from=min(Ts)-1,to=max(Ts)+1,by=0.25))

plot( z1, col=rgb(0,0,1,1/4),main=paste("Approximate distribution of Z and T statistics with n = ",n),xlab="Z and T values from Normal Parent",xlim=c(-5,5))  
plot( t1, col=rgb(1,0,0,1/4), add=T) 
legend(x="topright",col=c(rgb(0,0,1,1/4),rgb(1,0,0,1/4)),legend=expression("Zs","Ts"),pch=15,cex=2.5)



#Simulate 50000 samples of size 10 from N(mu,sigma) distribution
n<-10
N<-50000
mu<-10
sigma<-3

data<-matrix(0,nrow=N,ncol=n)

#Create the data
for (i in 1:N){
data[i,]<-rnorm(n=n,mean=mu,sd=sigma)
}

#calculate the means for each sample
means<-apply(X=data,FUN=mean,MARGIN=1)

#calculate the sd for each sample
sds<-apply(X=data,FUN=sd,MARGIN=1)

#Calculate the N values of z=(y-bar-mu)/(sigma/sqrt(n))
Zs<-(means-mu)/(sigma/sqrt(n))
#Calculate the N values of t=(y-bar-mu)/(s/sqrt(n))
Ts<-(means-mu)/(sds/sqrt(n))

z1<-hist(Zs,plot=FALSE,breaks=seq(from=min(Zs)-1,to=max(Zs)+1,by=0.25))
t1<-hist(Ts,plot=FALSE,breaks=seq(from=min(Ts)-1,to=max(Ts)+1,by=0.25))

plot( z1, col=rgb(0,0,1,1/4),main=paste("Approximate distribution of Z and T statistics with n = ",n),xlab="Z and T values from Normal Parent",xlim=c(-5,5))  
plot( t1, col=rgb(1,0,0,1/4), add=T) 
legend(x="topright",col=c(rgb(0,0,1,1/4),rgb(1,0,0,1/4)),legend=expression("Zs","Ts"),pch=15,cex=2.5)






#Simulate 50000 samples of size 10 from N(mu,sigma) distribution
n<-40
N<-50000
mu<-10
sigma<-3

data<-matrix(0,nrow=N,ncol=n)

#Create the data
for (i in 1:N){
data[i,]<-rnorm(n=n,mean=mu,sd=sigma)
}

#calculate the means for each sample
means<-apply(X=data,FUN=mean,MARGIN=1)

#calculate the sd for each sample
sds<-apply(X=data,FUN=sd,MARGIN=1)

#Calculate the N values of z=(y-bar-mu)/(sigma/sqrt(n))
Zs<-(means-mu)/(sigma/sqrt(n))
#Calculate the N values of t=(y-bar-mu)/(s/sqrt(n))
Ts<-(means-mu)/(sds/sqrt(n))


z1<-hist(Zs,plot=FALSE,breaks=seq(from=min(Zs)-1,to=max(Zs)+1,by=0.25))
t1<-hist(Ts,plot=FALSE,breaks=seq(from=min(Ts)-1,to=max(Ts)+1,by=0.25))

plot( z1, col=rgb(0,0,1,1/4),main=paste("Approximate distribution of Z and T statistics with n = ",n),xlab="Z and T values from Normal Parent",xlim=c(-5,5))  
plot( t1, col=rgb(1,0,0,1/4), add=T) 
legend(x="topright",col=c(rgb(0,0,1,1/4),rgb(1,0,0,1/4)),legend=expression("Zs","Ts"),pch=15,cex=2.5)











#R sim to compare using sigma vs s in the standardized statistic

#Simulate 50000 samples of size 10 from uniform 0,10 distribution
n<-10
N<-50000
min<-0
max<-10

data<-matrix(0,nrow=N,ncol=n)

#Create the data
for (i in 1:N){
data[i,]<-runif(n=n,min,max)
}

#calculate the means for each sample
means<-apply(X=data,FUN=mean,MARGIN=1)

#calculate the sd for each sample
sds<-apply(X=data,FUN=sd,MARGIN=1)

#Calculate the N values of z=(y-bar-mu)/(sigma/sqrt(n))
Zs<-(means-(min+max)/2)/sqrt(((max-min)^2/12)/(n))
#Calculate the N values of t=(y-bar-mu)/(s/sqrt(n))
Ts<-(means-(min+max)/2)/(sds/sqrt(n))

z1<-hist(Zs,plot=FALSE,breaks=seq(from=min(Zs)-1,to=max(Zs)+1,by=0.25))
t1<-hist(Ts,plot=FALSE,breaks=seq(from=min(Ts)-1,to=max(Ts)+1,by=0.25))

plot( z1, col=rgb(0,0,1,1/4),main=paste("Approximate distribution of Z and T statistics with n = ",n),xlab="Z and T values from Uniform",xlim=c(-5,5))  
plot( t1, col=rgb(1,0,0,1/4), add=T) 
legend(x="topright",col=c(rgb(0,0,1,1/4),rgb(1,0,0,1/4)),legend=expression("Zs","Ts"),pch=5)



#R sim to compare using sigma vs s in the standardized statistic

#Simulate 50000 samples of size 10 from uniform 0,10 distribution
n<-30
N<-50000
min<-0
max<-10

data<-matrix(0,nrow=N,ncol=n)

#Create the data
for (i in 1:N){
data[i,]<-runif(n=n,min,max)
}

#calculate the means for each sample
means<-apply(X=data,FUN=mean,MARGIN=1)

#calculate the sd for each sample
sds<-apply(X=data,FUN=sd,MARGIN=1)

#Calculate the N values of z=(y-bar-mu)/(sigma/sqrt(n))
Zs<-(means-(min+max)/2)/sqrt(((max-min)^2/12)/(n))
#Calculate the N values of t=(y-bar-mu)/(s/sqrt(n))
Ts<-(means-(min+max)/2)/(sds/sqrt(n))


z1<-hist(Zs,plot=FALSE,breaks=seq(from=min(Zs)-1,to=max(Zs)+1,by=0.25))
t1<-hist(Ts,plot=FALSE,breaks=seq(from=min(Ts)-1,to=max(Ts)+1,by=0.25))

plot( z1, col=rgb(0,0,1,1/4),main=paste("Approximate distribution of Z and T statistics with n = ",n),xlab="Z and T values from Uniform",xlim=c(-5,5))  
plot( t1, col=rgb(1,0,0,1/4), add=T) 
legend(x="topright",col=c(rgb(0,0,1,1/4),rgb(1,0,0,1/4)),legend=expression("Zs","Ts"),pch=5)


#R sim to compare using sigma vs s in the standardized statistic

#Simulate 50000 samples of size 10 from uniform 0,10 distribution
n<-50
N<-50000
min<-0
max<-10

data<-matrix(0,nrow=N,ncol=n)

#Create the data
for (i in 1:N){
data[i,]<-runif(n=n,min,max)
}
#calculate the means for each sample
means<-apply(X=data,FUN=mean,MARGIN=1)

#calculate the sd for each sample
sds<-apply(X=data,FUN=sd,MARGIN=1)

#Calculate the N values of z=(y-bar-mu)/(sigma/sqrt(n))
Zs<-(means-(min+max)/2)/sqrt(((max-min)^2/12)/(n))
#Calculate the N values of t=(y-bar-mu)/(s/sqrt(n))
Ts<-(means-(min+max)/2)/(sds/sqrt(n))



z1<-hist(Zs,plot=FALSE,breaks=seq(from=min(Zs)-1,to=max(Zs)+1,by=0.25))
t1<-hist(Ts,plot=FALSE,breaks=seq(from=min(Ts)-1,to=max(Ts)+1,by=0.25))

plot( z1, col=rgb(0,0,1,1/4),main=paste("Approximate distribution of Z and T statistics with n = ",n),xlab="Z and T values from Uniform",xlim=c(-5,5))  
plot( t1, col=rgb(1,0,0,1/4), add=T) 
legend(x="topright",col=c(rgb(0,0,1,1/4),rgb(1,0,0,1/4)),legend=expression("Zs","Ts"),pch=5)

























#R sim to compare using sigma vs s in the standardized statistic

#Simulate 50000 samples of size 10 from exp(lambda) distribution
n<-20
N<-50000
rate<-0.5

data<-matrix(0,nrow=N,ncol=n)

#Create the data
for (i in 1:N){
data[i,]<-rexp(n=n,rate=rate)
}

#calculate the means for each sample
means<-apply(X=data,FUN=mean,MARGIN=1)

#calculate the sd for each sample
sds<-apply(X=data,FUN=sd,MARGIN=1)

#Calculate the N values of z=(y-bar-mu)/(sigma/sqrt(n))
Zs<-(means-(1/rate))/sqrt((1/rate^2)/(n))
#Calculate the N values of t=(y-bar-mu)/(s/sqrt(n))
Ts<-(means-(1/rate))/(sds/sqrt(n))

z1<-hist(Zs,plot=FALSE,breaks=seq(from=min(Zs)-1,to=max(Zs)+1,by=0.25))
t1<-hist(Ts,plot=FALSE,breaks=seq(from=min(Ts)-1,to=max(Ts)+1,by=0.25))

plot( z1, col=rgb(0,0,1,1/4),main=paste("Approximate distribution of Z and T statistics with n = ",n),xlab="Z and T values from exponential",xlim=c(-5,5))  
plot( t1, col=rgb(1,0,0,1/4), add=T) 
legend(x="topright",col=c(rgb(0,0,1,1/4),rgb(1,0,0,1/4)),legend=expression("Zs","Ts"),pch=5)



#R sim to compare using sigma vs s in the standardized statistic

#Simulate 50000 samples of size 10 from exp(lambda) distribution
n<-50
N<-50000
rate<-0.5

data<-matrix(0,nrow=N,ncol=n)

#Create the data
for (i in 1:N){
data[i,]<-rexp(n=n,rate=rate)
}

#calculate the means for each sample
means<-apply(X=data,FUN=mean,MARGIN=1)

#calculate the sd for each sample
sds<-apply(X=data,FUN=sd,MARGIN=1)

#Calculate the N values of z=(y-bar-mu)/(sigma/sqrt(n))
Zs<-(means-(1/rate))/sqrt((1/rate^2)/(n))
#Calculate the N values of t=(y-bar-mu)/(s/sqrt(n))
Ts<-(means-(1/rate))/(sds/sqrt(n))


z1<-hist(Zs,plot=FALSE,breaks=seq(from=min(Zs)-1,to=max(Zs)+1,by=0.25))
t1<-hist(Ts,plot=FALSE,breaks=seq(from=min(Ts)-1,to=max(Ts)+1,by=0.25))

plot( z1, col=rgb(0,0,1,1/4),main=paste("Approximate distribution of Z and T statistics with n = ",n),xlab="Z and T values from exponential",xlim=c(-5,5))  
plot( t1, col=rgb(1,0,0,1/4), add=T) 
legend(x="topright",col=c(rgb(0,0,1,1/4),rgb(1,0,0,1/4)),legend=expression("Zs","Ts"),pch=5)








#R sim to compare using sigma vs s in the standardized statistic

#Simulate 50000 samples of size 10 from exp(lambda) distribution
n<-100
N<-50000
rate<-0.5

data<-matrix(0,nrow=N,ncol=n)

#Create the data
for (i in 1:N){
data[i,]<-rexp(n=n,rate=rate)
}

#calculate the means for each sample
means<-apply(X=data,FUN=mean,MARGIN=1)

#calculate the sd for each sample
sds<-apply(X=data,FUN=sd,MARGIN=1)

#Calculate the N values of z=(y-bar-mu)/(sigma/sqrt(n))
Zs<-(means-(1/rate))/sqrt((1/rate^2)/(n))
#Calculate the N values of t=(y-bar-mu)/(s/sqrt(n))
Ts<-(means-(1/rate))/(sds/sqrt(n))



z1<-hist(Zs,plot=FALSE,breaks=seq(from=min(Zs)-1,to=max(Zs)+1,by=0.25))
t1<-hist(Ts,plot=FALSE,breaks=seq(from=min(Ts)-1,to=max(Ts)+1,by=0.25))

plot( z1, col=rgb(0,0,1,1/4),main=paste("Approximate distribution of Z and T statistics with n = ",n),xlab="Z and T values from exponential",xlim=c(-5,5))  
plot( t1, col=rgb(1,0,0,1/4), add=T) 
legend(x="topright",col=c(rgb(0,0,1,1/4),rgb(1,0,0,1/4)),legend=expression("Zs","Ts"),pch=5)






