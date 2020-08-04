#Pollutant Mean is a function to calcuLate the mean of pollutant
#(sulfate or nitrate) across a specified list of monitors.
pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  data <- data.frame()
  for (i in id) {
    if (i < 10) {
      dat <- read.csv(paste("00", as.character(i),".csv", sep = ""), 
                      as.is = T, 
                      header = T)
      data <- rbind(data,dat)
    }
    else if (i < 100) {
      dat <- read.csv(paste("0", as.character(i),".csv", sep = ""), 
                      as.is = T, 
                      header = T)
      data <- rbind(data,dat)
    }
    else {
      dat <- read.csv(paste(as.character(i),".csv", sep = ""), 
                      as.is = T, 
                      header = T)
      data <- rbind(data,dat)
    }
  }
  return(mean(data[,pollutant],na.rm = T))
}

