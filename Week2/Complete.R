#Complete is a function to calcuLate the no of complete observations
#(sulfate and nitrate) across a specified list of monitors.
complete <- function(directory, id = 1:332) {
  
  data <- data.frame()
  for (i in id) {
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
    data <- rbind(data,c(dat[1,"ID"],sum(complete.cases(dat))))
  }
  colnames(data)<-c("id","NOBS")
  return(data)
}

