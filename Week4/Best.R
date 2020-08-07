#outcome-of-care-measures.csv: Contains information about 30-day mortality and 
#readmission rates for heart attacks, heart failure, and pneumonia for over 
#4,000 hospitals.
#hospital-data.csv: Contains information about each hospital.

#1 Function to plot Histogram
outcome_care_dataset<-read.csv("outcome-of-care-measures.csv", header=T)
outcome_care_dataset[,11]<-as.numeric(outcome_care_dataset[,11])
hist(outcome_care_dataset$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)

#2 Finding the best hospital in a state
best <- function(state, outcome) {
  ## Read outcome data
best_hospital<-as.data.frame(cbind(outcome_care_dataset[,2], #Name of Hospital
                                   outcome_care_dataset[,7],#state
                                   outcome_care_dataset[,11],#heart attack
                                   outcome_care_dataset[,17],#heart failure
                                   outcome_care_dataset[,23])#pneumonia
                                   ,stringsAsfactors = F)
names<-c("hospital__name","state","heart attack",
         "heart failure","pneumonia")
colnames(best_hospital)<-names

#check if state is valid
if(!state %in% best_hospital$state){
  stop("Invalid State")
}else if(!outcome %in% c("heart attack","heart failure","pneumonia")){
  stop("Invalid outcome")
}else{
## Return hospital name in that state with lowest 30-day death rate
target_data<-best_hospital[which(best_hospital[,'state'] == state),]
r_col<-as.numeric(target_data[,eval(outcome)])
result<-target_data[,1][which((r_col)== min(r_col,na.rm = T))]
result<-result[order(result)]}
return(result)
}
