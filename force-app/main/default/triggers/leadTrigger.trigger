trigger leadTrigger on Lead (before update,after insert,before delete) {
    

    if(Trigger.isAfter && Trigger.isInsert){
        leadTriggerHandler.handleAfterInsert(Trigger.new);
        
    }
 
    
//whenever a Lead is updated && industry=='Healthcare';
//set Source='Purchased List'
//set SIC Code=1100;
//set Primary='Yes';

    if(Trigger.isUpdate && Trigger.isBefore){
        for(Lead UpdateRecord :Trigger.NEW){
            if(UpdateRecord.Industry=='Healthcare'){
                UpdateRecord.LeadSource='Purchased List';
                UpdateRecord.SICCode__c='1100';
                UpdateRecord.Primary__c='Yes';
            }
        }
    }
    
    
    if(Trigger.isdelete && Trigger.isBefore)  {
        leadTriggerHandler.handleBeforeDeleteStatus(Trigger.old);
            
        
      
    }
    
}