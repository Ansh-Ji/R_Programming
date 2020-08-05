#Loop over a list and evaluate a function for every element
ceaser<-function(plain_text,key){
  x_num<-(match(plain_text,LETTERS)+key)
  c<-LETTERS[x_num]
  return(c)
}
lapply(c("H","E","L","L","O"), ceaser, key=4)#Always returns a list

x<-1:10
lapply(x, runif,min=0,max=10)#random uniform distribution generated 
                #first argument is no of values needed

x<-list(a=matrix(1:4,2,2),b=matrix(1:6,3,2))
#lapply(x, solve)
lapply(x, function(elt) elt[,1])#Anonymous function
