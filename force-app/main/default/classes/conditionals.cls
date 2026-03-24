public class conditionals{
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
        
         
    }}