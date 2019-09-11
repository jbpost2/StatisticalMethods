#####################################################
##ANOVA,data,generation,and,plots,etc.,ST,511,
##Justin,Post,-,Fall,2014
#####################################################

#create,true,means
mus<-c(52,,48,,43,,47)
#sample,size,(reps)
n<-20
#variances
var<-c(18,0.6)

#generate,data
set.seed(93)
temp1<-rnorm(n=n*length(mus),mean=rep(mus,each=n),sd=sqrt(var[1]))
temp2<-rnorm(n=n*length(mus),mean=rep(mus,each=n),sd=sqrt(var[2]))

seq1<-1:n
seq2<-(n+1):(2*n)
seq3<-(2*n+1):(3*n)
seq4<-(3*n+1):(4*n)
boxplot(temp1[seq1],temp1[seq2],temp1[seq3],temp1[seq4],names=c("Syrup26","Syrup42","Syrup55","Syrup62"),main="hypothetical,data,1")
boxplot(temp2[seq1],temp2[seq2],temp2[seq3],temp2[seq4],names=c("Syrup26","Syrup42","Syrup55","Syrup62"),main="hypothetical,data,1")

realdata<-matrix(c(
26,1,51.89,6.22,17.43,
26,2,51.52,6.18,17.09,
26,3,52.69,6.09,17.59,
26,4,52.06,6.36,17.5,
26,5,51.63,6.13,17.19,
26,6,52.73,6.12,17.5,
42,1,47.21,7.02,16,
42,2,48.57,6.42,15.91,
42,3,47.57,6.84,16.04,
42,4,46.85,6.97,15.85,
42,5,48.64,6.30,16.21,
42,6,47.49,6.91,15.91,
55,1,41.43,7.71,13.74,
55,2,42.31,7.59,13.98,
55,3,42.31,7.63,14.42,
55,4,41.49,7.66,13.58,
55,5,42.12,7.56,14.03,
55,6,42.65,7.55,14.4,
62,1,45.99,6.84,15.68,
62,2,46.66,6.66,16.3,
62,3,47.35,6.49,15.7,
62,4,45.83,6.96,15.61,
62,5,46.77,6.66,15.91,
62,6,47.88,6.34,15.64),byrow=TRUE,ncol=5,dimnames=list(c(),c("syrup","rep","L","a","b")))

boxplot(realdata[realdata[,1]==26,3],realdata[realdata[,1]==42,3],realdata[realdata[,1]==55,3],realdata[realdata[,1]==62,3],names=c("Syrup26","Syrup42","Syrup55","Syrup62"),main="Actual Data Boxplots")
abline(h=mean(realdata[,3]))
text(paste("overall mean = ",round(mean(realdata[,3]),2),sep=""),y=46,x=1.4)
text(paste("26 mean=",round(mean(realdata[realdata[,1]==26,3]),2),sep=""),y=52,x=2)
text(paste("42 mean=",round(mean(realdata[realdata[,1]==42,3]),2),sep=""),y=49,x=1.5)
text(paste("55 mean=",round(mean(realdata[realdata[,1]==55,3]),2),sep=""),y=42,x=2)
text(paste("62 mean=",round(mean(realdata[realdata[,1]==62,3]),2),sep=""),y=49,x=4)


