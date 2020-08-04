##Factor special type of vector used for cateogerical data
##Integer vector having labels
#Linear models used lm, glm
x <- factor(c(0,2,1,2,2,2,3,1))
x
#row.names(x)<-c("No.Heads","Frequency")
table(x)
#unclass(x) //bring it down to an integer vector
y<-factor(c('J',"N","N","J","J"))
y

y

#Missing Values
is.na(x)
is.nan(x)
#Na values have class too
##A nan value is also NA but the inverse not true
