bojack<-read.csv("BH.csv",skip = 0)
names<-c("Episode","Run_Time","IMDB_Rating","Year","Month","Air_Day")
colnames(bojack)<-names
print(bojack)
datamean<-function(y,removeNA = T){
  nc<-ncol(y)
  means<-numeric(nc)
  for(i in 1:nc){
    means[i]<-mean(y[,i])
  }
  means
}
datamean(bojack)
x<-factor(bojack$Month)
z<-factor(bojack$Year)
a<-data.frame(z,x)
table(a)
best_episodes<-subset(bojack,IMDB_Rating>8.7)
best_episodes
plot(IMDB_Rating~Year,data=bojack,title(main="BOJACK HORSEMAN"))
