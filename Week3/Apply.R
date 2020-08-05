#apply generally used to evaluate an anonymous function over the margins of an
#array ex:taking average of an array of matrices
?apply
x<-matrix(rnorm(100,1,1),10,10)
#for a matrix, the margin arg 1 indicates row and 2 indicates column
#some useful function
#rowSums=apply(x, 1, sum)
#rowMeans = apply(x, 1,mean)
#colSums=apply(x, 2, sum)
#colMeans=apply(x,2,mean)

#qunatile of the rows of a matrix
x<-matrix(rnorm(200),20,10)
x
apply(x, 1, quantile, probs = c(0.5,0.75),na.rm = T)

a<-array(rnorm(2*2*10),c(2,2,10))
apply(a, c(1,2),mean)
apply(a, c(3),mean)
apply(a,1,mean)
rowMeans(a,dims=2L)#same as apply(a, c(1,2),mean)
