#outcome-of-care-measures.csv: Contains information about 30-day mortality and 
#readmission rates for heart attacks, heart failure, and pneumonia for over 
#4,000 hospitals.
#hospital-data.csv: Contains information about each hospital.
#Hospital_Revised_Flatfiles.pdf: Descriptions of the variables in each file 
#(i.e the code book).

#1 Plot the 30-day mortality rates for heart attack

outcome<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
str(outcome)
outcome[,11]<-as.numeric(outcome[,11])
outcome[,11]
hist(outcome[,11])

#2 Finding the best hospital in a state

best <- function(state, outcome) {
  ## Read outcome data
  data<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
  split(data,data$outcome)
  
  ## Check that state and outcome are valid
  if(match(state,x))
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
}