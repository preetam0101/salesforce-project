public class AccountTriggerHandler {  
//If an Account with [Industry=Agriculture & type=Prospect] is updated & ownership is set to Private then Do not allow user to set this Ownership.
    public static void handleActivitiesBeforeUpdate(List<Account> acclist,Map<Id,Account> oldMap){
        
        for(Account accRecords:acclist){
            if(accRecords.Industry=='Agriculture' && accRecords.type=='Prospect'){
                if(oldMap.get(accRecords.Id).Ownership != accRecords.Ownership){
                  accRecords.addError('Ownership can not be updated with agriculture & prospect.');
                }
            } 
        } 
    } 
    
//Trigger USE CASE #10 BY SALESFORCE MAKES SENSE.
//Everytime an "account website i.e.Website" is updated,Update the "website__c" field of child 'CONTACT' for the account.
    public static void handleActivitiesAfterUpdate(List<Account> acclist,Map<ID,Account> oldMap){
        map<ID,String> acctoWebsiteMap=new map<ID,String>();
        list<Account> addaccounttoUpdateChildren=new list<Account>();
        list<ID> addaccountIdList=new list<ID>();
        for(Account newRecords:acclist){
            if(newRecords.website!=oldMap.get(newRecords.ID).website){
                 //if it's true only then update the website field of all child Contacts.
                 acctoWebsiteMap.put(newRecords.ID,newRecords.Website);
                 addaccounttoUpdateChildren.add(newRecords);
                 addaccountIdList.add(newRecords.ID);
            }
        }
        if(addaccounttoUpdateChildren.size() > 0){
           List<Contact> conRecords=[SELECT ID,FirstName From Contact WHERE AccountID IN :addaccountIdList ];
            for(Contact con : conRecords){
              // con.website__c= //parent Account website field value.
               
            }
        }
        
    }   
    
    
}