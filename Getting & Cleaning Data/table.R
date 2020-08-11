#data.table inherits from data.frame
#all function that work on data.frame also work on data.table
#quiet fast as written in c 

df = data.frame(x=rnorm(9),y=rep(c('c','a','b'),each=3),z=rpois(9,1))

dt = data.table(x=rnorm(9),y=rep(c('c','a','b'),each=3),z=rpois(9,1))
tables() #view all the tables in memory
#subsetting tables the same as data.frames but subsetting column isn't
dt[,list(mean(x),sum(z))] #pass expression
dt[,table(y)]

#add new columns easily
dt[,w:=z^2]
#explicitly have to copy otherwise copies aren't created
dt[,m:={temp=x+z; log2(temp+9)}]
DT<-data.table(x=sample(letters[1:3],100,T))
DT[, .N, by=x] #imp in counting
#most important distinction is key
#perform natural join usinng merge
#read.table much faster than fread(file)

