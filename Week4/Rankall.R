rankall<-function(outcome, num){
  outcome_care_dataset<-read.csv("outcome-of-care-measures.csv", header=T)
  best_hospital<-as.data.frame(cbind(outcome_care_dataset[,2],#Name of Hospital
                                     outcome_care_dataset[,7],#state
                                     outcome_care_dataset[,11],#heart attack
                                     outcome_care_dataset[,17],#heart failure
                                     outcome_care_dataset[,23])#pneumonia
                               ,stringsAsfactors = F)
  names<-c("hospital_name","state","heart attack",
           "heart failure","pneumonia")
  colnames(best_hospital)<-names
  dataset<-best_hospital
  if(!outcome %in% c("heart attack","heart failure","pneumonia")){
    stop("Invalid outcome")}
  dataset[ ,eval(outcome)] <- as.numeric(dataset[ ,(outcome)])
  dataset <- dataset[!is.na(dataset[,eval(outcome)]),]
  splited = split(dataset, dataset$state)
  data<-vector()
  for(i in (1:length(splited))){ 
    x<-as.data.frame(splited[i])
    data<-rbind(data,c(rankhospital(x[1,2],outcome,num),x[1,2]))
  }
  data<-as.data.frame(data)
  colnames(data)<-c("hospital","state")
  return(data)}


     