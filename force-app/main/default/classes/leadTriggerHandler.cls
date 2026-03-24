public class leadTriggerHandler {
    public static void handleBeforeDeleteStatus(List <lead> leadRecords){
        for(Lead Leadrec : leadRecords){
            if(Leadrec.Status=='Working-Contacted'){
               Leadrec.addError('You cannot delete a Lead whose status is-Working-Contacted');
            }
                
          }
        }
   
    public static void handleAfterInsert(list <Lead> newLeads){
        List<Task> taskListToInsert = new List<Task>(); 
        for(Lead leadRecords : newLeads){
            Task TaskRecord = new Task();
            TaskRecord.Priority='High';
            TaskRecord.OwnerId=leadRecords.OwnerId;
            TaskRecord.Description='follow-up with the Customer.';
            TaskRecord.Status='Not Started';
            TaskRecord.Subject='Send Letter';
            TaskRecord.WhoId=leadRecords.Id;
            taskListToInsert.add(TaskRecord);
            insert taskListToInsert;
        }
    }
}