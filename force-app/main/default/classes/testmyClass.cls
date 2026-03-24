@isTest
public class testmyClass {

    @isTest
    public static void testcreateAccount(){
        
          String Name='mPhasis limited';
       //  String Active__c='true';
        String BillingCity='INDORE';
       // String AccountNumber='27382173921309';
       
        test.startTest();
        
        myClass.createAccount(Name, BillingCity);
        
        test.stopTest();
        
        List<Account> accLists = [SELECT Id FROM Account WHERE CreatedDate = TODAY];
        
        system.assertEquals(1,accLists.size(),'an Account gixer have been created ');
        
        
    }
    
    @isTest
    public static void testupdateContact(){
      

        //Create test data
        Contact con = new Contact(
            FirstName = 'Vijay',
            LastName = 'Malya',
            Phone = '1111111111'
        );
        insert con;
        
         // Call the method
        Test.startTest();
        List<Contact> result = myClass.updateContact();
        Test.stopTest();
		
        
        con.Phone='01125532553';
        update con;
   
         // Fetch updated contact
        Contact updatedCon = [
            SELECT Phone 
            FROM Contact 
            WHERE Id = :result[0].Id
        ];

        //  Verify result

        System.assertEquals('01125532553', updatedCon.Phone);
 
        
    }
    
}