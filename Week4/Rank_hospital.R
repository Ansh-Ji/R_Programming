outcome_care_dataset<-read.csv("outcome-of-care-measures.csv", header=T)
rankhospital <- function(state, outcome,rank='best') {
  ## Read outcome data
  best_hospital<-as.data.frame(cbind(outcome_care_dataset[,2],#Name of Hospital
                                     outcome_care_dataset[,7],#state
                                     outcome_care_dataset[,11],#heart attack
                                     outcome_care_dataset[,17],#heart failure
                                     outcome_care_dataset[,23])#pneumonia
                               ,stringsAsfactors = F)
  names<-c("hospital_name","state","heart attack",
           "heart failure","pneumonia")
  colnames(best_hospital)<-names
  
  #check if state is valid
  if(!state %in% best_hospital$state){
    stop("Invalid State")
  }else if(!outcome %in% c("heart attack","heart failure","pneumonia")){
    stop("Invalid outcome")
    
  }else if(is.numeric(rank)){
    target_data<-best_hospital[which(best_hospital[,'state'] == state),]
    r_col<-as.numeric(target_data[,eval(outcome)])
    result<-target_data[order(r_col,target_data[,1]),]
    result<-result[rank,1]
               
    }else if(!is.numeric(rank)){
      if(rank == 'best'){
      target_data<-best_hospital[which(best_hospital[,'state'] == state),]
      r_col<-as.numeric(target_data[,eval(outcome)])  
      result<-target_data[,1][which((r_col)== min(r_col,na.rm = T))]
      result<-result[order(result)]}
      else if(rank == 'worst'){
      target_data<-best_hospital[which(best_hospital[,'state'] == state),]
      r_col<-as.numeric(target_data[,eval(outcome)])
      result<-target_data[,1][which((r_col)== max(r_col,na.rm = T))]
      result<-result[order(result)]}
    }else{stop("Invalid Rank")}
  return(result)
  }

