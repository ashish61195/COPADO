trigger CandidateTrigger on Candidate_ashish__c (before insert,after insert,after update)
{
    if(trigger.isbefore && trigger.isinsert)
    {
        CandidateTriggerLogic.beforeInsert(Trigger.New); 
    }
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        CandidateTriggerLogic.afterUpdate(Trigger.New, Trigger.OldMap);
        
    }
    
}



/*   CandidateTriggerHandler.beforeInsert(Trigger.New, Trigger.Newmap);
CandidateTriggerHandler.beforeInsertDate(Trigger.New, Trigger.Newmap);
CandidateTriggerHandler.beforeInsertT1B(Trigger.New, Trigger.Newmap);*/
