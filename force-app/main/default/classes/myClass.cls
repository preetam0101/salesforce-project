public class myClass {
    
    public static List<Account> createAccount( String Name, String BillingCity){
     
       Account acc = new Account();
        
        acc.Name='mPhasis limited';
        
     //   acc.Active__c='true';
     
        acc.BillingCity='INDORE';
        
       // acc.AccountNumber='27382173921309';
        
        insert acc;
        
        List<Account> accList = new List<Account>{acc};
            
            return accList ;
    
    }
    
    public static List<Contact> updateContact(){
       
        Contact con = [SELECT Id, Name FROM Contact WHERE FirstName = 'Vijay'  LIMIT 1];

		con.Phone = '01125532553';
        
        List<Contact> conList =new List<Contact>{con};

		update con;
        
        return conList;
        
    }
       
}