#rnorm generate normal variates with given sd and mean
#Every distribution has four types of functions
# r = Random generator, p = cummulative , d= density, q = Quantile
Rprof()
rnorm(5)
set.seed(1) #to re-generate the same pseudo-random nos 
print(x<-rnorm(5))

ppois(2,2)# probability that a poisson r.v with rate 2 is <= 2
dpois(1,2)
ppois(6,2)

#Sampling
sample(1:10,5,replace = F)
sample(1:10)#permutation

#Multithreaded BLAS (Basic Linear Algebra Libraries) are deisgned to 
#run on multicore processor Walltime<CPUtime
#Rprof() keeps track of function call stack at regular intervals of time 
#tabulates how much time spent in each function
#summaryRprof() two methods for normalizing the data
#"by.total" divides time spend in each function by total run time
#"by.self" does the same but first subtracts out time spent in lower level
#functions 

summaryRprof()

