@IsTest
public class LeadProcessorTest {
    static testMethod void tsteMethod1(){
        List<Lead> lstLead = new List<Lead>(); 
        for(Integer i=0;i<200;i++){
            Lead led = new Lead();
            led.FirstName = 'liu';
            led.LastName = 'doudou';
            led.Company ='demo' +i;
            lstLead.add(led);
        }   
        insert lstLead;
        
        Test.startTest();
            LeadProcessor obj = new LeadProcessor();
            Database.executeBatch(obj);
        Test.stopTest();
        
    }

}