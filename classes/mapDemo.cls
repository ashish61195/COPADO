public class mapDemo {
    public void mymapDemo(){
        List<Account> listacc = new List<Account>();
        listacc = [SELECT Id, name from Account limit 10];
        
        map<Id,Account> mapOfAccount = new map<Id, Account>(listacc);
    
        System.debug('Maps are ' +mapOfAccount);
    }
        
}