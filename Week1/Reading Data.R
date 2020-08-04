##How to Read Data
#read table read csv returns a dataframe
#readlines for text lines returns a character vector
data<-read.csv("hw1_data.csv",header=T,comment.char = " ")
print(data)
is.data.frame(data)
nrow(data)
ncol(data)
head(data)
colnames(data)
row.names(data)<-(1:153)
data
summary(data$Ozone)
dput(data,file="y.R")
new.x<-dget("y.R")
new.x
remove(new.x)
rm(count)
rm(data1)
u<-data$Ozone[is.na(data$Ozone)]
u
a<-list(foo=1:4,bar=0.6)
a["bar"]
data["Ozone"]


