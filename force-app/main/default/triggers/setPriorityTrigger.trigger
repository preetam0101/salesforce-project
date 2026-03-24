trigger setPriorityTrigger on Task (before insert) {
//whenever a new task is created,set the priority to high.
    if(Trigger.isInsert && Trigger.isBefore){
        //do field update here.
        for(Task Taskrecord : Trigger.NEW){
            system.debug('found new record');
            TaskRecord.Priority ='Low';
        }
    }
}