public class arithmatics {
       //OPERATORS IN SALESFORCE. && and || and !
    public static void handleCustomerInteraction(string typeofCustomer,decimal purchaseAmount,boolean isNewUser,boolean requestedRefund){
        if(typeofCustomer=='PREMIUM' && purchaseAmount>0){
            system.debug('hello sir you are our premium member,CONGRATULATIONS on your first purchase.');
        }
        else if(typeofCustomer=='REGULAR' && purchaseAmount>0){
            system.debug('CONGRATULATIONS on your first purchase.');
        }
        //a custumer is neither PREMIUM nor REGULAR but give him 10% discount.
        if(typeofCustomer !='PREMIUM' && typeofCustomer!='REGULAR' && purchaseAmount>0){
            system.debug('congratulations the 10% discount has been added on your purchase.');
        }
        //A CUSTOMER IS EITHER PREMIUM OR REGULAR OR GUEST AND HAD MADE A PURCHASE THEN GREET HIM WITH A THANKYOU MESSAGE, 
        //HERE "OR LOGIC" COMES IN.
        if((typeofCustomer=='PREMIUM'||typeofCustomer=='REGULAR') && purchaseAmount>0){
            system.debug('THANKYOU FOR BEING OUR VALUABLE CUSTOMER.');
            // if((typeofCustomer=='PREMIUM'||typeofCustomer=='REGULAR') && purchaseAmount>0).
            //IF(( FALSE ||FALSE) && TRUE)---WILL BE EXECUTED.
            // 
            // IF((FALSE||TRUE) && FALSE)---WILL BE NOT EXECUTED.
            // 
        }
        if(typeofCustomer=='PREMIUM'||(typeofCustomer=='REGULAR' && purchaseAmount>0)){
            system.debug('THANKYOU FOR BEING OUR VALUABLE CUSTOMER.');
          //  SEE THE "()" PRIORITY.
          //  if(FALSE||(FALSE && TRUE)) ---WILL NOT BE EXECUTED.
          //  if(FALSE||(FALSE && FALSE))---
          //  if(FALSE||(TRUE && TRUE))----CODE WILL BE EXECUTED.
          //  if(TRUE||(FALSE && TRUE))----
          //  if(TRUE||(FALSE && FALSE))--- 
         
        }  
//NOT OPERATOR [ ! ], [ != ],[ !< ],[ !> ], [ !== ] etc.
        IF(typeofCustomer !='REGULAR'&& !isNewUser){		//if it is "not a regular user & not a new user" then print this.
            system.debug('you are a premium member.');
        }
//use case-if the customer is a PREMIUM member and has not purchased anything yet BUT had made a refund request. send him an inconsistent method message.

        IF(typeofCustomer=='PREMIUM' && purchaseAmount==0 && requestedRefund){
            system.debug('sorry,the refund can not be requested as you have not purchased anything yet.');
        }
        
         
    } 
    
    
    
 
    //conditional if ,else-if,else statements.
    public static void handleCustomerInteraction(string typeofCustomer,decimal purchaseAmount,boolean isNewUser){
        if(typeofCustomer=='PREMIUM'){
            system.debug('hello sir you are our premium member');
        }
        else{system.debug('Hello Sir');}
        if(purchaseAmount<1000){
            system.debug('your cart is not ready yet please purchase for atleast 1000 ruppees.');
        }
        else if(purchaseAmount>1000){
            system.debug('your cart is ready to deliver at HOME');
        }
        if(isNewUser){
            system.debug('welcome dear user');
        }
        else{system.debug('welcome again');}
    }
    
//SWITCH WHEN STATEMENT.    
    
