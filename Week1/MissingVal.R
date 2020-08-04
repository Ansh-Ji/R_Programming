##Removing NA values

x<-read.csv("hw1_data.csv",header=T,comment.char = " ")
x[1:2,]
tail(x)
nrow(x)
is.data.frame(x)
bad<-is.na(x)
x[!bad,]
good<-complete.cases(x$Ozone)
153-length(x$Ozone[good])
better<-complete.cases(x$Ozone)
x[better,][1:6,]
x[1:6][1:2]
x[1:2,]
x[47,1]
u<-as.data.frame(x[,1])
bad1<-is.na(u)
u[!bad1]
summary(u[!bad1])
summary(u)
data1<-x[x$Ozone>31 && x$Temp>90]
print(data1)
data1<-subset(x,Ozone>31 & Temp>90)
mean(data1$Solar.R)
tempe<-subset(x,Month==6)
summary(tempe[,4])
summary(subset(x,Month==5)[,1])
x<-4L
class(x)
x<-c(1,3,5)
y<-c(3,2,10)
z<-rbind(x,y)
z
c(1:4)+c(2:3)
summary(subset(x,Ozone>31 & Temp>90)[,2])
summary(subset(x,Month==6)[,4])
