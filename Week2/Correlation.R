#Complete is a function to calcuLate the no of complete observations
#(sulfate and nitrate) across a specified list of monitors.
correlation <- function(directory, threshold = 0) {
  cor_result<-c()
  data <- complete("specdata",id=1:332)
  data <- subset(data,data$NOBS>threshold)
  for (i in data$id){
    if (i < 10) {
      dat <- read.csv(paste("00", as.character(i),".csv", sep = ""), 
                      as.is = T, 
                      header = T)
    }
    else if (i < 100) {
      dat <- read.csv(paste("0", as.character(i),".csv", sep = ""), 
                      as.is = T, 
                      header = T)
    }
    else {
      dat <- read.csv(paste(as.character(i),".csv", sep = ""), 
                      as.is = T, 
                      header = T)
    }
    testdata <- dat[(!is.na(dat$sulfate)),]
    testdata <-testdata[(!is.na(testdata$nitrate)),]
    cor_result<-c(cor_result,cor(testdata$sulfate,testdata$nitrate))
  }
  return(cor_result)
}
  
  
