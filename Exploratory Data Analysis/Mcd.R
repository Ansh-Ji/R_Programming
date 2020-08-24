---
title: "McDonald's"
author: "Janish Parikh"
date: "16/08/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r}
library('dplyr')
```

```{r}
menudata<-tibble::as_tibble(read.csv('menu.csv',header = T, comment.char = ''))
head(menudata)
```
Understanding the calories
```{r}
cal<-select(menudata,c(1,2,4))
summary(cal)
hist(cal$Calories,col='yellow',main = "McD Calories", xlab = 'Calories')
rug(cal$Calories)
abline(v=median(cal$Calories),col = 'Red', lwd =2)
boxplot(cal$Calories,col = 'yellow')
abline(h=500, col= "red")
highestcal<-cal[which(cal$Calories==max(cal$Calories)),]
print(highestcal)
cal<-cal[order(desc(cal$Calories),cal$Item),]
cal$catf<-as.factor(cal$Category)
plot(cal$Calories~cal$catf, col='yellow')
abline(h=median(cal$Calories), col='red')
```

```{r}


```