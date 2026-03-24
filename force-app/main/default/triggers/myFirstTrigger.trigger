trigger myFirstTrigger on Contact (before insert,after insert) {
    if(Trigger.isinsert){
        system.debug('NEW RECORD: '+Trigger.NEW);
    } 
 
    else{
        system.debug('OLD RECORD: '+Trigger.OLD);
    }
    
    

}