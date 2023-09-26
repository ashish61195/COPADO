@isTest
public class Job_Test_Apex
{
    @testSetup public static void setup()
    {
        Contact con=new Contact(lastname='shaikh');
        insert con;
        List<Job_ashish__c> jobs=new List<Job_ashish__c>();        
        for(INTEGER i=1;i<20;i++)
        {
        Job_ashish__c job=new Job_ashish__c();        
        job.Number_of_Positions__c=5;
        job.Job_Types__c='Manager';
        job.Required_Skills__c='Team Player';
        job.Networking_Linux__c='Bcom';
        job.Certification_Required__c='MPM (Master Project Manager)';
        job.Active__c=true;
        job.Manager__c=con.id;
        job.Description__c='i'+i;
        jobs.add(job);
        }
        insert jobs;
    }
    @isTest
    public static void insert_Job()
    {        
        List<Job_ashish__c> job1=[SELECT id,Number_of_Positions__c from Job_ashish__c where Job_Types__c =: 'Manager' LIMIT 10];
        system.debug(job1);
        test.startTest();     	
        update job1;        
        test.stopTest();        
        //List<Job_ashish__c> joblst=[select 	Job_Name__c from Job_ashish__c where Manager__c=: Manager__c];
        for( Integer i=0 ; i<job1.size() ; i++ ){
            system.assertEquals(5, job1[i].Number_of_Positions__c);            
            system.debug(i);
        }
    }   
    @isTest
    public static void delete_Job()
    {       
      List<Job_ashish__c> job=[SELECT id,Active__c from Job_ashish__c where Job_Types__c =: 'Manager' ];
        test.startTest();        
        database.DeleteResult[] res=database.delete(job,false);
        test.stopTest();  
        for( Integer i=0 ; i<job.size() ; i++ ){
            system.assertEquals('This Job is active and can not be deleted',res[i].getErrors()[0].getMessage());      
            system.debug(i);
        }
        
             
    }    
}