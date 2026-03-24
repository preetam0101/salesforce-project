trigger addErrorTrigger on Account (before update) {
    if(Trigger.isUpdate && Trigger.isBefore){
        for(Account accTrigger : Trigger.NEW){
            if(accTrigger.Ownership=='public'){
                accTrigger.COUNTRY__C='INDIA';
            }
        }
    }
}