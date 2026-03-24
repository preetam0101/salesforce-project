trigger AccountTrigger on Account (before update,after update) {
    //before update
    if(Trigger.isBefore && Trigger.isUpdate){
        AccountTriggerHandler.handleActivitiesBeforeUpdate(Trigger.NEW,Trigger.oldMap);
    }
//AFTER UPDATE    
    if(Trigger.isAfter && Trigger.isUpdate){
        AccountTriggerHandler.handleActivitiesAfterUpdate(Trigger.new,Trigger.oldMap);
    }
}