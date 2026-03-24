public class OpportunityTriggerHandeler {
//As soon as the opportunity is deleted create a task for the opportunity account owner to investigate why the opportunity was deleted and submit the information.

    public static void HandleMyAfterDelete(List <Opportunity> oldRecords){
        List <Task> taskRecordList=new List <Task>(); 
        for(Opportunity oppo : oldRecords){
           Task taskRec=new Task(); 
            taskRec.description='Please INVESTIGATE why the opportunity was deleted ';
            taskRec.Priority='High';
            taskRec.OwnerId = oppo.Account.ownerId;
            taskRec.Status='Not Started';
            taskRec.Subject='Follow Up'; 
            taskRec.WhatId=oppo.Id;
            taskRecordList.add(taskRec);
        }
        //if taskrecordList is not EMPTY THEN DO THIS .
        if(!taskRecordList.isEmpty()){
            insert taskRecordList;
        }
    }
    
    public static void handleActivitiesBeforeUpdate(List<Opportunity> newRecords,Map<ID,Opportunity> oldMap){
        //figure out IF the Stage record has been modified or not.
        //find the record from NEW list & compare it to the OLD list and Check if the 'StageName' has changed or not. 
        for(Opportunity newopp : newRecords){
           
                if(oldMap.get(newopp.Id).StageName!=newopp.StageName){
            //if the above statement is #True than make AMOUNT=PROBABILITY * EXPECTED REVENUE        
                   newopp.Amount=newopp.Probability*newopp.ExpectedRevenue;
                
            
        }
        
        }}
    
    
    
    public static void handleActivitiesAfterUpdate(list<Opportunity> newRecords){
         //if stage=='Closed Won';
    //then create a task for the opportunity owner to split the revenue among the team with high priority.
    
        list<Task> taskListToInsert=new list<Task>();  	//for this line refer to line no 18
        //"For every Opportunity record (which I will call 'opp') in the list called 'newRecords'..."
        for(Opportunity opp : newRecords){
            if(opp.stageName=='Closed Won'){
                //Create a Related record--A new Task.
                Task taskRecord = new Task();
                TaskRecord.Priority='High';
                TaskRecord.OwnerId=opp.OwnerId;
                TaskRecord.Description='Please split the revenue amongst the Team members.';
                TaskRecord.Status='Not Started';
                TaskRecord.Subject='Split Revenue';
                TaskRecord.WhatId=opp.Id;
                taskListToInsert.add(TaskRecord);		//refer to line no.6
            }
        }
        if(!taskListToInsert.isEmpty()){
            insert taskListToInsert; 
        }
    }
}