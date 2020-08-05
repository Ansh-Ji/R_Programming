#Mapply is a multivariate apply of sorts which applies a function in parallel
#over a set of arguments
#when mutliple lists as arguments instead using a for loop we can use mapply
mapply(rep,1:4,4:1,SIMPLIFY = T)

noise<-function(n, mean, sd){
  rnorm(n, mean, sd)
  #return(noise)
}
noise(5,1,2)
#instant vectorization of function
mapply(noise,1:5,1:5,sd = 2,SIMPLIFY = T)
