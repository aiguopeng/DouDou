public class ProposeDao {
    public static List<Propose__c> getProposeRecById (String id) {
        List<Propose__c> ProposeList = [select Id, Name, MonthPrice__c, StartDay__c, EmployeeName__c from Propose__c where id =: id];
        return ProposeList;
    }

	//public class Sample20100508Controller {
   // public List<CustomObject1__c> getCustomObject1() {
     //   return [select id, name from customobject1__c];
  //  }
//}
    
    
    
    
    
}