trigger ContactTrigger on Contact (before insert) {
//before insert 
//this is a trigger and its handler class will prevent a CONTACT record from save if the PARENT account is not assigned to it.
    if(Trigger.isInsert && Trigger.isBefore){
        ContactTriggerHandler.handleBeforeInsertActivities(Trigger.new);
    }
}