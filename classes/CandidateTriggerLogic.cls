public class CandidateTriggerLogic 
{
    public static void beforeInsert(List<Candidate_ashish__c> candidateList)
    {
        // Expected Salary field is missing
        for(Candidate_ashish__c candidateObject : candidateList)   				// write diffrent classes for each method
        {
            if(candidateObject.Expected_salary_demo__c == NULL)
            {
                Trigger.new[0].addError('Expected Salary field is missing');
            }
        }
        
        // Application date 
        for(Candidate_ashish__c candidateObject : candidateList)
        {
            candidateObject.Application_Date__c = date.today();   //issue fixed of system.date()+1;
        }
        
        List<Job_ashish__c> jobList =  [SELECT id from Job_ashish__c WHERE Active__c = false]; 
        for(Candidate_ashish__c candidateObject :candidateList)
        {
            string jobName = candidateObject.Job__c;            
            for(Job_ashish__c selectJob : jobList)														//
            {
                if(selectJob.id == jobName)
                {
                    candidateObject.addError('This job is not active');
                }
            }
            
        }  
            
            //If job is Inactive Candidate is not allowed to applay that job 
            Map<Id, Job_ashish__c> mapForJob = new  Map<Id, Job_ashish__c>([SELECT Id FROM Job_ashish__c WHERE Active__c = FALSE ]); //govner limits  //error
            
            for(Candidate_ashish__c candidateObject : candidateList)
            {
                if(mapForJob.containsKey(candidateObject.Job__c))
                {
                    candidateObject.addError('This job is not active..! filter where');
                }
            }
            
            
            //If Candidate is hired send mail to candidate
            List<ID> ids=new List<ID>();
            for(Candidate_ashish__c data : candidateList)
            {
                if(data.Status__c == 'Hired')
                {               
                    ids.add(data.id);             
                }
            } 
            if(ids.size()>0)  //isEmpty
            {
                SendEmail.SendToCandidate(ids);
            }
            
            
        }
        
        public static void ExpectedSalaryMissing(List<Candidate_ashish__c> candidateList)
        {
            
        }
        public static void afterUpdate(List<Candidate_ashish__c> candidateList, Map<Id, Candidate_ashish__c> candidateMap)
        {
            
            {  //If Candidate is hired send mail to candidate
                List<ID> ids=new List<ID>();
                for(Candidate_ashish__c data : candidateList)
                {
                    if(data.Status__c == 'Hired')
                    {               
                        ids.add(data.id);             
                    }
                } 
                if(ids.size() > 0)
                {
                    SendEmail.SendToCandidate(ids);
                }
            }
            
        }
        
    }