    public static void mydailyRoutine(integer timeatClock){
        switch on timeatClock{
            when 5{system.debug('WAKE UP');}
            when 6{system.debug('BREAKFAST');}
            when 7{system.debug('STUDY');}
            when 12{system.debug('LUNCH');}
            when 17{system.debug('COFFEE');}
            when ELSE{system.debug('SCROLLING');}
        }
    }
 
    
    
    
    
//FOR LOOPS IN APEX
     public static void forloopsmethod(){
 
        list<string> myList=new list<string>{'PREETAM','SURAJ'};     //FOR LOOP FOR LIST
        for(string Name:myList){
        system.debug('Name:'+Name);}
        
        set<id> myset=new set<id>{'001Qy00001j0GC4IAM'};	//FOR LOOP FOR SET
        for(id recordid :myset){
        system.debug('recordid='+recordid);}

        for(integer i1=0; i1<6; i1++){
        system.debug('i1='+i1);}
         
        list<string> mylist1=new list<string>{'RAM','SHYAM','HARSHIT','SHIVAM','PANKAJ'};
        for(integer i=0 ; i< mylist1.size() ; i++){
        system.debug(mylist1.get(i));
}} 
    
    
//APEX TESTING     for this you have to create 2 class lets assume NEWCLASS & NEWCLASSTEST

/*
PUBLIC CLASS NEWCLASS{   
    public static Decimal methodname44a(string operation,integer i1,integer i2){
        IF(operation == 'Add'){
        return i1 + i2 ;}
        ELSE IF(operation == 'subtract'){
        return i1 - i2 ;}        
        ELSE{ return i1*i2; }}}*/     
/*
@isTest
public class NEWCLASSTEST{
    @isTest static void methodName45(){
        decimal i1=NEWCLASS.methodname44a('Add',5,9);
        system.assertEquals(14,i1);
        decimal i2=NEWCLASS.methodname44a('subtract',15,5);
        system.assertEquals(10,i2);
       decimal i3=NEWCLASS.methodname44a('mult',5,3);
        system.assertEquals(15,i3);}}                   */
   
    
 
//MAPS AND OPERATIONS ON MAPS
   public static void methodname43(){
         
//map <key,value>  mapname=new map<key,value>();
        map<string,string> map1=new map<string,string>{'INDIA'=>'RUPPEE','USA'=>'dollar'};
        system.debug('map1:'+map1);
//MAP (map to copy)        
        map<string,string> map2=new map<string,string>(map1);
        system.debug('map2:'+map2);

//map<id,sobject>(record list)
	list<Account> acclist=[select ID,Name,Phone from Account LIMIT 1];
        map<ID,sobject> map3= new map<ID,sobject>(acclist);
        system.debug('map3:'+map3);
        
       
//METHODS IN MAP COLLECTION
//clear()
        map<string,integer> map4=new map<string,integer>{'RAM'=>21,'RAAJ'=>23};
        system.debug(map4);
        map4.clear();
        system.debug(map4);

       
//clone()
        map<string,integer> map5=new map<string,integer>{'RAM'=>21,'RAAJ'=>23};
        system.debug(map5);
        map5.clone();
        system.debug(map5);

//containsKey(key)
        map<string,integer> map6=new map<string,integer>{'RAM'=>21,'RAAJ'=>23};
        boolean bool=map6.containsKey('RAM');
        system.debug('bool:'+bool);       
       
       
//mapname.equals(mapname)
        map<string,integer> map7=new map<string,integer>{'RAM'=>21,'RAAJ'=>23};
        map<string,integer> map8=new map<string,integer>{'RAM'=>21,'RAAJ'=>23};

        boolean bool1=map7.equals(map8);
        system.debug('bool1:'+bool1);
       
//get(key)
        map<string,integer> map9=new map<string,integer>{'RAM'=>21,'RAAJ'=>23};
        system.debug(map9.get('RAM'));     
       
//isEmpty()
        map<string,integer> map10=new map<string,integer>{};
        system.debug(map10.isEmpty());

//keySet()
        map<string,integer> map11=new map<string,integer>{'RAM'=>21,'RAAJ'=>23};
        system.debug(map11.keySet());
       
//PUT(KEY,VALUE)
        map<string,integer> map12=new map<string,integer>{'RAM'=>21,'RAAJ'=>23};
        map12.put('SHREE',20);
        system.debug( map12);
 
//putAll(fromMap)
        map<string,integer> map13=new map<string,integer>{'RAM'=>21,'RAAJ'=>23};
        map<string,integer> map14=new map<string,integer>{'SHREE'=>21,'DEV'=>23};
        map13.putAll(map14);
        system.debug('map14:'+map14);

//putAll(sobjectArray)
		list<Account> accountlist=[select id,Name from Account limit 2];
        map<id,sobject> map15=new map<id,sobject>();
        system.debug('accountlist:'+accountlist);
        map15.putAll(accountlist);
        system.debug(map15);
       
//remove(key)  remove the key and returns the corresponding value.
        map<string,integer> map16=new map<string,integer>{'RAM'=>21,'RAAJ'=>23};
        integer i=map16.remove('RAM');
        system.debug('i:'+i);
 
//size() returns the number of key value pairs present in a map.
        map<string,integer> map17=new map<string,integer>{'RAM'=>21,'RAAJ'=>23};
        integer i1=map17.size();
        system.debug('i1:'+i1);
       
//values() returns all the values assigned in a map in the form of LIST.
        map<string,integer> map18=new map<string,integer>{'RAM'=>21,'RAAJ'=>23};
        system.debug(map18.values());
   	       




       
       
       
       
       
       
}
    
    
//SETS AND OPERATION ON SETS LIKE CONSTRUCTORS AND METHODS.
    public static void methodname42(){
      set<string> set1=new set<string>();
        set1.add('ram');
        set1.add('ram');
        set1.add('shyam');
        set1.add('shree');
//CONSTRUCTOR SET TO COPY.       
        system.debug('set1:'+ set1);
        set<string> setC1=new set<string>(set1);
        system.debug('setC1:'+ setC1);
        

        set<integer> set2=new set<integer>{15,23,3,43};
        set2.add(12);
        set2.add(16);
   
        system.debug('set2:'+ set2);
        set<integer> set3=new set<integer>(set2);
        system.debug('set3:'+ set3);
        
//CLONE & CLEAR METHOD IN SET.
  		  set<integer> set4 = new set<integer>{12,11,13,4};
          system.debug(set4);
          system.debug(set4.clone());
          set4.clear();
          system.debug(set4);  
        
//contains(setElements);
		set<integer> set5 = new set<integer>{12,11,13,4};
        system.debug(set5);
        SYSTEM.DEBUG(set5.contains(11));    
        
 //set.containsAll(list)   element check for list and set.
        list<integer> list2=new list<integer>{2,3,3,4,5,6};
        set<integer> set6=new set<integer>{2,3,4,5};
        system.debug(set6.containsAll(list2));

//equals(setname)   
        set<integer> set7=new set<integer>{2,3,4,5,6};
        set<integer> set8=new set<integer>{2,3,4,5,6};
        system.debug(set7.equals(set8));
        
        
//isEmpty()    
        set<integer> set9=new set<integer>();
        system.debug(set9.isEmpty());  
        
        
//remove(setElement)    
        set<integer> set10=new set<integer>{10,11,12,13,23,32};
        set10.remove(10);
        system.debug(set10);  
        
        
//removeAll(set and list)    
        set<integer> set11=new set<integer>{10,11,12,13,23,32};
        list<integer> list3=new list<integer>{10,11};
   		set11.removeAll(list3);
        system.debug(set11);
 
//removeAll(set and set)
        set<integer> set12=new set<integer>{10,11,12,13,23,32};
        set<integer> set13=new set<integer>{10,11,12,89};
   		set12.removeAll(set13);
        system.debug(set12);


//size()
        set<integer> set14=new set<integer>{10,11,12,13,23,32};
        system.debug(set14.size());
        
//retainAll(setname OR listname)
        set<integer> set15=new set<integer>{10,11,12,13,23,32};
        set<integer> set16=new set<integer>{10,11,12,13};
            set15.retainAll(set16);
        system.debug(set15);
        set<integer> set17=new set<integer>{10,11,12,23,32};
        list<integer> list4=new list<integer>{10,11,12,13,23,32};
		    set17.retainAll(list4);
        system.debug(set17);        
        
        
        

}        
    
    
//METHODS add,addAll,addAll(SET),CLEAR,Equals,get(index),
    public static void methodname41(){
        list<integer> list2 = new list<integer>();   //{12,6,8,10,15}  
        list2.add(12);
        list2.add(8);
        list2.add(10);
        list2.add(15);
        list2.add(1,6);
        system.debug('list2:'+list2);
        
        list<integer> list3=new list<integer>();
        list3.addAll(list2);
        system.debug('list3:'+list3);
        
//
        
//sort()  this method will sort the elements in ascending order.
        list2.sort();
        system.debug('list2:'+list2);
        
//size()  returns the no of elements in the list.
		 system.debug(list2.size());        
        
//indexOf(listElement)
		system.debug(list2.indexOf(8));        
        
//isEmpty()  CHECK LIST WHETHER IT IS EMPTY OR NOT. ALSO you can use if-else statements within this empty check.
		 system.debug(list2.isEmpty());

//remove(IndexNo)  Remove any element from a given list via index number.
		list2.remove(0);
        system.debug('list2:'+list2);
        
//set(index,element)  this will replace  the older element by the newer one.
		list2.set(3,35);
        system.debug('list2:'+list2);  
        
        
        
//get(INDEX)
        INTEGER I=list2.get(0);
        system.debug('element at [0]='+I);
        
        
//SET ELEMENTS COPY TO A LIST VIA ADD ALL.       
        set<integer> set1 = new set<integer>{12,22,4};   //{12,6,8,10,15}  
        set1.add(20);
        set1.add(25);
        set1.add(25);
        
        list<integer> list4=new list<integer>();
        list4.addall(set1);
        system.debug('list4='+list4);
        
//contains METHOD.
 		boolean bool= list4.contains(25);
		system.debug('isDataExist:'+bool);        

//EQUAL METHOD FOR 2 LIST.
		list<integer> l1 = new list<integer>();
		list<integer> l2 = new list<integer>(); 
        l1.add(10);
        l1.add(20);
        l1.add(10);
        l2.add(20);
        l2.add(30);
        boolean B1 = l1.equals(l2);
        IF(l1.equals(l2)) { system.debug('congratulations');}
        ELSE{ system.debug('oh NO l1 is not equal to l2'); }

//CLEAR METHOD FOR A LIST.
        list4.clear();
        system.debug('list4='+list4);
}    
    

  
    
    
//WILDCARDS " * " 
    Public static void methodname38(){
    List<List<sOBJECT>> sobjectlist = [FIND 'DH*' IN ALL FIELDS RETURNING Employee__c(Name)]; 
    system.debug('sobjectlist:'+sobjectlist);}    
    
    
//SOSL FINDING NAYARA RECORD IN THE DATABASE VIA SOSL QUERY. 
    Public static void methodname37(){
    List<List<sOBJECT>> sobjectlist = [FIND 'NAYARA' IN ALL FIELDS RETURNING Account(Name,Phone,website,fax)]; 
    system.debug('sobjectlist:'+sobjectlist);}
    
    
        //DYNAMIC SOQL 
    Public static void methodname36(string objectName,string obj1,string obj2){
        List<sObject> dynamiclist=database.query('Select '+obj1+','+obj2+' FROM '+objectName+' LIMIT 2');
        system.debug('dynamiclist:'+dynamiclist);
    } //soqlcustomobject.methodname35('Employee__c','Name','SALARY__c');

    
    
    
        //DYNAMIC SOQL 
    Public static void methodname35(string objectName){
        List<sObject> dynamiclist=database.query('Select id,Name from '+objectName+' LIMIT 2');
        system.debug('dynamiclist:'+dynamiclist);
    }
/*soqlcustomobject.methodname35('Employee__c');
soqlcustomobject.methodname35('Account');
soqlcustomobject.methodname35('Contact');
soqlcustomobject.methodname35('COMPANY__c');*/
    
    
  //else  
    
    
//SOQL querry for relationships Parent (COMPANY__c) to child(Employee__c). 
    public static void methodname34(){
    List<COMPANY__c> companyName =[SELECT ID,Name,HEAD_QUARTER__c,(SELECT ID,Name,AGE__c,COUNTRY__c,JOB_ROLE__c FROM  Employees__r) FROM COMPANY__c WHERE Name='SENDIT'];
    system.debug('companyName:'+companyName);
}
    
    
    
    
    //SOQL querry for relationships Parent (Account) to child(contact). 
    public static void methodname33(){
    List<Account> acclist =[SELECT ID,Name,(SELECT ID,Name,Email FROM Contacts WHERE Name='shree parmar') FROM Account WHERE Name='KISAAN'];
    system.debug('acclist:'+acclist);
}
    

    
    
