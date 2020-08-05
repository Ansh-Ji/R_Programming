library(datasets)
data(iris)
tapply(iris$Sepal.Length, iris$Species, mean)
x<-subset(iris,iris$Species=="virginica")
round(mean(x$Sepal.Length))


data(mtcars)
?mtcars
unique(mtcars$cyl)
tapply(mtcars$mpg, mtcars$cyl, mean)
with(mtcars,tapply(mpg,cyl,mean))
sapply(split(mtcars$mpg, mtcars$cyl), mean)

averagehp<-tapply(mtcars$hp, mtcars$cyl, mean)
round(abs(averagehp[3] - averagehp[1]))
