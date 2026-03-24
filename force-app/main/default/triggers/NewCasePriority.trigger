trigger NewCasePriority on Case (before insert,before Update) {
//setting the new case priority to high if origin is phone otherwise low.

    if(Trigger.isBefore || Trigger.isUpdate && Trigger.isInsert){
        for(Case Casepriority : Trigger.NEW){
            if(Casepriority.Origin=='Phone'){	
                Casepriority.Priority ='High';
            }
            else{
                Casepriority.Priority='low';
            }
        }
    }
}