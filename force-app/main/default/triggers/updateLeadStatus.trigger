trigger updateLeadStatus on Lead (before update) {
//set the lead status to Working-Contacted.
    if(Trigger.isUpdate && Trigger.isBefore){
        for(Lead LeadrecordUpdate : Trigger.NEW){
            
            LeadrecordUpdate.Status ='Working-Contacted';
        }
    }
}