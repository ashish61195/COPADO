trigger UpdateLatestJob on Job_ashish__c (after insert) {
   	UpdateLatestJobHelper.UpdateCandidateLatestJob(Trigger.New);
}