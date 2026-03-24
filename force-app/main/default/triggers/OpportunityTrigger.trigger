trigger OpportunityTrigger on Opportunity (after delete,before update,after update) {
//As soon as the opportunity is deleted create a task for the opportunity account owner to investigate why the opportunity was deleted and submit the information.
    if(Trigger.isafter && Trigger.isdelete){
    OpportunityTriggerHandeler.HandleMyAfterDelete(Trigger.old);	
    }
    
    
    
    
    
//if stage is updated by any kind,then Update Opportunity Amount based on Probability*Expected Revenue.
//for before Update trigger-
    if(Trigger.isBefore && Trigger.isUpdate ){
        OpportunityTriggerHandeler.handleActivitiesBeforeUpdate(Trigger.NEW,Trigger.oldMap);
        
    }
     
//if stage=='Closed Won';
//then create a task for the opportunity owner to split the revenue among the team with high priority.
//for after Update trigger-
	   if(Trigger.isAfter && Trigger.isUpdate){
        OpportunityTriggerHandeler.handleActivitiesAfterUpdate(Trigger.NEW);
        
    }
    
}