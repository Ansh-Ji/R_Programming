##Matrices
##Matrices have dimension attribute
x<-matrix(nrow=2,ncol=2)#initialzed with NA values
dim(x)
#matrix are constructed columnwise
x<-matrix(1,1,0,1,0,1,0,1,1, nrow=3,ncol = 3)
m <-1:20
dim(m)<-c(4:5)
m
##Matrix can also be created using rbind and cbind
a<-0:10
b<-10:0
cbind(a,b)
rbind(a,b)
cbind(c(1,1,0),c(1,0,1),c(0,1,1))
m<-cbind(c(1,1,0),c(1,0,1),c(0,1,1))
colnames(m)<-c("J","A","N")
rownames(m)<-c("I","S","H")
m
##BY default when a single element of matrix is retreived it returns a vector instead of matrix
##by setiing drop=F we can get a 1x1 matrix
a<-matrix(1:10,5,5)
a[1,2,drop=F]
