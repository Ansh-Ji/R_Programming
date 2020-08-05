#Simplify (Laaply)Loop over a list and evaluate a function for every element
#if result is a list of length 1 then vector returned
#if all vectors have equal length then matrix returned
#else a list is returned
ceaser<-function(plain_text,key){
  x_num<-(match(plain_text,LETTERS)+key)
  c<-LETTERS[x_num]
  return(c)
}
sapply(c("H","E","L","L","O"), ceaser, key=4)#Simplifies the list

x<-1:10
lapply(x, runif,min=0,max=10)#random uniform distribution generated 
#first argument is no of values needed

x<-list(a=matrix(1:4,2,2),b=matrix(1:6,3,2))
#lapply(x, solve)
sapply(x, function(elt) elt[,1])#Anonymous function
