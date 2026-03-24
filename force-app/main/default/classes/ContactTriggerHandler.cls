public class ContactTriggerHandler {
//it is handler class that will prevent a CONTACT record from save if the PARENT account is not assigned to it.
    public static void handleBeforeInsertActivities(List<Contact> newcontact){
        for(Contact conRecord : newcontact){
            if(conRecord.AccountId==null){
                conRecord.AccountId.addError('please assign a Parent Record.');
            }
        }
    }
}