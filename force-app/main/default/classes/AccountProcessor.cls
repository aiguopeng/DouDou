public class AccountProcessor{
    @future
    public static void countContacts(Set<Id> setId){
        List<Account> IstAccount = [select id,Number_of_Contacts__c,(Select id from Contacts) From Account where id In :setId];
        for(Account acct :IstAccount){
            List<Contact>IstCont = acct.Contacts;
            acct.Number_of_Contacts__c = IstCont.size();
        }
        Update IstAccount;
    }
}