   //SOQL querry for relationships Child(contact) to Parent(Account) for Standard Object. 
    public static void methodname32(){
   	list<Contact> conlist=[SELECT Id,Name,Contact.account__c,Contact.website__c FROM Contact WHERE id='003Qy00000t6svhIAA'];
    system.debug('conlist:'+conlist);
} 
    
    
    
    
    //SOQL querry for relationships Child(Employee__c) to Parent(COMPANY__c) for custum Object. 
    public static void methodname31(){
    List<Employee__c> employeelist = [ SELECT Id,Name FROM Employee__c WHERE id='a0JQy000000RgsnMAC'];
    system.debug('employeelist:'+employeelist);
} 

    
    
    
    
   public static void methodname30(){			//SOQL STATEMENTS  AND COUNT METHOD
   Account  acc =[SELECT ID,Name FROM Account WHERE Name='KISAAN'];
   string Name = acc.Name;
   system.debug('Name:'+Name);
   integer i=[select count() from Account where COUNTRY__c='india'];
   system.debug('total account :'+i);
   system.debug('account id :'+acc);
}

    
    
    
//	DATABASE CLASS METHOD    
  /*public static void methodname29(){    ////we will create 2 object in a single call.
    List<Account> acclist=new List<Account>();   //EMPTY LIST.
    Account accObject1=new Account();            //creating an instance to access Accunt object.
    accObject1.Name='ANGRAJ';
    Account accObject2=new Account();
    accObject2.Name='KARN';
    acclist.add(accObject1);
    acclist.add(accObject2);
 
   Database.SaveResult[] insertlist= Database.insert(acclist,false);
   system.debug('insertlist:'+insertlist);
   for(Database.SaveResult sr : insertlist){
   if(sr.isSuccess()){
   system.debug('inserted Account with ACCOUNT ID:'+sr.getId());
}
   else{
   for(Database.Error err : sr.getErrors()){
   system.debug(err.getStatusCode() + ':' +err.getMessage());
   system.debug('Account field that affected this error:'+err.getFields());
}}}}*/  
    
    
    
    
    
//how to delete a particular account 'BRAJ PARMAR' from Account.    
	public static void methodname28(){
	Account del=[select id,name from Account where Name='BRAJ PARMAR'];
	delete del; }    
    
    
    
    
    
//merge DML statement.
 public static void methodname27(){
 Account parent=[select id,name from Account where name='SHEETAL ENTERPRISES']; //record in which the child going to merge.
 Account child =[select id,name from Account where name='RAMSON'];  //Record to be merged.
 merge parent child;}
    
    
    
    
//upserting record ,,,here we will create a new record[RAMSON] along with updating an existing record with id=001Qy00001b92CrIAI.   
        public static void methodname26(){
        list<Account> acclist= new list<Account>();  //create empty list.
        Account accobj1 = new Account();            //create a instance 
        accobj1.Name='RAMSON';                      //create a record in instance.        
        Account accobj2 =[SELECT ID,Name from Account where id='001Qy00001b92CrIAI'];
       // system.debug('accid:'+accobj1.id);
        accobj2.Phone='493849392';
        acclist.add(accobj1);
        acclist.add(accobj2);
       // system.debug('acclist:'+acclist);
        If(!acclist.isEmpty()){
        upsert acclist;}
  }
    
    
    
    
//inserting and updating records.    
        public static void methodname25(){
        //list<Account> acclist=new list<Account>();
        Account acclist=new Account();       
        acclist.Name='Test Account';
        acclist.AnnualRevenue=98000;
        insert acclist;
        system.debug('account id:'+acclist.Id);  //this will print the record id of "Test Account".
        Account accountToUpdate=[SELECT ID,Name,Phone FROM Account Where Id=:acclist.Id];
        accountToUpdate.Phone='9171526815';
        update accountToUpdate;}
 
    
    
    
    
//CREATE A account record and relate it to a contact using DML STATEMENT.
        public static void methodname24(){
        list<Account> acclist=new list<Account>(); 		//creating an empty list.
        system.debug('acclist:'+acclist);
        Account accobject=new Account();		
        accobject.Name='DHARMA GROUP OF COMPANY';		//creating a record in Account object.
        acclist.add(accobject); 						//adding the new created record in the empty list.
        If(!acclist.isEmpty()){  						//necessary check command whether if the list is still empty or not.
        insert acclist;
		system.debug('acclist:'+acclist[0].Id);
		insertrelatedcontact(acclist[0].Id); 			//calling the method to relate contact to the record.
}}
    
    
    
    
        public static void insertrelatedcontact(string Accountids){
        system.debug('Accountid:'+Accountids);
             Contact cont=new Contact();
            cont.FirstName='CHANDRA SEKHAR';
            cont.LastName='DHARMA';
            cont.Phone='8983984938';
			cont.AccountId=Accountids;
        insert cont;
}
    
    
    
    
    public static void methodname23(){
    insertdml1(); 
    newdml();}
    public static void insertdml1(){
    Employee__c emp=new Employee__c();
    emp.Name='AKSHAY KUMAR';
    insert emp;     
    system.debug('employee detail:'+emp.Name);
    list<Employee__c> emplist=new list<Employee__c>();
    IF(!emplist.isEmpty()){
    system.debug('emplist:'+emplist[0].id);   }}
    public static void newdml(){
    Account acc=new Account();
    acc.Name='INFOSYS';
    acc.COUNTRY__c='India';
    insert acc;
    system.debug('accdetail:'+acc);}
    



    
// Updating the field data of a object with DML statement.
        public static void methodname22(){
        list<Employee__c> paylist = new list<Employee__c>();
        system.debug('paylist:'+paylist);
        Employee__c pay = [SELECT ID,SALARY__c FROM Employee__C
		where Id='a0JQy000000RjInMAK'];
        pay.SALARY__c= 200000;
   		paylist.add(pay);
        system.debug('salary:'+paylist);
        If(!paylist.isEmpty()){
        update pay; }}
    
    
    
    
    
//insert DML use case::  
        public static void methodname21(){
        insertdml();}
        public static void insertdml(){
        Employee__c instance = new Employee__c(); //creating an instance for the employee object.
        instance.Name ='Pyare';//giving the value to the Name field
        insert instance;	//commanding the code editor to create a new record in the employee object where name=pyare.
        system.debug('instance:'+instance);}
    
    
    
    
    
