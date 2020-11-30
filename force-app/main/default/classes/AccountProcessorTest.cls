@IsTest
public class AccountProcessorTest {
    public static testmethod void TestAccountProcessorTest(){
        Account a = new Account();
        a.Name = 'test Account';
        Insert a;
        
        Contact cont = new Contact();
        cont.FirstName = 'dd';
        cont.LastName = 'lll';
        cont.AccountId = a.Id;
        Insert cont;
        
        set<Id> setAccId = new Set<ID>();
        setAccId.add(a.Id);
        
        Test.startTest();
             AccountProcessor.countContacts(setAccId);
        Test.stopTest();
        
        Account Acc = [select Number_of_Contacts__c from Account where Id = :a.Id limit 1];
        System.assertEquals(integer.valueOf(Acc.Number_of_Contacts__c),1);       
        
    }

}