 //this will add a employee(named nathuram godse)in the employee object.just remove the comment to execute it.
        public static void methodname20(){
        Employee__c emp=new Employee__c();
        emp.Name='nathuram godse';
        insert emp;}
    
 
    
    
    
//constructors   arithmatics.arithmatics();
        public arithmatics(integer n){
        integer i = n+2;
        system.debug('i:'+i);}       
   	    public static void democlassconstructor2(){
        arithmatics a=new arithmatics(4);}
//passing method arguments by reference.  [non primitive data type]  
        public static void methodname18(){
	 	list<integer> listname = new list<integer>();
  	    system.debug('listname:'+listname);
   	    mymethod(listname);}
       public static void mymethod(list<integer> listofname){
       system.debug('listofname:'+listofname);
       listofname.add(10);
       listofname.add(100);
       listofname.add(200);
       system.debug('listofname:'+listofname);}
//passing method arguments by value.   [primitive data type]
        public static void methodname17(){
        integer x=12;
        mymethod(x); }
   	    public static void mymethod(integer myint){
        system.debug('myint:'+myint);
        myint=200;
        system.debug('myint:'+myint);}
//apex properties for set & get.
        public static void methodname16(){				      	
        innerclass info = new innerclass();
        info.proper=22;
        system.debug('mrp:'+info.proper);}
  	    public class innerclass{
        public integer proper{
        get{return proper ; }
        set{proper=value ; }}}
    
//the SOQL 'for loop'.    
        public static void methodname15(){							
        for(employee__c variablename:[select Name,COMPANY__c,COUNTRY__c from employee__c limit 5]){
        system.debug('info:'+variablename);}}
    
//the list_or_set iteration for loop.    
        Public static void methodname14(){							
        list<employee__c>detail=[select Name,ACTIVE__c From employee__c LIMIT 2];
        for(employee__c Evariable : detail){
        system.debug('info:'+Evariable.name);}}
    
//traditional for loop.
        public static void methodname13(){							
        for(integer i=1; i<=5;i=i+1){
        system.debug('ram='+i);}}
    
//control flow || if else statement and condition.
        public static void methodname12(){  						
        integer x=3,y=4,z,a,b;
        z=x+y;
        a=x-y;
        b=x*y;
        if(x==y){system.debug('sum:'+z); }							 //execute if x=y.
        else if(x>y){system.debug('diff:'+a); }						 //execute if x>y
        else{system.debug('multiply:'+b); }					  		//otherwise execute this.
        }
        public static void methodname11(){
    	list<account>accountlist=[select id,name from account limit 1];
        system.debug('accountlist value:'+accountlist);}
    
//logical compliment operator.
        public static void methodname10(){		
   		boolean x=true;
    	system.debug('z='+!x);}
        public static void methodname9(){		 //addition
        integer x=30;
		integer y=10;
        integer z=x+y;
        system.debug('z='+z);}
        public static void methodname8(){		 //substraction.
        integer x=30;
		integer y=10;
        integer z=x-y;
        system.debug('z='+z);}
        public static void methodname7(){		 //concatenation.
        string x='ram';
		integer y=10;
        x=x+y;
        system.debug('y='+x);}
        public static void methodname6(){		//increment.
        integer x=12,y,z;
		y=++x;
        system.debug('y='+y);
        z=++x;
        system.debug('z='+z);}
    
//inequility or not equals to.    
        public static void methodname5(){	 	
        integer a=12,b=13;
        if((a!=b)){
        system.debug(true);
        }else{
        system.debug(false);}}
    
//AND logic operator.
        public static void methodname3(){   
        integer x=7,y=7,i=1,j=1;
        //integer bool =x==y?x:y;
        if((x==y)&&(i==j)){
        system.debug('true');	//true if both are true.
        }else{
        system.debug('false'); 	//false if both or anyone is false.
}
        //system.debug('exist:'+bool);
}
    
//OR logical operator	
        public static void methodname2(){   
        integer x=7,y=3,i=1,j=13;
        if((x==y)||(i==j)){
        system.debug('true');	//true if both are true or anyone is true.
		}else{
        system.debug('false'); 	//false if both are false.
}}
    
//equality operator.
   		 public static void methodname1(){  
   		 integer x=71,y=71,i=12,j=12;
      	 //integer bool =x==y?x:y;
         if((y==x)) {
         system.debug('true'); 	//true if x=y.
         }else{
         system.debug('false');		 //false if x!=y.
}
             
//system.debug('exist:'+bool);
}
 //greater than equal to operator.    
  	     public static void methodname4(){    
         integer x=12,y=20;
         if((x>=y)){
         system.debug(true);
         }else{
             system.debug(false);}}}

/*

arithmatics.methodname23();
arithmatics.methodname22();
arithmatics.methodname21();
arithmatics.methodname20();
arithmatics.methodname19();
arithmatics.methodname17();
arithmatics.methodname16();
arithmatics.methodname15();
arithmatics.methodname14();
arithmatics.methodname13();
arithmatics.methodname12();
arithmatics.methodname11();
arithmatics.methodname9();
arithmatics.methodname8();
arithmatics.methodname7();
arithmatics.methodname6();
arithmatics.methodname5();
arithmatics.methodname4();
arithmatics.methodname3();
arithmatics.methodname2();
arithmatics.methodname1();


Account acc = new Account();
acc.Name = 'hariom parmar';
insert acc;
    
Contact cont = new Contact();
cont.LastName='91716558';
cont.Accountid=acc.id;
insert cont;
*/